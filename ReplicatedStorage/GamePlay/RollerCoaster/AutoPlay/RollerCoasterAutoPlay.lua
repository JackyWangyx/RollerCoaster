local RunService = game:GetService("RunService")

local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)
local NetClient = require(game.ReplicatedStorage.ScriptAlias.NetClient)
local IAPClient = require(game.ReplicatedStorage.ScriptAlias.IAPClient)

local Define = require(game.ReplicatedStorage.Define)


local RollerCoasterAutoPlay = {}

local Info = {
	IsAutoGame = false,
	IsAutoClick = false,
}

local CurrentPlayerStatus = nil

function RollerCoasterAutoPlay:Init()
	Info.IsAutoGame = false
	Info.IsAutoClick = false

	CurrentPlayerStatus = Define.PlayerStatus.Idle
	NetClient:Request("Player", "GetStatus", function(status)	
		CurrentPlayerStatus = status	
	end)

	EventManager:Listen(EventManager.Define.RefreshPlayerStatus, function(status)
		CurrentPlayerStatus = status
	end)

	task.spawn(function() 
		RollerCoasterAutoPlay:AutoPlayCo()
	end)
end

function RollerCoasterAutoPlay:AutoPlayCo()
	task.wait()
	local player = game.Players.LocalPlayer
	while true do
		--if Info.IsAutoGame then
		--	if CurrentPlayerStatus == Define.PlayerStatus.Idle then
		--		NetClient:Request("Game", "Enter", function(result)	
		--		end)
		--		task.wait(1)
		--	end
		--end

		task.wait(0.1)
	end
end

function RollerCoasterAutoPlay:GetInfo()
	return Info
end

-- Game

function RollerCoasterAutoPlay:StartAutoGame()
	if Info.IsAutoGame then return end
	Info.IsAutoGame = true
	EventManager:Dispatch(EventManager.Define.RefreshAutoPlay, Info)
end

function RollerCoasterAutoPlay:EndAutoGame()
	if not Info.IsAutoGame then return end
	Info.IsAutoGame = false
	EventManager:Dispatch(EventManager.Define.RefreshAutoPlay, Info)
end

return RollerCoasterAutoPlay
