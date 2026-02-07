-- 放在 Car/LocalScript
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local RATE_MOVING = 80-- 移动时发射速率
local POSITION_THRESHOLD = 0.1 -- 每帧位置变化阈值（单位：studs，根据帧率调整以模拟速度阈值）
local car = script.Parent
local handle = car:WaitForChild("Handle")
local character = car:FindFirstAncestorOfClass("Model")
local humanoid = character and character:FindFirstChildOfClass("Humanoid")
local hrp = character and character:FindFirstChild("HumanoidRootPart")
if not (humanoid and hrp) then return end
-- 克隆本地发射器（保留所有参数，只关掉开关）
local emitters = {}
for _, att in ipairs(handle:GetChildren()) do
	if att:IsA("Attachment") then
		for _, pe in ipairs(att:GetChildren()) do
			if pe:IsA("ParticleEmitter") then
				-- 模板永远关掉，别人不会看到
				pe.Enabled = false
				pe.Rate = 0
				-- 本地副本
				local clone = pe:Clone()
				clone.Name = "LocalOnlyEmitter"
				clone.Enabled = false
				clone.Rate = 0
				clone.Parent = att
				table.insert(emitters, clone)
			end
		end
	end
end
local function setEmit(on)
	for _, e in ipairs(emitters) do
		if on then
			e.Enabled = true
			e.Rate = RATE_MOVING
		else
			e.Rate = 0
			e.Enabled = false
		end
	end
end
-- 初始化上一次位置
local lastPosition = hrp.Position
-- 按帧检测位置变化
RunService.RenderStepped:Connect(function()
	if not hrp then return end
	local currentPosition = hrp.Position
	local deltaPosition = (currentPosition - lastPosition).Magnitude
	if deltaPosition >= POSITION_THRESHOLD then
		setEmit(true)
	else
		setEmit(false)
	end
	lastPosition = currentPosition
end)