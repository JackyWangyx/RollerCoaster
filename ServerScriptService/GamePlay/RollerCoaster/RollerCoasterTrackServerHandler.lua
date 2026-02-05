local PlayerManager = require(game.ReplicatedStorage.ScriptAlias.PlayerManager)
local SceneManager = require(game.ReplicatedStorage.ScriptAlias.SceneManager)
local Util = require(game.ReplicatedStorage.ScriptAlias.Util)
local ResourcesManager = require(game.ReplicatedStorage.ScriptAlias.ResourcesManager)
local ConfigManager = require(game.ReplicatedStorage.ScriptAlias.ConfigManager)
local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)
local UIInfo = require(game.ReplicatedStorage.ScriptAlias.UIInfo)

local SceneAreaServerHandler = require(game.ServerScriptService.ScriptAlias.SceneAreaServerHandler)
local RollerCoasterDefine = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterDefine)

local RollerCoasterRequest = nil
local ThemeRequest = nil
local TrackCreator = require(game.ReplicatedStorage.ScriptAlias.TrackCreator)

local Define = require(game.ReplicatedStorage.Define)

local RollerCoasterTrackServerHandler = {}

RollerCoasterTrackServerHandler.TrackList = {}

function RollerCoasterTrackServerHandler:Init()
	RollerCoasterRequest = require(game.ServerScriptService.ScriptAlias.RollerCoaster)
	ThemeRequest = require(game.ServerScriptService.ScriptAlias.Theme)
	
	RollerCoasterTrackServerHandler:InitTrack(SceneAreaServerHandler.AreaPointList)
	
	table.insert(SceneAreaServerHandler.OnCreateArea, function(player, areaInfo)
		RollerCoasterTrackServerHandler:OnPlayerAdded(player, areaInfo)
	end)
	
	table.insert(SceneAreaServerHandler.OnClearArea, function(player, areaInfo)
		RollerCoasterTrackServerHandler:OnPlayerRemoved(player, areaInfo)
	end)
	
	EventManager:Listen(EventManager.Define.RefreshTrack, function(param)
		local player = param.Player
		task.spawn(function()
			RollerCoasterTrackServerHandler:RefreshTrack(player)
		end)
	end)
	
	EventManager:Listen(EventManager.Define.RefreshArea, function(serverAreaInfoList)
		for index, areaInfo in ipairs(serverAreaInfoList) do
			local trackInfo = RollerCoasterTrackServerHandler.TrackList[index]
			if areaInfo.ThemeKey ~= nil and areaInfo.ThemeKey ~= trackInfo.ThemeKey and trackInfo.Player ~= nil then
				trackInfo.ThemeKey = areaInfo.ThemeKey
				task.spawn(function()
					RollerCoasterTrackServerHandler:RefreshTrack(trackInfo.Player)
				end)
			end
		end	
	end)
end

function RollerCoasterTrackServerHandler:InitTrack(trackPointList)
	for index = 1, SceneAreaServerHandler.AreaCount do
		local trackRoot = SceneAreaServerHandler.AreaPointList[index]
		local trackStart = trackRoot:FindFirstChild("TrackStart")
		local trackEndList = Util:GetAllChildByName(trackRoot, "TrackEnd", true)

		local upFoloder = Instance.new("Folder")
		upFoloder.Name = "Up"
		upFoloder.Parent = trackStart
		
		local downFoloder = Instance.new("Folder")
		downFoloder.Name = "Down"
		downFoloder.Parent = trackStart
		
		local areaInfo = SceneAreaServerHandler.AreaInfoList[index]
		local trackInfo = {
			Index = index,
			Player = nil,
			Start = trackStart,
			EndList = trackEndList,
			UpTrack = nil,
			DownTrack = nil,
			ThemeKey = areaInfo.ThemeKey,
		}
		
		areaInfo.TrackInfo = trackInfo
		table.insert(RollerCoasterTrackServerHandler.TrackList, trackInfo)
		
		Util:DeActiveObject(trackInfo.End)
	end
end

function RollerCoasterTrackServerHandler:OnPlayerAdded(player, areaInfo)
	local trackInfo = areaInfo.TrackInfo
	task.spawn(function()
		trackInfo.Player = player
		RollerCoasterTrackServerHandler:CreateTrack(trackInfo)
	end)	
end

function RollerCoasterTrackServerHandler:OnPlayerRemoved(player, areaInfo)
	local trackInfo = areaInfo.TrackInfo
	trackInfo.Player = nil
	RollerCoasterTrackServerHandler:ClearTrack(trackInfo)
