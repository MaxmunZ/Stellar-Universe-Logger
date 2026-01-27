local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Stellar System | v1.2", HidePremium = false, SaveConfig = true, ConfigFolder = "StellarConfig"})

local FishLogic = loadstring(game:HttpGet("https://raw.githubusercontent.com/MaxmunZ/Stellar-Universe-Logger/main/Games/FishIt.lua"))()

local TabInfo = Window:MakeTab({Name = "Info", Icon = "rbxassetid://4483345998"})
TabInfo:AddButton({
    Name = "Copy Discord",
    Callback = function() setclipboard("https://discord.gg/stellaruniverse") end    
})

local TabWeb = Window:MakeTab({Name = "Webhook", Icon = "rbxassetid://4483345998"})
TabWeb:AddTextbox({
    Name = "Webhook URL",
    Default = "",
    TextDisplace = "Paste here...",
    Callback = function(Value) _G.FishWebhook = Value end	
})

local TabFish = Window:MakeTab({Name = "Fishing", Icon = "rbxassetid://4483345998"})
TabFish:AddToggle({
    Name = "Auto Fish",
    Default = false,
    Callback = function(Value)
        if Value then FishLogic:StartAutoFarm() else FishLogic:StopAutoFarm() end
    end    
})

OrionLib:Init()
