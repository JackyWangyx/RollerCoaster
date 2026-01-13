local IAPClient = require(game.ReplicatedStorage.ScriptAlias.IAPClient)
local EventMananger = require(game.ReplicatedStorage.ScriptAlias.EventManager)
local UIManager = require(game.ReplicatedStorage.ScriptAlias.UIManager)
local SoundMnaager = require(game.ReplicatedStorage.ScriptAlias.SoundManager)

local RollerCoasterGameManager = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterGameManager)

local Define = require(game.ReplicatedStorage.Define)

local RollerCoaster = {}

function RollerCoaster:UpdateGameInfo(player, param)
	RollerCoasterGameManager:OnUpdateGameInfo(param)
end

return RollerCoaster
