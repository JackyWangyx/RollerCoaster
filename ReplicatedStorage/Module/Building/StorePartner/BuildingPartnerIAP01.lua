local BuildingPartnerIAP= require(game.ReplicatedStorage.ScriptAlias.BuildingPartnerIAP)

local Define = require(game.ReplicatedStorage.Define)

local BuildingPartnerIAP01 = {}

function BuildingPartnerIAP01:Init(buildingPart, triggerPart)
	local partnerID = 12
	BuildingPartnerIAP:Handle(buildingPart, triggerPart, partnerID)
end

return BuildingPartnerIAP01
