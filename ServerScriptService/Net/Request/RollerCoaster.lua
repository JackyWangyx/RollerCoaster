local PlayerManager = require(game.ReplicatedStorage.ScriptAlias.PlayerManager)
local Util = require(game.ReplicatedStorage.ScriptAlias.Util)
local ConfigManager = require(game.ReplicatedStorage.ScriptAlias.ConfigManager)
local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)
local AnalyticsManager = require(game.ReplicatedStorage.ScriptAlias.AnalyticsManager)

local PlayerRecord = require(game.ServerScriptService.ScriptAlias.PlayerRecord)
local IAPServer = require(game.ServerScriptService.ScriptAlias.IAPServer)
local PlayerPrefs = require(game.ServerScriptService.ScriptAlias.PlayerPrefs)

local ThemeRequest = require(game.ServerScriptService.ScriptAlias.Theme)

local RollerCoaster = {}

function LoadInfo(player)
	local saveInfo = PlayerPrefs:GetModule(player, "RollerCoaster")
	if saveInfo.ThemeList == nil then
		saveInfo.ThemeList = {
			["World01"] = {
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

function RollerCoaster:GetThemeInfo(player, param)
	local saveInfo = LoadInfo(player)
	local themeKey = param.ThemeKey
	local themeList = saveInfo.ThemeList
	local themeInfo = themeList[themeKey]
	if not themeInfo then
		themeInfo = {
			TrackLevel = 1,
		}
		
		themeList[themeKey] = themeInfo
	end
	
	return themeInfo
end

-----------------------------------------------------------------------------------------------
-- Track

function RollerCoaster:GetTrackStoreInfo(player)
	local themeKey = ThemeRequest:GetCurrentTheme(player)
	local themeData = ConfigManager:SearchData("Theme", "ThemeKey", themeKey)
	local themeInfo =  RollerCoaster:GetThemeInfo(player, { ThemeKey = themeKey })
	local trackLevel = themeInfo.TrackLevel
	local trackDataList = ConfigManager:SearchAllData("Track"..themeKey, "Direction", "Up")
	local isMaxLevel = trackLevel >= #trackDataList
	local trackData = trackDataList[trackLevel]
	local nextTrackData = nil
	if isMaxLevel then
		nextTrackData = nil
	else
		nextTrackData = trackDataList[trackLevel + 1]
	end
	
	local info = {
		Name = themeData.Name,
		Icon = trackData.Icon,
		Level = trackLevel,
		MaxLevel = #trackDataList,
		IsMaxLevel = isMaxLevel,
		CostCoin = trackData.CostCoin,
		CostRobux = trackData.CostRobux,
		ProductKey = trackData.ProductKey,
	}
	
	if nextTrackData then
		info.Length = nextTrackData.Length
	else
		info.Length = 0
	end
	
	return info
end

function RollerCoaster:UpgradeTrack(player, param)
	local buyType = param.Type
	local themeKey = ThemeRequest:GetCurrentTheme(player)
	local themeData = ConfigManager:SearchData("Theme", "ThemeKey", themeKey)
	local themeInfo =  RollerCoaster:GetThemeInfo(player, { ThemeKey = themeKey })
	local trackLevel = themeInfo.TrackLevel
	local trackDataList = ConfigManager:SearchAllData("Track"..themeKey, "Direction", "Up")
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
	
	themeInfo.TrackLevel += 1
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
