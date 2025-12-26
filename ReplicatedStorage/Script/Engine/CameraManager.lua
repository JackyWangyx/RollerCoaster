local Define = require(game.ReplicatedStorage.Define)

local CameraManager = {}

function CameraManager:Init()
	CameraManager:SetZoomRange(Define.Camera.ZoomMinDistance, Define.Camera.ZoomMaxDistance)
end

function CameraManager:SetZoomRange(min, max)
	local player = game.Players.LocalPlayer
	player.CameraMinZoomDistance = min
	player.CameraMaxZoomDistance = max
end

return CameraManager
