local BuildingRank = require(game.ReplicatedStorage.ScriptAlias.BuildingRank)

local Define = require(game.ReplicatedStorage.Define)

local BuildingRankRebirth = {}

function BuildingRankRebirth:Init(buildingPart, triggerPart)
	BuildingRank:Handle(buildingPart, Define.RankList.TotalRebirth)
end

return BuildingRankRebirth
