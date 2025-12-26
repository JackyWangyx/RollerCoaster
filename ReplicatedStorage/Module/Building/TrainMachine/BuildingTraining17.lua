local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining17 = {}

function BuildingTraining17:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 17)
end

return BuildingTraining17