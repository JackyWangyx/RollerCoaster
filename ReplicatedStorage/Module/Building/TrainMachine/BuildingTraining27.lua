local TrainingMachine = require(game.ReplicatedStorage.ScriptAlias.TrainingMachine)

local BuildingTraining27 = {}

function BuildingTraining27:Init(buildingPart, triggerPart)
	TrainingMachine:Handle(buildingPart, triggerPart, 27)
end

return BuildingTraining27