local ConfigManager = require(game.ReplicatedStorage.ScriptAlias.ConfigManager)
local Util = require(game.ReplicatedStorage.ScriptAlias.Util)
local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)
local AnalyticsManager = require(game.ReplicatedStorage.ScriptAlias.AnalyticsManager)

local PlayerRecord = require(game.ServerScriptService.ScriptAlias.PlayerRecord)
local NetServer = require(game.ServerScriptService.ScriptAlias.NetServer)
local PlayerPrefs = require(game.ServerScriptService.ScriptAlias.PlayerPrefs)
local PlayerProperty = require(game.ServerScriptService.ScriptAlias.PlayerProperty)

local Account = {}

function LoadInfo(player)
	local saveInfo = PlayerPrefs:GetModule(player, "Account")
	return saveInfo
end

-- Coin

function Account:GetCoin(player)
	local accountModule = LoadInfo(player)
	local coin = accountModule.Coin 
	if not coin then
		coin = 700
		accountModule.Coin = 700
	end
	
	return coin
end

function Account:AddCoin(player, param)
	local value =  param.Value
	if value == 0 then
		return true
	end
	
	local scource = param.Source or AnalyticsManager.CurrencySourceType.GamePlay
	
	local accountModule = LoadInfo(player)
	local coin = accountModule.Coin or 0
	coin += value
	accountModule.Coin = coin

	EventManager:DispatchToClient(player, EventManager.Define.GetCoin, value)
	EventManager:DispatchToClient(player, EventManager.Define.RefreshCoin, coin)
	
	PlayerRecord:AddValue(player, PlayerRecord.Define.TotalGetCoin, value)
	EventManager:Dispatch(EventManager.Define.QuestGetCoin, {
		Player = player,
		Value = value,
	})
	
	AnalyticsManager:EarnCurrency(player, AnalyticsManager.CurrencyType.Coin, value, scource)
	
	return true
end

function Account:SpendCoin(player, param)
	local value =  param.Value
	if value == 0 then
		return true
	end
	
	local scource = param.Source or AnalyticsManager.CurrencySourceType.GamePlay
	
	local accountModule = LoadInfo(player)
	local coin = accountModule.Coin or 0
	if coin < value then
		return false
	end
	
	coin -= value
	accountModule.Coin = coin
	EventManager:DispatchToClient(player, EventManager.Define.RefreshCoin, coin)
	AnalyticsManager:SpendCurrency(player, AnalyticsManager.CurrencyType.Coin, value, scource)
	
	return true
end

-- Wins

function Account:GetWins(player)
	local accountModule = LoadInfo(player)
	local wins = accountModule.Wins 
	if not wins then
		wins = 0
		accountModule.Wins = 0
	end

	return wins
end

function Account:AddWins(player, param)
	local value =  param.Value
	if value == 0 then
		return true
	end
	
	local scource = param.Source or AnalyticsManager.CurrencySourceType.GamePlay

	local accountModule = LoadInfo(player)
	local wins = accountModule.Wins or 0
	wins += value
	accountModule.Wins = wins

	EventManager:DispatchToClient(player, EventManager.Define.GetWins, value)
	EventManager:DispatchToClient(player, EventManager.Define.RefreshWins, wins)

	PlayerRecord:AddValue(player, PlayerRecord.Define.TotalGetWins, value)
	EventManager:Dispatch(EventManager.Define.QuestGetWins, {
		Player = player,
		Value = value,
	})

	AnalyticsManager:EarnCurrency(player, AnalyticsManager.CurrencyType.Wins, value, scource)

	return true
end

function Account:SpendWins(player, param)
	local value =  param.Value
	if value == 0 then
		return true
	end
	
	local scource = param.Source or AnalyticsManager.CurrencySourceType.GamePlay

	local accountModule = LoadInfo(player)
	local wins = accountModule.Wins or 0
	if wins < value then
		return false
	end

	wins -= value
	accountModule.Wins = wins
	EventManager:DispatchToClient(player, EventManager.Define.RefreshWins, wins)
	AnalyticsManager:SpendCurrency(player, AnalyticsManager.CurrencyType.Wins, value, scource)

	return true
end

return Account