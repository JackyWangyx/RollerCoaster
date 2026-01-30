local GuideDefine = {}

GuideDefine.State = {

}

GuideDefine.TargetMode = {
	Node = 0,
	Building = 1,
	Pos = 2,
}

GuideDefine.ArrowPrefab = "GuideArrow"

-- 引导配置模板
local Template = {
	["Step_Name"] = {
		-- 引导存储键值，与引导实现代码名字一致
		Key = "StepKey",
		-- 引导提示文本
		TipText = "Step_TipText",
		-- 引导进行中显示的组件
		ShowPartList = {
			--[1] = "LevelRoot/Game/....",
		},
		-- 引导进行中显示的UI
		ShowUIList = {
			--[1] = "Page/UIMain/...",
		},
		-- 引导指向模式
		TargetMode = GuideDefine.TargetMode.Building,
		-- 引导指向的建筑
		TargetBuilding = "BuildingTool",
		-- 引导指向的坐标
		TargetPos = Vector3.zero,
	}
}


GuideDefine.GuideList = {
	[1] = {
		Key = "GuideStep_01_GoToRace",
		TipText = "Go to race",
		TargetMode = GuideDefine.TargetMode.Building,
		TargetBuilding = "BuildingTrackUpEntrance",
	},
}

return GuideDefine
