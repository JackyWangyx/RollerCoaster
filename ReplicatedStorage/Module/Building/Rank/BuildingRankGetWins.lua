local BuildingRank = require(game.ReplicatedStorage.ScriptAlias.BuildingRank)

local Define = require(game.ReplicatedStorage.Define)

local BuildingRankGetWins = {}

function BuildingRankGetWins:Init(buildingPart, triggerPart)
	BuildingRank:Handle(buildingPart, Define.RankList.TotalGetWins)
end

return BuildingRankGetWins
