local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Gunakan pcall untuk menghindari crash jika asset ID bermasalah
local Window = OrionLib:MakeWindow({
    Name = "STELLAR SYSTEM | Fish It", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "StellarFish",
    IntroText = "Stellar System | Luc Aetheryn",
    -- Hapus bagian Icon jika tidak muncul, atau gunakan ID asset resmi
    Icon = "rbxassetid://4483345998" 
})

-- [[ TAB 1: INFO ]]
local Tab1 = Window:MakeTab({Name = "Info", Icon = "rbxassetid://4483345998", PremiumOnly = false})

Tab1:AddLabel("Owner: Luc Aetheryn")
Tab1:AddLabel("Status: ONLINE")

Tab1:AddButton({
    Name = "Copy Discord Link",
    Callback = function()
        setclipboard("https://discord.gg/QEhHc6UBHH")
        OrionLib:MakeNotification({Name = "Stellar", Content = "Link Copied!", Time = 2})
    end    
})

-- [[ TAB 2: FISHING ]]
local Tab2 = Window:MakeTab({Name = "Fishing", Icon = "rbxassetid://4483345998", PremiumOnly = false})
Tab2:AddSection({Name = "Fishing Support"})
Tab2:AddSection({Name = "Fishing Features"})
Tab2:AddSection({Name = "Instant Features"})
Tab2:AddSection({Name = "Blatant v1 Features"})
Tab2:AddSection({Name = "Blatant v2 Features"})
Tab2:AddSection({Name = "Selling Features"})
Tab2:AddSection({Name = "Favorite Features"})
Tab2:AddSection({Name = "Auto Rejoin Features"})

-- [[ TAB 3: AUTOMATICALLY ]]
local Tab3 = Window:MakeTab({Name = "Automatically", Icon = "rbxassetid://4483345998", PremiumOnly = false})
Tab3:AddSection({Name = "Shop Features"})
Tab3:AddSection({Name = "Save Position Features"})
Tab3:AddSection({Name = "Enchant Features"})
Tab3:AddSection({Name = "Totem Features"})
Tab3:AddSection({Name = "Potions Features"})
Tab3:AddSection({Name = "Event Features"})

-- [[ TAB 4: TRADING ]]
local Tab4 = Window:MakeTab({Name = "Trading", Icon = "rbxassetid://4483345998", PremiumOnly = false})
Tab4:AddSection({Name = "Trading Fish Features"})
Tab4:AddSection({Name = "Trading Enchant Stones Features"})
Tab4:AddSection({Name = "Trading Coin Features"})
Tab4:AddSection({Name = "Trading Fish By Rarity"})
Tab4:AddSection({Name = "Auto Accept Features"})

-- [[ TAB 5: QUEST ]]
local Tab5 = Window:MakeTab({Name = "Quest", Icon = "rbxassetid://4483345998", PremiumOnly = false})
Tab5:AddSection({Name = "Artifact Lever Location"})
Tab5:AddSection({Name = "Ghostfin Quest"}) 
Tab5:AddSection({Name = "Element Quest"})
Tab5:AddSection({Name = "Diamond Quest"}) 
Tab5:AddSection({Name = "Crystalline Passage Features"})

-- [[ TAB 6: TELEPORT ]]
local Tab6 = Window:MakeTab({Name = "Teleport", Icon = "rbxassetid://4483345998", PremiumOnly = false})
Tab6:AddSection({Name = "Teleport To Player"})
Tab6:AddSection({Name = "Location"})

-- [[ TAB TAMBAHAN ]]
local Tab7 = Window:MakeTab({Name = "Webhook", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local Tab8 = Window:MakeTab({Name = "Misc", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local Tab9 = Window:MakeTab({Name = "Config", Icon = "rbxassetid://4483345998", PremiumOnly = false})

-- Tambahkan Label di tab kosong agar Tab tersebut terlihat (Wajib di Orion)
Tab7:AddLabel("Webhook settings coming soon")
Tab8:AddLabel("Misc features coming soon")
Tab9:AddLabel("Save/Load your configs here")

OrionLib:Init()
local Tab3 = Window:MakeTab({Name = "Automatically", Icon = "rbxassetid://4483345998"})
Tab3:AddSection({Name = "Shop Features"})
Tab3:AddSection({Name = "Save Position Features"})
Tab3:AddSection({Name = "Enchant Features"})
Tab3:AddSection({Name = "Totem Features"})
Tab3:AddSection({Name = "Potions Features"})
Tab3:AddSection({Name = "Event Features"})

-- [[ TAB 4: TRADING ]]
local Tab4 = Window:MakeTab({Name = "Trading", Icon = "rbxassetid://4483345998"})
Tab4:AddSection({Name = "Trading Fish Features"})
Tab4:AddSection({Name = "Trading Enchant Stones Features"})
Tab4:AddSection({Name = "Trading Coin Features"})
Tab4:AddSection({Name = "Trading Fish By Rarity"})
Tab4:AddSection({Name = "Auto Accept Features"})

-- [[ TAB 5: QUEST ]]
local Tab5 = Window:MakeTab({Name = "Quest", Icon = "rbxassetid://4483345998"})
Tab5:AddSection({Name = "Artifact Lever Location"})
Tab5:AddSection({Name = "Ghostfin Quest"}) -- Custom Name
Tab5:AddSection({Name = "Element Quest"})
Tab5:AddSection({Name = "Diamond Quest"}) -- Custom Name
Tab5:AddSection({Name = "Crystalline Passage Features"})

-- [[ TAB 6: TELEPORT ]]
local Tab6 = Window:MakeTab({Name = "Teleport", Icon = "rbxassetid://4483345998"})
Tab6:AddSection({Name = "Teleport To Player"})
Tab6:AddSection({Name = "Location"})

-- [[ TAB TAMBAHAN UNTUK SIDEBAR LENGKAP ]]
local Tab7 = Window:MakeTab({Name = "Webhook", Icon = "rbxassetid://4483345998"})
local Tab8 = Window:MakeTab({Name = "Misc", Icon = "rbxassetid://4483345998"})
local Tab9 = Window:MakeTab({Name = "Config", Icon = "rbxassetid://4483345998"})

OrionLib:Init()
