local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining31 = {}

function BuildingTraining31:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 31)
end

return BuildingTraining31