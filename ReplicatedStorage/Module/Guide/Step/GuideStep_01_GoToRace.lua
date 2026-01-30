local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)
local QuestDefine = require(game.ReplicatedStorage.ScriptAlias.QuestDefine)

local GuideStep = require(game.ReplicatedStorage.ScriptAlias.GuideStep)

local GuideStepGameStart = setmetatable({}, {__index = GuideStep })
GuideStepGameStart.__index = GuideStepGameStart

function GuideStepGameStart.new(key, config, info)
	local self = setmetatable(GuideStep.new(key, config, info), GuideStepGameStart) 
	return self
end

function GuideStepGameStart:InitImpl()
	print("Impl", self.Key)
end

function GuideStepGameStart:TriggerEvent()
	self:Complete()
end

function GuideStepGameStart:EnableImpl()
	print("Enable", self.Key)
	
	EventManager:Listen(EventManager.Define.GameStart, GuideStepGameStart.TriggerEvent)
end

function GuideStepGameStart:DisableImpl()
	print("Disable", self.Key)
	
	EventManager:Remove(EventManager.Define.GameStart, GuideStepGameStart.TriggerEvent)
end



return GuideStepGameStart