local RollerCoasterDefine = {}

RollerCoasterDefine.TrackAngle = 30

RollerCoasterDefine.Game = {
	-- 下滑加速度的变化量
	SlideAccelerationDelta = 10,
	-- 赛道终点区域偏移量
	--TrackEndOffset = Vector3.new(10, 2, -50),
	-- 终点下滑阻挡碰撞偏移量
	--DwonCollideOffset = Vector3.new(0 ,0, 0),
	-- 落地特效延迟
	DropEffectDelay = 0.35,
	-- 落地相机震动参数
	DropCameraShakeParam = {
		Poweer = Vector3.new(0, 3, 0),
		Duration = 1,
		Count = 6
	},
	-- 上升赛道偏移量
	UpTrackOffset = Vector3.zero,
	-- 下落赛道偏移量
	DownTrackOffset = Vector3.new(-20, 0, 0),
	-- 到顶部推出玩家参数
	ArriveEndPushPlayerParam = {
		Direction = Vector3.new(0, 1, -2),
		Power = 30,
	},
	-- 下滑结束推出玩家参数
	SlidePushPlayerParam = {
		Direction = Vector3.new(0, 0.5, 1),
		Power = 80,
	}
}

RollerCoasterDefine.GamePhase = {
	Idle = 1,
	Up = 2,
	ArriveEnd = 3,
	Down = 4,
	Busy = 10000,
}

RollerCoasterDefine.Event = {
	Enter = "Enter",
	ArriveEnd = "ArriveEnd",
	Slide = "Slide",
	Exit = "Exit",
	Reset = "Reset",
	
	LogGameProperty = "LogGameProperty",
}

return RollerCoasterDefine