local ProximityArea = require(game.ReplicatedStorage.ScriptAlias.ProximityArea)
local IAPClient = require(game.ReplicatedStorage.ScriptAlias.IAPClient)
local NetClient = require(game.ReplicatedStorage.ScriptAlias.NetClient)
local ConfigManager = require(game.ReplicatedStorage.ScriptAlias.ConfigManager)
local Building = require(game.ReplicatedStorage.ScriptAlias.Building)

local Define = require(game.ReplicatedStorage.Define)

local BuildingPetIAP = {}

function BuildingPetIAP:Handle(buildingPart, triggerPart, petID)
	local building = Building.Proximity(buildingPart, Define.Message.BuyPetTip, function()
		local petData = ConfigManager:GetData("Pet", petID)
		local productKey = petData.ProductKey
		NetClient:Request("Pet", "CheckPackage", function(result)
			if result then
				IAPClient:Purchase(productKey, function(result)
					BuildingPetIAP:Refresh(buildingPart, triggerPart, petID)
				end)
			else
				UIManager:ShowMessage(Define.Message.PetPackageFull)
			end
		end)
	end)
end

return BuildingPetIAP
