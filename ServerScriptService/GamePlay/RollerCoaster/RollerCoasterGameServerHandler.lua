local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)
local ConfigManager = require(game.ReplicatedStorage.ScriptAlias.ConfigManager)
local PlayerManager = require(game.ReplicatedStorage.ScriptAlias.PlayerManager)

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

function RollerCoasterGameServerHandler:Enter(player, param)
	local trackInfo = RollerCoasterTrackServerHandler:GetTrackByIndex(param.Index)
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
	
	local currentRank = RollerCoasterRequest:GetCurrentRank(player)
	local rankInfo = RollerCoasterRequest:GetRankInfo(player, { Rank = currentRank })
	local rankData = ConfigManager:GetData("Rank", currentRank)
	gameInitParam.UpSegmentNameList = upSegmentNameList
	gameInitParam.DownSegmentNameList = downSegmentNameList
	gameInitParam.Rank = currentRank
	gameInitParam.TrackLevel = rankInfo.TrackLevel
	local speed = PlayerProperty:GetGamePropertyValue(player, PlayerProperty.Define.SPEED)
	--local maxSpeedFactor = PlayerProperty:GetGamePropertyValue(player, PlayerProperty.Define.MAX_SPEED_FACTOR)
	gameInitParam.Speed = speed * rankData.SpeedFactor -- * maxSpeedFactor 
	
	local getCoinFactor = PlayerProperty:GetGamePropertyValue(player, PlayerProperty.Define.GET_COIN_FACTOR)
	local rewardCoinPerMeter = getCoinFactor * rankData.RewardCoin
	gameInitParam.RewardCoinPerMeter = rewardCoinPerMeter
	
	local playerInfo = {
		Player = player,
		TrackIndex = param.Index,
		Rank = currentRank,
		TrackLevel = rankInfo.TrackLevel,
		RankInfo = rankInfo,
		RankData = rankData,
		ArrvieDistance = 0,
		RewardCoinPerMeter = rewardCoinPerMeter,
		
		AttachPart = {},
	}
	
	local rootPart = PlayerManager:GetHumanoidRootPart(player)
	if rootPart then
		rootPart:SetNetworkOwner(player)
		local s = rootPart:GetNetworkOwner()
	end

	PlayerManager:DisablePhysic(player)

	-- 抵消重力
	local att = Instance.new("Attachment")
	att.Parent = rootPart
	local vf = Instance.new("VectorForce")
	vf.Attachment0 = att
	vf.RelativeTo = Enum.ActuatorRelativeTo.World
	vf.ApplyAtCenterOfMass = true

	local mass = rootPart.AssemblyMass
	vf.Force = Vector3.new(0, mass * workspace.Gravity, 0)
	vf.Parent = rootPart
	
	table.insert(playerInfo.AttachPart, att)
	table.insert(playerInfo.AttachPart, vf)
	
	PlayerCache[player] = playerInfo
	
	EventManager:DispatchToClient(player, RollerCoasterDefine.Event.Enter, gameInitParam)
	return true
end

function RollerCoasterGameServerHandler:ArriveEnd(player)
	local playerInfo = PlayerCache[player]
	if not playerInfo then return false end
	EventManager:DispatchToClient(player, RollerCoasterDefine.Event.ArriveEnd)
	return true
end

function RollerCoasterGameServerHandler:Slide(player, param)
	local playerInfo = PlayerCache[player]
	if not playerInfo then return false end
	local rootPart = PlayerManager:GetHumanoidRootPart(player)
	playerInfo.ArriveDistance = param.ArriveDistance
	EventManager:DispatchToClient(player, RollerCoasterDefine.Event.Slide)
	return true
end

function RollerCoasterGameServerHandler:Exit(player)
	local playerInfo = PlayerCache[player]
	if not playerInfo then return false end
	
	local attachList = table.clone(playerInfo.AttachPart)
	task.delay(1, function()
		for _, part in ipairs(attachList) do
			part:Destroy()
		end
		
		PlayerManager:EnablePhysic(player)
	end)

	PlayerCache[player] = nil
	
	EventManager:DispatchToClient(player, RollerCoasterDefine.Event.Exit)
	return true
end

function RollerCoasterGameServerHandler:GetWins(player)
	local playerInfo = PlayerCache[player]
	if not playerInfo then return false end
	
	local getWinsFactor = PlayerProperty:GetGamePropertyValue(player, PlayerProperty.Define.GET_WINS_FACTOR)
	local value = playerInfo.RankData.RewardWins * getWinsFactor
	local accountRequest = require(game.ServerScriptService.ScriptAlias.Account)
	accountRequest:AddWins(player, { Value = value })
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
