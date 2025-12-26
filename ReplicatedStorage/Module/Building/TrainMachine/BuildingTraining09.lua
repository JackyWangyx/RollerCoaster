local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining09 = {}

function BuildingTraining09:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 9)
end

return BuildingTraining09