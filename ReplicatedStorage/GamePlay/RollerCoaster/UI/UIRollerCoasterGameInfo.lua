local IAPClient = require(game.ReplicatedStorage.ScriptAlias.IAPClient)
local UIInfo = require(game.ReplicatedStorage.ScriptAlias.UIInfo)
local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)
local Util = require(game.ReplicatedStorage.ScriptAlias.Util)
local UpdatorManager = require(game.ReplicatedStorage.ScriptAlias.UpdatorManager)

local RollerCoasterGameManager = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterGameManager)
local RollerCoasterGameLoop = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterGameLoop)
local RollerCoasterDefine = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterDefine)

local UIRollerCoasterGameInfo = {}

UIRollerCoasterGameInfo.UIRoot = nil

UIRollerCoasterGameInfo.GameFrame = nil
UIRollerCoasterGameInfo.PlayerGameFrame = nil
UIRollerCoasterGameInfo.IsInGame = false

function UIRollerCoasterGameInfo:Init(root)
	UIRollerCoasterGameInfo.UIRoot = root
	UIInfo:HandleAllButton(root, UIRollerCoasterGameInfo)

	UIRollerCoasterGameInfo.GameFrame = Util:GetChildByName(root, "GameFrame")
	UIRollerCoasterGameInfo.PlayerGameFrame = Util:GetChildByName(root, "PlayerGameFrame")
	
	UIRollerCoasterGameInfo.PlayerGameFrame.Visible = false
	
	EventManager:Listen(RollerCoasterDefine.Event.Enter, function(param)
		UIRollerCoasterGameInfo.PlayerGameFrame.Visible = true
		UIRollerCoasterGameInfo.IsInGame = true
	end)

	EventManager:Listen(RollerCoasterDefine.Event.ArriveEnd, function()
		
	end)

	EventManager:Listen(RollerCoasterDefine.Event.Slide, function()
	
	end)

	EventManager:Listen(RollerCoasterDefine.Event.Exit, function()
		UIRollerCoasterGameInfo.PlayerGameFrame.Visible = false
		UIRollerCoasterGameInfo.IsInGame = false
	end)

	UIRollerCoasterGameInfo:Refresh()
	
	UpdatorManager:RenderStepped(function(deltaTime)
		UIRollerCoasterGameInfo:RefreshInfo()
	end)
end

function UIRollerCoasterGameInfo:Refresh()

end

function UIRollerCoasterGameInfo:RefreshRank()
	
end

function UIRollerCoasterGameInfo:RefreshInfo()
	if not UIRollerCoasterGameInfo.IsInGame then return end
	
	local gameInitParam = RollerCoasterGameLoop.GameInitParam
	local updateInfo = RollerCoasterGameLoop.UpdateInfo
	if not updateInfo or not gameInitParam then return end

	local info = {
		GetCoin = math.round(updateInfo.ArriveDistance * gameInitParam.RewardCoinPerMeter),
		MoveDistance = math.round(updateInfo.ArriveDistance),
	}

	UIInfo:SetInfo(UIRollerCoasterGameInfo.PlayerGameFrame, info)
end

-- Game

function UIRollerCoasterGameInfo:Button_Glide()
	RollerCoasterGameManager:Slide()
end

function UIRollerCoasterGameInfo:Button_DoubleSpeed()
	--RollerCoasterGameManager:Exit()
end

function UIRollerCoasterGameInfo:Button_ExitGame()
	RollerCoasterGameManager:Exit()
end

return UIRollerCoasterGameInfo
