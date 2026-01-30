local IAPClient = require(game.ReplicatedStorage.ScriptAlias.IAPClient)
local UIInfo = require(game.ReplicatedStorage.ScriptAlias.UIInfo)
local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)

local RollerCoasterAutoPlay = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterAutoPlay)

local UIRollerCoasterAutoPlay = {}

UIRollerCoasterAutoPlay.UIRoot = nil

function UIRollerCoasterAutoPlay:Init(root)
	UIRollerCoasterAutoPlay.UIRoot = root
	UIInfo:HandleAllButton(root, UIRollerCoasterAutoPlay)

	UIRollerCoasterAutoPlay:Refresh()

	EventManager:Listen(EventManager.Define.RefreshAutoPlay, function(info)
		UIRollerCoasterAutoPlay:Refresh()
	end)
end

function UIRollerCoasterAutoPlay:Refresh()
	local info = RollerCoasterAutoPlay.Info
	UIInfo:SetInfo(UIRollerCoasterAutoPlay.UIRoot, info)
end

-- Game
function UIRollerCoasterAutoPlay:Button_AutoGame()
	IAPClient:CheckHasGamePass("AutoPlay", function(isPurchased)
		if isPurchased then
			UIRollerCoasterAutoPlay:SwitchAutoPlay()
		else
			IAPClient:Purchase("AutoPlay", function(success)
				if success then
					UIRollerCoasterAutoPlay:SwitchAutoPlay()
				end			
			end)
		end
	end)
end

function UIRollerCoasterAutoPlay:SwitchAutoPlay()
	local info = RollerCoasterAutoPlay.Info
	if info.IsAutoGame then
		RollerCoasterAutoPlay:EndAutoGame()
	else
		if not info.IsAutoTraining then
			RollerCoasterAutoPlay:StartAutoGame()
		end
	end
end

return UIRollerCoasterAutoPlay
