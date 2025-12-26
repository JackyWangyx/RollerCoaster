local PlayerManager = require(game.ReplicatedStorage.ScriptAlias.PlayerManager)
local Util = require(game.ReplicatedStorage.ScriptAlias.Util)
local ConfigManager = require(game.ReplicatedStorage.ScriptAlias.ConfigManager)
local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)
local AnalyticsManager = require(game.ReplicatedStorage.ScriptAlias.AnalyticsManager)

local PlayerRecord = require(game.ServerScriptService.ScriptAlias.PlayerRecord)
local IAPServer = require(game.ServerScriptService.ScriptAlias.IAPServer)
local PlayerPrefs = require(game.ServerScriptService.ScriptAlias.PlayerPrefs)

local RollerCoasterGameServerHandler = require(game.ServerScriptService.ScriptAlias.RollerCoasterGameServerHandler)

local RollerCoaster = {}

function LoadInfo(player)
	local saveInfo = PlayerPrefs:GetModule(player, "RollerCoaster")
	if saveInfo.Rank == nil then
		saveInfo.Rank = 1
	end
	
	if saveInfo.TrackLevel == nil then
		saveInfo.TrackLevel = 1
	end
	
	return saveInfo
end

-----------------------------------------------------------------------------------------------
-- Info

function RollerCoaster:GetInfo(player)
	local saveInfo = LoadInfo(player)
	return saveInfo
end

function RollerCoaster:GetRank(player)
	local saveInfo = LoadInfo(player)
	return saveInfo.Rank
end

function RollerCoaster:GetTrackLevel(player)
	local saveInfo = LoadInfo(player)
	return saveInfo.TrackLevel
end

-----------------------------------------------------------------------------------------------
-- Game

function RollerCoaster:Enter(player, param)
	local result = RollerCoasterGameServerHandler:Enter(player, param)
	return result
end

function RollerCoaster:Slide(player, param)
	local result = RollerCoasterGameServerHandler:Slide(player, param)
	return result
end

function RollerCoaster:Exit(player, param)
	local result = RollerCoasterGameServerHandler:Exit(player, param)
	return result
end

function RollerCoaster:GetWins(player, param)
	local result = RollerCoasterGameServerHandler:GetWins(player, param)
	return result
end

return RollerCoaster
