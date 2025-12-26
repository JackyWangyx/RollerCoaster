local BuildingTrackDownEntrance = require(game.ReplicatedStorage.ScriptAlias.BuildingTrackDownEntrance)

local BuildingTrackDownEntrance10 = {}

local Index = 10

function BuildingTrackDownEntrance10:Init(buildingPart, triggerPart)
	BuildingTrackDownEntrance:Handle(buildingPart, triggerPart, Index)
end

return BuildingTrackDownEntrance10
