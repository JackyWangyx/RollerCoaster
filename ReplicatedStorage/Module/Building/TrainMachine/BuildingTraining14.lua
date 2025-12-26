local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining14 = {}

function BuildingTraining14:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 14)
end

return BuildingTraining14