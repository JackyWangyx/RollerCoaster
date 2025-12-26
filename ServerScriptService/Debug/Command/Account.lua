local Util = require(game.ReplicatedStorage.ScriptAlias.Util)

local PlayerPrefs = require(game.ServerScriptService.ScriptAlias.PlayerPrefs)
local NetServer = require(game.ServerScriptService.ScriptAlias.NetServer)

local Account = {}

Account.Icon = "🔑"
Account.Color = Color3.new(1, 0.666667, 0)

function Account:Log(player, param)
	local module = PlayerPrefs:GetModule(player, "Account")
	print(module)
end

-- Coin

function Account:Coin10K(player, param)
	NetServer:RequireModule("Account"):AddCoin(player, { Value = 10000 })
end

function Account:Coin1M(player, param)
	NetServer:RequireModule("Account"):AddCoin(player, { Value = 1000000 })
end

function Account:Coin1B(player, param)
	NetServer:RequireModule("Account"):AddCoin(player, { Value = 1000000000 })
end

function Account:Coin1T(player, param)
	NetServer:RequireModule("Account"):AddCoin(player, { Value = 1000000000000 })
end

-- Wins

function Account:Wins10K(player, param)
	NetServer:RequireModule("Account"):AddWins(player, { Value = 10000 })
end

function Account:Wins1M(player, param)
	NetServer:RequireModule("Account"):AddWins(player, { Value = 1000000 })
end

function Account:Wins1B(player, param)
	NetServer:RequireModule("Account"):AddWins(player, { Value = 1000000000 })
end

function Account:Wins1T(player, param)
	NetServer:RequireModule("Account"):AddWins(player, { Value = 1000000000000 })
end

return Account
