local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining15 = {}

function BuildingTraining15:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 15)
end

return BuildingTraining15