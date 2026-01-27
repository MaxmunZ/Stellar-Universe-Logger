local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Stellar System | v1.2", HidePremium = false, SaveConfig = true, ConfigFolder = "StellarConfig"})

-- Panggil Logika dari folder Games
local FishLogic = loadstring(game:HttpGet("https://raw.githubusercontent.com/MaxmunZ/Stellar-Universe-Logger/main/Games/FishIt.lua"))()

-- [[ TAB INFO ]]
local TabInfo = Window:MakeTab({Name = "Info", Icon = "rbxassetid://4483345998"})
TabInfo:AddLabel("Official Stellar Universe Script")
TabInfo:AddButton({
    Name = "Copy Discord Stellar",
    Callback = function()
        setclipboard("https://discord.gg/stellaruniverse")
        OrionLib:MakeNotification({Name = "Stellar", Content = "Link Copied!", Time = 2})
    end    
})

-- [[ TAB WEBHOOK ]]
local TabWeb = Window:MakeTab({Name = "Webhook", Icon = "rbxassetid://4483345998"})
TabWeb:AddTextbox({
    Name = "Webhook Fish Caught",
    Default = "",
    TextDisplace = "Tempel Link Webhook...",
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
