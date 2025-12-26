local BuildingPetLoot = require(game.ReplicatedStorage.ScriptAlias.BuildingPetLoot)

local BuildingPetLootMythical = {}

function BuildingPetLootMythical:Init(buildingPart, triggerPart)
	BuildingPetLoot:Handle(buildingPart, triggerPart, "PetLoot8", "Egg/Egg08")
end

return BuildingPetLootMythical
