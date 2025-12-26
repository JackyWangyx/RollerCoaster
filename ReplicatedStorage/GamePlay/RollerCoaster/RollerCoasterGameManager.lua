local SceneManager = require(game.ReplicatedStorage.ScriptAlias.SceneManager)
local ResourcesManager = require(game.ReplicatedStorage.ScriptAlias.ResourcesManager)
local NetClient = require(game.ReplicatedStorage.ScriptAlias.NetClient)
local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)

local RollerCoasterGameLoop = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterGameLoop)
local RollerCoasterAutoPlay = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterAutoPlay)
local TrackCreator = require(game.ReplicatedStorage.ScriptAlias.TrackCreator)

local RollerCoasterDefine = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterDefine)

local RollerCoasterGameManager = {}

RollerCoasterGameManager.GameRoot = nil

function RollerCoasterGameManager:Init()
	RollerCoasterGameLoop:Init()
	RollerCoasterAutoPlay:Init()
end

----------------------------------------------------------------------------------------------------------
-- Game Phase

function RollerCoasterGameManager:Enter(index)
	NetClient:Request("RollerCoaster", "Enter", { Index = index })
end

function RollerCoasterGameManager:Slide(index)
	if RollerCoasterGameLoop.GamePhase == RollerCoasterDefine.GamePhase.Up or 
		RollerCoasterGameLoop.GamePhase == RollerCoasterDefine.GamePhase.ArriveEnd then
		NetClient:Request("RollerCoaster", "Slide", { Index = index })
	end
end

function RollerCoasterGameManager:Exit(index)
	NetClient:Request("RollerCoaster", "Exit", { Index = index })
end

function RollerCoasterGameManager:GetWins(index)
	NetClient:Request("RollerCoaster", "GetWins", { Index = index })
end

return RollerCoasterGameManager
