local BuildingPetLoot = require(game.ReplicatedStorage.ScriptAlias.BuildingPetLoot)

local BuildingPetLootMythical = {}

function BuildingPetLootMythical:Init(buildingPart, triggerPart)
	BuildingPetLoot:Handle(buildingPart, triggerPart, "PetLoot3", "Egg/Egg03")
end

return BuildingPetLootMythical
