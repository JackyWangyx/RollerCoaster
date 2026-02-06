local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)
local ConfigManager = require(game.ReplicatedStorage.ScriptAlias.ConfigManager)
local PlayerManager = require(game.ReplicatedStorage.ScriptAlias.PlayerManager)
local PlayerMove = require(game.ReplicatedStorage.ScriptAlias.PlayerMove)
local UpdatorManager = require(game.ReplicatedStorage.ScriptAlias.UpdatorManager)

local NetServer = require(game.ServerScriptService.ScriptAlias.NetServer)
local RollerCoasterRequest = require(game.ServerScriptService.ScriptAlias.RollerCoaster)
local PlayerProperty = require(game.ServerScriptService.ScriptAlias.PlayerProperty)

local RollerCoasterTrackServerHandler = require(game.ServerScriptService.ScriptAlias.RollerCoasterTrackServerHandler)
local RollerCoasterDefine = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterDefine)

local RollerCoasterGameServerHandler = {}

local PlayerCache = {}

function RollerCoasterGameServerHandler:Init()
	PlayerCache = {}
	
	PlayerManager:HandleCharacterAddRemove(function(player, character)
		RollerCoasterGameServerHandler:OnPlayerAdded(player, character)
	end, function(player, character)
		RollerCoasterGameServerHandler:OnPlayerRemoved(player, character)
	end)
	
	UpdatorManager:Heartbeat(function(deltaTime)
		RollerCoasterGameServerHandler:Update(deltaTime)
	end)
end

function RollerCoasterGameServerHandler:OnPlayerAdded(player, character)

end

function RollerCoasterGameServerHandler:OnPlayerRemoved(player, character)
	local playerInfo = PlayerCache[player]
	if not playerInfo then return end
	PlayerCache[player] = nil
end

function RollerCoasterGameServerHandler:GetPlayerCache()
	return PlayerCache
end

function RollerCoasterGameServerHandler:Update(deltaTime)
	local playerCache = table.clone(PlayerCache)
	for player, playerInfo in pairs(playerCache) do
		if playerInfo.TrackInfo.UpTrack and playerInfo.TrackInfo.DownTrack then
			if playerInfo.GamePhase == RollerCoasterDefine.GamePhase.Up then
				playerInfo.CurrentDistance += playerInfo.MoveSpeed * deltaTime
				if playerInfo.CurrentDistance > playerInfo.TrackInfo.UpTrack.Length then
					playerInfo.CurrentDistance = playerInfo.TrackInfo.UpTrack.Length
				end
			elseif playerInfo.GamePhase == RollerCoasterDefine.GamePhase.Down then			
				playerInfo.SlideAcceleration = playerInfo.SlideAcceleration + playerInfo.SlideAccelerationDelta * deltaTime
				playerInfo.MoveSpeed = playerInfo.MoveSpeed + playerInfo.SlideAcceleration * deltaTime
				playerInfo.CurrentDistance = playerInfo.CurrentDistance - deltaTime * playerInfo.MoveSpeed

				if playerInfo.CurrentDistance < 0 then
					playerInfo.CurrentDistance = 0
				end
			end
		end
	end
	
	local brocadcastInfo = {}
	
	local onlinePlayerList = game.Players:GetPlayers()
	for index, player in ipairs(onlinePlayerList) do
		local playerID = player.UserId
		local playerInfo = playerCache[player]
		if playerInfo then
			local distance = math.round(playerInfo.CurrentDistance)
			local length = math.round(playerInfo.Length)
			local progress = math.clamp(distance / length, 0, 1)
			local info = {
				PlayerID = playerID,
				Distance = distance,
				Progress = progress,
				Length = length,
			}

			table.insert(brocadcastInfo, info)
		else
			local info = {
				PlayerID = playerID,
				Distance = 0,
				Progress = 0,
				Length = 0,
			}

			table.insert(brocadcastInfo, info)
		end
	end
	
	NetServer:BroadcastAll("RollerCoaster", "UpdateGameInfo", brocadcastInfo)
end

