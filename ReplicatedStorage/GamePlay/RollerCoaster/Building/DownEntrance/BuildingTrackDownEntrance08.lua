local BuildingTrackDownEntrance = require(game.ReplicatedStorage.ScriptAlias.BuildingTrackDownEntrance)

local BuildingTrackDownEntrance08 = {}

local Index = 8

function BuildingTrackDownEntrance08:Init(buildingPart, triggerPart)
	BuildingTrackDownEntrance:Handle(buildingPart, triggerPart, Index)
end

return BuildingTrackDownEntrance08
