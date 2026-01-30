local UIManager = require(game.ReplicatedStorage.ScriptAlias.UIManager)
local UIInfo = require(game.ReplicatedStorage.ScriptAlias.UIInfo)
local IAPClient = require(game.ReplicatedStorage.ScriptAlias.IAPClient)
local Util = require(game.ReplicatedStorage.ScriptAlias.Util)
local UIPropList = require(game.ReplicatedStorage.ScriptAlias.UIPropList)
local PetUtil =require(game.ReplicatedStorage.ScriptAlias.PetUtil)

local UIRobloxStore = {}

UIRobloxStore.UIRoot = nil
UIRobloxStore.UIPropFrame = nil

function UIRobloxStore:Init(root)
	UIRobloxStore.UIRoot = root
	UIRobloxStore.UIPropFrame = Util:GetChildByName(root, "PropFrame")
	UIPropList:Init(UIRobloxStore.UIPropFrame)
end

function UIRobloxStore:OnShow(param)

end

function UIRobloxStore:OnHide()

end

function UIRobloxStore:Refresh()
	UIPropList:Refresh()
end

-- LimitedTime Pet

function UIRobloxStore:Button_LimitedTime_Pet1()
	local check = PetUtil:CheckPackage(1)
	if not check then return end
	
	IAPClient:Purchase("ProductStorePet246", function(result)
	end)
end

function UIRobloxStore:Button_LimitedTime_Pet2()
	local check = PetUtil:CheckPackage(1)
	if not check then return end

	IAPClient:Purchase("ProductStorePet251", function(result)
	end)
end

function UIRobloxStore:Button_LimitedTime_Pet3()
	local check = PetUtil:CheckPackage(1)
	if not check then return end

	IAPClient:Purchase("ProductStorePet256", function(result)
	end)
end

-- PetLoot Smile

local PetRobuxLootSmileParam = {
	LootKey = "PetLoot101",
	EggPrefab = "Egg/Egg101"
}

function UIRobloxStore:Button_PetLootSmileX1()
	local check = PetUtil:CheckPackage(1)
	if not check then return end
	
	local uiInfo = UIManager:GetPage("UIPetLoot")
	local uiPetLoot = uiInfo.Script
	
	uiPetLoot.IsRobuxLoot = true
	uiPetLoot.Param = PetRobuxLootSmileParam
	uiPetLoot.LootKey = PetRobuxLootSmileParam.LootKey
	uiPetLoot.EggPrefab = PetRobuxLootSmileParam.EggPrefab
	IAPClient:Purchase("SlimePetEggX1", nil, function(result)
		if result then
			task.delay(0.1, function()
				UIManager:Hide("UIRobloxStore")
				uiPetLoot:OpenLootImpl(1, false, 1)
			end)
		end
	end)
end

function UIRobloxStore:Button_PetLootSmileX3()
	local check = PetUtil:CheckPackage(1)
	if not check then return end
	
	local uiInfo = UIManager:GetPage("UIPetLoot")
	local uiPetLoot = uiInfo.Script
	
	uiPetLoot.IsRobuxLoot = true
	uiPetLoot.Param = PetRobuxLootSmileParam
	uiPetLoot.LootKey = PetRobuxLootSmileParam.LootKey
	uiPetLoot.EggPrefab = PetRobuxLootSmileParam.EggPrefab
	IAPClient:Purchase("SlimePetEggX3", nil, function(result)
		if result then
			task.delay(0.1, function()
				UIManager:Hide("UIRobloxStore")
				uiPetLoot:OpenLootImpl(3, false, 1)
			end)
		end
	end)
end

function UIRobloxStore:Button_PetLootSmileX9()
	local check = PetUtil:CheckPackage(1)
	if not check then return end
	
	local uiInfo = UIManager:GetPage("UIPetLoot")
	local uiPetLoot = uiInfo.Script
	
	uiPetLoot.IsRobuxLoot = true
	uiPetLoot.Param = PetRobuxLootSmileParam
	uiPetLoot.LootKey = PetRobuxLootSmileParam.LootKey
	uiPetLoot.EggPrefab = PetRobuxLootSmileParam.EggPrefab
	IAPClient:Purchase("SlimePetEggX9", nil, function(result)
		if result then
			task.delay(0.1, function()
				UIManager:Hide("UIRobloxStore")
				uiPetLoot:OpenLootImpl(3, true, 3)
			end)
		end
	end)
end

-- PetLoot Brainrot

local PetRobuxLootBrainrotParam = {
	LootKey = "PetLoot102",
	EggPrefab = "Egg/Egg102"
}

function UIRobloxStore:Button_PetLootBrainrotX1()
	local check = PetUtil:CheckPackage(1)
	if not check then return end

	local uiInfo = UIManager:GetPage("UIPetLoot")
	local uiPetLoot = uiInfo.Script

	uiPetLoot.IsRobuxLoot = true
	uiPetLoot.Param = PetRobuxLootBrainrotParam
	uiPetLoot.LootKey = PetRobuxLootBrainrotParam.LootKey
	uiPetLoot.EggPrefab = PetRobuxLootBrainrotParam.EggPrefab
	IAPClient:Purchase("BrainrotPetEggX1", nil, function(result)
		if result then
			task.delay(0.1, function()
				UIManager:Hide("UIRobloxStore")
				uiPetLoot:OpenLootImpl(1, false, 1)
			end)
		end
	end)
end

function UIRobloxStore:Button_PetLootBrainrotX3()
	local check = PetUtil:CheckPackage(1)
	if not check then return end

	local uiInfo = UIManager:GetPage("UIPetLoot")
	local uiPetLoot = uiInfo.Script

	uiPetLoot.IsRobuxLoot = true
	uiPetLoot.Param = PetRobuxLootBrainrotParam
	uiPetLoot.LootKey = PetRobuxLootBrainrotParam.LootKey
	uiPetLoot.EggPrefab = PetRobuxLootBrainrotParam.EggPrefab
	IAPClient:Purchase("BrainrotPetEggX3", nil, function(result)
		if result then
			task.delay(0.1, function()
				UIManager:Hide("UIRobloxStore")
				uiPetLoot:OpenLootImpl(3, false, 1)
			end)
		end
	end)
end

function UIRobloxStore:Button_PetLootBrainrotX9()
	local check = PetUtil:CheckPackage(1)
	if not check then return end

	local uiInfo = UIManager:GetPage("UIPetLoot")
	local uiPetLoot = uiInfo.Script

	uiPetLoot.IsRobuxLoot = true
	uiPetLoot.Param = PetRobuxLootBrainrotParam
	uiPetLoot.LootKey = PetRobuxLootBrainrotParam.LootKey
	uiPetLoot.EggPrefab = PetRobuxLootBrainrotParam.EggPrefab
	IAPClient:Purchase("BrainrotPetEggX9", nil, function(result)
		if result then
			task.delay(0.1, function()
				UIManager:Hide("UIRobloxStore")
				uiPetLoot:OpenLootImpl(3, true, 3)
			end)
		end
	end)
end

return UIRobloxStore
