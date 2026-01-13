local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)
local SceneManager = require(game.ReplicatedStorage.ScriptAlias.SceneManager)
local NetClient = require(game.ReplicatedStorage.ScriptAlias.NetClient)
local Util = require(game.ReplicatedStorage.ScriptAlias.Util)

local SceneAreaManager = {}

SceneAreaManager.AreaInfoList = {}

SceneAreaManager.ServerAeraInfoList = {}
SceneAreaManager.SelfAreaIndex = -1

function SceneAreaManager:Init()
	for areaIndex, area in ipairs(SceneManager.AreaList) do
		local areaInfo = {
			Index = areaIndex,
			Area = area,
			ThemeKey = "Default",
			ThemeList = {},
		}
		
		local themeRoot = area:FindFirstChild("Theme")
		if themeRoot then
			local themeList = themeRoot:GetChildren()
			for themeIndex, theme in ipairs(themeList) do
				local themeInfo = {
					Theme = theme,
					ThemeKey = theme.Name,
				}
				
				table.insert(areaInfo.ThemeList, themeInfo)
			end
		end
		
		table.insert(SceneAreaManager.AreaInfoList, areaInfo)
	end
	
	EventManager:Listen(EventManager.Define.RefreshArea, function(areaInfoList)
		SceneAreaManager:RefreshServerAreaInfo(areaInfoList)
	end)
	
	for areaIndex, areaInfo in ipairs(SceneAreaManager.AreaInfoList) do
		SceneAreaManager:SwitchTheme(areaIndex, areaInfo.ThemeKey)
	end
end

function SceneAreaManager:RefreshServerAreaInfo(areaInfoList)
	SceneAreaManager.ServerAeraInfoList = areaInfoList

	local player = game.Players.LocalPlayer
	for areaIndex, areaInfo in ipairs(areaInfoList) do
		if areaInfo.PlaeyrId == player.UserId then
			SceneAreaManager.SelfAreaIndex = areaIndex
		end
	end
end

function SceneAreaManager:SwitchTheme(areaIndex, themeKey)
	local areaInfo = SceneAreaManager.AreaInfoList[areaIndex]
	areaInfo.ThemeKey = themeKey
	local find = false
	for _, themeInfo in ipairs(areaInfo.ThemeList) do
		if themeInfo.ThemeKey == themeKey then
			Util:ActiveObject(themeInfo.Theme)
			find = true
		else
			Util:DeActiveObject(themeInfo.Theme)
		end
	end
	
	if not find and #areaInfo.ThemeList > 0 then
		Util:ActiveObject(areaInfo.ThemeList[1].Theme)
	end
end

return SceneAreaManager