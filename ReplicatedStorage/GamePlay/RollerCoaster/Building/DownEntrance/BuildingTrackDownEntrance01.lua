local BuildingTrackDownEntrance = require(game.ReplicatedStorage.ScriptAlias.BuildingTrackDownEntrance)

local BuildingTrackDownEntrance01 = {}

local Index = 1

function BuildingTrackDownEntrance01:Init(buildingPart, triggerPart)
	BuildingTrackDownEntrance:Handle(buildingPart, triggerPart, Index)
end

return BuildingTrackDownEntrance01
