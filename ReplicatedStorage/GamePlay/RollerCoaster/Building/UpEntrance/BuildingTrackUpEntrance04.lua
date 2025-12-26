local BuildingTrackUpEntrance = require(game.ReplicatedStorage.ScriptAlias.BuildingTrackUpEntrance)

local BuildingTrackUpEntrance04 = {}

local Index = 4

function BuildingTrackUpEntrance04:Init(buildingPart, triggerPart)
	BuildingTrackUpEntrance:Handle(buildingPart, triggerPart, Index)
end

return BuildingTrackUpEntrance04