end

function RollerCoasterTrackServerHandler:GetTrackByIndex(index)
	return SceneAreaServerHandler.AreaInfoList[index].TrackInfo
end

function RollerCoasterTrackServerHandler:GetTrackByPlayer(player)
	for index, areaInfo in ipairs(SceneAreaServerHandler.AreaInfoList) do
		if areaInfo.TrackInfo.Player == player then
			return areaInfo.TrackInfo
		end
	end

	return nil
end

function RollerCoasterTrackServerHandler:RefreshTrack(player)
	local trackInfo = RollerCoasterTrackServerHandler:GetTrackByPlayer(player)
	local trackIndex = trackInfo.Index
	local gameServerHandler = require(game.ServerScriptService.ScriptAlias.RollerCoasterGameServerHandler)
	local playerCache = gameServerHandler:GetPlayerCache()
	for player, playerInfo in pairs(playerCache) do
		if playerInfo.TrackIndex == trackIndex then
			gameServerHandler:Exit(player)
			SceneAreaServerHandler:ResetPlayerPos(player)
		end
	end
	
	RollerCoasterTrackServerHandler:ClearTrack(trackInfo)
	RollerCoasterTrackServerHandler:CreateTrack(trackInfo)
end

function RollerCoasterTrackServerHandler:CreateTrack(trackInfo)
	if trackInfo.UpTrack then
		RollerCoasterTrackServerHandler:ClearTrack(trackInfo)
	end
	
	local player = trackInfo.Player
	if not player then
		return
	end
	
	local themeKey = ThemeRequest:GetCurrentTheme(player)
	local themeData = ConfigManager:SearchData("Theme", "ThemeKey", themeKey)
	local gameThemeInfo = RollerCoasterRequest:GetThemeInfo(player, { ThemeKey = themeKey })
	local trackLevel = gameThemeInfo.TrackLevel
	local position = trackInfo.Start.Position
	trackInfo.ThemeKey = themeKey
	
	-- Up
	local upTrackInfo = {
		Name = "Up",
		PrefabList = {},
		Angle = RollerCoasterDefine.TrackAngle,
		StartOffset = position + RollerCoasterDefine.Game.UpTrackOffset,
		Root = trackInfo.Start.Up,
	}
	
	local upTrackDataList = ConfigManager:SearchAllData("Track"..themeKey, "Direction", "Up")
	for index = 1, trackLevel do
		local data = upTrackDataList[index]
		local prefabInfo = {
			Prefab = ResourcesManager:Load(data.Prefab),
			Length = data.Length,
		}
		
		table.insert(upTrackInfo.PrefabList, prefabInfo)
	end

	local upTrack = TrackCreator:Create(upTrackInfo)
	trackInfo.UpTrack = upTrack

	-- Down
	
	local downTrackInfo = {
		Name = "Down",
		PrefabList = {},
		Angle = RollerCoasterDefine.TrackAngle,
		StartOffset = position + RollerCoasterDefine.Game.DownTrackOffset,
		Root = trackInfo.Start.Down,
	}

	local downTrackDataList = ConfigManager:SearchAllData("Track"..themeKey, "Direction", "Down")
	for index = 1, #downTrackDataList do
		local data = downTrackDataList[index]
		local prefabInfo = {
			Prefab = ResourcesManager:Load(data.Prefab),
			Length = data.Length,
		}

		table.insert(downTrackInfo.PrefabList, prefabInfo)
	end

	local downTrack = TrackCreator:Create(downTrackInfo)
	trackInfo.DownTrack = downTrack
	
	-- End
	
	for _, trackEnd in ipairs(trackInfo.EndList) do
		local endPos = downTrack.TrackRoute:GetPointByFactor(1).Position + RollerCoasterDefine.Game.TrackEndOffset
		trackEnd:PivotTo(CFrame.new(endPos))
	end
end

function RollerCoasterTrackServerHandler:ClearTrack(trackInfo)
	if trackInfo.UpTrack then
		TrackCreator:Clear(trackInfo.UpTrack)
		trackInfo.UpTrack = nil
	end
	
	if trackInfo.DownTrack then
		TrackCreator:Clear(trackInfo.DownTrack)
		trackInfo.DownTrack = nil
	end	
	
	if trackInfo.End then
		Util:DeActiveObject(trackInfo.End)
	end
end

return RollerCoasterTrackServerHandler
