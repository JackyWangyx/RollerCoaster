local BuildingToolIAP = require(game.ReplicatedStorage.ScriptAlias.BuildingToolIAP)

local Define = require(game.ReplicatedStorage.Define)

local BuildingToolIAP02 = {}

function BuildingToolIAP02:Init(buildingPart, triggerPart)
	local toolID = 17
	BuildingToolIAP:Handle(buildingPart, triggerPart, toolID)
end

return BuildingToolIAP02
