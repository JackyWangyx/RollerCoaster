local BuildingToolIAP = require(game.ReplicatedStorage.ScriptAlias.BuildingToolIAP)

local Define = require(game.ReplicatedStorage.Define)

local BuildingToolIAP01 = {}

function BuildingToolIAP01:Init(buildingPart, triggerPart)
	local toolID = 16
	BuildingToolIAP:Handle(buildingPart, triggerPart, toolID)
end

return BuildingToolIAP01
