local model = script.Parent
local ac = model:FindFirstChildOfClass("AnimationController"); if not ac then return end
local animator = ac:FindFirstChildOfClass("Animator") or Instance.new("Animator", ac)
local idleAnim = ac:FindFirstChild("Idle"); local runAnim = ac:FindFirstChild("Run"); if not (idleAnim and runAnim) then return end
local idleT = animator:LoadAnimation(idleAnim); idleT.Looped = true
local runT  = animator:LoadAnimation(runAnim);  runT.Looped  = true

local root = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart"); if not root then return end
pcall(function() root:SetNetworkOwner(nil) end) -- 固定服务器所有权

local TICK = 0.2       -- 5Hz，200只≈每秒1000次判速
local ON   = 1     -- 进入移动的阈值
local OFF  = 1     -- 退出移动的阈值（滞回防抖）
local moving = false
idleT:Play(0.1)

while model.Parent do
	local v = root.AssemblyLinearVelocity.Magnitude
	-- 形成 ON/OFF 滞回，只在状态变化时才播/停动画
	if (not moving and v > ON) or (moving and v < OFF) then
		moving = v > ON
		if moving then
			if idleT.IsPlaying then idleT:Stop(0.08) end
			if not runT.IsPlaying then runT:Play(0.08) end
		else
			if runT.IsPlaying then runT:Stop(0.12) end
			if not idleT.IsPlaying then idleT:Play(0.12) end
		end
	end
	task.wait(TICK)
end
