local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local camera = Workspace.CurrentCamera
local button = script.Parent -- 假设脚本放在按钮下面

-- ==========================================
-- 🔧 参数调试区 (在这里调手感)
-- ==========================================
local SHAKE_DURATION = 0.4   -- 震动持续时间 (秒)
local SHAKE_POWER    = 1.5   -- 震动强度 (数字越大越猛)
local FADE_OUT       = true  -- 是否开启衰减 (True=慢慢停下, False=突然停下)
-- ==========================================

local isShaking = false
local startTime = 0

-- 1. 核心震动循环 (每帧运行)
RunService.RenderStepped:Connect(function()
	if not isShaking then return end

	-- 计算过去的时间
	local timePassed = tick() - startTime

	-- 时间到了就停止
	if timePassed >= SHAKE_DURATION then
		isShaking = false
		return
	end

	-- 计算当前这一瞬间的震动幅度
	local currentPower = SHAKE_POWER

	if FADE_OUT then
		-- 计算衰减系数 (1 -> 0)
		local alpha = 1 - (timePassed / SHAKE_DURATION)
		currentPower = SHAKE_POWER * alpha
	end

	-- 生成随机偏移 (X, Y, Z)
	local rx = (math.random() - 0.5) * 2 * currentPower
	local ry = (math.random() - 0.5) * 2 * currentPower
	local rz = (math.random() - 0.5) * 2 * currentPower

	-- 应用到摄像机
	-- CFrame.new(x, y, z) 负责位移震动
	-- CFrame.Angles(...) 负责旋转震动 (如果想要更晕的效果，可以解开下面注释)
	camera.CFrame = camera.CFrame * CFrame.new(rx, ry, 0) -- 这里只震动 X 和 Y 轴比较舒服
	-- camera.CFrame = camera.CFrame * CFrame.Angles(0, 0, math.rad(rx * 0.5)) -- 加上Z轴旋转
end)

-- 2. 点击按钮触发
button.MouseButton1Click:Connect(function()
	isShaking = true
	startTime = tick()
	print("开始震动！强度:", SHAKE_POWER)
end)