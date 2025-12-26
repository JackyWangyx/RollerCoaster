local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining13 = {}

function BuildingTraining13:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 13)
end

return BuildingTraining13