local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)
local QuestDefine = require(game.ReplicatedStorage.ScriptAlias.QuestDefine)

local QuestChecker = require(game.ServerScriptService.ScriptAlias.QuestChecker)

local SlideChecker = setmetatable({}, {__index = QuestChecker})
SlideChecker.__index = SlideChecker

function SlideChecker.new(player, questType, questInfo)
	local self = setmetatable(QuestChecker.new(player, questType, questInfo), SlideChecker) 
	return self
end

return SlideChecker