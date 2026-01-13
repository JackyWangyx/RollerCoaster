local PlayerManager = require(game.ReplicatedStorage.ScriptAlias.PlayerManager)
local SceneManager = require(game.ReplicatedStorage.ScriptAlias.SceneManager)
local Util = require(game.ReplicatedStorage.ScriptAlias.Util)
local ResourcesManager = require(game.ReplicatedStorage.ScriptAlias.ResourcesManager)
local ConfigManager = require(game.ReplicatedStorage.ScriptAlias.ConfigManager)
local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)

local SceneAreaServerHandler = require(game.ServerScriptService.ScriptAlias.SceneAreaServerHandler)
local RollerCoasterDefine = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterDefine)

local RollerCoasterRequest = nil
local TrackCreator = require(game.ReplicatedStorage.ScriptAlias.TrackCreator)

local Define = require(game.ReplicatedStorage.Define)

local RollerCoasterTrackServerHandler = {}

RollerCoasterTrackServerHandler.TrackPointList = {}
RollerCoasterTrackServerHandler.TrackList = {}

function RollerCoasterTrackServerHandler:Init()
	RollerCoasterRequest = require(game.ServerScriptService.ScriptAlias.RollerCoaster)
	
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
end

function RollerCoasterTrackServerHandler:InitTrack(trackPointList)
	for index = 1, SceneAreaServerHandler.AreaCount do
		local trackPoint = SceneAreaServerHandler.AreaPointList[index].Track
		
		local upFoloder = Instance.new("Folder")
		upFoloder.Name = "Up"
		upFoloder.Parent = trackPoint
		
		local downFoloder = Instance.new("Folder")
		downFoloder.Name = "Down"
		downFoloder.Parent = trackPoint
		
		local trackInfo = {
			Index = index,
			Player = nil,
			Root = trackPoint,
			UpTrack = nil,
			DownTrack = nil,
		}
		
		local areaInfo = SceneAreaServerHandler.AreaInfoList[index]
		areaInfo.TrackInfo = trackInfo
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
	local currentRank = RollerCoasterRequest:GetCurrentRank(player)
	local rankInfo = RollerCoasterRequest:GetRankInfo(player, { Rank = currentRank })
	local rank = currentRank
	local trackLevel = rankInfo.TrackLevel
	local position = trackInfo.Root.Position
	
	-- Up
	local upTrackInfo = {
		Name = "Up",
		PrefabList = {},
		Angle = RollerCoasterDefine.TrackAngle,
		StartOffset = position + Vector3.new(0, 0, 0),
		Root = trackInfo.Root.Up,
	}
	
	local upTrackDataList = ConfigManager:SearchAllData("Track", "Rank", rank, "Direction", "Up")
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
		StartOffset = position + Vector3.new(-20, 0, 0),
		Root = trackInfo.Root.Down,
	}

	local downTrackDataList = ConfigManager:SearchAllData("Track", "Rank", rank, "Direction", "Down")
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
end

return RollerCoasterTrackServerHandler
