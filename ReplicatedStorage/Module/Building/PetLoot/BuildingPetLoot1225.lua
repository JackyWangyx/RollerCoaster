local BuildingPetLoot = require(game.ReplicatedStorage.ScriptAlias.BuildingPetLoot)

local BuildingPetLootNormal = {}

function BuildingPetLootNormal:Init(buildingPart, triggerPart)
	BuildingPetLoot:Handle(buildingPart, triggerPart, "PetLoot1", "Egg/Egg1225")
end

return BuildingPetLootNormal
