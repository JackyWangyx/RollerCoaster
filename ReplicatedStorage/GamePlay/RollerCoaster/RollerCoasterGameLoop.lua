local SceneManager = require(game.ReplicatedStorage.ScriptAlias.SceneManager)
local ResourcesManager = require(game.ReplicatedStorage.ScriptAlias.ResourcesManager)
local NetClient = require(game.ReplicatedStorage.ScriptAlias.NetClient)
local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)
local UpdateManager = require(game.ReplicatedStorage.ScriptAlias.UpdatorManager)
local PlayerManager = require(game.ReplicatedStorage.ScriptAlias.PlayerManager)
local UTween = require(game.ReplicatedStorage.ScriptAlias.UTween)

local TrackCreator = require(game.ReplicatedStorage.ScriptAlias.TrackCreator)
local TrackRoute = require(game.ReplicatedStorage.ScriptAlias.TrackRoute)
local RollerCoasterDefine = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterDefine)

local RollerCoasterGameLoop = {}

RollerCoasterGameLoop.GamePhase = RollerCoasterDefine.GamePhase.Idle
RollerCoasterGameLoop.TrackIndex = -1
RollerCoasterGameLoop.UpTrackRoute = nil
RollerCoasterGameLoop.DownTrackRoute = nil

RollerCoasterGameLoop.GameInitParam = nil
RollerCoasterGameLoop.UpdateInfo = {}

function RollerCoasterGameLoop:Init()
	UpdateManager:Heartbeat(function(deltaTime)
		RollerCoasterGameLoop:Update(deltaTime)
	end)
	
	EventManager:Listen(RollerCoasterDefine.Event.Enter, function(gameInitParam)
		RollerCoasterGameLoop:EnterUp(gameInitParam)
	end)
	
	EventManager:Listen(RollerCoasterDefine.Event.ArriveEnd, function()
		RollerCoasterGameLoop:EnterTop()
	end)
	
	EventManager:Listen(RollerCoasterDefine.Event.Slide, function()
		RollerCoasterGameLoop:EnterDown()
	end)
	
	EventManager:Listen(RollerCoasterDefine.Event.Exit, function()
		RollerCoasterGameLoop:EnterFinish()
	end)
	
	EventManager:Listen(RollerCoasterDefine.Event.LogGameProperty, function()
		RollerCoasterGameLoop:LogGameProperty()
	end)
end

function RollerCoasterGameLoop:LogGameProperty()
	print(RollerCoasterGameLoop.GameInitParam, RollerCoasterGameLoop.UpdateInfo)
end

---------------------------------------------------------------------------------------------------------
-- Phase

function RollerCoasterGameLoop:EnterUp(gameInitParam)
	RollerCoasterGameLoop.GamePhase = RollerCoasterDefine.GamePhase.Up
	RollerCoasterGameLoop.GameInitParam = gameInitParam

	-- Create Track
	RollerCoasterGameLoop.TrackIndex = gameInitParam.TrackIndex
	
	local trackRoot = SceneManager.LevelRoot.Game.Track:FindFirstChild("Track_".. string.format("%02d", RollerCoasterGameLoop.TrackIndex))
	local upSegmentList = {}
	for _, segmentName in ipairs(gameInitParam.UpSegmentNameList) do
		local segment = trackRoot.Up:FindFirstChild(segmentName)
		table.insert(upSegmentList, segment)
	end
	
	RollerCoasterGameLoop.UpTrackRoute = TrackRoute.new(upSegmentList)
	
	local downSegmentList = {}
	for _, segmentName in ipairs(gameInitParam.DownSegmentNameList) do
		local segment = trackRoot.Down:FindFirstChild(segmentName)
		table.insert(downSegmentList, segment)
	end

	RollerCoasterGameLoop.DownTrackRoute = TrackRoute.new(downSegmentList)
	
	-- Init Status
	local player = game.Players.LocalPlayer
	local rootPart = PlayerManager:GetHumanoidRootPart(player)
	PlayerManager:DisableControl(player)
	
	RollerCoasterGameLoop.UpdateInfo = {
		Player = player,
		RootPart = rootPart,
		MoveSpeed = gameInitParam.Speed,
		MoveDistance = 0,
		ArriveDistance = 0,
		MoveAcceleration = 0,
	}
	
	RollerCoasterGameLoop:SetPlayerPosByDistance(RollerCoasterGameLoop.UpTrackRoute, 0)
end

function RollerCoasterGameLoop:EnterTop()
	RollerCoasterGameLoop.GamePhase = RollerCoasterDefine.GamePhase.ArriveEnd
	local updateInfo = RollerCoasterGameLoop.UpdateInfo
	
	local player = game.Players.LocalPlayer
	local gameManager = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterGameManager)
	gameManager:GetWins(player)	
	
	task.wait()
	-- 先自动下滑
	gameManager:Slide(player)	
end

