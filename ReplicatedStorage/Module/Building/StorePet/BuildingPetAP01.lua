local BuildingPetIAP = require(game.ReplicatedStorage.ScriptAlias.BuildingPetIAP)

local Define = require(game.ReplicatedStorage.Define)

local BuildingPetAP01 = {}

function BuildingPetAP01:Init(buildingPart, triggerPart)
	local petID = 1
	BuildingPetIAP:Handle(buildingPart, triggerPart, petID)
end

return BuildingPetAP01
