local BuildingTrackUpEntrance = require(game.ReplicatedStorage.ScriptAlias.BuildingTrackUpEntrance)

local BuildingTrackUpEntrance01 = {}

local Index = 1

function BuildingTrackUpEntrance01:Init(buildingPart, triggerPart)
	BuildingTrackUpEntrance:Handle(buildingPart, triggerPart, Index)
end

return BuildingTrackUpEntrance01
