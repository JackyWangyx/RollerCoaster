local ProximityAreaOpenUI = require(game.ReplicatedStorage.ScriptAlias.ProximityAreaOpenUI)
local TriggerAreaOpenUI = require(game.ReplicatedStorage.ScriptAlias.TriggerAreaOpenUI)
local Building = require(game.ReplicatedStorage.ScriptAlias.Building)

local BuildingAnimalStore = {}

function BuildingAnimalStore:Init(buildingPart, triggerPart)
	local building = Building.TriggerOpenUI(buildingPart, "AnimalStore")
end

return BuildingAnimalStore