function RollerCoasterGameServerHandler:Enter(player, param)
	local trackInfo = RollerCoasterTrackServerHandler:GetTrackByIndex(param.Index)
	if trackInfo.Player == nil then
		return false
	end
	
	local upSegmentNameList = {}
	for _, segment in ipairs(trackInfo.UpTrack.SegmentList) do
		table.insert(upSegmentNameList, segment.Name)
	end
	
	local downSegmentNameList = {}
	for _, segment in ipairs(trackInfo.DownTrack.SegmentList) do
		table.insert(downSegmentNameList, segment.Name)
	end
	
	local gameInitParam = {
		TrackIndex = param.Index,
	}
	
	local themeKey = trackInfo.ThemeKey
	local gameThemeInfo = RollerCoasterRequest:GetThemeInfo(player, { ThemeKey = themeKey })
	local themeData = ConfigManager:SearchData("Theme", "ThemeKey", themeKey)
	gameInitParam.UpSegmentNameList = upSegmentNameList
	gameInitParam.DownSegmentNameList = downSegmentNameList
	gameInitParam.ThemeKey = themeKey
	gameInitParam.TrackLevel = gameThemeInfo.TrackLevel
	local speed = PlayerProperty:GetGamePropertyValue(player, PlayerProperty.Define.SPEED)
	local maxSpeedFactor = PlayerProperty:GetGamePropertyValue(player, PlayerProperty.Define.MAX_SPEED_FACTOR)
	gameInitParam.Speed = speed * themeData.SpeedFactor * maxSpeedFactor 
	
	local getCoinFactor = PlayerProperty:GetGamePropertyValue(player, PlayerProperty.Define.GET_COIN_FACTOR)
	local rewardCoinPerMeter = getCoinFactor * themeData.RewardCoin
	gameInitParam.RewardCoinPerMeter = rewardCoinPerMeter
	
	local toolRequest = require(game.ServerScriptService.ScriptAlias.Tool)
	local toolInfo = toolRequest:GetEquip(player)
	local toolData = ConfigManager:GetData("Tool", toolInfo.ID)
	local moveHeight = toolData.GameHeight
	gameInitParam.MoveHeight = moveHeight
	
	local upTrackDataList = ConfigManager:SearchAllData("Track"..themeKey, "Direction", "Up")
	gameInitParam.IsTrackMaxLevel = gameThemeInfo.TrackLevel >= #upTrackDataList
	
	local playerInfo = {
		Player = player,
		TrackIndex = param.Index,
		ThemeKey = themeKey,
		TrackLevel = gameThemeInfo.TrackLevel,
		TrackInfo = trackInfo,
		Length = trackInfo.DownTrack.Length,
		ThemeInfo = gameThemeInfo,
		ThemeData = themeData,
		ArrvieDistance = 0,
		CurrentDistance = 0,
		IsGetWins = false,
		RewardCoinPerMeter = rewardCoinPerMeter,
		MoveSpeed = gameInitParam.Speed,
		SlideAcceleration = 0,
		SlideAccelerationDelta = RollerCoasterDefine.Game.SlideAccelerationDelta,
		GamePhase = RollerCoasterDefine.GamePhase.Up,
	}

	PlayerMove:Enable(player)

	PlayerCache[player] = playerInfo
	EventManager:DispatchToClient(player, RollerCoasterDefine.Event.Enter, gameInitParam)
	return true
end

function RollerCoasterGameServerHandler:ArriveEnd(player)
	local playerInfo = PlayerCache[player]
	if not playerInfo then return false end
	playerInfo.GamePhase = RollerCoasterDefine.GamePhase.ArriveEnd
	
	PlayerMove:Disable(player)
	EventManager:DispatchToClient(player, RollerCoasterDefine.Event.ArriveEnd)
	return true
end

function RollerCoasterGameServerHandler:Slide(player, param)
	local playerInfo = PlayerCache[player]
	if not playerInfo then return false end
	
	local rootPart = PlayerManager:GetHumanoidRootPart(player)
	playerInfo.ArriveDistance = param.ArriveDistance
	playerInfo.MoveSpeed = 0
	playerInfo.SlideAcceleration = 0
	if playerInfo.GamePhase == RollerCoasterDefine.GamePhase.ArriveEnd then
		PlayerMove:Enable(player)
	end
	
	playerInfo.GamePhase = RollerCoasterDefine.GamePhase.Down
	EventManager:DispatchToClient(player, RollerCoasterDefine.Event.Slide)
	return true
end

function RollerCoasterGameServerHandler:Exit(player)
	local playerInfo = PlayerCache[player]
	if not playerInfo then return false end
	
	playerInfo.GamePhase = RollerCoasterDefine.GamePhase.Idle
	PlayerCache[player] = nil
	
	PlayerMove:Disable(player)
	EventManager:DispatchToClient(player, RollerCoasterDefine.Event.Exit)
	return true
end

function RollerCoasterGameServerHandler:GetWins(player)
	local playerInfo = PlayerCache[player]
	if not playerInfo then return false end
	if playerInfo.IsGetWins then return false end
	local getWinsFactor = PlayerProperty:GetGamePropertyValue(player, PlayerProperty.Define.GET_WINS_FACTOR)
	local value = playerInfo.ThemeData.RewardWins * getWinsFactor
	local accountRequest = require(game.ServerScriptService.ScriptAlias.Account)
	accountRequest:AddWins(player, { Value = value })
	playerInfo.IsGetWins = true
	return true
end

function RollerCoasterGameServerHandler:GetCoin(player)
	local playerInfo = PlayerCache[player]
	if not playerInfo then return false end
	
	local value = math.round(playerInfo.RewardCoinPerMeter * playerInfo.ArriveDistance)
	local accountRequest = require(game.ServerScriptService.ScriptAlias.Account)
	accountRequest:AddCoin(player, { Value = value })
	return true
end

return RollerCoasterGameServerHandler
