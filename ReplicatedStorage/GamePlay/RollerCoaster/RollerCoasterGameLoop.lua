local SceneManager = require(game.ReplicatedStorage.ScriptAlias.SceneManager)
local SceneAreaManager = require(game.ReplicatedStorage.ScriptAlias.SceneAreaManager)
local ResourcesManager = require(game.ReplicatedStorage.ScriptAlias.ResourcesManager)
local NetClient = require(game.ReplicatedStorage.ScriptAlias.NetClient)
local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)
local UpdateManager = require(game.ReplicatedStorage.ScriptAlias.UpdatorManager)
local PlayerManager = require(game.ReplicatedStorage.ScriptAlias.PlayerManager)
local UTween = require(game.ReplicatedStorage.ScriptAlias.UTween)
local Util = require(game.ReplicatedStorage.ScriptAlias.Util)
local CameraManager = require(game.ReplicatedStorage.ScriptAlias.CameraManager)
local PlayerMove = require(game.ReplicatedStorage.ScriptAlias.PlayerMove)

local TrackCreator = require(game.ReplicatedStorage.ScriptAlias.TrackCreator)
local TrackRoute = require(game.ReplicatedStorage.ScriptAlias.TrackRoute)
local RollerCoasterDefine = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterDefine)
local RollerCoasterAutoPlay = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterAutoPlay)

local RollerCoasterGameLoop = {}

RollerCoasterGameLoop.GamePhase = RollerCoasterDefine.GamePhase.Idle
RollerCoasterGameLoop.TrackIndex = -1
RollerCoasterGameLoop.UpTrackRoute = nil
RollerCoasterGameLoop.DownTrackRoute = nil

RollerCoasterGameLoop.GameInitParam = nil
RollerCoasterGameLoop.UpdateInfo = {}
RollerCoasterGameLoop.IsCompleteGame = false

function RollerCoasterGameLoop:Init()
	UpdateManager:RenderStepped(function(deltaTime)
		RollerCoasterGameLoop:Update(deltaTime)
	end)
	
	EventManager:Listen(RollerCoasterDefine.Event.Enter, function(gameInitParam)
		RollerCoasterGameLoop.GameInitParam = gameInitParam
		RollerCoasterGameLoop:EnterUp()
		
		local areaInfo = SceneAreaManager.AreaInfoList[RollerCoasterGameLoop.GameInitParam.TrackIndex]
		Util:DeActiveObject(areaInfo.ExitCollide)
		Util:DeActiveObject(areaInfo.DownCollide)
	end)
	
	EventManager:Listen(RollerCoasterDefine.Event.ArriveEnd, function()
		RollerCoasterGameLoop:EnterTop()

		task.delay(RollerCoasterDefine.Game.DropEffectDelay, function()
			local areaInfo = SceneAreaManager.AreaInfoList[RollerCoasterGameLoop.GameInitParam.TrackIndex]
			Util:ActiveObject(areaInfo.DownCollide)
		end)	
	end)
	
	EventManager:Listen(RollerCoasterDefine.Event.Slide, function()
		RollerCoasterGameLoop:EnterDown()
	end)
	
	EventManager:Listen(RollerCoasterDefine.Event.Exit, function()
		RollerCoasterGameLoop:EnterFinish()
		
		task.delay(RollerCoasterDefine.Game.DropEffectDelay, function()
			local areaInfo = SceneAreaManager.AreaInfoList[RollerCoasterGameLoop.GameInitParam.TrackIndex]
			Util:ActiveObject(areaInfo.ExitCollide)
		end)	
	end)
	
	EventManager:Listen(RollerCoasterDefine.Event.Reset, function()
		SceneAreaManager:ResetPlayerPos(game.Players.LocalPlayer)
	end)
	
	EventManager:Listen(RollerCoasterDefine.Event.LogGameProperty, function()
		RollerCoasterGameLoop:LogGameProperty()
	end)
end

function RollerCoasterGameLoop:LogGameProperty()
	warn(RollerCoasterGameLoop.GameInitParam, RollerCoasterGameLoop.UpdateInfo)
end

---------------------------------------------------------------------------------------------------------
-- Phase

