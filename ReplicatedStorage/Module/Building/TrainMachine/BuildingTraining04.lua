local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining04 = {}

function BuildingTraining04:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 4)
end

return BuildingTraining04