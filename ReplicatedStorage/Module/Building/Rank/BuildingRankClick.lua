local BuildingRank = require(game.ReplicatedStorage.ScriptAlias.BuildingRank)

local Define = require(game.ReplicatedStorage.Define)

local BuildingRankClick = {}

function BuildingRankClick:Init(buildingPart, triggerPart)
	BuildingRank:Handle(buildingPart, Define.RankList.TotalClick)
end

return BuildingRankClick
