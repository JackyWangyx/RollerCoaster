local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining28 = {}

function BuildingTraining28:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 28)
end

return BuildingTraining28