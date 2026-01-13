local NetClient = require(game.ReplicatedStorage.ScriptAlias.NetClient)
local UIList = require(game.ReplicatedStorage.ScriptAlias.UIList)
local UIInfo = require(game.ReplicatedStorage.ScriptAlias.UIInfo)
local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)
local Util = require(game.ReplicatedStorage.ScriptAlias.Util)
local Building = require(game.ReplicatedStorage.ScriptAlias.Building)

local RollerCoasterGameManager = require(game.ReplicatedStorage.ScriptAlias.RollerCoasterGameManager)

local Define = require(game.ReplicatedStorage.Define)

local BuildingTrackUpEntrance = {}

function BuildingTrackUpEntrance:Init(buildingPart, opts)
	local building = Building.Trigger(buildingPart, opts, function()
		RollerCoasterGameManager:Enter(opts.AreaIndex)
	end)
end

return BuildingTrackUpEntrance
