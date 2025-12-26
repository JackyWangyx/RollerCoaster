local BuildingToolIAP = require(game.ReplicatedStorage.ScriptAlias.BuildingToolIAP)

local Define = require(game.ReplicatedStorage.Define)

local BuildingToolIAP05 = {}

function BuildingToolIAP05:Init(buildingPart, triggerPart)
	local toolID = 20
	BuildingToolIAP:Handle(buildingPart, triggerPart, toolID)
end

return BuildingToolIAP05
