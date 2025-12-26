local BuildingPetLoot = require(game.ReplicatedStorage.ScriptAlias.BuildingPetLoot)

local BuildingPetLootMythical = {}

function BuildingPetLootMythical:Init(buildingPart, triggerPart)
	BuildingPetLoot:Handle(buildingPart, triggerPart, "PetLoot10", "Egg/Egg10")
end

return BuildingPetLootMythical
