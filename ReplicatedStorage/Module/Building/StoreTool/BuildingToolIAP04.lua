local BuildingToolIAP = require(game.ReplicatedStorage.ScriptAlias.BuildingToolIAP)

local Define = require(game.ReplicatedStorage.Define)

local BuildingToolIAP04 = {}

function BuildingToolIAP04:Init(buildingPart, triggerPart)
	local toolID = 19
	BuildingToolIAP:Handle(buildingPart, triggerPart, toolID)
end

return BuildingToolIAP04
