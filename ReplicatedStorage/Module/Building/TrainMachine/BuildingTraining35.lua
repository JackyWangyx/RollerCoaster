local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining35 = {}

function BuildingTraining35:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 35)
end

return BuildingTraining35