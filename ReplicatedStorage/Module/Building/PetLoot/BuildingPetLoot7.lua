local BuildingPetLoot = require(game.ReplicatedStorage.ScriptAlias.BuildingPetLoot)

local BuildingPetLootMythical = {}

function BuildingPetLootMythical:Init(buildingPart, triggerPart)
	BuildingPetLoot:Handle(buildingPart, triggerPart, "PetLoot7", "Egg/Egg07")
end

return BuildingPetLootMythical
