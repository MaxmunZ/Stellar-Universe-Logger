local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Stellar System | v1.1", HidePremium = false, SaveConfig = true, ConfigFolder = "Stellar"})

-- TAB INFO (Persis seperti Chloe X Info)
local TabInfo = Window:MakeTab({
	Name = "Info",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

TabInfo:AddLabel("Official Stellar Universe Script")
TabInfo:AddButton({
	Name = "COPY DISCORD STELLAR",
	Callback = function()
		setclipboard("https://discord.gg/stellaruniverse") -- Ganti linknya
	end    
})

-- TAB WEBHOOK (Persis seperti Chloe X Webhook)
local TabWeb = Window:MakeTab({
	Name = "Webhook",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

TabWeb:AddTextbox({
	Name = "Webhook Fish Caught",
	Default = "",
	TextDisplace = "Tempel Webhook Disini...",
	Callback = function(Value)
		_G.FishWebhook = Value -- Menyimpan webhook yang diinput pemain
	end	
})

TabWeb:AddButton({
	Name = "Test Log Webhook",
	Callback = function()
        -- Fungsi kirim tes ke discord
        print("Testing to: " .. _G.FishWebhook)
  	end    
})

OrionLib:Init()
