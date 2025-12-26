local BuildingPartnerIAP= require(game.ReplicatedStorage.ScriptAlias.BuildingPartnerIAP)

local Define = require(game.ReplicatedStorage.Define)

local BuildingPartnerIAP02 = {}

function BuildingPartnerIAP02:Init(buildingPart, triggerPart)
	local partnerID = 13
	BuildingPartnerIAP:Handle(buildingPart, triggerPart, partnerID)
end

return BuildingPartnerIAP02
