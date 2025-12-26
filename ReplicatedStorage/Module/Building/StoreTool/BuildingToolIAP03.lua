local BuildingToolIAP = require(game.ReplicatedStorage.ScriptAlias.BuildingToolIAP)

local Define = require(game.ReplicatedStorage.Define)

local BuildingToolIAP03 = {}

function BuildingToolIAP03:Init(buildingPart, triggerPart)
	local toolID = 18
	BuildingToolIAP:Handle(buildingPart, triggerPart, toolID)
end

return BuildingToolIAP03
