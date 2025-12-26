local ResourcesManager = {}

local PreLoadPrefabCache = {}

ResourcesManager.ReplicatedStorageCache = {
	All = nil,
	Module = nil,
	Script = nil,
	GamePlay = nil,
}

function ResourcesManager:Init()
	ResourcesManager:LoadReplicatedStorage()
end

function ResourcesManager:LoadReplicatedStorage()
	local isWorking = true
	task.spawn(function()
		ResourcesManager.ReplicatedStorageCache.All =  game.ReplicatedStorage:GetDescendants()
		ResourcesManager.ReplicatedStorageCache.Module =  game.ReplicatedStorage.Module:GetDescendants()
		ResourcesManager.ReplicatedStorageCache.Script =  game.ReplicatedStorage.Script:GetDescendants()
		ResourcesManager.ReplicatedStorageCache.GamePlay =  game.ReplicatedStorage.GamePlay:GetDescendants()
		isWorking = false
	end)

	while isWorking do
		task.wait()
	end
end

function ResourcesManager:PreLoadByPath(path)
	ResourcesManager:Load(path)
end

function ResourcesManager:PreLoadByPathList(pathList)
	for _, path in pairs(pathList) do
		ResourcesManager:PreLoadByPath(path)
	end
end

function ResourcesManager:ClearCache()
	PreLoadPrefabCache = {}
end

function ResourcesManager:Load(path)
	local cacheResources = PreLoadPrefabCache[path]
	if cacheResources then return cacheResources end	
	local result = ResourcesManager:LoadImpl(path)
	PreLoadPrefabCache[path] = result
	return result
end

function ResourcesManager:LoadImpl(path)
	local parts = string.split(path, '/')
	local current = game.ReplicatedStorage.Prefab
	for _, part in ipairs(parts) do
		current = current:FindFirstChild(part)
		if not current then
			return nil
		end
	end

	return current
end

return ResourcesManager
