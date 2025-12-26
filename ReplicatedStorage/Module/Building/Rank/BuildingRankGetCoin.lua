local BuildingRank = require(game.ReplicatedStorage.ScriptAlias.BuildingRank)

local Define = require(game.ReplicatedStorage.Define)

local BuildingRankGetCoin = {}

function BuildingRankGetCoin:Init(buildingPart, triggerPart)
	BuildingRank:Handle(buildingPart, Define.RankList.TotalGetCoin)
end

return BuildingRankGetCoin
