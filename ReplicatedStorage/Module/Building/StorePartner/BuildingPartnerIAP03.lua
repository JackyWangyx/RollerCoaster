local BuildingPartnerIAP= require(game.ReplicatedStorage.ScriptAlias.BuildingPartnerIAP)

local Define = require(game.ReplicatedStorage.Define)

local BuildingPartnerIAP03 = {}

function BuildingPartnerIAP03:Init(buildingPart, triggerPart)
	local partnerID = 14
	BuildingPartnerIAP:Handle(buildingPart, triggerPart, partnerID)
end

return BuildingPartnerIAP03
