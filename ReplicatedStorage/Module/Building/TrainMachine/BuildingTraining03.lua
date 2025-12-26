local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining03 = {}

function BuildingTraining03:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 3)
end

return BuildingTraining03