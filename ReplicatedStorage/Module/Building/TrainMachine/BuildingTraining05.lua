local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining05 = {}

function BuildingTraining05:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 5)
end

return BuildingTraining05