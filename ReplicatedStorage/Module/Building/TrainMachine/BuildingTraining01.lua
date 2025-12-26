local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining01 = {}

function BuildingTraining01:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 1)
end

return BuildingTraining01