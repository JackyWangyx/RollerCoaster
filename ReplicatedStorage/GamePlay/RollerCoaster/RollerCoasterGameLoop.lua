local SceneManager = require(game.ReplicatedStorage.ScriptAlias.SceneManager)
local ResourcesManager = require(game.ReplicatedStorage.ScriptAlias.ResourcesManager)
local NetClient = require(game.ReplicatedStorage.ScriptAlias.NetClient)
local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)
local UpdateManager = require(game.ReplicatedStorage.ScriptAlias.UpdatorManager)
local PlayerManager = require(game.ReplicatedStorage.ScriptAlias.PlayerManager)
local UTween = require(game.ReplicatedStorage.ScriptAlias.UTween)
local Util = require(game.ReplicatedStorage.ScriptAlias.Util)
local CameraManager = require(game.ReplicatedStorage.ScriptAlias.CameraManager)

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
	RollerCoasterGameLoop:DisableGravity(player)
end

function RollerCoasterGameLoop:EnterTop()
	RollerCoasterGameLoop.GamePhase = RollerCoasterDefine.GamePhase.ArriveEnd
	local updateInfo = RollerCoasterGameLoop.UpdateInfo
	
	if RollerCoasterAutoPlay.Info.IsAutoGame then
		task.wait()
		local player = game.Players.LocalPlayer
		local gameManager = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterGameManager)
		gameManager:GetWins(player)
		gameManager:Slide(player)	
	end
end

function RollerCoasterGameLoop:EnterDown()
	local player = game.Players.LocalPlayer
	if RollerCoasterGameLoop.GamePhase == RollerCoasterDefine.GamePhase.ArriveEnd then
		RollerCoasterGameLoop:DisableGravity(player)
	end
	
	RollerCoasterGameLoop.GamePhase = RollerCoasterDefine.GamePhase.Down
	--local rootPart = PlayerManager:GetHumanoidRootPart(player)
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
	PlayerManager:EnableControl(player)
	RollerCoasterGameLoop:EnableGravity(player)
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
	local offsetY = RollerCoasterGameLoop.GameInitParam.MoveHeight
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
	
	if updateInfo.MoveDistance >= upTrackRoute.Length then
		if RollerCoasterGameLoop.GameInitParam.IsTrackMaxLevel then
			-- 到达顶端
			RollerCoasterGameLoop.GamePhase = RollerCoasterDefine.GamePhase.Busy
			updateInfo.MoveDistance = downTrackRoute.Length
			updateInfo.ArriveDistance = updateInfo.MoveDistance

			local player = game.Players.LocalPlayer
			local gameManager = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterGameManager)
			gameManager:ArriveEnd(player)	

			PlayerManager:EnablePhysic(player)
			PlayerManager:EnableControl(player)
			RollerCoasterGameLoop:EnableGravity(player)
			RollerCoasterGameLoop:PushPlayer(player, Vector3.new(0, 1, -2).Unit * 100, 100)
		else
			-- 未到达顶端
			updateInfo.MoveDistance = upTrackRoute.Length
			updateInfo.ArriveDistance = updateInfo.MoveDistance

			local player = game.Players.LocalPlayer
			local gameManager = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterGameManager)
			gameManager:Slide(player)
			RollerCoasterGameLoop.GamePhase = RollerCoasterDefine.GamePhase.Busy
		end
	end
end

