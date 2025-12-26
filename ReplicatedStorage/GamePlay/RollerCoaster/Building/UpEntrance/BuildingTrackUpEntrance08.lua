local BuildingTrackUpEntrance = require(game.ReplicatedStorage.ScriptAlias.BuildingTrackUpEntrance)

local BuildingTrackUpEntrance08 = {}

local Index = 8

function BuildingTrackUpEntrance08:Init(buildingPart, triggerPart)
	BuildingTrackUpEntrance:Handle(buildingPart, triggerPart, Index)
end

return BuildingTrackUpEntrance08
