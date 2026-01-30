local RunService = game:GetService("RunService")

local PlayerManager = require(game.ReplicatedStorage.ScriptAlias.PlayerManager)
local UTween = require(game.ReplicatedStorage.ScriptAlias.UTween)
local Define = require(game.ReplicatedStorage.Define)

local CameraManager = {}

function CameraManager:Init()
	CameraManager:SetZoomRange(Define.Camera.ZoomMinDistance, Define.Camera.ZoomMaxDistance)
end

-- Param

function CameraManager:SetZoomRange(min, max)
	local player = game.Players.LocalPlayer
	player.CameraMinZoomDistance = min
	player.CameraMaxZoomDistance = max
end

-- Effect

--local currentShakeOffset = Vector3.new(0, 0, 0)
--local shakeConnection = nil

--function CameraManager:ShakeCamera(power, duration, count)
--	local humanoid = PlayerManager:GetHumanoid(game.Players.LocalPlayer)
--	if humanoid then
--		UTween:Value(Vector3.new(0, 0, 0), power, duration, function(value)
--			humanoid.CameraOffset = value
--		end)
--			:SetEase(UTween.EaseType.Shake, count)
--	end
--end

local camera = game.Workspace.CurrentCamera

local SHAKE_DURATION = 0.4
local SHAKE_POWER    = 1.5
local FADE_OUT       = true 

local isCameraShaking = false
local cameraShakeStartTime = 0

RunService.RenderStepped:Connect(function()
	if not isCameraShaking then return end

	local timePassed = tick() - cameraShakeStartTime

	if timePassed >= SHAKE_DURATION then
		isCameraShaking = false
		return
	end

	local currentPower = SHAKE_POWER

	if FADE_OUT then
		local alpha = 1 - (timePassed / SHAKE_DURATION)
		currentPower = SHAKE_POWER * alpha
	end

	local rx = (math.random() - 0.5) * 2 * currentPower
	local ry = (math.random() - 0.5) * 2 * currentPower
	local rz = (math.random() - 0.5) * 2 * currentPower

	camera.CFrame = camera.CFrame * CFrame.new(rx, ry, 0)
end)

function CameraManager:ShakeCamera()
	isCameraShaking = true
	cameraShakeStartTime = tick()
end

return CameraManager
