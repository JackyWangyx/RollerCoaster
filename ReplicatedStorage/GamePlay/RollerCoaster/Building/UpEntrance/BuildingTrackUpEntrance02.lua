local BuildingTrackUpEntrance = require(game.ReplicatedStorage.ScriptAlias.BuildingTrackUpEntrance)

local BuildingTrackUpEntrance02 = {}

local Index = 2

function BuildingTrackUpEntrance02:Init(buildingPart, triggerPart)
	BuildingTrackUpEntrance:Handle(buildingPart, triggerPart, Index)
end

return BuildingTrackUpEntrance02
