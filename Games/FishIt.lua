local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- [[ PENGATURAN JENDELA UTAMA ]]
local Window = Fluent:CreateWindow({
    Title = "STELLAR SYSTEM | Fish It",
    SubTitle = "by Luc Aetheryn",
    TabWidth = 140, 
    Size = UDim2.fromOffset(450, 320), 
    Acrylic = true, 
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- [[ SISTEM FLOATING LOGO (FIXED MAXIMIZE) ]]
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local MiniButton = Instance.new("ImageButton", ScreenGui)

MiniButton.Name = "StellarMinimize"
MiniButton.Size = UDim2.new(0, 50, 0, 50)
MiniButton.Position = UDim2.new(0, 10, 0.5, -25)
MiniButton.Image = "rbxassetid://1000304092" -- Logo Stellar Kamu
MiniButton.Visible = false
MiniButton.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
MiniButton.Draggable = true 

local Corner = Instance.new("UICorner", MiniButton)
Corner.CornerRadius = UDim.new(1, 0)

-- FUNGSI UNTUK MEMBUKA KEMBALI (MAXIMIZE)
MiniButton.MouseButton1Click:Connect(function()
    -- Memaksa UI Fluent untuk muncul kembali
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.LeftControl, false, game)
    -- Jika executor kamu tidak mendukung VirtualInput, kita gunakan toggle visible:
    if Fluent.Unloaded then return end
    MiniButton.Visible = false
end)

-- MENDETEKSI SAAT MENU DIMINIMIZE
Window.OnMinimize:Connect(function(Minimized)
    MiniButton.Visible = Minimized
end)

-- [[ SETUP TABS ]]
local Tabs = {
    Info = Window:AddTab({ Title = "Info", Icon = "info" }),
    Fishing = Window:AddTab({ Title = "Fishing", Icon = "fish" }),
    Auto = Window:AddTab({ Title = "Automatically", Icon = "play-circle" }),
    Trading = Window:AddTab({ Title = "Trading", Icon = "repeat" }),
    Quest = Window:AddTab({ Title = "Quest", Icon = "scroll" }),
    Teleport = Window:AddTab({ Title = "Teleport", Icon = "map-pin" }),
    Webhook = Window:AddTab({ Title = "Webhook", Icon = "webhook" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "settings" }),
    Config = Window:AddTab({ Title = "Config", Icon = "save" })
}

-- [[ 1. TAB INFO & DISCORD ]]
Tabs.Info:AddParagraph({ Title = "Developer", Content = "Luc Aetheryn" })
Tabs.Info:AddButton({
    Title = "Copy Discord Link",
    Callback = function() 
        setclipboard("https://discord.gg/QEhHc6UBHH")
        Fluent:Notify({ Title = "Stellar", Content = "Discord Link Copied!", Duration = 3 })
    end
})

-- [[ 2. TAB FISHING ]]
Tabs.Fishing:AddSection("Fishing Support")
Tabs.Fishing:AddSection("Fishing Features")
Tabs.Fishing:AddSection("Instant Features")

-- [[ 3. TAB AUTOMATICALLY ]]
Tabs.Auto:AddSection("Shop & Save Position")
Tabs.Auto:AddSection("Enchant & Totem")

-- [[ 4. TAB TRADING ]]
Tabs.Trading:AddSection("Trading System")

-- [[ 5. TAB QUEST ]]
Tabs.Quest:AddSection("Artifact & Event")
Tabs.Quest:AddButton({
    Title = "Ghostfin Quest",
    Callback = function() end
})
Tabs.Quest:AddButton({
    Title = "Diamond Quest",
    Callback = function() end
})

-- [[ 6. TAB TELEPORT ]]
Tabs.Teleport:AddSection("World Teleport")

-- [[ 7. LAIN-LAIN ]]
Tabs.Webhook:AddSection("Notification")
Tabs.Misc:AddSection("Misc")
Tabs.Config:AddSection("Settings")

Window:SelectTab(1)
Fluent:Notify({ Title = "STELLAR", Content = "Maximize Fixed! Click Logo to Open.", Duration = 4 })
