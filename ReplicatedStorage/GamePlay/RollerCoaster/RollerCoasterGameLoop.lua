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

RollerCoasterGameLoop.UpdateInfo = {}

function RollerCoasterGameLoop:Init()
	UpdateManager:Heartbeat(function(deltaTime)
		RollerCoasterGameLoop:Update(deltaTime)
	end)
	
	EventManager:Listen(RollerCoasterDefine.Event.Enter, function(param)
		RollerCoasterGameLoop:EnterUp(param)
	end)
	
	EventManager:Listen(RollerCoasterDefine.Event.ArriveEnd, function()
		RollerCoasterGameLoop.GamePhase = RollerCoasterDefine.GamePhase.ArriveEnd
	end)
	
	EventManager:Listen(RollerCoasterDefine.Event.Slide, function(param)
		RollerCoasterGameLoop:EnterDown(param)
	end)
	
	EventManager:Listen(RollerCoasterDefine.Event.Exit, function()
		RollerCoasterGameLoop.GamePhase = RollerCoasterDefine.GamePhase.Idle
	end)
end

---------------------------------------------------------------------------------------------------------
-- Phase

function RollerCoasterGameLoop:EnterUp(param)
	RollerCoasterGameLoop.GamePhase = RollerCoasterDefine.GamePhase.Up

	-- Create Track
	RollerCoasterGameLoop.TrackIndex = param.Index
	local trackRoot = SceneManager.LevelRoot.Game.Track:FindFirstChild("Track_".. string.format("%02d", RollerCoasterGameLoop.TrackIndex))
	local upSegmentList = {}
	for _, segmentName in ipairs(param.UpSegmentNameList) do
		local segment = trackRoot.Up:FindFirstChild(segmentName)
		table.insert(upSegmentList, segment)
	end
	
	RollerCoasterGameLoop.UpTrackRoute = TrackRoute.new(upSegmentList)
	
	local downSegmentList = {}
	for _, segmentName in ipairs(param.DownSegmentNameList) do
		local segment = trackRoot.Down:FindFirstChild(segmentName)
		table.insert(downSegmentList, segment)
	end

	RollerCoasterGameLoop.DownTrackRoute = TrackRoute.new(downSegmentList)
	
	-- Init Status
	local player = game.Players.LocalPlayer
	local rootPart = PlayerManager:GetHumanoidRootPart(player)
	PlayerManager:DisablePhysic(player)
	PlayerManager:DisableControl(player)
	PlayerManager:EnableAnchored(player)
	
	RollerCoasterGameLoop.UpdateInfo = {
		Player = player,
		RootPart = rootPart,
		MoveSpeed = 100,
		MoveDistance = 0,
		MoveAcceleration = 0,
	}
	
	RollerCoasterGameLoop:SetPlayerPosByDistance(RollerCoasterGameLoop.UpTrackRoute, 0)
end

function RollerCoasterGameLoop:EnterDown()
	RollerCoasterGameLoop.GamePhase = RollerCoasterDefine.GamePhase.Down
	
	local player = game.Players.LocalPlayer
	local rootPart = PlayerManager:GetHumanoidRootPart(player)
	local startDistance = RollerCoasterGameLoop.UpdateInfo.MoveDistance
	startDistance = RollerCoasterGameLoop.DownTrackRoute:GetNearestPathDistance(rootPart.Position)
	RollerCoasterGameLoop.UpdateInfo = {
		Player = player,
		RootPart = rootPart,
		MoveSpeed = 0,
		MoveAcceleration = 100,
		MoveDistance = startDistance -- RollerCoasterGameLoop.DownTrackRoute.Length,
	}
end

function RollerCoasterGameLoop:EnterFinish()
	RollerCoasterGameLoop.GamePhase = RollerCoasterDefine.GamePhase.Idle
	
	local player = game.Players.LocalPlayer
	PlayerManager:EnablePhysic(player)
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
	local updateInfo = RollerCoasterGameLoop.UpdateInfo
	updateInfo.MoveDistance = updateInfo.MoveDistance + deltaTime * updateInfo.MoveSpeed
	RollerCoasterGameLoop:SetPlayerPosByDistance(upTrackRoute, updateInfo.MoveDistance)
	
	if updateInfo.MoveDistance >= upTrackRoute.Length then
		RollerCoasterGameLoop:EnterDown()
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
		
		RollerCoasterGameLoop.GamePhase = RollerCoasterDefine.GamePhase.Idle
		UTween:PlayerPosition(player, fromPos, toPos, 1)
			:SetEase(UTween.EaseType.OutQuart)
			:SetOnComplete(function()
				RollerCoasterGameLoop:EnterFinish()
			end)
	end
end

return RollerCoasterGameLoop
