local BuildingTrackDownEntrance = require(game.ReplicatedStorage.ScriptAlias.BuildingTrackDownEntrance)

local BuildingTrackDownEntrance07 = {}

local Index = 7

function BuildingTrackDownEntrance07:Init(buildingPart, triggerPart)
	BuildingTrackDownEntrance:Handle(buildingPart, triggerPart, Index)
end

return BuildingTrackDownEntrance07
