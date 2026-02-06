local RunService = game:GetService("RunService")

local PlayerManager = require(game.ReplicatedStorage.ScriptAlias.PlayerManager)

-- 客户端通过控制 TargetPart 的位置，玩家保持物理状态，由约束拉动玩家移动，实现平滑移动和同步
-- 服务端只需要授予玩家客户端控制权限
local PlayerMove = {}

PlayerMove.TargetPart = nil

function PlayerMove:Enable(player)
	local rootPart = PlayerManager:GetHumanoidRootPart(player)
	if not rootPart then return end
	
	if RunService:IsClient() then
		-- RootPart的Attachment0（默认有RootRigAttachment，无需新建）
		local attach0 = rootPart:FindFirstChild("RootRigAttachment") or Instance.new("Attachment")
		if not attach0.Parent then
			attach0.Name = "RootRigAttachment"
			attach0.Parent = rootPart
		end

		-- 创建虚拟目标Part（透明、Anchored、小尺寸）
		local targetPart = Instance.new("Part")
		targetPart.Name = "PlayerMove_TargetPart"
		targetPart.Size = Vector3.new(0.1, 0.1, 0.1)
		targetPart.Transparency = 1
		targetPart.CanCollide = false
		targetPart.Anchored = true
		targetPart.CFrame = rootPart.CFrame
		targetPart.Parent = workspace

		local attach1 = Instance.new("Attachment")
		attach1.Parent = targetPart

		-- AlignPosition：位置对齐（无限力，Responsiveness高）
		local alignPos = Instance.new("AlignPosition")
		alignPos.Attachment0 = attach0
		alignPos.Attachment1 = attach1
		alignPos.MaxForce = math.huge
		alignPos.MaxVelocity = math.huge  -- 高速支持
		alignPos.Responsiveness = 2000000  -- 响应速度（越高越快，<200防抖）
		alignPos.Parent = rootPart

		-- AlignOrientation：旋转对齐
		local alignOri = Instance.new("AlignOrientation")
		alignOri.Attachment0 = attach0
		alignOri.Attachment1 = attach1
		alignOri.MaxTorque = math.huge
		alignOri.MaxAngularVelocity = math.huge
		alignOri.Responsiveness = 2000000
		alignOri.Parent = rootPart

		PlayerMove.TargetPart = targetPart
		
		PlayerManager:DisableControl(player)
	else
		rootPart.Anchored = false
		rootPart:SetNetworkOwner(player)
		local humanoid = PlayerManager:GetHumanoid(player)
		humanoid.PlatformStand = true
	end
	
	PlayerManager:DisablePhysic(player)
end

function PlayerMove:Disable(player)
	local rootPart = PlayerManager:GetHumanoidRootPart(player)
	if not rootPart then return end

	if RunService:IsClient() then
		for _, obj in pairs(rootPart:GetChildren()) do
			if obj:IsA("AlignPosition") or obj:IsA("AlignOrientation") then
				obj:Destroy()
			end
		end

		if PlayerMove.TargetPart then 
			PlayerMove.TargetPart:Destroy()
			PlayerMove.TargetPart = nil
		end
		
		PlayerManager:EnableControl(player)
	else
		--rootPart:SetNetworkOwner(nil)
		local humanoid = PlayerManager:GetHumanoid(player)
		humanoid.PlatformStand = false
	end
	
	PlayerManager:EnablePhysic(player)
end

return PlayerMove
