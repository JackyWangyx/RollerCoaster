local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining06 = {}

function BuildingTraining06:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 6)
end

return BuildingTraining06