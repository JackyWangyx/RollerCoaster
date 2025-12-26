local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining07 = {}

function BuildingTraining07:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 7)
end

return BuildingTraining07