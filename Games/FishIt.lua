local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({
    Name = "Stellar System | v1.2", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "StellarConfig",
    IntroText = "Stellar Universe"
})

-- [[ SIDEBAR NAVIGATION - PERSIS REFERENSI ]]
local Tab1 = Window:MakeTab({Name = "Info", Icon = "rbxassetid://4483345998"})
local Tab2 = Window:MakeTab({Name = "Fishing", Icon = "rbxassetid://4483360581"})
local Tab3 = Window:MakeTab({Name = "Automatically", Icon = "rbxassetid://4483360581"})
local Tab4 = Window:MakeTab({Name = "Trading", Icon = "rbxassetid://4483345998"})
local Tab5 = Window:MakeTab({Name = "Menu", Icon = "rbxassetid://4483345998"})
local Tab6 = Window:MakeTab({Name = "Quest", Icon = "rbxassetid://4483345998"})

-- [[ ISI TAB INFO ]]
Tab1:AddSection({Name = "Stellar Information"})
Tab1:AddButton({
    Name = "COPY LINK DISCORD",
    Callback = function()
        setclipboard("https://discord.gg/stellaruniverse")
        OrionLib:MakeNotification({Name = "Stellar", Content = "Link Copied!", Time = 2})
    end    
})

-- Webhook Field (Mirip Chloe X)
Tab1:AddTextbox({
    Name = "Webhook URL",
    Default = "",
    TextDisplace = "Tempel link webhook di sini...",
    Callback = function(Value)
        _G.FishWebhook = Value
    end	
})

-- [[ ISI TAB FISHING ]]
Tab2:AddToggle({
    Name = "Auto Fishing",
    Default = false,
    Callback = function(Value)
        _G.StellarAutoFarm = Value
        if Value then
            OrionLib:MakeNotification({Name = "Stellar", Content = "Auto Fishing Aktif!", Time = 2})
            -- Logika pancing Anda di sini
        end
    end    
})

OrionLib:Init()
