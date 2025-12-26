local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining18 = {}

function BuildingTraining18:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 18)
end

return BuildingTraining18