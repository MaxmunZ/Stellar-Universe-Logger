local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Stellar System | v1.0", HidePremium = false, SaveConfig = true, ConfigFolder = "StellarConfig"})

-- [[ NOTIFICATION LOGIN ]]
OrionLib:MakeNotification({
	Name = "Stellar Universe",
	Content = "Script Berhasil Dijalankan!",
	Image = "rbxassetid://4483345998",
	Time = 5
})

-- [[ TAB INFO ]]
local TabInfo = Window:MakeTab({
	Name = "Info",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

TabInfo:AddParagraph("Stellar Universe","Official script for Stellar members.")
TabInfo:AddButton({
	Name = "Copy Discord Link",
	Callback = function()
		setclipboard("https://discord.gg/stellar-universe") -- Ganti dengan link discord Anda
	end    
})

-- [[ TAB WEBHOOK (Seperti Chloe X) ]]
local TabWebhook = Window:MakeTab({
	Name = "Webhook",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

TabWebhook:AddTextbox({
	Name = "Webhook Fish Caught",
	Default = "",
	TextDisplace = "Tempel Link Webhook Disini...",
	Callback = function(Value)
		_G.FishWebhook = Value
		print("Webhook Ikan Terpasang!")
	end	
})

-- [[ FUNGSI LOGGER ]]
local function SendLog(fish, tier, weight, price)
    if _G.FishWebhook == nil or _G.FishWebhook == "" then
        OrionLib:MakeNotification({Name = "Error", Content = "Isi Webhook Terlebih Dahulu!", Time = 3})
        return
    end

    local req = (syn and syn.request) or http_request or request
    req({
        Url = _G.FishWebhook,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = game:GetService("HttpService"):JSONEncode({
            ["username"] = "Stellar System",
            ["embeds"] = {{
                ["title"] = "🪐 STELLAR FISH LOG",
                ["fields"] = {
                    {["name"] = "Explorer", ["value"] = game.Players.LocalPlayer.Name},
                    {["name"] = "Fish Data", ["value"] = fish .. " | " .. tier}
                }
            }}
        })
    })
end

TabWebhook:AddButton({
	Name = "Test Webhook",
	Callback = function()
        SendLog("Test Fish", "Mythical", "10kg", "5000")
  	end    
})

OrionLib:Init()
