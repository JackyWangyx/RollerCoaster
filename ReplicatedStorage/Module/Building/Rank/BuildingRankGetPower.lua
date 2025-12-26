local BuildingRank = require(game.ReplicatedStorage.ScriptAlias.BuildingRank)

local Define = require(game.ReplicatedStorage.Define)

local BuildingRankGetPower = {}

function BuildingRankGetPower:Init(buildingPart, triggerPart)
	BuildingRank:Handle(buildingPart, Define.RankList.TotalGetPower)
end

return BuildingRankGetPower
