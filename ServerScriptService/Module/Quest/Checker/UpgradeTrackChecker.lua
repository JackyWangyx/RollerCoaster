local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)
local QuestDefine = require(game.ReplicatedStorage.ScriptAlias.QuestDefine)

local QuestChecker = require(game.ServerScriptService.ScriptAlias.QuestChecker)

local UpgradeTrackChecker = setmetatable({}, {__index = QuestChecker})
UpgradeTrackChecker.__index = UpgradeTrackChecker

function UpgradeTrackChecker.new(player, questType, questInfo)
	local self = setmetatable(QuestChecker.new(player, questType, questInfo), UpgradeTrackChecker) 
	return self
end

return UpgradeTrackChecker