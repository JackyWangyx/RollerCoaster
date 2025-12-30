local NetClient = require(game.ReplicatedStorage.ScriptAlias.NetClient)
local UIList = require(game.ReplicatedStorage.ScriptAlias.UIList)
local UIInfo = require(game.ReplicatedStorage.ScriptAlias.UIInfo)
local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)
local Util = require(game.ReplicatedStorage.ScriptAlias.Util)
local Building = require(game.ReplicatedStorage.ScriptAlias.Building)

local Define = require(game.ReplicatedStorage.Define)

local BuildingRailUpdate = {}

function BuildingRailUpdate:Init(buildingPart, triggerPart)
	local building = Building.TriggerOpenUI(buildingPart, "RailUpdate")
end

return BuildingRailUpdate
