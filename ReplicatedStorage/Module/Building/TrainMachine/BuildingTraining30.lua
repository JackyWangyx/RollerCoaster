local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining30 = {}

function BuildingTraining30:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 30)
end

return BuildingTraining30