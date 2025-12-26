local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining21 = {}

function BuildingTraining21:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 21)
end

return BuildingTraining21