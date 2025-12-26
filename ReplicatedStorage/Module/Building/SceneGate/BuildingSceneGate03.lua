local SceneGate = require(game.ReplicatedStorage.ScriptAlias.SceneGate)

local BuildingSceneGate03 = {}

function BuildingSceneGate03:Init(buildingPart, triggerPart)
	SceneGate:Handle(buildingPart, triggerPart, 3)
end

return BuildingSceneGate03
