local character = script.Parent
local humanoid = character:FindFirstChildOfClass("Humanoid")

if humanoid then
	-- 确保存在 Animator
	local animator = humanoid:FindFirstChildOfClass("Animator")
	if not animator then
		animator = Instance.new("Animator")
		animator.Parent = humanoid
	end

	-- 选择适当的动画 ID
	local animationId
	if humanoid.RigType == Enum.HumanoidRigType.R15 then
		animationId = "rbxassetid://913376220" -- R15 跑步动画
	else
		animationId = "rbxassetid://180426354" -- R6 跑步动画
	end

	-- 创建动画对象
	local animation = Instance.new("Animation")
	animation.AnimationId = animationId

	-- 加载并播放动画
	local animationTrack = humanoid:LoadAnimation(animation)
	animationTrack.Looped = true
	animationTrack:Play()
else
	warn("⚠️ 未找到 Humanoid，无法播放动画")
end
