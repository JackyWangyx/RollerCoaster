local IAPClient = require(game.ReplicatedStorage.ScriptAlias.IAPClient)
local UIInfo = require(game.ReplicatedStorage.ScriptAlias.UIInfo)
local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)

local RollerCoasterGameManager = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterGameManager)

local UIRollerCoasterGameInfo = {}

UIRollerCoasterGameInfo.UIRoot = nil

function UIRollerCoasterGameInfo:Init(root)
	UIRollerCoasterGameInfo.UIRoot = root
	UIInfo:HandleAllButton(root, UIRollerCoasterGameInfo)

	UIRollerCoasterGameInfo:Refresh()
end

function UIRollerCoasterGameInfo:Refresh()
	
end

function UIRollerCoasterGameInfo:RefreshRank()
	
end

function UIRollerCoasterGameInfo:RefreshInfo()
	
end

-- Game

function UIRollerCoasterGameInfo:Button_Glide()
	RollerCoasterGameManager:Slide()
	print("Glide")
end

function UIRollerCoasterGameInfo:Button_DoubleSpeed()
	--RollerCoasterGameManager:Exit()
end

function UIRollerCoasterGameInfo:Button_ExitGame()
	RollerCoasterGameManager:Exit()
end

return UIRollerCoasterGameInfo
