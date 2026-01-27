local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- MENGATUR UKURAN LEBIH KECIL (Mirip Chloe X)
local Window = Fluent:CreateWindow({
    Title = "STELLAR SYSTEM",
    SubTitle = "by Luc Aetheryn",
    TabWidth = 140, -- Lebih ramping
    Size = UDim2.fromOffset(450, 320), -- Ukuran dikecilkan dari 580x460
    Acrylic = true, 
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- [[ SISTEM FLOATING LOGO MINIMIZE ]]
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local ImageButton = Instance.new("ImageButton", ScreenGui)

ImageButton.Size = UDim2.new(0, 50, 0, 50)
ImageButton.Position = UDim2.new(0, 10, 0.5, 0)
ImageButton.Image = "rbxassetid://1000304092" -- Logo Stellar
ImageButton.Visible = false -- Sembunyi saat menu buka
ImageButton.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
local Corner = Instance.new("UICorner", ImageButton)
Corner.CornerRadius = UDim.new(1, 0) -- Bulat sempurna

-- Fungsi Klik Logo untuk Munculkan Menu
ImageButton.MouseButton1Click:Connect(function()
    Window:Minimize() -- Memanggil fungsi bawaan Fluent
    ImageButton.Visible = false
end)

-- Fungsi menyambungkan Tombol Minimize bawaan Fluent ke Logo kita
-- Kita buat toggle manual agar Logo muncul saat menu hilang
Window.OnMinimize:Connect(function()
    ImageButton.Visible = true
end)

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

-- [[ 1. INFO ]]
Tabs.Info:AddParagraph({ Title = "Owner", Content = "Luc Aetheryn" })
Tabs.Info:AddParagraph({ Title = "Status", Content = "ONLINE - Stable" })
Tabs.Info:AddButton({
    Title = "Copy Discord Link",
    Callback = function() setclipboard("https://discord.gg/QEhHc6UBHH") end
})

-- [[ 2. FISHING (Lengkap Sesuai Gambar) ]]
Tabs.Fishing:AddSection("Fishing Support")
Tabs.Fishing:AddSection("Fishing Features")
Tabs.Fishing:AddSection("Instant Features")
Tabs.Fishing:AddSection("Blatant v1 Features")
Tabs.Fishing:AddSection("Blatant v2 Features")
Tabs.Fishing:AddSection("Selling Features")
Tabs.Fishing:AddSection("Favorite Features")
Tabs.Fishing:AddSection("Auto Rejoin Features")

-- [[ 3. AUTOMATICALLY (Lengkap Sesuai Gambar) ]]
Tabs.Auto:AddSection("Shop Features")
Tabs.Auto:AddSection("Save Position Features")
Tabs.Auto:AddSection("Enchant Features")
Tabs.Auto:AddSection("Totem Features")
Tabs.Auto:AddSection("Potions Features")
Tabs.Auto:AddSection("Event Features")

-- [[ 4. TRADING (Lengkap Sesuai Gambar) ]]
Tabs.Trading:AddSection("Trading Fish Features")
Tabs.Trading:AddSection("Trading Enchant Stones Features")
Tabs.Trading:AddSection("Trading Coin Features")
Tabs.Trading:AddSection("Trading Fish By Rarity")
Tabs.Trading:AddSection("Auto Accept Features")

-- [[ 5. QUEST (Lengkap Sesuai Gambar) ]]
Tabs.Quest:AddSection("Artifact Lever Location")
Tabs.Quest:AddButton({Title = "Ghostfin Quest", Callback = function() end})
Tabs.Quest:AddSection("Element Quest")
Tabs.Quest:AddButton({Title = "Diamond Quest", Callback = function() end})
Tabs.Quest:AddSection("Crystalline Passage Features")

-- [[ 6. TELEPORT (Lengkap Sesuai Gambar) ]]
Tabs.Teleport:AddSection("Teleport To Player")
Tabs.Teleport:AddSection("Location")

-- [[ 7. WEBHOOK, MISC, CONFIG ]]
Tabs.Webhook:AddSection("Webhook Settings")
Tabs.Misc:AddSection("Misc Features")
Tabs.Config:AddSection("Configuration")

Window:SelectTab(1)
Fluent:Notify({ Title = "STELLAR SYSTEM", Content = "All Sections Loaded!", Duration = 5 })
