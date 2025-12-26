local UIManager = require(game.ReplicatedStorage.ScriptAlias.UIManager)

local ClickGameDefine = {}

function ClickGameDefine:C()
end

ClickGameDefine.SpawnIntervalMin = 1.5
ClickGameDefine.SpawnIntervalMax = 2.5
ClickGameDefine.SpawnCountLimit = 5
ClickGameDefine.LifeTimeDuration = 2

ClickGameDefine.ContainerWidth = 1.0
ClickGameDefine.ContainerHeight = 1.0

ClickGameDefine.RandMoveDistanceMin = 0.05
ClickGameDefine.RandMoveDistanceMax = 0.1

ClickGameDefine.AutoClickInterval = 0.25

return ClickGameDefine