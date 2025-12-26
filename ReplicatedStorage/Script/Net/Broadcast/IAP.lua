local IAPClient = require(game.ReplicatedStorage.ScriptAlias.IAPClient)

local IAP = {}

function IAP:OnPurchase(player, param)
	local success = param.Success
	local message = param.Message
	local receiptInfo = param.ReceiptInfo
	local productID = receiptInfo.ProductId
	IAPClient:OnPurchase(productID, success, message)
end

return IAP
