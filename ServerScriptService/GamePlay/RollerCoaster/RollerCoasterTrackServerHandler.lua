local PlayerManager = require(game.ReplicatedStorage.ScriptAlias.PlayerManager)
local SceneManager = require(game.ReplicatedStorage.ScriptAlias.SceneManager)
local Util = require(game.ReplicatedStorage.ScriptAlias.Util)
local ResourcesManager = require(game.ReplicatedStorage.ScriptAlias.ResourcesManager)
local ConfigManager = require(game.ReplicatedStorage.ScriptAlias.ConfigManager)
local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)

local RollerCoasterDefine = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterDefine)

local RollerCoasterRequest = nil
local TrackCreator = require(game.ReplicatedStorage.ScriptAlias.TrackCreator)

local Define = require(game.ReplicatedStorage.Define)

local RollerCoasterTrackServerHandler = {}

RollerCoasterTrackServerHandler.TrackPointList = {}
RollerCoasterTrackServerHandler.TrackList = {}
RollerCoasterTrackServerHandler.TrackCount = 0

function RollerCoasterTrackServerHandler:Init()
	RollerCoasterRequest = require(game.ServerScriptService.ScriptAlias.RollerCoaster)
	
	RollerCoasterTrackServerHandler.LevelRoot = SceneManager.LevelRoot
	local trackPointRoot = SceneManager.LevelRoot.Game.Track
	local trackPointList = trackPointRoot:GetDescendants()
	trackPointList = Util:ListSortByPartName(trackPointList)
	RollerCoasterTrackServerHandler.TrackPointList = trackPointList
	RollerCoasterTrackServerHandler.TrackCount = #trackPointList
	
	RollerCoasterTrackServerHandler:InitTrack(trackPointList)
	
	PlayerManager:HandleCharacterAddRemove(function(player, character)
		RollerCoasterTrackServerHandler:OnPlayerAdded(player, character)
	end, function(player, character)
		RollerCoasterTrackServerHandler:OnPlayerRemoved(player, character)
	end)
	
	EventManager:Listen(EventManager.Define.RefreshTrack, function(param)
		local player = param.Player
		task.spawn(function()
			RollerCoasterTrackServerHandler:RefreshTrack(player)
		end)
	end)
end

function RollerCoasterTrackServerHandler:InitTrack(trackPointList)
	for index = 1, RollerCoasterTrackServerHandler.TrackCount do
		local trackPoint = RollerCoasterTrackServerHandler.TrackPointList[index]
		
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
			DownTrack = nil
		}
		
		table.insert(RollerCoasterTrackServerHandler.TrackList, trackInfo)
	end
end

function RollerCoasterTrackServerHandler:OnPlayerAdded(player, character)
	local trackInfo = RollerCoasterTrackServerHandler:GetEmptyTrack()
	if trackInfo then
		trackInfo.Player = player
		RollerCoasterTrackServerHandler:CreateTrack(trackInfo)
	end
end

function RollerCoasterTrackServerHandler:OnPlayerRemoved(player, character)
	local trackInfo = RollerCoasterTrackServerHandler:GetTrackByPlayer(player)
	if trackInfo then
		trackInfo.Player = nil
		RollerCoasterTrackServerHandler:ClearTrack(trackInfo)
	end
end

function RollerCoasterTrackServerHandler:GetEmptyTrack()
	for index, trackInfo in ipairs(RollerCoasterTrackServerHandler.TrackList) do
		if trackInfo.Player == nil then
			return trackInfo
		end
	end
	
	return nil
end

function RollerCoasterTrackServerHandler:GetTrackByIndex(index)
	return RollerCoasterTrackServerHandler.TrackList[index]
end

function RollerCoasterTrackServerHandler:GetTrackByPlayer(player)
	for index, trackInfo in ipairs(RollerCoasterTrackServerHandler.TrackList) do
		if trackInfo.Player == player then
			return trackInfo
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
		TrackCreator:Clear( trackInfo.UpTrack)
		trackInfo.UpTrack = nil
	end
	
	if trackInfo.DownTrack then
		TrackCreator:Clear( trackInfo.DownTrack)
		trackInfo.DownTrack = nil
	end	
end

return RollerCoasterTrackServerHandler