function RollerCoasterGameLoop:EnterUp()
	RollerCoasterGameLoop.GamePhase = RollerCoasterDefine.GamePhase.Up
	local gameInitParam = RollerCoasterGameLoop.GameInitParam
	RollerCoasterGameLoop.IsCompleteGame = false

	-- Create Track
	RollerCoasterGameLoop.TrackIndex = gameInitParam.TrackIndex
	
	local trackRoot = SceneManager.AreaList[RollerCoasterGameLoop.TrackIndex]
	local trackStart = trackRoot:FindFirstChild("TrackStart")
	local upSegmentList = {}
	for _, segmentName in ipairs(gameInitParam.UpSegmentNameList) do
		local segment = trackStart.Up:FindFirstChild(segmentName)
		table.insert(upSegmentList, segment)
	end
	
	RollerCoasterGameLoop.UpTrackRoute = TrackRoute.new(upSegmentList)
	
	local downSegmentList = {}
	for _, segmentName in ipairs(gameInitParam.DownSegmentNameList) do
		local segment = trackStart.Down:FindFirstChild(segmentName)
		table.insert(downSegmentList, segment)
	end

	RollerCoasterGameLoop.DownTrackRoute = TrackRoute.new(downSegmentList)
	
	-- Init Status
	local player = game.Players.LocalPlayer
	local rootPart = PlayerManager:GetHumanoidRootPart(player)
	
	RollerCoasterGameLoop.UpdateInfo = {
		Player = player,
		RootPart = rootPart,
		MoveSpeed = gameInitParam.Speed,
		MoveDistance = 0,
		ArriveDistance = 0,
		MoveAcceleration = 0,
	}
	
	RollerCoasterGameLoop:SetPlayerPosByDistance(RollerCoasterGameLoop.UpTrackRoute, 0)

	PlayerMove:Enable(player)
end

function RollerCoasterGameLoop:EnterTop()
	RollerCoasterGameLoop.GamePhase = RollerCoasterDefine.GamePhase.ArriveEnd
	local updateInfo = RollerCoasterGameLoop.UpdateInfo
	
	if RollerCoasterAutoPlay.Info.IsAutoGame then
		task.wait(1)
		local player = game.Players.LocalPlayer
		local gameManager = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterGameManager)
		gameManager:GetWins(player)
		gameManager:Slide(player)	
	end
end

function RollerCoasterGameLoop:EnterDown()
	local player = game.Players.LocalPlayer
	if RollerCoasterGameLoop.GamePhase == RollerCoasterDefine.GamePhase.ArriveEnd then
		PlayerMove:Enable(player)
	end
	
	RollerCoasterGameLoop.GamePhase = RollerCoasterDefine.GamePhase.Down
	local startDistance = RollerCoasterGameLoop.UpdateInfo.MoveDistance
	local startPos = RollerCoasterGameLoop.UpTrackRoute:GetPointByDistance(startDistance).Position
	startDistance = RollerCoasterGameLoop.DownTrackRoute:GetNearestPathDistance(startPos)
		
	local updateInfo = RollerCoasterGameLoop.UpdateInfo
	updateInfo.MoveSpeed = 0
	updateInfo.SlideAcceleration = 0
	updateInfo.SlideAccelerationDelta = RollerCoasterDefine.Game.SlideAccelerationDelta
	updateInfo.MoveDistance = startDistance
end

function RollerCoasterGameLoop:EnterFinish()
	RollerCoasterGameLoop.GamePhase = RollerCoasterDefine.GamePhase.Idle
	
	local player = game.Players.LocalPlayer
	PlayerMove:Disable(player)
end

---------------------------------------------------------------------------------------------------------
-- Update

