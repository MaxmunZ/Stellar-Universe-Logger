local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Stellar System | v1.2", HidePremium = false, SaveConfig = true, ConfigFolder = "Stellar"})

-- Panggil Logika dari Folder Games yang baru Anda buat
local FishLogic = loadstring(game:HttpGet("https://raw.githubusercontent.com/MaxmunZ/Stellar-Universe-Logger/refs/heads/main/Games/FishIt.lua"))()

-- [[ TAB INFO ]]
local TabInfo = Window:MakeTab({Name = "Info", Icon = "rbxassetid://4483345998"})
TabInfo:AddLabel("Stellar Universe Official Script")
TabInfo:AddButton({
	Name = "Copy Link Discord",
	Callback = function()
		setclipboard("https://discord.gg/stellaruniverse")
	end    
})

-- [[ TAB WEBHOOK (Persis Chloe X) ]]
local TabWeb = Window:MakeTab({Name = "Webhook", Icon = "rbxassetid://4483345998"})
TabWeb:AddTextbox({
	Name = "Webhook Fish Caught",
	Default = "",
	TextDisplace = "Tempel Webhook Disini...",
	Callback = function(Value)
		_G.FishWebhook = Value
	end	
})

-- [[ TAB FISHING ]]
local TabFish = Window:MakeTab({Name = "Fishing", Icon = "rbxassetid://4483345998"})
TabFish:AddToggle({
	Name = "Auto Fishing",
	Default = false,
	Callback = function(Value)
		if Value then
            FishLogic:StartAutoFarm()
        else
            FishLogic:StopAutoFarm()
        end
	end    
})

OrionLib:Init()
	Callback = function()
        -- Fungsi kirim tes ke discord
        print("Testing to: " .. _G.FishWebhook)
  	end    
})

OrionLib:Init()
