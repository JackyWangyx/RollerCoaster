local NetClient = require(game.ReplicatedStorage.ScriptAlias.NetClient)
local ConfigManager = require(game.ReplicatedStorage.ScriptAlias.ConfigManager)
local AttributeUtil = require(game.ReplicatedStorage.ScriptAlias.AttributeUtil)
local Util = require(game.ReplicatedStorage.ScriptAlias.Util)
local UIList = require(game.ReplicatedStorage.ScriptAlias.UIList)
local UIListSelect = require(game.ReplicatedStorage.ScriptAlias.UIListSelect)
local UIButton = require(game.ReplicatedStorage.ScriptAlias.UIButton)
local UIInfo = require(game.ReplicatedStorage.ScriptAlias.UIInfo)
local UIConfirm = require(game.ReplicatedStorage.ScriptAlias.UIConfirm)
local TweenUtil = require(game.ReplicatedStorage.ScriptAlias.TweenUtil)
local UIManager = require(game.ReplicatedStorage.ScriptAlias.UIManager)
local IAPClient = require(game.ReplicatedStorage.ScriptAlias.IAPClient)
local PlayerManager = require(game.ReplicatedStorage.ScriptAlias.PlayerManager)
local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)

local UIRailUpdate = {}

UIRailUpdate.UIRoot = nil
UIRailUpdate.MaxFrame = nil
UIRailUpdate.TrackInfo = nil

function UIRailUpdate:Init(root)
	UIRailUpdate.UIRoot = root
	UIRailUpdate.MaxFrame = Util:GetChildByName(UIRailUpdate.UIRoot, "MaxFrame")
end

function UIRailUpdate:OnShow()

end

function UIRailUpdate:OnHide()

end

function UIRailUpdate:Refresh()
	local info = NetClient:RequestWait("RollerCoaster", "GetTrackStoreInfo")
	UIInfo:SetInfo(UIRailUpdate.UIRoot, info)
	UIRailUpdate.TrackInfo = info
end

function UIRailUpdate:Button_Buy()
	NetClient:Request("RollerCoaster", "UpgradeTrack", { Type = "Coin" }, function(result)
		if result.Success then
			UIRailUpdate:Refresh()
		else
			UIManager:ShowMessage(result.Message)
		end
	end)
end

function UIRailUpdate:Button_BuyRobux()
	if not UIRailUpdate.TrackInfo then return end
	IAPClient:Purchase( UIRailUpdate.TrackInfo.ProductKey, function(success)
		if success then
			NetClient:Request("RollerCoaster", "UpgradeTrack", { Type == "Robux" }, function(result)
				if result.Success then
					UIRailUpdate:Refresh()
				else
					UIManager:ShowMessage(result.Message)
				end
			end)
		end
	end)
end

return UIRailUpdate
