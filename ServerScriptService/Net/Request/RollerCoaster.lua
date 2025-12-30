local PlayerManager = require(game.ReplicatedStorage.ScriptAlias.PlayerManager)
local Util = require(game.ReplicatedStorage.ScriptAlias.Util)
local ConfigManager = require(game.ReplicatedStorage.ScriptAlias.ConfigManager)
local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)
local AnalyticsManager = require(game.ReplicatedStorage.ScriptAlias.AnalyticsManager)

local PlayerRecord = require(game.ServerScriptService.ScriptAlias.PlayerRecord)
local IAPServer = require(game.ServerScriptService.ScriptAlias.IAPServer)
local PlayerPrefs = require(game.ServerScriptService.ScriptAlias.PlayerPrefs)

local RollerCoaster = {}

function LoadInfo(player)
	local saveInfo = PlayerPrefs:GetModule(player, "RollerCoaster")
	if saveInfo.CurrentRank == nil then
		saveInfo.CurrentRank = 1
	end
	
	if saveInfo.MaxRank == nil then
		saveInfo.MaxRank = 1
	end
	
	if saveInfo.RankList == nil then
		saveInfo.RankList = {
			["1"] = {
				ID = 1,
				IsUnlock = true,
				TrackLevel = 1,
			}
		}
	end
	
	return saveInfo
end

-----------------------------------------------------------------------------------------------
-- Info

function RollerCoaster:GetInfo(player)
	local saveInfo = LoadInfo(player)
	return saveInfo
end

function RollerCoaster:GetCurrentRank(player)
	local saveInfo = LoadInfo(player)
	return saveInfo.CurrentRank
end

function RollerCoaster:SetCurrentRank(player, param)
	local saveInfo = LoadInfo(player)
	local rank = param.Rank
	saveInfo.CurrentRank = rank
	return true
end

function RollerCoaster:GetMaxRank(player)
	local saveInfo = LoadInfo(player)
	return saveInfo.MaxRank
end

function RollerCoaster:GetRankInfo(player, param)
	local saveInfo = LoadInfo(player)
	local rank = param.Rank
	local rankList = saveInfo.RankList
	local rankInfo = rankList[tostring(rank)]
	if not rankInfo then
		rankInfo = {
			ID = rank,
			IsUnlock = false,
			TrackLevel = 1,
		}
		
		rankList[tostring(rank)] = rankInfo
	end
	
	return rankInfo
end

function RollerCoaster:UnlockRank(player, param)
	local rankInfo = RollerCoaster:GetRankInfo(player, param)
	if rankInfo.IsUnlock then
		return false
	end
	
	local rank = param.Rank
	local rankData = ConfigManager:GetData("Rank", rank)
	local accountRequest = require(game.ServerScriptService.ScriptAlias.Account)
	local remainWins = accountRequest:GetWins(player)
	if remainWins < rankData.CostWins  then
		return false
	end
	
	accountRequest:SpendWins(player, { Value = rankData.CostCoin })
	rankInfo.IsUnlock = true
	return true
end

-----------------------------------------------------------------------------------------------
-- Track

function RollerCoaster:GetTrackStoreInfo(player)
	local currentRank = RollerCoaster:GetCurrentRank(player)
	local rankInfo =  RollerCoaster:GetRankInfo(player, { Rank = currentRank })
	local trackLevel = rankInfo.TrackLevel
	local trackDataList = ConfigManager:SearchAllData("Track", "Rank", currentRank, "Direction", "Up")
	local isMaxLevel = trackLevel >= #trackDataList
	local trackData = trackDataList[trackLevel]
	local rankData = ConfigManager:GetData("Rank", currentRank)
	local info = {
		Name = rankData.Name,
		Icon = rankData.Icon,
		Level = trackLevel,
		MaxLevel = #trackDataList,
		IsMaxLevel = isMaxLevel,
		CostCoin = trackData.CostCoin,
		CostRobux = trackData.CostRobux,
		ProductKey = trackData.ProductKey,
		Length = trackData.Length
	}
	
	return info
end

function RollerCoaster:UpgradeTrack(player, param)
	local buyType = param.Type
	local currentRank = RollerCoaster:GetCurrentRank(player)
	local rankInfo =  RollerCoaster:GetRankInfo(player, { Rank = currentRank })
	local trackLevel = rankInfo.TrackLevel
	local trackDataList = ConfigManager:SearchAllData("Track", "Rank", currentRank, "Direction", "Up")
	local isMaxLevel = trackLevel >= #trackDataList
	local trackData = trackDataList[trackLevel]
	
	if isMaxLevel then
		return {
			Success = false,
			Message = "Max Level",
		}
	end
	
	if buyType == "Coin" then
		local accountRequest = require(game.ServerScriptService.ScriptAlias.Account)
		local remainCoin = accountRequest:GetCoin(player)
		if remainCoin < trackData.CostCoin  then
			return {
				Success = false,
				Message = "Coin not enough!",
			}
		end

		accountRequest:SpendCoin(player, { Value = trackData.CostCoin })
	end
	
	rankInfo.TrackLevel += 1
	EventManager:Dispatch(EventManager.Define.RefreshTrack, { Player = player })
	
	return {
		Success = true,
		Message = "",
	}
end

-----------------------------------------------------------------------------------------------
-- Game

function RollerCoaster:Enter(player, param)
	local rollerCoasterGameServerHandler = require(game.ServerScriptService.ScriptAlias.RollerCoasterGameServerHandler)
	local result = rollerCoasterGameServerHandler:Enter(player, param)
	return result
end

function RollerCoaster:ArriveEnd(player)
	local rollerCoasterGameServerHandler = require(game.ServerScriptService.ScriptAlias.RollerCoasterGameServerHandler)
	local result = rollerCoasterGameServerHandler:ArriveEnd(player)
	return result
end

function RollerCoaster:Slide(player, param)
	local rollerCoasterGameServerHandler = require(game.ServerScriptService.ScriptAlias.RollerCoasterGameServerHandler)
	local result = rollerCoasterGameServerHandler:Slide(player, param)
	return result
end

function RollerCoaster:Exit(player)
	local rollerCoasterGameServerHandler = require(game.ServerScriptService.ScriptAlias.RollerCoasterGameServerHandler)
	local result = rollerCoasterGameServerHandler:Exit(player)
	return result
end

function RollerCoaster:GetWins(player)
	local rollerCoasterGameServerHandler = require(game.ServerScriptService.ScriptAlias.RollerCoasterGameServerHandler)
	local result = rollerCoasterGameServerHandler:GetWins(player)
	return result
end

function RollerCoaster:GetCoin(player)
	local rollerCoasterGameServerHandler = require(game.ServerScriptService.ScriptAlias.RollerCoasterGameServerHandler)
	local result = rollerCoasterGameServerHandler:GetCoin(player)
	return result
end

return RollerCoaster
