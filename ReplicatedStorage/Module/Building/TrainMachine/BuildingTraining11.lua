local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining11 = {}

function BuildingTraining11:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 11)
end

return BuildingTraining11