local BuildingAnimalIAP = require(game.ReplicatedStorage.ScriptAlias.BuildingAnimalIAP)

local Define = require(game.ReplicatedStorage.Define)

local BuildingAnimalIAP01 = {}

function BuildingAnimalIAP01:Init(buildingPart, triggerPart)
	local animalID = 1
	BuildingAnimalIAP:Handle(buildingPart, triggerPart, animalID)
end

return BuildingAnimalIAP01
