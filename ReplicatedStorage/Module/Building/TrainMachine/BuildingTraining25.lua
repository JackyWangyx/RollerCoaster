local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining25 = {}

function BuildingTraining25:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 25)
end

return BuildingTraining25