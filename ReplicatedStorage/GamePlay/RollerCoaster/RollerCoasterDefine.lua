local RollerCoasterDefine = {}

RollerCoasterDefine.TrackAngle = 30

RollerCoasterDefine.Game = {
	SlideAcceleration = 500,
	TrackEndOffset = Vector3.new(0, 0, 0)
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
