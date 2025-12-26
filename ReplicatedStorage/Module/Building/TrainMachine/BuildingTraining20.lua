local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining20 = {}

function BuildingTraining20:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 20)
end

return BuildingTraining20