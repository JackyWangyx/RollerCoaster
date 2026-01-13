local BuildingPetIAP = require(game.ReplicatedStorage.ScriptAlias.BuildingPetIAP)

local Define = require(game.ReplicatedStorage.Define)

local BuildingPetAP01 = {}

function BuildingPetAP01:Init(buildingPart, opts)
	local petID = 1
	BuildingPetIAP:Handle(buildingPart, opts, petID)
end

return BuildingPetAP01
