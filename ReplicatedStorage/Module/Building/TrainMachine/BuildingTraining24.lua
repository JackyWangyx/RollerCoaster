local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining24 = {}

function BuildingTraining24:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 24)
end

return BuildingTraining24