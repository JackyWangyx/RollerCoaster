local IAPClient = require(game.ReplicatedStorage.ScriptAlias.IAPClient)
local UIInfo = require(game.ReplicatedStorage.ScriptAlias.UIInfo)
local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)
local Util = require(game.ReplicatedStorage.ScriptAlias.Util)
local UpdatorManager = require(game.ReplicatedStorage.ScriptAlias.UpdatorManager)
local PlayerManager = require(game.ReplicatedStorage.ScriptAlias.PlayerManager)
local UIList = require(game.ReplicatedStorage.ScriptAlias.UIList)
local AttributeUtil = require(game.ReplicatedStorage.ScriptAlias.AttributeUtil)

local RollerCoasterGameManager = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterGameManager)
local RollerCoasterGameLoop = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterGameLoop)
local RollerCoasterDefine = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterDefine)

local Define = require(game.ReplicatedStorage.Define)

local UIRollerCoasterGameInfo = {}

UIRollerCoasterGameInfo.UIRoot = nil

UIRollerCoasterGameInfo.GameFrame = nil
UIRollerCoasterGameInfo.PlayerGameFrame = nil
UIRollerCoasterGameInfo.BottonRankTrans = nil
UIRollerCoasterGameInfo.RankBar = nil
UIRollerCoasterGameInfo.IsInGame = false

function UIRollerCoasterGameInfo:Init(root)
	UIRollerCoasterGameInfo.UIRoot = root
	UIInfo:HandleAllButton(root, UIRollerCoasterGameInfo)

	UIRollerCoasterGameInfo.GameFrame = Util:GetChildByName(root, "GameFrame")
	UIRollerCoasterGameInfo.PlayerGameFrame = Util:GetChildByName(root, "PlayerGameFrame")
	UIRollerCoasterGameInfo.BottonRankTrans = Util:GetChildByName(UIRollerCoasterGameInfo.GameFrame, "BottonRankTrans", true)
	UIRollerCoasterGameInfo.RankBar = Util:GetChildByName(UIRollerCoasterGameInfo.GameFrame, "RankBar", true)
	
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
		UIRollerCoasterGameInfo:Refresh()
	end)
end

function UIRollerCoasterGameInfo:Refresh()	
	UIRollerCoasterGameInfo:RefreshPlayerInfo()
	
	local updateGameInfo = RollerCoasterGameManager.UpdateGameInfo
	UIRollerCoasterGameInfo:RefreshBottonRank(updateGameInfo)
end

function UIRollerCoasterGameInfo:RefreshPlayerInfo()
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

-- Rank

function UIRollerCoasterGameInfo:RefreshBottonRank(updateGameInfo)
	local rankList = UIRollerCoasterGameInfo:GetRankList(updateGameInfo)
	local itemList = UIList:LoadWithInfo(UIRollerCoasterGameInfo.BottonRankTrans, "UIBottonRankItem", rankList)
	UIList:HadnlePlayerHeadIconAsync(itemList)

	for _, item in ipairs(itemList) do
		local progress = AttributeUtil:GetInfoValue(item, "Progress")
		local bar = UIRollerCoasterGameInfo.RankBar
		UIRollerCoasterGameInfo:UpdateRankPointer(bar, item, progress)
	end
end

function UIRollerCoasterGameInfo:UpdateRankPointer(progressBar, pointer, percent)
	if not progressBar then return end
	percent = math.clamp(percent, 0, 1)
	local barAbsPos = progressBar.AbsolutePosition
	local barAbsSize = progressBar.AbsoluteSize
	local pointerSize = pointer.AbsoluteSize
	local targetAbsY = barAbsPos.Y + (barAbsSize.Y * percent) - (pointerSize.Y / 2)
	local targetAbsX = barAbsPos.X + (barAbsSize.X / 2) - (pointerSize.X / 2) 
	if pointer.Parent then
		local parentAbsPos = pointer.Parent.AbsolutePosition
		local relativeX = targetAbsX - parentAbsPos.X
		local relativeY = targetAbsY - parentAbsPos.Y
		pointer.Position = UDim2.new(0, relativeX, 0, relativeY)
	end
end

function UIRollerCoasterGameInfo:GetRankList(updateGameInfo)
	local result = {}
	local localPlayer = game.Players.LocalPlayer
	local selfInfo = nil

	for _, playerInfo in ipairs(updateGameInfo) do
		local playerID = playerInfo.PlayerID
		local player = PlayerManager:GetPlayerById(playerID)

		if player then
			local rankInfo = {
				UserID = playerID,
				Distance = playerInfo.Distance,
				Progress = 1 - playerInfo.Progress,
				IsSelf = playerID == localPlayer.UserId,
			}

			if rankInfo.IsSelf then
				selfInfo = rankInfo
			else
				table.insert(result, rankInfo)
			end
		end
	end

	if selfInfo then
		table.insert(result, selfInfo)
	end

	return result
end

-- Button

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
