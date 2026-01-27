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

-- [[ TAB FISHING ]]
local Tab2 = Window:NewTab("Fishing")

-- Kategori Sesuai Gambar Referensi
local SecSupport = Tab2:NewSection("Fishing Support")
local SecFeatures = Tab2:NewSection("Fishing Features")
local SecInstant = Tab2:NewSection("Instant Features")
local SecBlatantV1 = Tab2:NewSection("Blatant v1 Features")
local SecBlatantV2 = Tab2:NewSection("Blatant v2 Features")
local SecSelling = Tab2:NewSection("Selling Features")
local SecFavorite = Tab2:NewSection("Favorite Features")
local SecRejoin = Tab2:NewSection("Auto Rejoin Features")

-- [[ TAB AUTOMATICALLY - STELLAR SYSTEM EXCLUSIVE ]]
local Tab3 = Window:NewTab("Automatically")

-- Struktur Section
local SecShop = Tab3:NewSection("Shop Features")
local SecSavePos = Tab3:NewSection("Save position Features")
local SecEnchant = Tab3:NewSection("Enchant Features")
local SecTotem = Tab3:NewSection("Totem Features")
local SecPotions = Tab3:NewSection("Potions Features")
local SecEvent = Tab3:NewSection("Event Features")

-- Contoh pengisian fitur (Bisa kembangkan nanti)
SecShop:NewToggle("Auto Buy Bait", "Otomatis membeli umpan", function(state)
    print("Auto Buy Bait:", state)
end)

SecSavePos:NewButton("Save Current Position", "Simpan posisi saat ini", function()
    print("Position Saved")
end)

SecEnchant:NewToggle("Auto Enchant", "Otomatis melakukan enchant", function(state)
    print("Auto Enchant:", state)
end)

-- [[ TAB TRADING - STELLAR SYSTEM EXCLUSIVE ]]
local Tab4 = Window:NewTab("Trading")

-- Struktur Section 
local SecTradeFish = Tab4:NewSection("Trading Fish Features")
local SecTradeStone = Tab4:NewSection("Trading Enchant Stones Features")
local SecTradeCoin = Tab4:NewSection("Trading Coin Features")
local SecTradeRarity = Tab4:NewSection("Trading Fish By Rarity")
local SecAutoAccept = Tab4:NewSection("Auto Accept Features")

-- Contoh pengisian fitur (Bisa dikembangkan nanti)
SecTradeFish:NewButton("Select Fish to Trade", "Pilih ikan untuk ditukar", function()
    print("Selecting Fish...")
end)

SecAutoAccept:NewToggle("Auto Accept Trade", "Otomatis menerima permintaan trade", function(state)
    print("Auto Accept:", state)
end)



-- Sidebar Tabs (Struktur Mandiri Stellar System)
local Tab5 = Window:NewTab("Quest")
local Tab6 = Window:NewTab("Menu")
