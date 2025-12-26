local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining26 = {}

function BuildingTraining26:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 26)
end

return BuildingTraining26