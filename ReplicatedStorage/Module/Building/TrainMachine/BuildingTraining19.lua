local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining19 = {}

function BuildingTraining19:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 19)
end

return BuildingTraining19