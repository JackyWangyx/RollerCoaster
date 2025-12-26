local RollerCoasterTrackServerHandler =require(game.ServerScriptService.ScriptAlias.RollerCoasterTrackServerHandler)
local RollerCoasterGameServerHandler = require(game.ServerScriptService.ScriptAlias.RollerCoasterGameServerHandler)

local Define = require(game.ReplicatedStorage.Define)

local RollerCoasterServer = {}

function RollerCoasterServer:Init()
	RollerCoasterTrackServerHandler:Init()
	RollerCoasterGameServerHandler:Init()
end

return RollerCoasterServer
