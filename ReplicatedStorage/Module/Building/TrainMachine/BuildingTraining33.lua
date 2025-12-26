local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining33 = {}

function BuildingTraining33:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 33)
end

return BuildingTraining33