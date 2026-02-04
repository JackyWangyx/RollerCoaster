local NetClient = require(game.ReplicatedStorage.ScriptAlias.NetClient)
local ConfigManager = require(game.ReplicatedStorage.ScriptAlias.ConfigManager)
local AttributeUtil = require(game.ReplicatedStorage.ScriptAlias.AttributeUtil)
local Util = require(game.ReplicatedStorage.ScriptAlias.Util)
local UIList = require(game.ReplicatedStorage.ScriptAlias.UIList)
local UIListSelect = require(game.ReplicatedStorage.ScriptAlias.UIListSelect)
local UIButton = require(game.ReplicatedStorage.ScriptAlias.UIButton)
local UIInfo = require(game.ReplicatedStorage.ScriptAlias.UIInfo)
local IAPClient = require(game.ReplicatedStorage.ScriptAlias.IAPClient)
local PlayerManager = require(game.ReplicatedStorage.ScriptAlias.PlayerManager)
local UIManager = require(game.ReplicatedStorage.ScriptAlias.UIManager)
local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)
local TimerManager = require(game.ReplicatedStorage.ScriptAlias.TimerManager)
local TimeUtil = require(game.ReplicatedStorage.ScriptAlias.TimeUtil)

local Define = require(game.ReplicatedStorage.Define)

local UISignOnline = {}

UISignOnline.UIRoot = nil
UISignOnline.ItemList = nil
UISignOnline.InfoList = nil
UISignOnline.RefreshTimer = nil

function UISignOnline:Init(root)
	UISignOnline.UIRoot = root
end

function UISignOnline:OnShow(param)
	UISignOnline.RefreshTimer = TimerManager:Interval(1, function()
		UISignOnline:Refresh()
	end)
end

function UISignOnline:OnHide()
	if UISignOnline.RefreshTimer then
		UISignOnline.RefreshTimer:Destroy()
		UISignOnline.RefreshTimer = nil
	end
end

function UISignOnline:Update()

end

function UISignOnline:ProcessInfoList(infoList)
	local now = os.time()
	for _, info in ipairs(infoList) do
		local seconds = info.RequireTime - (now - info.LoginTime)
		info.RemainTime = TimeUtil:FormatSeconds(seconds)
	end
end

function UISignOnline:Refresh()
	NetClient:Request("Sign", "GetOnlineList", { Key = "SignOnline" }, function(infoList)
		UISignOnline.InfoList = infoList
		UISignOnline:ProcessInfoList(infoList)
		UISignOnline.ItemList = UIList:LoadWithInfo(UISignOnline.UIRoot, "UISignOnlineItem", infoList)
		UIList:HandleItemList(UISignOnline.ItemList, UISignOnline, "UISignItem")
	end)
end

function UISignOnline:Claim(index)
	if not UISignOnline.ItemList then return end
	NetClient:Request("Sign", "GetOnlineReward", { Key = "SignOnline", ID = index }, function(rewardList)
		UISignOnline:Refresh()
		for _, data in ipairs(rewardList) do
			UIManager:ShowMessageWithIcon(data.Icon, "Got "..data.Description)
			task.wait()
		end
		EventManager:Dispatch(EventManager.Define.RefreshSignOnline)
	end)
end

function UISignOnline:Button_ClaimAll()
	if not UISignOnline.ItemList then return end
	NetClient:Request("Sign", "CheckOnlineComplete", { Key = "SignOnline" }, function(isComplete)
		if isComplete then return end
		IAPClient:Purchase("SignOnlineGetAll", function(success)
			if not success then return end
			NetClient:Request("Sign", "GetAllOnlineReward", { Key = "SignOnline" }, function(rewardList)
				UISignOnline:Refresh()
				for _, data in ipairs(rewardList) do
					UIManager:ShowMessageWithIcon(data.Icon, "Got "..data.Description)
					task.wait(0.1)
				end
				EventManager:Dispatch(EventManager.Define.RefreshSignOnline)
			end)
		end)
	end)
end

return UISignOnline
