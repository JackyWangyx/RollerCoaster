local ProximityAreaOpenUI = require(game.ReplicatedStorage.ScriptAlias.ProximityAreaOpenUI)
local TriggerAreaOpenUI = require(game.ReplicatedStorage.ScriptAlias.TriggerAreaOpenUI)
local NearTrigger = require(game.ReplicatedStorage.ScriptAlias.NearTrigger)
local Util = require(game.ReplicatedStorage.ScriptAlias.Util)
local UTween = require(game.ReplicatedStorage.ScriptAlias.UTween)
local BuildingSignActivity = require(game.ReplicatedStorage.ScriptAlias.BuildingSignActivity)

local BuildingActivityChristmas2025 = {}

local ActivityKey = "Christmas2025"

function BuildingActivityChristmas2025:Init(buildingPart, triggerPart)
	BuildingSignActivity:Handle(buildingPart, triggerPart, ActivityKey)
end

return BuildingActivityChristmas2025
