local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining32 = {}

function BuildingTraining32:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 32)
end

return BuildingTraining32