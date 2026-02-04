local RollerCoasterDefine = {}

RollerCoasterDefine.TrackAngle = 30

RollerCoasterDefine.Game = {
	SlideAccelerationDelta = 20,
	TrackEndOffset = Vector3.new(10, 2, -50),
	DropEffectDelay = 0.35,
	DropCameraShakeParam = {
		Poweer = Vector3.new(0, 3, 0),
		Duration = 1,
		Count = 6
	},
	UpTrackOffset = Vector3.zero,
	DownTrackOffset = Vector3.new(-20, 0, 0),
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
	
	LogGameProperty = "LogGameProperty",
}

return RollerCoasterDefine