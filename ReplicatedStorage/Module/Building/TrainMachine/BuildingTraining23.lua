local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining23 = {}

function BuildingTraining23:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 23)
end

return BuildingTraining23