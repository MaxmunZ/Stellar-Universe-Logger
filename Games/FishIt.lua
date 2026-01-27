local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- WARNA CUSTOM STELLAR (Ungu, Magenta, Putih)
local colors = {
    SchemeColor = Color3.fromRGB(191, 64, 191), -- Ungu dari logo Stellar
    Background = Color3.fromRGB(20, 20, 30),    -- Gelap
    Header = Color3.fromRGB(30, 30, 45),        
    TextColor = Color3.fromRGB(255, 255, 255),  -- Putih
    ElementColor = Color3.fromRGB(35, 35, 50)   
}

local Window = Library.CreateLib("STELLAR SYSTEM | Fish It", colors)

-- [[ TAB INFO - STELLAR EXCLUSIVE ]]
local Tab1 = Window:NewTab("Info")
local InfoSec = Tab1:NewSection("Stellar System Information")

-- Header Informasi Eksklusif
InfoSec:NewLabel("--- GLOBAL INFORMATION ---")
InfoSec:NewLabel("Status: ONLINE")
InfoSec:NewLabel("Version: v1.1.0 [STABLE]")
InfoSec:NewLabel("Owner: Luc Aetheryn") -- Nama pemilik

-- Elemen User
InfoSec:NewLabel("-------------------------------------------")
InfoSec:NewLabel("Player: " .. game.Players.LocalPlayer.Name)
InfoSec:NewLabel("ID: " .. game.Players.LocalPlayer.UserId)
InfoSec:NewLabel("-------------------------------------------")

-- Seksi Komunitas
local SocialSec = Tab1:NewSection("Community")

SocialSec:NewButton("COPY DISCORD LINK", "Link: discord.gg/QEhHc6UBHH", function()
    setclipboard("https://discord.gg/QEhHc6UBHH")
    -- Notifikasi konfirmasi
    game.StarterGui:SetCore("SendNotification", {
        Title = "Stellar System",
        Text = "Link Discord berhasil disalin!",
        Duration = 3
    })
end)

-- Sidebar Tabs (Struktur Mandiri Stellar System)
local Tab2 = Window:NewTab("Fishing")
local Tab3 = Window:NewTab("Automatically")
local Tab4 = Window:NewTab("Trading")
local Tab5 = Window:NewTab("Quest")
local Tab6 = Window:NewTab("Menu")
