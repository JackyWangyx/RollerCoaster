local BuildingTrackUpEntrance = require(game.ReplicatedStorage.ScriptAlias.BuildingTrackUpEntrance)

local BuildingTrackUpEntrance03 = {}

local Index = 3

function BuildingTrackUpEntrance03:Init(buildingPart, triggerPart)
	BuildingTrackUpEntrance:Handle(buildingPart, triggerPart, Index)
end

return BuildingTrackUpEntrance03
