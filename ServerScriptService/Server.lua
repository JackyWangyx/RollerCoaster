local PlayerManager = require(game.ReplicatedStorage.ScriptAlias.PlayerManager)
local FriendManager = require(game.ReplicatedStorage.ScriptAlias.FriendManager)
local SceneManager = require(game.ReplicatedStorage.ScriptAlias.SceneManager)
local AnalyticsManager = require(game.ReplicatedStorage.ScriptAlias.AnalyticsManager)
local DriveController = require(game.ReplicatedStorage.ScriptAlias.DriveController)
local LogUtil = require(game.ReplicatedStorage.ScriptAlias.LogUtil)

local MessageManager = require(game.ServerScriptService.ScriptAlias.MessageManager)
local DataStorageManager = require(game.ServerScriptService.ScriptAlias.DataStorageManager)
local MemoryStoreManager = require(game.ServerScriptService.ScriptAlias.MemoryStoreManager)
local ServerPrefs = require(game.ServerScriptService.ScriptAlias.ServerPrefs)
local PlayerPrefs = require(game.ServerScriptService.ScriptAlias.PlayerPrefs)
local PlayerCache = require(game.ServerScriptService.ScriptAlias.PlayerCache)
local PlayerStatus = require(game.ServerScriptService.ScriptAlias.PlayerStatus)
local PlayerProperty = require(game.ServerScriptService.ScriptAlias.PlayerProperty)
local PlayerRecord = require(game.ServerScriptService.ScriptAlias.PlayerRecord)
local PlayerLeaderStats = require(game.ServerScriptService.ScriptAlias.PlayerLeaderStats)
local NetServer = require(game.ServerScriptService.ScriptAlias.NetServer)
local IAPServer = require(game.ServerScriptService.ScriptAlias.IAPServer)
local GameRank = require(game.ServerScriptService.ScriptAlias.GameRank)
local QuestManager = require(game.ServerScriptService.ScriptAlias.QuestManager)
local TradeServer = require(game.ServerScriptService.ScriptAlias.TradeServer)
local SceneAreaServerHandler = require(game.ServerScriptService.ScriptAlias.SceneAreaServerHandler)
local PetServerHandler = require(game.ServerScriptService.ScriptAlias.PetServerHandler)
local ToolServerHandler = require(game.ServerScriptService.ScriptAlias.ToolServerHandler)
local PartnerServerHandler = require(game.ServerScriptService.ScriptAlias.PartnerServerHandler)
local TrailServerHandler = require(game.ServerScriptService.ScriptAlias.TrailServerHandler)
local PropServerHandler = require(game.ServerScriptService.ScriptAlias.PropServerHandler)
local BuffOnlineHandler = require(game.ServerScriptService.ScriptAlias.BuffOnlineHandler)
local TrainingHandler = require(game.ServerScriptService.ScriptAlias.TrainingHandler)
local AutoRebirthHandler = require(game.ServerScriptService.ScriptAlias.AutoRebirthHandler)
local AnimalServerHandler = require(game.ServerScriptService.ScriptAlias.AnimalServerHandler)

--local RunnerGameHandler = require(game.ServerScriptService.ScriptAlias.RunnerGameHandler)

local DebugServer = require(game.ServerScriptService.Debug.DebugServer)
local Define = require(game.ReplicatedStorage.Define)


local function Init()
	LogUtil:Init()
	NetServer:Init()
	
	-- Data
	ServerPrefs:Init()
	PlayerPrefs:Init()
	PlayerCache:Init()
	PlayerStatus:Init()
	PlayerProperty:Init()
	PlayerLeaderStats:Init()
	PlayerRecord:Init()
	GameRank:Init()

	-- System
	IAPServer:Init()
	SceneManager:Init()

	PlayerManager:Init()
	MessageManager:Init()
	DataStorageManager:Init()
	MemoryStoreManager:Init()
	AnalyticsManager:Init()
	QuestManager:Init()

	-- System
	TradeServer:Init()
	FriendManager:Init()

	-- GamePlay
	DriveController:Init()
	PetServerHandler:Init()
	BuffOnlineHandler:Init()
	ToolServerHandler:Init()
	TrailServerHandler:Init()
	PropServerHandler:Init()
	TrainingHandler:Init()
	AutoRebirthHandler:Init()
	AnimalServerHandler:Init()
	PartnerServerHandler:Init()
	
	--RunnerGameHandler:Init()
	
	SceneAreaServerHandler:Init()
	require(game.ServerScriptService.ScriptAlias.RollerCoasterServer):Init()

	-- Misc
	DebugServer:Init()

	print("[Server] Start! Ver : "..Define.Version)
end

Init()