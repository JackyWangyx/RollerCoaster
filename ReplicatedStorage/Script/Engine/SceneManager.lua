local RunService = game:GetService("RunService")

local Util = require(game.ReplicatedStorage.ScriptAlias.Util)
local LogUtil = require(game.ReplicatedStorage.ScriptAlias.LogUtil)

local Define = require(game.ReplicatedStorage.Define)

local SceneManager = {}

SceneManager.Config = nil
SceneManager.CurrentLevelName = nil
SceneManager.LevelRoot = nil

function SceneManager:Init()
	if RunService:IsServer() then
		SceneManager.Config = game.ServerStorage.Level:WaitForChild("SceneConfig")
		local levelConfig = SceneManager.Config:GetDescendants()[1]
		SceneManager.CurrentLevelName = levelConfig.Name
		local levelPrefab = game.ServerStorage.Level:FindFirstChild(SceneManager.CurrentLevelName)
		local levelRoot = nil
		if levelPrefab then
			levelRoot = levelPrefab:Clone()
		else
			levelRoot = game.Workspace:FindFirstChild(SceneManager.CurrentLevelName )
		end 
		levelRoot.Name = "LevelRoot"
		levelRoot.Parent = game.Workspace
		local levelNameLabel = Instance.new("StringValue")
		levelNameLabel.Name = "LevelName"
		levelNameLabel.Value = SceneManager.CurrentLevelName
		levelNameLabel.Parent = levelRoot
		SceneManager.LevelRoot = levelRoot
		
		LogUtil:Log("[Server] Scene Load Success! ", SceneManager.CurrentLevelName)
	else
		task.wait()
		SceneManager.LevelRoot = game.Workspace:WaitForChild("LevelRoot")
		SceneManager.CurrentLevelName = SceneManager.LevelRoot:WaitForChild("LevelName").Value
		LogUtil:Log("[Client] Scene Load Success!")
	end
end

return SceneManager
