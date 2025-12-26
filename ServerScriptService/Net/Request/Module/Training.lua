local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)
local AnalyticsManager = require(game.ReplicatedStorage.ScriptAlias.AnalyticsManager)

local PlayerProperty = require(game.ServerScriptService.ScriptAlias.PlayerProperty)
local PlayerRecord = require(game.ServerScriptService.ScriptAlias.PlayerRecord)
local NetServer = require(game.ServerScriptService.ScriptAlias.NetServer)

local Training = {}

function Training:Start(player, param)
	local index = param.Index
	local trainingHandler = require(game.ServerScriptService.ScriptAlias.TrainingHandler)
	local result = trainingHandler:Start(player, index)
	return result
end

function Training:End(player, param)
	local trainingHandler = require(game.ServerScriptService.ScriptAlias.TrainingHandler)
	local result = trainingHandler:End(player)
	return result
end

-- 仅训练值，不包含基础值
function Training:GetPower(player)
	local baseProperty = PlayerProperty:GetPlayerProperty(player)
	return baseProperty.TrainingPower or 0
end

function Training:AddPower(player, param)
	local value = param.Value
	local baseProperty = PlayerProperty:GetPlayerProperty(player)
	local targetValue = baseProperty.TrainingPower + value
	
	baseProperty.TrainingPower = targetValue

	local power = PlayerProperty:GetPower(player)	
	EventManager:DispatchToClient(player, EventManager.Define.RefreshPower, power)
	EventManager:DispatchToClient(player, EventManager.Define.GetPower, value)
	
	AnalyticsManager:EarnCurrency(player, AnalyticsManager.CurrencyType.Power, value)
	
	PlayerRecord:AddValue(player, PlayerRecord.Define.TotalGetPower, value)
	PlayerRecord:SetMaxValue(player, PlayerRecord.Define.MaxTrainingPower, targetValue)
	EventManager:Dispatch(EventManager.Define.QuestGetPower, {
		Player = player,
		Value = value,
	})
	
	return true
end

function Training:SpendPower(player, param)
	local value = param.Value
	local baseProperty = PlayerProperty:GetPlayerProperty(player)
	if baseProperty.TrainingPower >= value then
		baseProperty.TrainingPower -= value
		
		local power = PlayerProperty:GetPower(player)	
		EventManager:DispatchToClient(player, EventManager.Define.RefreshPower, power)
		AnalyticsManager:SpendCurrency(player, AnalyticsManager.CurrencyType.Power, value)
		return true
	else
		return false
	end
end

return Training
