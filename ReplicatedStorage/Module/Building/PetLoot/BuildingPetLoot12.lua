local BuildingPetLoot = require(game.ReplicatedStorage.ScriptAlias.BuildingPetLoot)

local BuildingPetLootMythical = {}

function BuildingPetLootMythical:Init(buildingPart, triggerPart)
	BuildingPetLoot:Handle(buildingPart, triggerPart, "PetLoot12", "Egg/Egg12")
end

return BuildingPetLootMythical
