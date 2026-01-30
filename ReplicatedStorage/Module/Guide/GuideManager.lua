local NetClient = require(game.ReplicatedStorage.ScriptAlias.NetClient)

local GuideDefine = require(game.ReplicatedStorage.ScriptAlias.GuideDefine)

local GuideManager = {}

local SaveInfoList = nil
local GuideList = {}

function GuideManager:Init()
	NetClient:Request("Guide", "GetInfoList", function(infoList)
		SaveInfoList = infoList
		
		for key, info in pairs(infoList) do
			local config = GuideManager:GetConfig(key)
			local guideScript = require(script.Parent.Step:FindFirstChild(key))
			local guide = guideScript.new(key, config, info)
			table.insert(GuideList, guide)
		end
		
		GuideManager:Refresh()
	end)
end

function GuideManager:GetConfig(key)
	for index, guideConfig in ipairs(GuideDefine.GuideList) do
		if guideConfig.Key == key then
			return guideConfig
		end
	end
	
	return nil
end

function GuideManager:GetGuide(key)
	for _, guide in ipairs(GuideList) do
		if guide.Key == key then
			return guide
		end
	end
	
	return nil
end

function GuideManager:Refresh()
	for _, guide in ipairs(GuideList) do
		if not guide.Info.IsComplete then
			guide:Enable()
			break
		end
	end
end

function GuideManager:Complete(key)
	local guide = GuideManager:GetGuide(key)
	if not guide then return end
	
	NetClient:Request("Guide", "Complete", { Key = key }, function(success)
		if success then
			guide:Disable()
			guide.Info.IsComplete = true
			GuideManager:Refresh()
		end
	end)
end

return GuideManager
