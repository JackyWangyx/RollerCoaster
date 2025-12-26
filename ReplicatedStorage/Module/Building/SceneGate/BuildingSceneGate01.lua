local SceneGate = require(game.ReplicatedStorage.ScriptAlias.SceneGate)

local BuildingSceneGate01 = {}

function BuildingSceneGate01:Init(buildingPart, triggerPart)
	SceneGate:Handle(buildingPart, triggerPart, 1)
end

return BuildingSceneGate01
