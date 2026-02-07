local TweenUtil = require(game.ReplicatedStorage.ScriptAlias.TweenUtil)
local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)
local Util = require(game.ReplicatedStorage.ScriptAlias.Util)

local UIAccountTip = {}

UIAccountTip.UIRoot = nil

UIAccountTip.UICoinTarget = nil
UIAccountTip.UIGetCoinTip = nil

UIAccountTip.UIWinsTarget = nil
UIAccountTip.UIGetWinsTip = nil

UIAccountTip.UIPowerTarget = nil
UIAccountTip.UIGetPowerTip = nil

function UIAccountTip:Init(root)
	UIAccountTip.UIRoot = root
	
	UIAccountTip.UICoinTarget = Util:GetChildByName(UIAccountTip.UIRoot, "UICoinTargetIcon", true)
	UIAccountTip.UIGetCoinTip = Util:GetChildByName(UIAccountTip.UIRoot, "UIGetCoinTip", true)
	if UIAccountTip.UIGetCoinTip then
		UIAccountTip.UIGetCoinTip.Visible = false
		EventManager:Listen(EventManager.Define.GetCoin, function(value)
			UIAccountTip:OnGetCoin(value)
		end)
	end

	UIAccountTip.UIWinsTarget = Util:GetChildByName(UIAccountTip.UIRoot, "UIWinsTargetIcon", true)
	UIAccountTip.UIGetWinsTip = Util:GetChildByName(UIAccountTip.UIRoot, "UIGetWinsTip", true)
	if UIAccountTip.UIGetWinsTip then
		UIAccountTip.UIGetWinsTip.Visible = false
		EventManager:Listen(EventManager.Define.GetWins, function(value)
			UIAccountTip:OnGetWins(value)
		end)
	end

	UIAccountTip.UIPowerTarget = Util:GetChildByName(UIAccountTip.UIRoot, "UIPowerTarget", true)
	UIAccountTip.UIGetPowerTip = Util:GetChildByName(UIAccountTip.UIRoot, "UIGetPowerTip", true)
	if UIAccountTip.UIGetPowerTip then
		UIAccountTip.UIGetPowerTip.Visible = false
		EventManager:Listen(EventManager.Define.GetPower, function(value)
			UIAccountTip:OnGetPower(value)
		end)
	end
end

function UIAccountTip:OnGetCoin(value)
	if UIAccountTip.UIGetCoinTip then
		TweenUtil:UIFlyToTarget(UIAccountTip.UIGetCoinTip, UIAccountTip.UICoinTarget, value, {
			RandRotate = true,
			ShowText = false,
		})
	end
end

function UIAccountTip:OnGetWins(value)
	if UIAccountTip.UIGetWinsTip then
		TweenUtil:UIFlyToTarget(UIAccountTip.UIGetWinsTip, UIAccountTip.UIWinsTarget, value, {
			RandRotate = false,
			ShowText = false,
		})
	end
end

function UIAccountTip:OnGetPower(value)
	if UIAccountTip.UIGetPowerTip then
		TweenUtil:UIFlyToTarget(UIAccountTip.UIGetPowerTip, UIAccountTip.UIPowerTarget, value, {
			RandRotate = false,
			ShowText = false,
		})
	end
end

return UIAccountTip
