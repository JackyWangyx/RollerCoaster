local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining02= {}

function BuildingTraining02:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 2)
end

return BuildingTraining02