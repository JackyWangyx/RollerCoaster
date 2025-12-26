local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)

local RollerCoasterTrackServerHandler = require(game.ServerScriptService.ScriptAlias.RollerCoasterTrackServerHandler)
local RollerCoasterDefine = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterDefine)

local RollerCoasterGameServerHandler = {}

function RollerCoasterGameServerHandler:Init()
	
end

function RollerCoasterGameServerHandler:Enter(player, param)
	local trackInfo = RollerCoasterTrackServerHandler:GetTrackByIndex(param.Index)
	local upSegmentNameList = {}
	for _, segment in ipairs(trackInfo.UpTrack.SegmentList) do
		table.insert(upSegmentNameList, segment.Name)
	end
	
	local downSegmentNameList = {}
	for _, segment in ipairs(trackInfo.DownTrack.SegmentList) do
		table.insert(downSegmentNameList, segment.Name)
	end
	
	param.UpSegmentNameList = upSegmentNameList
	param.DownSegmentNameList = downSegmentNameList
	
	EventManager:DispatchToClient(player, RollerCoasterDefine.Event.Enter, param)
	return true
end

function RollerCoasterGameServerHandler:Slide(player, param)
	EventManager:DispatchToClient(player, RollerCoasterDefine.Event.Slide)
	return true
end

function RollerCoasterGameServerHandler:Exit(player, param)
	EventManager:DispatchToClient(player, RollerCoasterDefine.Event.Exit)
	return true
end

function RollerCoasterGameServerHandler:GetWins(player, param)
	EventManager:DispatchToClient(player, RollerCoasterDefine.Event.GetWins)
	return true
end

return RollerCoasterGameServerHandler
