local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining10 = {}

function BuildingTraining10:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 10)
end

return BuildingTraining10