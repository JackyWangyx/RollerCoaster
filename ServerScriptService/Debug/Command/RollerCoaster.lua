local Util = require(game.ReplicatedStorage.ScriptAlias.Util)
local ConfigManager = require(game.ReplicatedStorage.ScriptAlias.ConfigManager)
local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)

local PlayerPrefs = require(game.ServerScriptService.ScriptAlias.PlayerPrefs)
local NetServer = require(game.ServerScriptService.ScriptAlias.NetServer)

local RollerCoasterDefine = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterDefine)

local RollerCoaster = {}

RollerCoaster.Icon = "🎢"
RollerCoaster.Color = Color3.new(0.941176, 0.741176, 0.498039)

function RollerCoaster:LogSave(player, param)
	local module = PlayerPrefs:GetModule(player, "RollerCoaster")
	print(module)
end

function RollerCoaster:GameProprerty(player, param)
	EventManager:DispatchToClient(player, RollerCoasterDefine.Event.LogGameProperty)
end

function RollerCoaster:Clear(player)
	PlayerPrefs:SetModule(player, "RollerCoaster", {})
end

return RollerCoaster
