local Workspace = game:GetService("Workspace")

local Util = require(game.ReplicatedStorage.ScriptAlias.Util)
local SceneManager = require(game.ReplicatedStorage.ScriptAlias.SceneManager)
local ResourcesManager = require(game.ReplicatedStorage.ScriptAlias.ResourcesManager)

local BuildingManager = {}

BuildingManager.Mode = {
	Glbobal = 1,
	Area = 2,
}

BuildingManager.GlobalBuildingPath = nil
BuildingManager.AreaBuildingPathList = {}

function BuildingManager:Init()
	BuildingManager.GlobalBuildingPath = SceneManager.LevelRoot:WaitForChild("Building")
	if BuildingManager.GlobalBuildingPath then
		BuildingManager:InitPath(BuildingManager.GlobalBuildingPath, true, -1)
	end
	
	if SceneManager.AreaList then
		for areaIndex, area in ipairs(SceneManager.AreaList) do
			local pathList = Util:GetAllChildByTypeAndName(area, "Folder", "Building", true)
			for _, path in ipairs(pathList) do
				table.insert(BuildingManager.AreaBuildingPathList, path)
				BuildingManager:InitPath(path, false, areaIndex)
			end
		end
	end
end

function BuildingManager:InitPath(path, mode, areaIndex)
	local children = path:GetDescendants()
	for _, child in ipairs(children) do
		if BuildingManager:IsBuilding(child) then
			BuildingManager:OnBuildingAdded(child, {
				Mode = mode,
				AreaIndex = areaIndex,
			})
		end
	end

	path.ChildAdded:Connect(function(part)
		if BuildingManager:IsBuilding(part) then
			BuildingManager:OnBuildingAdded(part, {
				Mode = mode,
				AreaIndex = areaIndex,
			})
		end
	end)
end

function BuildingManager:IsBuilding(part)
	local buildingName = part.Name
	if not Util:IsStrStartWith(buildingName, "Building") then
		return false
	end
	return true
end

function BuildingManager:OnBuildingAdded(buildingPart, opts)
	local buildingName = buildingPart.Name
	local buildingScriptFile = Util:GetChildByTypeAndName(game.ReplicatedStorage, "ModuleScript", buildingName, true, ResourcesManager.ReplicatedStorageCache.All)
	local triggerPart = buildingPart:FindFirstChild("Trigger")
	opts.TriggerPart = triggerPart
	if buildingScriptFile then
		local buildingScript = require(buildingScriptFile)
		local initFunc = buildingScript["Init"]
		if initFunc then
			initFunc(buildingScript, buildingPart, opts)
		end
	end
end

return BuildingManager
