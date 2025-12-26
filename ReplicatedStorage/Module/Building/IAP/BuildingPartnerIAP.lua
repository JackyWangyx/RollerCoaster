local ProximityArea = require(game.ReplicatedStorage.ScriptAlias.ProximityArea)
local IAPClient = require(game.ReplicatedStorage.ScriptAlias.IAPClient)
local NetClient = require(game.ReplicatedStorage.ScriptAlias.NetClient)
local ConfigManager = require(game.ReplicatedStorage.ScriptAlias.ConfigManager)
local PlayerManager = require(game.ReplicatedStorage.ScriptAlias.PlayerManager)
local Util = require(game.ReplicatedStorage.ScriptAlias.Util)
local Building = require(game.ReplicatedStorage.ScriptAlias.Building)

local Define = require(game.ReplicatedStorage.Define)

local RunService = game:GetService("RunService")
local RotationSpeed = 30

local BuildingPartnerIAP = {}

function BuildingPartnerIAP:Handle(buildingPart, triggerPart, partnerID)
	local building = Building.Proximity(buildingPart, Define.Message.BuyPartnerTip, function()
		local data = ConfigManager:GetData("Partner", partnerID)
		local productKey = data.ProductKey
		NetClient:Request("Partner", "CheckExist", { ID = partnerID }, function(isExist)
			if not isExist then
				IAPClient:Purchase(productKey, function(success)
					BuildingPartnerIAP:Refresh(buildingPart, triggerPart, partnerID)
				end)
			end
		end)
	end)

	local humanoid = Util:GetChildByName(buildingPart, "Humanoid")
	if humanoid then
		PlayerManager:DisableHumanoid(humanoid)
	end
	
	building.RefreshFunc = function()
		NetClient:Request("Partner", "CheckExist", { ID = partnerID }, function(result)
			local uiCost = Util:GetChildByName(buildingPart, "UICost")
			uiCost.Visible = not result
		end)
	end
	
	building:Refresh()
end

return BuildingPartnerIAP
