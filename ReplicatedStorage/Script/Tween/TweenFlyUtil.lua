local TweenService = game:GetService("TweenService")

local TweenFlyUtil = {}

local function lerp(a, b, t)
	return a + (b - a) * t
end

-- 将屏幕坐标（像素）转换为 parent 的 Offset 坐标
local function screenToParentOffset(screenPos: Vector2, parent: GuiObject)
	local parentAbs = parent.AbsolutePosition
	return screenPos - parentAbs
end

-- 世界坐标转屏幕像素
local function worldToScreen(worldPos: Vector3)
	local cam = workspace.CurrentCamera
	local v3 = cam:WorldToViewportPoint(worldPos)
	return Vector2.new(v3.X, v3.Y)
end

-- 创建贝塞尔曲线函数（父容器坐标系）
local function makeBezierInParent(fromScreen: Vector2, toScreen: Vector2, parent: GuiObject)
	local from = screenToParentOffset(fromScreen, parent)
	local to   = screenToParentOffset(toScreen, parent)

	local distance = (to - from).Magnitude
	local curveH   = math.clamp(distance / 3, 100, 400)
	local randomX  = math.random(-50, 50)
	local mid      = (from + to) / 2 - Vector2.new(randomX, curveH)

	return function(t)
		local u = 1 - t
		local pos = (u*u)*from + 2*u*t*mid + (t*t)*to
		return pos
	end
end

-- 在屏幕宽高中间 1/3 区域内随机生成出生点
local function randomSpawnInCenter(container: GuiObject)
	local screenSize = container.AbsoluteSize
	local screenPos  = container.AbsolutePosition

	local minX = screenPos.X + screenSize.X * (1/3)
	local maxX = screenPos.X + screenSize.X * (2/3)
	local minY = screenPos.Y + screenSize.Y * (1/3)
	local maxY = screenPos.Y + screenSize.Y * (2/3)

	local randX = math.random() * (maxX - minX) + minX
	local randY = math.random() * (maxY - minY) + minY
	return Vector2.new(randX, randY)
end


