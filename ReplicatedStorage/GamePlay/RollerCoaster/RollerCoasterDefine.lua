local RollerCoasterDefine = {}

RollerCoasterDefine.TrackAngle = 30

RollerCoasterDefine.GamePhase = {
	Idle = 1,
	Up = 2,
	ArriveEnd = 3,
	Down = 4,
}

RollerCoasterDefine.Event = {
	Enter = "Enter",
	ArriveEnd = "ArriveEnd",
	Slide = "Slide",
	Exit = "Exit",
	GetWins = "GetWins",
}

return RollerCoasterDefine
