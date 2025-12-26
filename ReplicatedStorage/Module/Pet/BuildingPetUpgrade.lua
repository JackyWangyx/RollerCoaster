local ProximityAreaOpenUI = require(game.ReplicatedStorage.ScriptAlias.ProximityAreaOpenUI)
local TriggerAreaOpenUI = require(game.ReplicatedStorage.ScriptAlias.TriggerAreaOpenUI)

local BuildingPetUpgrade = {}

function BuildingPetUpgrade:Init(buildingPart, triggerPart)
	--ProximityAreaOpenUI:Handle(triggerPart, "Open Pet Upgrade", "PetUpgrade")
	TriggerAreaOpenUI:Handle(triggerPart, "PetUpgrade")
end

return BuildingPetUpgrade
