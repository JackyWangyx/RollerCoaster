local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining16 = {}

function BuildingTraining16:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 16)
end

return BuildingTraining16