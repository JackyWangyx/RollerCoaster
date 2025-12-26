local UIInfo = require(game.ReplicatedStorage.ScriptAlias.UIInfo)
local Util = require(game.ReplicatedStorage.ScriptAlias.Util)
local NetClient = require(game.ReplicatedStorage.ScriptAlias.NetClient)
local TimerManager =require(game.ReplicatedStorage.ScriptAlias.TimerManager)
local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)

local UIBuffFriendOnline = {}

UIBuffFriendOnline.Root = nil

function UIBuffFriendOnline:Init(root)
	UIBuffFriendOnline.Root = root
	EventManager:Listen(EventManager.Define.RefreshBuffFriendOnline, function()
		UIBuffFriendOnline:Refresh()
	end)
end

function UIBuffFriendOnline:Refresh()
	NetClient:Request("Friend", "GetProperty", function(info)
		if info and info.GetPowerFactor3 then
			info.DisplayGetPowerFactor3 = tostring(math.round(info.GetPowerFactor3 * 100)).."%"
			UIInfo:SetInfo(UIBuffFriendOnline.Root, info)
		end	
	end)
end

return UIBuffFriendOnline
