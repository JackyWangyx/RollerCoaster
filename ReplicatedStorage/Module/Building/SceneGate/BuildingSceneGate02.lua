local SceneGate = require(game.ReplicatedStorage.ScriptAlias.SceneGate)

local BuildingSceneGate02 = {}

function BuildingSceneGate02:Init(buildingPart, triggerPart)
	SceneGate:Handle(buildingPart, triggerPart, 2)
end

return BuildingSceneGate02
