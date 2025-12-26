local BuildingTrackDownEntrance = require(game.ReplicatedStorage.ScriptAlias.BuildingTrackDownEntrance)

local BuildingTrackDownEntrance06 = {}

local Index = 6

function BuildingTrackDownEntrance06:Init(buildingPart, triggerPart)
	BuildingTrackDownEntrance:Handle(buildingPart, triggerPart, Index)
end

return BuildingTrackDownEntrance06
