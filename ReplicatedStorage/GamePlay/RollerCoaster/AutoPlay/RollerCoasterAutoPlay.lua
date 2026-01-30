local RunService = game:GetService("RunService")

local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)
local NetClient = require(game.ReplicatedStorage.ScriptAlias.NetClient)
local IAPClient = require(game.ReplicatedStorage.ScriptAlias.IAPClient)
local SceneAreaManager = require(game.ReplicatedStorage.ScriptAlias.SceneAreaManager)

local RollerCoasterGameLoop = nil
local RollerCoasterDefine = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterDefine)

local Define = require(game.ReplicatedStorage.Define)

local RollerCoasterAutoPlay = {}

RollerCoasterAutoPlay.Info = {
	IsAutoGame = false,
	--IsAutoClick = false,
}

function RollerCoasterAutoPlay:Init()
	RollerCoasterGameLoop = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterGameLoop)
	RollerCoasterAutoPlay.Info.IsAutoGame = false

	task.spawn(function() 
		RollerCoasterAutoPlay:AutoPlayCo()
	end)
end

function RollerCoasterAutoPlay:AutoPlayCo()
	task.wait()
	local player = game.Players.LocalPlayer
	while true do
		local currentState = RollerCoasterGameLoop.GamePhase
		if RollerCoasterAutoPlay.Info.IsAutoGame then
			if currentState == RollerCoasterDefine.GamePhase.Idle then
				task.wait(2)
			end
			
			if currentState == RollerCoasterDefine.GamePhase.Idle then
				NetClient:Request("RollerCoaster", "Enter", { Index = SceneAreaManager.CurrentAreaIndex }, function(result)	
				end)
				task.wait(2)
			else
				task.wait(2)
			end
		end

		task.wait(0.1)
	end
end

-- Game

function RollerCoasterAutoPlay:StartAutoGame()
	if RollerCoasterAutoPlay.Info.IsAutoGame then return end
	RollerCoasterAutoPlay.Info.IsAutoGame = true
	EventManager:Dispatch(EventManager.Define.RefreshAutoPlay, RollerCoasterAutoPlay.Info)
end

function RollerCoasterAutoPlay:EndAutoGame()
	if not RollerCoasterAutoPlay.Info.IsAutoGame then return end
	RollerCoasterAutoPlay.Info.IsAutoGame = false
	EventManager:Dispatch(EventManager.Define.RefreshAutoPlay, RollerCoasterAutoPlay.Info)
end

return RollerCoasterAutoPlay
