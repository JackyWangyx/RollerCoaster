local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining12 = {}

function BuildingTraining12:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 12)
end

return BuildingTraining12