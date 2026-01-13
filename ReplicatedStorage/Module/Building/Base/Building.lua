local SceneManager = require(game.ReplicatedStorage.ScriptAlias.SceneManager)
local BuildingManager = require(game.ReplicatedStorage.ScriptAlias.BuildingManager)
local SceneAreaManager = require(game.ReplicatedStorage.ScriptAlias.SceneAreaManager)
local TriggerArea = require(game.ReplicatedStorage.ScriptAlias.TriggerArea)
local TriggerAreaOpenUI = require(game.ReplicatedStorage.ScriptAlias.TriggerAreaOpenUI)
local ProximityArea = require(game.ReplicatedStorage.ScriptAlias.ProximityArea)
local ProximityAreaOpenUI = require(game.ReplicatedStorage.ScriptAlias.ProximityAreaOpenUI)
local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)
local Util = require(game.ReplicatedStorage.ScriptAlias.Util)

local Building = {}

Building.__index = Building

Building.TriggerMode = {
	None = 0,
	Trigger = 1,
	Proximity = 2,
	TriggerOpenUI = 3,
	ProximityOpenUI = 4,
}

----------------------------------------------------------------------------------------------
-- New

local function new(buildingPart, opts, triggerMode)
	local self = setmetatable({}, Building)
	self.Player = game.Players.LocalPlayer
	self.BuildingPart = buildingPart
	self.TriggerPart = buildingPart:FindFirstChild("Trigger")
	--self.RendererTrans = buildingPart:FindFirstChild("Renderer")
	--self.ThemeKey = "Default"
	self.OnlySelf = true
	self.TriggerMode = triggerMode or Building.TriggerMode.None
	self.Options = opts
	self.SelfAreaIndex = -1
	self.IsSelfArea = true
	
	if opts.Mode == BuildingManager.Mode.Glbobal then
		self.IsSelfArea = true
	else
		self.IsSelfArea = false
	end
	
	--EventManager:Listen(EventManager.Define.RefreshTheme, function(themeKey)
	--	self.ThemeKey = themeKey
	--	self:RefreshTheme()
	--end)
	
	--EventManager:Listen(EventManager.Define.RefreshArea, function(areaInfoList)
	--	local player = game.Players.LocalPlayer
	--	for areaIndex, areaInfo in ipairs(areaInfoList) do
	--		self.IsSelfArea = areaInfo.PlaeyrId == player.UserId
	--		if self.IsSelfArea then
	--			self.SelfAreaIndex = areaIndex
	--		end
	--	end
	--end)
	
	return self
end

function Building:CheckEnable()
	return self.IsSelfArea
end

----------------------------------------------------------------------------------------------
-- Normal

function Building.Normal(buildingPart, opts)
	local self = new(buildingPart, opts, Building.TriggerMode.None)
	self:Refresh()
	return self
end

----------------------------------------------------------------------------------------------
-- Trigger

function Building.Trigger(buildingPart, opts, enterFunc, exitFunc, onlySelf)
	local self = new(buildingPart, opts, Building.TriggerMode.Trigger)
	if onlySelf == nil then
		onlySelf = true
	end
	
	self.EnterFunc = enterFunc
	self.ExitFunc = exitFunc
	self.OnlySelf = onlySelf
	
	TriggerArea:Handle(self.TriggerPart, function()
		if not self:CheckEnable() then return end
		if self.EnterFunc then
			self.EnterFunc(self)
		end
	end, function()
		if not self:CheckEnable() then return end
		if self.ExitFunc then
			self.ExitFunc(self)
		end
	end, self.OnlySelf)
	
	self:Refresh()
	return self
end

function Building.TriggerOpenUI(buildingPart, opts, uiName, uiParam)
	local self = new(buildingPart, opts, Building.TriggerMode.TriggerOpenUI)
	self.UIName = uiName
	self.UIParam = uiParam
	
	TriggerAreaOpenUI:Handle(self.TriggerPart, self.UIName, self.UIParam)
	
	self:Refresh()
	return self
end

----------------------------------------------------------------------------------------------
-- Proximity

function Building.Proximity(buildingPart, opts, tipText, triggerFunc)
	local self = new(buildingPart, opts, Building.TriggerMode.Proximity)
	self.TipText = tipText
	self.TriggerFunc = triggerFunc
	
	ProximityArea:Handle(self.TriggerPart, self.TipText, function()
		if not self:CheckEnable() then return end
		if self.TriggerFunc then
			self.TriggerFunc(self)
		end
	end)
	
	self:Refresh()
	return self
end

function Building.ProximityOpenUI(buildingPart, opts, tipText, uiName, uiParam)
	local self = new(buildingPart, opts, Building.TriggerMode.ProximityOpenUI)
	self.TipText = tipText
	self.UIName = uiName
	self.UIParam = uiParam
	
	ProximityAreaOpenUI:Handle(self.TriigerPart, self.TipText, self.UIName, self.UIParam)
	
	self:Refresh()
	return self
end

----------------------------------------------------------------------------------------------
-- Refresh

function Building:Refresh()
	--self:RefreshTheme()
	--self:RefreshRenderer()
end

--function Building:RefreshTheme()
--	if not self.RendererTrans then return end
--	if self.RendererList == nil then
--		self.RendererList = self.RendererTrans:GetChildren()
--	end
	
--	if self.RendererList and #self.RendererList >= 1 then
--		local find = false
--		for _, child in ipairs(self.RendererList) do
--			local isMatch = (child.Name == self.ThemeKey)
--			if isMatch then
--				Util:ActiveObject(child)
--				find = true
--			else
--				Util:DeActiveObject(child)
--			end
--		end
		
--		if not find then
--			Util:ActiveObject(self.RendererList[1])
--		end
--	end
--end

--function Building:RefreshRenderer()
--	if self.RefreshFunc then
--		self.RefreshFunc(self)
--	end
--end

return Building