function RollerCoasterGameLoop:SetPlayerPosByDistance(trackRoute, distance, faceBackward)
	local targetPart = PlayerMove.TargetPart
	if not targetPart then
		return
	end

	faceBackward = faceBackward or false
	local posInfo = trackRoute:GetPointByDistance(distance)
	local pos = posInfo.Position
	local rot = posInfo.Rotation

	if faceBackward then
		rot = rot * CFrame.Angles(0, math.pi, 0)
	end

	local offsetY = RollerCoasterGameLoop.GameInitParam.MoveHeight
	local newPos = pos + (rot.UpVector * offsetY)
	local resultCFrame = CFrame.new(newPos) * rot
	targetPart.CFrame = resultCFrame
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
	updateInfo.ArriveDistance = updateInfo.MoveDistance

	local targetPart = PlayerMove.TargetPart
	if not targetPart then return end

	local rootPart = updateInfo.RootPart
	if not rootPart then return end

	local endPosInfo = upTrackRoute:GetPointByDistance(upTrackRoute.Length)
	local endPosition = endPosInfo.Position + (endPosInfo.Rotation.UpVector * RollerCoasterGameLoop.GameInitParam.MoveHeight)

	local REACH_THRESHOLD = 1.5       -- 单位：Studs，建议 1.2 ~ 2.5，根据你的约束强度和速度调整
	local VELOCITY_THRESHOLD = 8      -- studs/s，如果玩家还在快速向前冲，可以放宽

	local isComplete = (updateInfo.MoveDistance >= upTrackRoute.Length)

	if isComplete then
		if RollerCoasterGameLoop.GameInitParam.IsTrackMaxLevel then
			local distanceToEnd = (rootPart.Position - endPosition).Magnitude
			local isReallyClose = distanceToEnd <= REACH_THRESHOLD
			local isSlowEnough = rootPart.AssemblyLinearVelocity.Magnitude <= VELOCITY_THRESHOLD

			if isReallyClose and isSlowEnough then
				local player = game.Players.LocalPlayer
				local gameManager = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterGameManager)
				local pushParam = RollerCoasterDefine.Game.ArriveEndPushPlayerParam
				
				RollerCoasterGameLoop.GamePhase = RollerCoasterDefine.GamePhase.Busy
				PlayerMove:PushPlayer(player, pushParam.Direction.Unit, pushParam.Power, RollerCoasterDefine.Game.DropEffectDelay)
				gameManager:ArriveEnd(player)
				PlayerMove:Disable(player)	
			else
				updateInfo.MoveDistance = upTrackRoute.Length
				RollerCoasterGameLoop:SetPlayerPosByDistance(upTrackRoute, updateInfo.MoveDistance)
			end
		else
			local player = game.Players.LocalPlayer
			local gameManager = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterGameManager)
			gameManager:Slide(player)
		end
	else
		RollerCoasterGameLoop:SetPlayerPosByDistance(upTrackRoute, updateInfo.MoveDistance)
	end
end

function RollerCoasterGameLoop:UpdateDown(deltaTime)
	local downTrackRoute = RollerCoasterGameLoop.DownTrackRoute
	local updateInfo = RollerCoasterGameLoop.UpdateInfo
	updateInfo.SlideAcceleration = updateInfo.SlideAcceleration + updateInfo.SlideAccelerationDelta * deltaTime
	updateInfo.MoveSpeed = updateInfo.MoveSpeed + updateInfo.SlideAcceleration * deltaTime
	if updateInfo.MoveSpeed > RollerCoasterDefine.Game.SlideMaxSpeed then
		updateInfo.MoveSpeed = RollerCoasterDefine.Game.SlideMaxSpeed
	end
	
	updateInfo.MoveDistance = updateInfo.MoveDistance - deltaTime * updateInfo.MoveSpeed
	
	if updateInfo.MoveDistance <= 0 then
		RollerCoasterGameLoop.IsCompleteGame = true
		updateInfo.MoveDistance = 0
		
		RollerCoasterGameLoop:SetPlayerPosByDistance(downTrackRoute, updateInfo.MoveDistance, true)
		
		local player = game.Players.LocalPlayer
		local gameManager = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterGameManager)
		gameManager:GetCoin(player)
		
		RollerCoasterGameLoop.GamePhase = RollerCoasterDefine.GamePhase.Idle
		
		local gameManager = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterGameManager)
		gameManager:Exit(player)
		
		local player = game.Players.LocalPlayer
		local rootPart = PlayerManager:GetHumanoidRootPart(player)
		if player and rootPart then
			PlayerMove:Disable(player)
			
			local pushParam = RollerCoasterDefine.Game.SlidePushPlayerParam
			PlayerMove:PushPlayer(player, pushParam.Direction.Unit, pushParam.Power, RollerCoasterDefine.Game.DropEffectDelay)
			task.delay(RollerCoasterDefine.Game.DropEffectDelay, function()
				local fxPrefab = ResourcesManager:Load("Fx/Fx_PlayerDrop")
				Util:SpawnFxEmit(fxPrefab, rootPart.CFrame.Position, 20, 2)
				
				rootPart.AssemblyLinearVelocity = Vector3.zero
				rootPart.AssemblyAngularVelocity = Vector3.zero
				
				CameraManager:ShakeCamera()
			end)
		end
	else
		RollerCoasterGameLoop:SetPlayerPosByDistance(downTrackRoute, updateInfo.MoveDistance, true)
	end
end

return RollerCoasterGameLoop
