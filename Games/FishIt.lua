local RedzLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/RHEZAL-D/Redz-Library/main/Source.lua"))()

local Window = RedzLib:MakeWindow({
  Name = "STELLAR SYSTEM",
  SubTitle = "by Luc Aetheryn",
  SaveConfig = true,
  ConfigFolder = "StellarFish"
})

-- MENGATUR TEMA WARNA (Ungu-Magenta)
Window:ChangeColor(Color3.fromRGB(191, 64, 191)) 

-- MENAMBAHKAN TOMBOL MINIMIZE KE LOGO STELLAR
Window:AddMinimizeButton({
  Button = { Image = "rbxassetid://1000304092", BackgroundColor3 = Color3.fromRGB(30, 30, 45) },
  Corner = { CornerRadius = UDim.new(0, 10) }
})

-- [[ TAB INFO ]]
local Tab1 = Window:MakeTab({"Info", "info"})
Tab1:AddSection("Information")
Tab1:AddParagraph("Owner: Luc Aetheryn")
Tab1:AddParagraph("Status: Online")

-- [[ TAB FISHING ]]
local Tab2 = Window:MakeTab({"Fishing", "fish"})
Tab2:AddSection("Fishing Support")
Tab2:AddSection("Fishing Features")

-- [[ TAB AUTOMATICALLY ]]
local Tab3 = Window:MakeTab({"Automatically", "play"})
Tab3:AddSection("Automation Features")

-- [[ TAB TRADING ]]
local Tab4 = Window:MakeTab({"Trading", "repeat"})
Tab4:AddSection("Trading Features")

-- [[ TAB QUEST ]]
local Tab5 = Window:MakeTab({"Quest", "scroll"})
Tab5:AddSection("Quest Progress")
Tab5:AddButton({"Ghostfin Quest", function() end}) -- Sesuai Permintaan
Tab5:AddButton({"Diamond Quest", function() end}) -- Sesuai Permintaan

-- [[ TAB TELEPORT ]]
local Tab6 = Window:MakeTab({"Teleport", "map-pin"})
Tab6:AddSection("Teleport Location")
