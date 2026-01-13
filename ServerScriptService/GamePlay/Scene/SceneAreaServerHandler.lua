local PlayerManager = require(game.ReplicatedStorage.ScriptAlias.PlayerManager)
local SceneManager = require(game.ReplicatedStorage.ScriptAlias.SceneManager)
local Util = require(game.ReplicatedStorage.ScriptAlias.Util)
local ResourcesManager = require(game.ReplicatedStorage.ScriptAlias.ResourcesManager)
local ConfigManager = require(game.ReplicatedStorage.ScriptAlias.ConfigManager)
local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)

local Define = require(game.ReplicatedStorage.Define)

local SceneAreaServerHandler = {}

SceneAreaServerHandler.AreaPointList = {}
SceneAreaServerHandler.AreaInfoList = {}
SceneAreaServerHandler.AreaCount = 0

SceneAreaServerHandler.OnCreateArea = {}
SceneAreaServerHandler.OnClearArea = {}

function SceneAreaServerHandler:Init()
	if not SceneManager.AreaList then return end
	local areaPointList = {}
	for index, area in ipairs(SceneManager.AreaList) do
		local areaInfo = {
			Player = nil,
			Index = index,
			Area = area,
		}
		
		table.insert(areaPointList, area)
		table.insert(SceneAreaServerHandler.AreaInfoList, areaInfo)
	end

	SceneAreaServerHandler.AreaPointList = areaPointList
	SceneAreaServerHandler.AreaCount = #areaPointList

	PlayerManager:HandleCharacterAddRemove(function(player, character)
		SceneAreaServerHandler:OnPlayerAdded(player, character)
	end, function(player, character)
		SceneAreaServerHandler:OnPlayerRemoved(player, character)
	end)
end

function SceneAreaServerHandler:OnPlayerAdded(player, character)
	local areaInfo = SceneAreaServerHandler:GetEmptyArea()
	if areaInfo then
		areaInfo.Player = player
		SceneAreaServerHandler:CreateArea(player, areaInfo)
		SceneAreaServerHandler:BroadcastRefreshArea()
	end
end

function SceneAreaServerHandler:OnPlayerRemoved(player, character)
	local areaInfo = SceneAreaServerHandler:GetAreaByPlayer(player)
	if areaInfo then
		areaInfo.Player = nil
		SceneAreaServerHandler:ClearArea(player, areaInfo)
		SceneAreaServerHandler:BroadcastRefreshArea()
	end
end

function SceneAreaServerHandler:BroadcastRefreshArea()
	local areaInfoList = {}
	for index, areaInfo in ipairs(SceneAreaServerHandler.AreaInfoList) do
		local playerID = nil
		if areaInfo.Player then
			playerID = areaInfo.Player.UserId
		end
		
		local info = {
			Index = index,
			PlayerID = playerID,
		}
		
		table.insert(areaInfoList, info)
	end
	
	EventManager:DispatchToAllClient(EventManager.Define.RefreshArea, areaInfoList)
end

function SceneAreaServerHandler:GetEmptyArea()
	for index, areaInfo in ipairs(SceneAreaServerHandler.AreaInfoList) do
		if areaInfo.Player == nil then
			return areaInfo
		end
	end

	return nil
end

function SceneAreaServerHandler:GetAeraByIndex(index)
	return SceneAreaServerHandler.AreaInfoList[index]
end

function SceneAreaServerHandler:GetAreaByPlayer(player)
	for index, areaInfo in ipairs(SceneAreaServerHandler.AreaInfoList) do
		if areaInfo.Player == player then
			return areaInfo
		end
	end

	return nil
end

function SceneAreaServerHandler:RefreshArea(player)
	local areaInfo = SceneAreaServerHandler:GetAeraByPlayer(player)
	local areaIndex = areaInfo.Index
	SceneAreaServerHandler:ClearArea(player, areaInfo)
	SceneAreaServerHandler:CreateArea(player, areaInfo)
end

function SceneAreaServerHandler:CreateArea(player, areaInfo)
	for index, func in ipairs(SceneAreaServerHandler.OnCreateArea) do
		pcall(func, player, areaInfo)
	end
end

function SceneAreaServerHandler:ClearArea(player, areaInfo)
	for index, func in ipairs(SceneAreaServerHandler.OnClearArea) do
		pcall(func, player, areaInfo)
	end
end

return SceneAreaServerHandler
