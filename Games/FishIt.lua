local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "STELLAR SYSTEM",
    SubTitle = "by Luc Aetheryn",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- Efek blur transparan seperti Chloe X
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Kamu bisa ganti ini
})

-- MENGATUR WARNA AKSEN (Ungu-Magenta)
Fluent:SetTheme("Amethyst") 

-- [[ TAB INFO ]]
local Tabs = {
    Info = Window:AddTab({ Title = "Info", Icon = "info" }),
    Fishing = Window:AddTab({ Title = "Fishing", Icon = "fish" }),
    Auto = Window:AddTab({ Title = "Automatically", Icon = "play" }),
    Quest = Window:AddTab({ Title = "Quest", Icon = "scroll" }),
    Teleport = Window:AddTab({ Title = "Teleport", Icon = "map-pin" })
}

Tabs.Info:AddParagraph({
    Title = "Owner: Luc Aetheryn",
    Content = "Status: Online & Stable"
})

-- [[ TAB QUEST ]] (Sesuai Permintaan)
Tabs.Quest:AddSection("Quest Progress")
Tabs.Quest:AddButton({
    Title = "Ghostfin Quest",
    Description = "Start Ghostfin Questline",
    Callback = function() end
})
Tabs.Quest:AddButton({
    Title = "Diamond Quest",
    Description = "Start Diamond Questline",
    Callback = function() end
})

-- TOMBOL MINIMIZE KHUSUS (Floating Logo)
-- Fluent secara default memiliki tombol minimize kecil di pojok layar

Window:SelectTab(1)
Fluent:Notify({
    Title = "Stellar System",
    Content = "Welcome back, Luc Aetheryn",
    Duration = 5
})
