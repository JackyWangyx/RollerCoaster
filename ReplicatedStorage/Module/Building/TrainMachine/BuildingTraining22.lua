local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining22 = {}

function BuildingTraining22:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 22)
end

return BuildingTraining22