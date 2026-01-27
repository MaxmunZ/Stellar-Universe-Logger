local player = game.Players.LocalPlayer
-- Menggunakan Library Kavo (Sangat stabil di Delta HP)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Stellar System | Fish It", "EmptyBlue")

-- Membuat Tab (Sidebar kiri otomatis)
local Tab1 = Window:NewTab("Info")
local Section1 = Tab1:NewSection("Stellar Universe")

Section1:NewLabel("Halo, " .. player.Name)
Section1:NewButton("Copy Discord", "Copy link ke clipboard", function()
    setclipboard("https://discord.gg/stellar")
end)

local Tab2 = Window:NewTab("LocalPlayer")
local Section2 = Tab2:NewSection("Movement")

Section2:NewButton("Speed Hack (100)", "Lari kencang", function()
    player.Character.Humanoid.WalkSpeed = 100
end)

Section2:NewButton("Normal Speed", "Kembali normal", function()
    player.Character.Humanoid.WalkSpeed = 16
end)

local Tab3 = Window:NewTab("Fishing")
local Section3 = Tab3:NewSection("Fitur Fisch")
Section3:NewLabel("Fitur Auto-Farm akan segera hadir!")
