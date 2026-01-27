local player = game.Players.LocalPlayer
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Membuat Window (Saya matikan Intro supaya HP Anda tidak berat)
local Window = OrionLib:MakeWindow({
    Name = "Stellar System | Fish It", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "StellarUniverse",
    IntroEnabled = false -- Matikan ini agar langsung muncul
})

-- Membuat Tab (Sesuai Struktur Sidebar Chloe X)
local Tab1 = Window:MakeTab({ Name = "Info", Icon = "rbxassetid://4483345998" })
local Tab2 = Window:MakeTab({ Name = "Local Player", Icon = "rbxassetid://4483345998" })

-- Menambahkan Fitur dari YouTube tadi ke Tab Local Player
Tab2:AddButton({
    Name = "Speed Hack (500)",
    Callback = function()
        player.Character.Humanoid.WalkSpeed = 500
    end    
})

Tab2:AddButton({
    Name = "Normal Speed",
    Callback = function()
        player.Character.Humanoid.WalkSpeed = 16
    end    
})

-- Notifikasi pembuka agar Anda tahu script berhasil jalan
OrionLib:MakeNotification({
    Name = "Stellar Loaded!",
    Content = "Halo " .. player.Name .. ", Script siap dipakai!",
    Time = 5
})

OrionLib:Init()
