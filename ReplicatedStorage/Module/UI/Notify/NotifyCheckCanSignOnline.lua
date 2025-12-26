local UINotify = require(game.ReplicatedStorage.ScriptAlias.UINotify)
local NetClient = require(game.ReplicatedStorage.ScriptAlias.NetClient)
local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)

local NotifyCheckCanSignOnline = {}

function NotifyCheckCanSignOnline:Handle(rootPart)
	local notifyPart = rootPart:WaitForChild("Notify")
	local function refresh()
		NetClient:Request("Sign", "CheckCanSignOnline", { Key = "SignOnline" } , function(result)
			notifyPart.Visible = result
		end)
	end
	
	UINotify:Handle(rootPart, function(notifyPart)
		refresh()
	end
	, UINotify.RefreshType.AutoRefresh
	, 11)
	
	EventManager:Listen(EventManager.Define.RefreshSignOnline, function()
		refresh()
	end)
end

return NotifyCheckCanSignOnline
