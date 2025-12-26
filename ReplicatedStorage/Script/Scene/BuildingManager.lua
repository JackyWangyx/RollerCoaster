local Workspace = game:GetService("Workspace")

local Util = require(game.ReplicatedStorage.ScriptAlias.Util)
local SceneManager = require(game.ReplicatedStorage.ScriptAlias.SceneManager)
local ResourcesManager = require(game.ReplicatedStorage.ScriptAlias.ResourcesManager)

local BuildingManager = {}

local BuildingPath = nil

function BuildingManager:Init()
	BuildingPath = SceneManager.LevelRoot:WaitForChild("Building")
	local children = BuildingPath:GetDescendants()
	for _, child in ipairs(children) do
		if BuildingManager:IsBuilding(child) then
			BuildingManager:OnBuildingAdded(child)
		end
	end
	
	BuildingPath.ChildAdded:Connect(function(part)
		if BuildingManager:IsBuilding(part) then
			BuildingManager:OnBuildingAdded(part)
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

function BuildingManager:OnBuildingAdded(buildingPart)
	local buildingName = buildingPart.Name
	local buildingScriptFile = Util:GetChildByTypeAndName(game.ReplicatedStorage, "ModuleScript", buildingName, true, ResourcesManager.ReplicatedStorageCache.All)
	local triggerPart = buildingPart:FindFirstChild("Trigger")
	if buildingScriptFile then
		local buildingScript = require(buildingScriptFile)
		local initFunc = buildingScript["Init"]
		initFunc(buildingScript, buildingPart, triggerPart)
	end
end

return BuildingManager
