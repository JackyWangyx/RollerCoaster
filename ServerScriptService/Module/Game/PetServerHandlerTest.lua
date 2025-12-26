local UpdatorManager = require(game.ReplicatedStorage.ScriptAlias.UpdatorManager)
local ConfigManager = require(game.ReplicatedStorage.ScriptAlias.ConfigManager)
local Util = require(game.ReplicatedStorage.ScriptAlias.Util)
local EventManager = require(game.ReplicatedStorage.ScriptAlias.EventManager)
local PlayerManager = require(game.ReplicatedStorage.ScriptAlias.PlayerManager)
local SceneManager = require(game.ReplicatedStorage.ScriptAlias.SceneManager)

local PlayerStatus = require(game.ServerScriptService.ScriptAlias.PlayerStatus)
local NetServer = require(game.ServerScriptService.ScriptAlias.NetServer)

local Define = require(game.ReplicatedStorage.Define)

local PetFolder = nil
local PetServerHandler = {}

local PetCacheList = {}
local PetFormationCache = {}

function PetServerHandler:Init()
	PetFolder = SceneManager.LevelRoot.Game:WaitForChild("Pet")

	PlayerManager:HandlePlayerAddRemove(function(player)
		--PetServerHandler:Refresh(player)
	end, function(player, character)
		
	end)

	EventManager:Listen(EventManager.Define.RefreshPet, function(player)
		PetServerHandler:Refresh(player)
	end)

	PlayerManager:HandleCharacterAddRemove(function(player, character)
		PetServerHandler:Refresh(player)
	end, function(player, character)
		PetServerHandler:Clear(player)
	end)
	
	UpdatorManager:Heartbeat(function(deltaTime)
		PetServerHandler:Update(deltaTime)
	end)
end

function PetServerHandler:Refresh(player)
	PetServerHandler:Clear(player)
	PetServerHandler:Create(player)
end

function PetServerHandler:Create(player)
	local petEquipInfoList = NetServer:RequireModule("Pet"):GetEquipList(player)
	local info = PetServerHandler:GetPetCacheInfo(player)
	local count = #petEquipInfoList
	local petFormationList = PetServerHandler:GetFormation(count)
	local rootPart = PlayerManager:GetHumanoidRootPart(player)
	if not rootPart then return end
	for index, petInfo in ipairs(petEquipInfoList) do
		local petFormation = petFormationList[index]
		local relativePosition = petFormation.Position
		local relativeRotation = petFormation.Orientation

		-- Pet
		local id = petInfo.ID
		local data = ConfigManager:GetData("Pet", id)
		if not data then 
			warn("[Pet Handler] PetData not found!", id)
			continue 
		end
		
		local prefab = Util:LoadPrefab(data.Prefab)
		if not prefab then 
			warn("[Pet Handler] Pet prefab not found!", id, data.Prefab)
			continue 
		end
		
		local pet = prefab:Clone()
		pet.Parent = PetFolder
		pet.Name = "Pet_"..player.UserId.."_"..data.Name.."_"..tostring(index)
		local parts = Util:GetAllChildByType(pet, "BasePart")
		for _, part in ipairs(parts) do
			part.Anchored = true
		end
		
		local petInfo = {
			Pet = pet,
			Position = relativePosition,
		}
		
		local relativeCFrame = CFrame.new(relativePosition) * CFrame.Angles(relativeRotation.X, relativeRotation.Y, relativeRotation.Z)
		local worldCFrame = rootPart.CFrame * relativeCFrame
		pet:SetPrimaryPartCFrame(worldCFrame)
		
		table.insert(info, petInfo)
	end
end

function PetServerHandler:GetPetCacheInfo(player)
	local info = PetCacheList[player]
	if not info then
		info = {}	
		PetCacheList[player] = info
	end
	return info
end


function PetServerHandler:Clear(player)
	local info = PetServerHandler:GetPetCacheInfo(player)
	for _, petInfo in ipairs(info) do
		local pet = petInfo.Pet
		pet:Destroy()
	end
	
	info = {}
	PetCacheList[player] = info
end

function PetServerHandler:GetFormation(count)
	local result = PetFormationCache[count]
	if not result then
		local formationList = {}
		local folder = game.ReplicatedStorage.Module.Pet:WaitForChild("PetFormation")
		local formation = folder:FindFirstChild(tostring(count))
		if not formation then
			return formationList
		end
		for _, part in ipairs(formation:GetChildren()) do
			table.insert(formationList, {
				Position = part.Position,
				Orientation = part.Orientation
			})
		end	
		result = formationList
		PetFormationCache[count] = formationList
	end
	return result
end

function PetServerHandler:Update(deltaTime)
	local players = game.Players:GetPlayers()
	for _, player in ipairs(players) do
		if not player.Character or not player.Character.PrimaryPart then
			continue
		end
		
		local playerRoot = player.Character.PrimaryPart
		local playerState = PlayerStatus:GetStatus(player)
		local playerCacheInfo = PetServerHandler:GetPetCacheInfo(player)
		for _, petInfo in ipairs(playerCacheInfo) do
			local pet = petInfo.Pet
			if pet and pet.PrimaryPart then
				local playerCFrame = playerRoot.CFrame
				local targetWorldPos = playerCFrame:PointToWorldSpace(petInfo.Position)
				local currentPos = pet.PrimaryPart.Position
				local newPos

				if playerState == Define.PlayerStatus.Gaming then
					-- 🚀 比赛状态：直接固定在偏移位置
					newPos = targetWorldPos
				else
					-- 🐢 正常状态：插值跟随
					local speed = 60
					local offset = targetWorldPos - currentPos
					local distance = offset.Magnitude
					if distance > 0.05 then
						local moveDelta = math.min(distance, speed * deltaTime)
						newPos = currentPos + offset.Unit * moveDelta
					else
						newPos = currentPos
					end
				end

				-- 始终朝向玩家
				local lookTarget = playerRoot.Position
				local targetCFrame = CFrame.new(newPos, lookTarget)

				-- 平滑旋转（比赛中也用，避免瞬间抖动）
				local currentCFrame = pet.PrimaryPart.CFrame
				local lerpAlpha = (playerState == Define.PlayerStatus.Gaming) and 0.6 or 0.25
				local finalCFrame = currentCFrame:Lerp(targetCFrame, lerpAlpha)

				pet:SetPrimaryPartCFrame(finalCFrame)
			end
		end
	end
end

return PetServerHandler