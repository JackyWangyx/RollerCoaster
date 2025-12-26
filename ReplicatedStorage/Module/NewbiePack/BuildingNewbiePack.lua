local ProximityAreaOpenUI = require(game.ReplicatedStorage.ScriptAlias.ProximityAreaOpenUI)
local TriggerAreaOpenUI = require(game.ReplicatedStorage.ScriptAlias.TriggerAreaOpenUI)
local Building = require(game.ReplicatedStorage.ScriptAlias.Building)

local BuildingNewbiePack = {}

function BuildingNewbiePack:Init(buildingPart, triggerPart)
	local building = Building.TriggerOpenUI(buildingPart, "NewbiePack")
end

return BuildingNewbiePack
