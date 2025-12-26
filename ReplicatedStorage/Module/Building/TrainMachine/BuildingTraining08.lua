local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining08 = {}

function BuildingTraining08:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 8)
end

return BuildingTraining08