-- 飞向目标 UI 动画（带到达时目标缩放提示）
function TweenFlyUtil:UIFlyToTarget(prefab, target, value, opts)
	opts = opts or {}
	local duration    = opts.duration or 0.8
	local easeStyle   = opts.easeStyle or Enum.EasingStyle.Quint
	local easeDir     = opts.easeDir or Enum.EasingDirection.InOut
	local targetScale = opts.targetScale or 0.75
	local container   = (opts.container and opts.container:IsA("GuiObject")) and opts.container or prefab.Parent

	-- 额外 pulse 配置（目标到达提示）
	local pulseScale    = opts.pulseScale or 1.15
	local pulseUpTime   = opts.pulseUpTime or 0.1
	local pulseDownTime = opts.pulseDownTime or 0.15

	-- 克隆 & 基本姿态
	local tip = prefab:Clone()
	tip.Parent = container
	tip.Visible = true
	tip.AnchorPoint = Vector2.new(0.5, 0.5)
	pcall(function() tip.ZIndex = math.max((target.ZIndex or 1), (prefab.ZIndex or 1)) + 5 end)

	-- 数据展示（可选）
	local ok, uiInfo = pcall(function() return require(game.ReplicatedStorage.ScriptAlias.UIInfo) end)
	if ok and uiInfo and uiInfo.SetInfo then
		pcall(function() uiInfo:SetInfo(tip, { Value = value }) end)
	end

	-- 起飞点（屏幕像素）
	local startScreen
	if opts.worldPart then
		startScreen = worldToScreen(opts.worldPart.Position)
	elseif opts.worldPosition then
		startScreen = worldToScreen(opts.worldPosition)
	else
		startScreen = randomSpawnInCenter(container) -- 随机出生
	end

	-- 目标点（屏幕像素，取目标中心）
	local tgtAbs = target.AbsolutePosition
	local tgtCtr = Vector2.new(tgtAbs.X + target.AbsoluteSize.X / 2, tgtAbs.Y + target.AbsoluteSize.Y / 2)

	-- 起始放置（在容器坐标系内）
	local startOffset = screenToParentOffset(startScreen, container)
	tip.Position = UDim2.fromOffset(startOffset.X, startOffset.Y)

	-- UIScale 控制大小（飞行物）
	local uiScale = tip:FindFirstChildOfClass("UIScale") or Instance.new("UIScale")
	uiScale.Parent = tip
	uiScale.Scale = 0.5 -- 出生时更小

	-- 出生动画：缩放 0.5 → 1，同时向上飘
	local floatOffset = Vector2.new(0, -50) -- 上漂距离（可调整）
	local floatTime = 0.25

	local floatTween = TweenService:Create(
		tip,
		TweenInfo.new(floatTime, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
		{ Position = UDim2.fromOffset(startOffset.X, startOffset.Y + floatOffset.Y) }
	)

	local appearTween = TweenService:Create(uiScale, TweenInfo.new(floatTime, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })

	-- 当浮动完成后，再从“漂浮后的位置”开始计算贝塞尔并飞向目标（解决你指出的问题）
	local function beginMainFlight()
		-- 取漂浮后中心点的屏幕坐标作为贝塞尔起点
		local absPos = tip.AbsolutePosition
		local absSize = tip.AbsoluteSize
		local startAfterFloatScreen = Vector2.new(absPos.X + absSize.X / 2, absPos.Y + absSize.Y / 2)

		-- 现在基于漂浮后的位置创建贝塞尔曲线
		local bezierAt = makeBezierInParent(startAfterFloatScreen, tgtCtr, container)

		-- NumberValue 驱动 t
		local tValue = Instance.new("NumberValue")
		tValue.Value = 0

		local conn
		local startScale = uiScale.Scale -- 此时应为 1
		local overshootScale = startScale * 1.1 -- 稍微放大一点点
		local endScale = targetScale

		conn = tValue.Changed:Connect(function(t)
			local p = bezierAt(t)
			tip.Position = UDim2.fromOffset(p.X, p.Y)

			-- 前半段：1 → 1.1，后半段：1.1 → targetScale
			if t < 0.2 then
				uiScale.Scale = lerp(startScale, overshootScale, t / 0.2)
			else
				uiScale.Scale = lerp(overshootScale, endScale, (t - 0.2) / 0.8)
			end
		end)

		local tween = TweenService:Create(tValue, TweenInfo.new(duration, easeStyle, easeDir), { Value = 1 })
		tween:Play()

		tween.Completed:Connect(function()
			if conn then conn:Disconnect() end
			tValue:Destroy()

			-- 到达目标后：在目标上播放缩放提示（放大 -> 回弹）
			local createdTargetScale = false
			local targetScaleObj = target:FindFirstChildOfClass("UIScale")
			if not targetScaleObj then
				targetScaleObj = Instance.new("UIScale")
				targetScaleObj.Parent = target
				createdTargetScale = true
				targetScaleObj.Scale = 1
			end

			local originalTargetScale = targetScaleObj.Scale or 1

			local pulseUpTween = TweenService:Create(
				targetScaleObj,
				TweenInfo.new(pulseUpTime, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
				{ Scale = originalTargetScale * pulseScale }
			)

			local pulseDownTween = TweenService:Create(
				targetScaleObj,
				TweenInfo.new(pulseDownTime, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
				{ Scale = originalTargetScale }
			)

			pulseUpTween:Play()
			pulseUpTween.Completed:Connect(function()
				pulseDownTween:Play()
				pulseDownTween.Completed:Connect(function()
					if createdTargetScale then
						task.defer(function()
							if targetScaleObj and targetScaleObj.Parent then
								targetScaleObj:Destroy()
							end
						end)
					else
						targetScaleObj.Scale = originalTargetScale
					end
				end)
			end)

			-- 飞行物自身的消失动画
			local disappearTween = TweenService:Create(uiScale, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Scale = 0 })
			disappearTween:Play()
			disappearTween.Completed:Connect(function()
				tip:Destroy()
			end)
		end)
	end

	-- 播放出生动画，浮动结束后开始主飞行（保证主飞行从浮动后的位置开始）
	appearTween:Play()
	floatTween:Play()
	floatTween.Completed:Connect(beginMainFlight)

	return tip
end

return TweenFlyUtil