function RollerCoasterGameLoop:EnterDown()
	RollerCoasterGameLoop.GamePhase = RollerCoasterDefine.GamePhase.Down
	
	local player = game.Players.LocalPlayer
	local rootPart = PlayerManager:GetHumanoidRootPart(player)
	local startDistance = RollerCoasterGameLoop.UpdateInfo.MoveDistance
	startDistance = RollerCoasterGameLoop.DownTrackRoute:GetNearestPathDistance(rootPart.Position)
		
	local updateInfo = RollerCoasterGameLoop.UpdateInfo
	updateInfo.MoveSpeed = 0
	updateInfo.MoveAcceleration = RollerCoasterDefine.Game.SlideAcceleration
	updateInfo.MoveDistance = startDistance
end

function RollerCoasterGameLoop:EnterFinish()
	RollerCoasterGameLoop.GamePhase = RollerCoasterDefine.GamePhase.Idle
	
	local player = game.Players.LocalPlayer
	PlayerManager:EnableControl(player)
end

---------------------------------------------------------------------------------------------------------
-- Update

function RollerCoasterGameLoop:SetPlayerPosByDistance(trackRoute, distance, faceBackward)
	faceBackward = faceBackward or false
	local posInfo = trackRoute:GetPointByDistance(distance)
	local pos = posInfo.Position
	local rot = posInfo.Rotation

	if faceBackward then
		rot = rot * CFrame.Angles(0, math.pi, 0)
	end

	local rootPart = RollerCoasterGameLoop.UpdateInfo.RootPart
	local offsetY = 5
	local newPos = pos + (rot.UpVector * offsetY)
	rootPart.CFrame = CFrame.new(newPos) * rot
end

function RollerCoasterGameLoop:Update(deltaTime)
	if RollerCoasterGameLoop.GamePhase == RollerCoasterDefine.GamePhase.Up then
		RollerCoasterGameLoop:UpdateUp(deltaTime)
	elseif RollerCoasterGameLoop.GamePhase == RollerCoasterDefine.GamePhase.Down then
		RollerCoasterGameLoop:UpdateDown(deltaTime)
	end
end

function RollerCoasterGameLoop:UpdateUp(deltaTime)
	local upTrackRoute = RollerCoasterGameLoop.UpTrackRoute
	local downTrackRoute = RollerCoasterGameLoop.DownTrackRoute
	local updateInfo = RollerCoasterGameLoop.UpdateInfo
	updateInfo.MoveDistance = updateInfo.MoveDistance + deltaTime * updateInfo.MoveSpeed
	updateInfo.ArriveDistance = updateInfo.MoveDistance
	
	RollerCoasterGameLoop:SetPlayerPosByDistance(upTrackRoute, updateInfo.MoveDistance)
	
	if updateInfo.MoveDistance >= upTrackRoute.Length and updateInfo.MoveDistance < downTrackRoute.Length then
		-- 未到达顶端
		updateInfo.MoveDistance = upTrackRoute.Length
		updateInfo.ArriveDistance = updateInfo.MoveDistance
		
		RollerCoasterGameLoop.GamePhase = RollerCoasterDefine.GamePhase.Busy
		local player = game.Players.LocalPlayer
		local gameManager = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterGameManager)
		gameManager:Slide(player)
		
	elseif updateInfo.MoveDistance >= downTrackRoute.Length then
		-- 到达顶端
		RollerCoasterGameLoop.GamePhase = RollerCoasterDefine.GamePhase.Busy
		updateInfo.MoveDistance = downTrackRoute.Length
		updateInfo.ArriveDistance = updateInfo.MoveDistance
		
		local player = game.Players.LocalPlayer
		local gameManager = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterGameManager)
		gameManager:ArriveEnd(player)	
	end
end

function RollerCoasterGameLoop:UpdateDown(deltaTime)
	local downTrackRoute = RollerCoasterGameLoop.DownTrackRoute
	local updateInfo = RollerCoasterGameLoop.UpdateInfo
	updateInfo.MoveSpeed = updateInfo.MoveSpeed + deltaTime * updateInfo.MoveAcceleration
	updateInfo.MoveDistance = updateInfo.MoveDistance - deltaTime * updateInfo.MoveSpeed
	RollerCoasterGameLoop:SetPlayerPosByDistance(downTrackRoute, updateInfo.MoveDistance, true)
	
	if updateInfo.MoveDistance <= 0 then
		local player = game.Players.LocalPlayer
		local rootPart = PlayerManager:GetHumanoidRootPart(player)
		local fromPos = Vector3.new(rootPart.Position.X, 5, rootPart.Position.Z)
		local lookVector = rootPart.CFrame.LookVector
		local horizontalForward = Vector3.new(lookVector.X, 0, lookVector.Z).Unit * 35
		local toPos = fromPos + horizontalForward
		local direction = (toPos - fromPos).Unit
		local newCFrame = CFrame.new(Vector3.new(0, 0, 0), direction)
		rootPart.CFrame = CFrame.new(fromPos) * newCFrame
		
		local gameManager = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterGameManager)
		gameManager:GetCoin(player)
		
		RollerCoasterGameLoop.GamePhase = RollerCoasterDefine.GamePhase.Idle
		UTween:PlayerPosition(player, fromPos, toPos, 1)
			:SetEase(UTween.EaseType.OutQuart)
			:SetOnComplete(function()
			end)
		
		local gameManager = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterGameManager)
		gameManager:Exit(player)
	end
end

return RollerCoasterGameLoop
