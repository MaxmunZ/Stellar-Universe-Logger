local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "STELLAR SYSTEM | Fish It",
   LoadingTitle = "Luc Aetheryn Edition",
   LoadingSubtitle = "by Stellar System",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "StellarFish", 
      FileName = "Config"
   },
   Discord = {
      Enabled = true,
      Invite = "QEhHc6UBHH", 
      RememberJoins = true 
   },
   KeySystem = false -- Dibuat false agar langsung masuk
})

-- [[ TAB INFO ]]
local Tab1 = Window:CreateTab("Info", 4483345998)
local SectionInfo = Tab1:CreateSection("Stellar System Information")

Tab1:AddParagraph("Owner", "Luc Aetheryn")
Tab1:AddParagraph("Status", "ONLINE - Stable Version")

Tab1:AddButton({
   Name = "Copy Discord Link",
   Callback = function()
      setclipboard("https://discord.gg/QEhHc6UBHH")
      Rayfield:Notify({Title = "Stellar System", Content = "Discord Link Copied!", Duration = 3})
   end,
})

-- [[ TAB FISHING ]]
local Tab2 = Window:CreateTab("Fishing", 4483345998)
Tab2:CreateSection("Fishing Features")
Tab2:AddLabel("Main Features Coming Soon")

-- [[ TAB AUTOMATICALLY ]]
local Tab3 = Window:CreateTab("Automatically", 4483345998)
Tab3:CreateSection("Shop & Support")

-- [[ TAB QUEST ]]
local Tab4 = Window:CreateTab("Quest", 4483345998)
Tab4:CreateSection("Artifact & Event")
Tab4:AddButton({Name = "Ghostfin Quest", Callback = function() end}) -- Sesuai Permintaan
Tab4:AddButton({Name = "Diamond Quest", Callback = function() end}) -- Sesuai Permintaan

-- [[ TAB TELEPORT ]]
local Tab5 = Window:CreateTab("Teleport", 4483345998)
Tab5:CreateSection("Teleport Player")
