-- [[ STELLAR SYSTEM - GAME SCRIPT ]]
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Stellar System | Fish It", "BloodTheme") -- Kamu bisa ganti tema: Ocean, Midnight, Sentinel, dll.

-- TABS
local Tab1 = Window:NewTab("Main")
local Section1 = Tab1:NewSection("Fishing Features")

Section1:NewButton("Auto Cast (Testing)", "Ini tombol percobaan", function()
    print("Tombol ditekan!")
end)

local Tab2 = Window:NewTab("Player")
local Section2 = Tab2:NewSection("Movement")

Section2:NewSlider("Walkspeed", "Atur kecepatan lari", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

local Tab3 = Window:NewTab("Credits")
local Section3 = Tab3:NewSection("Developed by MaxmunZ")