function RollerCoasterGameLoop:UpdateDown(deltaTime)
	local downTrackRoute = RollerCoasterGameLoop.DownTrackRoute
	local updateInfo = RollerCoasterGameLoop.UpdateInfo
	updateInfo.SlideAcceleration = updateInfo.SlideAcceleration + updateInfo.SlideAccelerationDelta * deltaTime
	updateInfo.MoveSpeed = updateInfo.MoveSpeed + updateInfo.SlideAcceleration * deltaTime
	updateInfo.MoveDistance = updateInfo.MoveDistance - deltaTime * updateInfo.MoveSpeed
	if updateInfo.MoveDistance < 0 then
		updateInfo.MoveDistance = 0
	end
	
	RollerCoasterGameLoop:SetPlayerPosByDistance(downTrackRoute, updateInfo.MoveDistance, true)
	
	if updateInfo.MoveDistance <= 0 then
		RollerCoasterGameLoop.IsCompleteGame = true
		
		local player = game.Players.LocalPlayer
		local gameManager = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterGameManager)
		gameManager:GetCoin(player)
		
		RollerCoasterGameLoop.GamePhase = RollerCoasterDefine.GamePhase.Idle
		
		local gameManager = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterGameManager)
		gameManager:Exit(player)
		
		local player = game.Players.LocalPlayer
		local rootPart = PlayerManager:GetHumanoidRootPart(player)
		if player and rootPart then
			local character = player.Character
			for _, part in pairs(character:GetChildren()) do
				if part:IsA("BasePart") then
					part.AssemblyLinearVelocity = Vector3.zero
					part.AssemblyAngularVelocity = Vector3.zero
				end
			end
			
			PlayerManager:EnablePhysic(player)
			PlayerManager:EnableControl(player)
			RollerCoasterGameLoop:EnableGravity(player)
			local pushParam = RollerCoasterDefine.Game.SlidePushPlayerParam
			RollerCoasterGameLoop:PushPlayer(player, pushParam.Direction.Unit, pushParam.Power)
			task.delay(RollerCoasterDefine.Game.DropEffectDelay, function()
				local fxPrefab = ResourcesManager:Load("Fx/Fx_PlayerDrop")
				Util:SpawnFxEmit(fxPrefab, rootPart.CFrame.Position, 20, 2)
				
				rootPart.AssemblyLinearVelocity = Vector3.zero
				rootPart.AssemblyAngularVelocity = Vector3.zero
				
				--local param = RollerCoasterDefine.Game.DropCameraShakeParam
				--CameraManager:ShakeCamera(param.Poweer, param.Duration, param.Count)
				CameraManager:ShakeCamera()
			end)
		end
	end
end

function RollerCoasterGameLoop:PushPlayer(player, direction, power)
	local rootPart = PlayerManager:GetHumanoidRootPart(player)
	local fromPos = rootPart.CFrame.Position
	--local lookVector = rootPart.CFrame.LookVector
	local toPos = fromPos + direction
	local targetDirection = (toPos - fromPos).Unit
	local newCFrame = CFrame.new(Vector3.zero, targetDirection)
	rootPart.CFrame = CFrame.new(fromPos) * newCFrame

	rootPart.AssemblyLinearVelocity = targetDirection * power
	rootPart.AssemblyAngularVelocity = Vector3.zero
end

-- Gravity

local AttachPartList = {}

function RollerCoasterGameLoop:DisableGravity(player)
	local rootPart = PlayerManager:GetHumanoidRootPart(player)
	if rootPart then
		local att = Instance.new("Attachment")
		att.Parent = rootPart
		local vf = Instance.new("VectorForce")
		vf.Attachment0 = att
		vf.RelativeTo = Enum.ActuatorRelativeTo.World
		vf.ApplyAtCenterOfMass = true

		local mass = rootPart.AssemblyMass
		vf.Force = Vector3.new(0, mass * workspace.Gravity, 0)
		vf.Parent = rootPart

		table.insert(AttachPartList, att)
		table.insert(AttachPartList, vf)
	end
end

function RollerCoasterGameLoop:EnableGravity(player)
	local rootPart = PlayerManager:GetHumanoidRootPart(player)
	if rootPart then
		rootPart.AssemblyLinearVelocity = Vector3.zero
		rootPart.AssemblyAngularVelocity = Vector3.zero
	end
	
	for _, part in ipairs(AttachPartList) do
		part:Destroy()
	end
	
	AttachPartList = {}
end

return RollerCoasterGameLoop
