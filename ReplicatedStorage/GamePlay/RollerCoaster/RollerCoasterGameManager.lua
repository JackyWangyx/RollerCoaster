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
RollerCoasterGameManager.UpdateGameInfo = nil

function RollerCoasterGameManager:Init()
	RollerCoasterGameLoop:Init()
	RollerCoasterAutoPlay:Init()
end

----------------------------------------------------------------------------------------------------------
-- Game Phase

function RollerCoasterGameManager:Enter(index)
	NetClient:Request("RollerCoaster", "Enter", { Index = index }, function()
		EventManager:Dispatch(EventManager.Define.GameStart)
	end)
end

function RollerCoasterGameManager:ArriveEnd(index)
	NetClient:Request("RollerCoaster", "ArriveEnd")
end

function RollerCoasterGameManager:Slide(index)
	if RollerCoasterGameLoop.GamePhase ~= RollerCoasterDefine.GamePhase.Up and 
		RollerCoasterGameLoop.GamePhase ~=RollerCoasterDefine.GamePhase.ArriveEnd then
		return
	end
	
	local param = {
		ArriveDistance = RollerCoasterGameLoop.UpdateInfo.ArriveDistance
	}
	
	NetClient:Request("RollerCoaster", "Slide", param)
end

function RollerCoasterGameManager:Exit(index)
	NetClient:Request("RollerCoaster", "Exit", function()
		EventManager:Dispatch(EventManager.Define.GameFinish)
	end)
end

function RollerCoasterGameManager:GetWins(index)
	if RollerCoasterGameLoop.GamePhase == RollerCoasterDefine.GamePhase.ArriveEnd then
		NetClient:Request("RollerCoaster", "GetWins")
	end
end

function RollerCoasterGameManager:GetCoin(index)
	NetClient:Request("RollerCoaster", "GetCoin")
end

----------------------------------------------------------------------------------------------------------
-- On Server Event

function RollerCoasterGameManager:OnUpdateGameInfo(broadcastInfo)
	RollerCoasterGameManager.UpdateGameInfo = broadcastInfo
end

return RollerCoasterGameManager
