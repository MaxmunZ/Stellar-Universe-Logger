-- [[ STELLAR SYSTEM FINAL UI - REVISED VERSION ]]
-- Developer: Luc Aetheryn
-- Fix: Visual Restoration & Detailed Explanation

local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- [[ GITHUB ASSET HANDLER ]]
local function GetStellarAsset(fileName, url)
    if not isfile(fileName) then
        local success, result = pcall(function() return game:HttpGet(url) end)
        if success then writefile(fileName, result) end
    end
    return getcustomasset(fileName)
end

local LogoStellar = GetStellarAsset("StellarLogo_v3.png", "https://raw.githubusercontent.com/MaxmunZ/Stellar-Assets/refs/heads/main/Stellar%20System.png.jpg")
local LogoDiscord = GetStellarAsset("DiscordLogo_v3.png", "https://raw.githubusercontent.com/MaxmunZ/Stellar-Assets/refs/heads/main/Discord.png")

if CoreGui:FindFirstChild("StellarFinal") then CoreGui.StellarFinal:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "StellarFinal"
ScreenGui.ResetOnSpawn = false

-- [[ 1. MAIN FRAME & CONTROLS ]]
local FloatBtn = Instance.new("ImageButton", ScreenGui); FloatBtn.Size = UDim2.fromOffset(50, 50); FloatBtn.Position = UDim2.new(0.05, 0, 0.2, 0); FloatBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 35); FloatBtn.Image = LogoStellar; FloatBtn.Visible = false; FloatBtn.Active = true; FloatBtn.Draggable = true; Instance.new("UICorner", FloatBtn).CornerRadius = UDim.new(1, 0)
local Main = Instance.new("Frame", ScreenGui); Main.Size = UDim2.fromOffset(500, 320); Main.Position = UDim2.new(0.5, -250, 0.5, -160); Main.BackgroundColor3 = Color3.fromRGB(25, 25, 35); Main.Active = true; Main.Draggable = true; Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 6)
local CloseBtn = Instance.new("TextButton", Main); CloseBtn.Text = "×"; CloseBtn.Size = UDim2.fromOffset(30, 30); CloseBtn.Position = UDim2.new(1, -40, 0, 5); CloseBtn.BackgroundTransparency = 1; CloseBtn.TextColor3 = Color3.fromRGB(255, 80, 80); CloseBtn.TextSize = 25; CloseBtn.Font = Enum.Font.GothamBold
local MiniBtn = Instance.new("TextButton", Main); MiniBtn.Text = "−"; MiniBtn.Size = UDim2.fromOffset(30, 30); MiniBtn.Position = UDim2.new(1, -75, 0, 5); MiniBtn.BackgroundTransparency = 1; MiniBtn.TextColor3 = Color3.new(1, 1, 1); MiniBtn.TextSize = 25; MiniBtn.Font = Enum.Font.GothamBold

MiniBtn.MouseButton1Click:Connect(function() Main.Visible = false; FloatBtn.Visible = true end)
FloatBtn.MouseButton1Click:Connect(function() Main.Visible = true; FloatBtn.Visible = false end)
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- [[ 2. SEARCH MENU (FINAL VISUAL FIX) ]]
local SearchMenu = Instance.new("ImageLabel", Main) 
SearchMenu.Name = "TierSearchMenu"
SearchMenu.Size = UDim2.new(0, 185, 0, 265) 
SearchMenu.Position = UDim2.new(0, 305, 0, 45) 
SearchMenu.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
SearchMenu.Image = GetStellarAsset("StellarB2_Vertical.png", "https://raw.githubusercontent.com/MaxmunZ/Stellar-Assets/main/Stellar%20Background%20Vertical.jpg")
SearchMenu.ScaleType = Enum.ScaleType.Stretch
SearchMenu.Visible = false
SearchMenu.ZIndex = 200
SearchMenu.Active = true -- Biar bisa diklik elemen di atasnya

local SStroke = Instance.new("UIStroke", SearchMenu)
SStroke.Color = Color3.fromRGB(255, 50, 150)
SStroke.Thickness = 1.5
Instance.new("UICorner", SearchMenu)

local STitle = Instance.new("TextLabel", SearchMenu)
STitle.Text = "Search"; STitle.Size = UDim2.new(1, 0, 0, 35); STitle.BackgroundTransparency = 1; STitle.TextColor3 = Color3.fromRGB(255, 255, 255); STitle.Font = Enum.Font.GothamMedium; STitle.TextSize = 14; STitle.ZIndex = 205

local SList = Instance.new("ScrollingFrame", SearchMenu)
SList.Size = UDim2.new(1, -20, 1, -80); SList.Position = UDim2.new(0, 10, 0, 40); SList.BackgroundTransparency = 1; SList.ScrollBarThickness = 0; SList.CanvasSize = UDim2.new(0, 0, 0, 260); SList.ZIndex = 210
Instance.new("UIListLayout", SList).Padding = UDim.new(0, 4)

for _, t in pairs({"Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic", "Secret"}) do
    local b = Instance.new("TextButton", SList)
    b.Size = UDim2.new(1, 0, 0, 30); b.Text = "  " .. t; b.BackgroundTransparency = 0.8; b.BackgroundColor3 = Color3.fromRGB(0, 0, 0); b.TextColor3 = Color3.fromRGB(200, 200, 200); b.Font = Enum.Font.Gotham; b.TextSize = 13; b.TextXAlignment = Enum.TextXAlignment.Left; b.ZIndex = 215
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 4)
    
    -- Gradient Effect untuk Button
    local bGrad = Instance.new("UIGradient", b)
    bGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 50, 150)), 
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 20, 80))
    })
    bGrad.Enabled = false -- Mati dulu, nyala pas dipilih

    b.MouseButton1Click:Connect(function()
        if table.find(SelectedTiers, t) then
            for i, v in ipairs(SelectedTiers) do if v == t then table.remove(SelectedTiers, i) end end
            bGrad.Enabled = false
            b.BackgroundTransparency = 0.8
            b.TextColor3 = Color3.fromRGB(200, 200, 200)
        else
            table.insert(SelectedTiers, t)
            bGrad.Enabled = true
            b.BackgroundTransparency = 0.2 -- Biar gradient kelihatan tegas
            b.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
        if _G.TierBtn then _G.TierBtn.Text = #SelectedTiers == 0 and "Select Options" or table.concat(SelectedTiers, ", ") end
    end)
end

-- Tombol DONE (Visual diperjelas tapi tetap elegan)
local CloseSearch = Instance.new("TextButton", SearchMenu)
CloseSearch.Size = UDim2.new(0.8, 0, 0, 28)
CloseSearch.Position = UDim2.new(0.1, 0, 1, -35)
CloseSearch.BackgroundColor3 = Color3.fromRGB(255, 50, 150)
CloseSearch.Text = "DONE"
CloseSearch.Font = Enum.Font.GothamBold
CloseSearch.TextSize = 12
CloseSearch.TextColor3 = Color3.new(1, 1, 1)
CloseSearch.ZIndex = 220
Instance.new("UICorner", CloseSearch)

local cGrad = Instance.new("UIGradient", CloseSearch)
cGrad.Color = ColorSequence.new(Color3.fromRGB(255, 50, 150), Color3.fromRGB(150, 20, 100))

CloseSearch.MouseButton1Click:Connect(function() SearchMenu.Visible = false end)

-- [[ 3. HEADER & SIDEBAR ]]
local Header = Instance.new("Frame", Main); Header.Size = UDim2.new(1, -90, 0, 40); Header.BackgroundTransparency = 1
local TitleLogo = Instance.new("ImageLabel", Header); TitleLogo.Size = UDim2.fromOffset(20, 20); TitleLogo.Position = UDim2.new(0, 12, 0.5, -10); TitleLogo.Image = LogoStellar; TitleLogo.BackgroundTransparency = 1; TitleLogo.ScaleType = Enum.ScaleType.Fit
local Title = Instance.new("TextLabel", Header); Title.Text = "Stellar System | Fish It"; Title.Font = Enum.Font.GothamMedium; Title.TextColor3 = Color3.new(1, 1, 1); Title.TextSize = 15; Title.Position = UDim2.new(0, 40, 0, 0); Title.Size = UDim2.new(1, -40, 1, 0); Title.TextXAlignment = 0; Title.BackgroundTransparency = 1
local Sidebar = Instance.new("Frame", Main); Sidebar.Position = UDim2.new(0, 10, 0, 50); Sidebar.Size = UDim2.new(0, 150, 1, -60); Sidebar.BackgroundTransparency = 1; Instance.new("UIListLayout", Sidebar).Padding = UDim.new(0, 6)
local Content = Instance.new("Frame", Main); Content.Position = UDim2.new(0, 170, 0, 50); Content.Size = UDim2.new(1, -180, 1, -60); Content.BackgroundColor3 = Color3.fromRGB(20, 20, 28); Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 6)

local Pages = {}
local TabButtons = {}

local function CreatePage(name, scroll)
    local P = scroll and Instance.new("ScrollingFrame", Content) or Instance.new("Frame", Content)
    P.Size = UDim2.new(1, 0, 1, 0); P.BackgroundTransparency = 1; P.Visible = false
    if scroll then P.ScrollBarThickness = 2; P.CanvasSize = UDim2.new(0, 0, 0, 600); P.ScrollBarImageColor3 = Color3.fromRGB(255, 50, 150) end
    Pages[name] = P; return P
end

-- [[ INFO PAGE - REPLENISHED & COMPACT ]]
local InfoPage = CreatePage("Info", true)
local HubTitle = Instance.new("TextLabel", InfoPage); HubTitle.Text = "-- Stellar System Hub --"; HubTitle.Size = UDim2.new(1, 0, 0, 45); HubTitle.Font = Enum.Font.GothamBold; HubTitle.TextSize = 16; HubTitle.TextColor3 = Color3.new(1, 1, 1); HubTitle.BackgroundTransparency = 1

local function AddInfoRow(lbl, val, y)
    local F = Instance.new("Frame", InfoPage); F.BackgroundTransparency = 1; F.Size = UDim2.new(0.9, 0, 0, 16); F.Position = UDim2.new(0.05, 0, 0, y)
    local L = Instance.new("TextLabel", F); L.Text = lbl; L.Size = UDim2.new(0, 85, 1, 0); L.Font = Enum.Font.Gotham; L.TextColor3 = Color3.fromRGB(220, 220, 220); L.TextSize = 12; L.TextXAlignment = 0; L.BackgroundTransparency = 1
    local V = Instance.new("TextLabel", F); V.Text = ":  "..val; V.Position = UDim2.new(0, 85, 0, 0); V.Size = UDim2.new(1, -85, 1, 0); V.Font = Enum.Font.Gotham; V.TextColor3 = Color3.fromRGB(220, 220, 220); V.TextSize = 12; V.TextXAlignment = 0; V.BackgroundTransparency = 1
end

-- Jarak Y antar baris dikurangi menjadi hanya selisih 18 unit agar rapat
AddInfoRow("Version", "V1.0.0 [BETA]", 45)
AddInfoRow("Owner", "Luc Aetheryn", 63)
AddInfoRow("Status", "Undetected", 81)
AddInfoRow("Last Update", "Jan 28, 2026", 99)

-- [[ DISCORD UI - ADJUSTED POSITIONS ]]
-- Garis dipindahkan ke 125 agar dekat dengan Last Update
local Line = Instance.new("Frame", InfoPage); Line.Position = UDim2.new(0.05, 0, 0, 125); Line.Size = UDim2.new(0.9, 0, 0, 2); Line.BorderSizePixel = 0; 
local G = Instance.new("UIGradient", Line); G.Color = ColorSequence.new(Color3.fromRGB(255, 50, 150), Color3.fromRGB(120, 20, 150))

-- Kotak Discord naik ke 135 agar sangat dekat dengan Line
local DBox = Instance.new("Frame", InfoPage); DBox.Position = UDim2.new(0.05, 0, 0, 135); DBox.Size = UDim2.new(0.9, 0, 0, 50); DBox.BackgroundColor3 = Color3.fromRGB(35, 35, 45); Instance.new("UICorner", DBox)
local DIcon = Instance.new("ImageLabel", DBox); DIcon.Size = UDim2.fromOffset(30, 30); DIcon.Position = UDim2.new(0, 10, 0.5, -15); DIcon.Image = LogoDiscord; DIcon.BackgroundTransparency = 1; DIcon.ScaleType = Enum.ScaleType.Fit

-- Penyesuaian Ukuran Teks: DName (14), DSub (11) agar tidak terlalu besar
local DName = Instance.new("TextLabel", DBox); DName.Text = "Stellar Discord"; DName.Position = UDim2.new(0, 50, 0.2, 0); DName.Size = UDim2.new(1, -60, 0.4, 0); DName.Font = Enum.Font.GothamBold; DName.TextSize = 14; DName.TextColor3 = Color3.new(1, 1, 1); DName.TextXAlignment = 0; DName.BackgroundTransparency = 1
local DSub = Instance.new("TextLabel", DBox); DSub.Text = "Official Link Discord Server"; DSub.Position = UDim2.new(0, 50, 0.5, 0); DSub.Size = UDim2.new(1, -60, 0.4, 0); DSub.Font = Enum.Font.Gotham; DSub.TextSize = 11; DSub.TextColor3 = Color3.fromRGB(180, 180, 180); DSub.TextXAlignment = 0; DSub.BackgroundTransparency = 1

-- Tombol Copy naik ke 190
local CopyBtn = Instance.new("TextButton", InfoPage); CopyBtn.Position = UDim2.new(0.05, 0, 0, 190); CopyBtn.Size = UDim2.new(0.9, 0, 0, 30); CopyBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55); CopyBtn.Text = "Copy Link Discord"; CopyBtn.Font = Enum.Font.Gotham; CopyBtn.TextSize = 12; CopyBtn.TextColor3 = Color3.new(1, 1, 1); Instance.new("UICorner", CopyBtn)

-- [[ WEBHOOK PAGE ]]
local WebhookPage = CreatePage("Webhook", true)
local WhTitle = Instance.new("TextLabel", WebhookPage); WhTitle.Text = "Webhook Settings"; WhTitle.Size = UDim2.new(1, 0, 0, 40); WhTitle.Font = Enum.Font.GothamBold; WhTitle.TextSize = 20; WhTitle.TextColor3 = Color3.new(1,1,1); WhTitle.BackgroundTransparency = 1
local function AddInput(lbl, y, placeholder)
    local L = Instance.new("TextLabel", WebhookPage)
    L.Text = lbl
    L.Size = UDim2.new(0.9, 0, 0, 20)
    L.Position = UDim2.new(0.05, 0, 0, y)
    L.Font = Enum.Font.Gotham
    L.TextColor3 = Color3.new(1,1,1)
    L.TextXAlignment = 0
    L.BackgroundTransparency = 1

    local I = Instance.new("TextBox", WebhookPage)
    I.Size = UDim2.new(0.9, 0, 0, 35)
    I.Position = UDim2.new(0.05, 0, 0, y+22)
    I.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    I.PlaceholderText = placeholder
    I.Text = ""
    I.TextColor3 = Color3.new(1, 1, 1)
    I.TextSize = 12 -- Ukuran teks sedikit diperkecil agar lebih rapi
    I.ClipsDescendants = true -- MEMOTONG TEKS yang keluar dari kotak
    I.ClearTextOnFocus = false
    
    -- Mencegah teks meluap secara horizontal
    I.TextXAlignment = Enum.TextXAlignment.Left 
    
    local Padding = Instance.new("UIPadding", I)
    Padding.PaddingLeft = UDim.new(0, 10)
    Padding.PaddingRight = UDim.new(0, 10) -- Padding agar teks tidak menempel ke pinggir
    
    Instance.new("UICorner", I)
    return I
end

local DiscordIDBox = AddInput("Input ID Discord", 50, "Input Here")
local WebhookURLBox = AddInput("Webhook URL", 115, "Input Here")

local function AddWhFilter(lbl, y, search)
    local F = Instance.new("Frame", WebhookPage); F.Size = UDim2.new(0.9, 0, 0, 35); F.Position = UDim2.new(0.05, 0, 0, y); F.BackgroundTransparency = 1
    local L = Instance.new("TextLabel", F); L.Text = lbl; L.Size = UDim2.new(0.4, 0, 1, 0); L.Font = Enum.Font.Gotham; L.TextColor3 = Color3.new(1, 1, 1); L.TextXAlignment = 0; L.BackgroundTransparency = 1
    local B = Instance.new("TextButton", F); B.Text = "Select Options"; B.Position = UDim2.new(0.4, 0, 0, 0); B.Size = UDim2.new(0.6, 0, 1, 0); B.BackgroundColor3 = Color3.fromRGB(35, 35, 45); B.TextColor3 = Color3.fromRGB(200, 200, 200); Instance.new("UICorner", B)
    if lbl == "Tier Filter" then _G.TierBtn = B end
    if search then B.MouseButton1Click:Connect(function() SearchMenu.Visible = not SearchMenu.Visible end) end
end
AddWhFilter("Tier Filter", 185, true)
AddWhFilter("Variant Filter", 225, false)
AddWhFilter("Name Filter", 265, false)

local function AddWhToggle(lbl, y)
    local F = Instance.new("Frame", WebhookPage); F.Size = UDim2.new(0.9, 0, 0, 35); F.Position = UDim2.new(0.05, 0, 0, y); F.BackgroundTransparency = 1
    local L = Instance.new("TextLabel", F); L.Text = lbl; L.Size = UDim2.new(0.7, 0, 1, 0); L.Font = Enum.Font.Gotham; L.TextColor3 = Color3.new(1, 1, 1); L.TextXAlignment = 0; L.BackgroundTransparency = 1
    local BG = Instance.new("TextButton", F); BG.Size = UDim2.fromOffset(45, 22); BG.Position = UDim2.new(1, -45, 0.5, -11); BG.BackgroundColor3 = Color3.fromRGB(45, 45, 55); BG.Text = ""; Instance.new("UICorner", BG).CornerRadius = UDim.new(1, 0)
    local T = Instance.new("Frame", BG); T.Size = UDim2.fromOffset(18, 18); T.Position = UDim2.new(0, 2, 0.5, -9); T.BackgroundColor3 = Color3.new(1,1,1); Instance.new("UICorner", T).CornerRadius = UDim.new(1, 0)
    BG.MouseButton1Click:Connect(function() 
        local s = BG.BackgroundColor3 == Color3.fromRGB(45, 45, 55)
        BG.BackgroundColor3 = s and Color3.fromRGB(255, 50, 150) or Color3.fromRGB(45, 45, 55)
        TweenService:Create(T, TweenInfo.new(0.2), {Position = s and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)}):Play()
        if lbl == "Send Fish Webhook" then _G.WebhookEnabled = s end
    end)
end
AddWhToggle("Send Fish Webhook", 310)

local TestBtn = Instance.new("TextButton", WebhookPage); TestBtn.Size = UDim2.new(0.9, 0, 0, 35); TestBtn.Position = UDim2.new(0.05, 0, 0, 355); TestBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55); TestBtn.Text = "Tests Webhook Connection"; TestBtn.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", TestBtn)

-- [[ WEBHOOK TEST LOGIC - CLEAN VERSION ]]
TestBtn.MouseButton1Click:Connect(function()
    local url = WebhookURLBox.Text:gsub("%s+", "")
    
    if url == "" or not url:find("discord") then
        TestBtn.Text = "Invalid Webhook URL!"
        task.wait(2)
        TestBtn.Text = "Test Webhook Connection"
        return
    end

    -- URL Logo Stellar untuk Thumbnail di dalam kotak
    local stellarLogo = "https://raw.githubusercontent.com/MaxmunZ/Stellar-Assets/main/Stellar%20System.png.jpg"

    local payload = HttpService:JSONEncode({
        -- Username & Avatar dihapus agar menggunakan bawaan Discord
        ["content"] = "Stellar System Test", 
        ["embeds"] = {{
            ["title"] = "✅ Connection Test Successful",
            ["description"] = "Stellar System has been successfully linked to your Discord Webhook.",
            ["color"] = 16723110, -- Pink Stellar
            ["thumbnail"] = {
                ["url"] = stellarLogo 
            },
            ["footer"] = {
                ["text"] = "Stellar System",
                ["icon_url"] = stellarLogo
            },
            ["timestamp"] = DateTime.now():ToIsoDate()
        }}
    })

    local success, response = pcall(function()
        return (request or http_request or syn.request)({
            Url = url,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = payload
        })
    end)

    if success then
        TestBtn.Text = "Successfully Sent!"
    else
        TestBtn.Text = "Failed To Send"
    end
    
    task.wait(2)
    TestBtn.Text = "Test Webhook Connection"
end)

-- [[ 5. TAB SYSTEM ]]
local function ShowPage(name)
    for k, v in pairs(Pages) do v.Visible = (k == name) end
    for k, v in pairs(TabButtons) do v.BackgroundColor3 = (k == name) and Color3.fromRGB(255, 50, 150) or Color3.fromRGB(35, 35, 45) end
end
for _, name in pairs({"Info", "Fishing", "Automatically", "Menu", "Quest", "Webhook", "Config"}) do
    if not Pages[name] then CreatePage(name, false) end
    local B = Instance.new("TextButton", Sidebar); B.Size = UDim2.new(1, 0, 0, 32); B.BackgroundColor3 = Color3.fromRGB(35, 35, 45); B.Text = "|| " .. name; B.TextColor3 = Color3.fromRGB(200, 200, 200); B.Font = Enum.Font.Gotham; B.TextSize = 13; B.TextXAlignment = 0; Instance.new("UICorner", B); Instance.new("UIPadding", B).PaddingLeft = UDim.new(0, 10)
    TabButtons[name] = B; B.MouseButton1Click:Connect(function() ShowPage(name) end)
end

-- [[ 6. FIX NOTIFICATION - COMPLETE VERSION ]]
local function SendFishNotification(fishName, rarity, price, zone, img, mutation, weight, playerName)
    if not _G.WebhookEnabled then return end
    
    local url = WebhookURLBox.Text:gsub("%s+", "")
    if url == "" or not url:find("discord") then return end

    local mainRepo = "https://raw.githubusercontent.com/MaxmunZ/Stellar-Assets/main/"
    local stellarLogo = mainRepo .. "Stellar%20System.png.jpg"
    
    -- Database Gambar Ikan (Thumbnail)
    local hasImage = {["Blob Shark"] = true, ["Megalodon"] = true, ["Cursed Kraken"] = true}
    local thumbnailURL = stellarLogo
    if hasImage[fishName] then
        thumbnailURL = mainRepo .. "Fishes/" .. fishName:gsub(" ", "%%20") .. ".png"
    end

    local data = {
        ["content"] = "", 
        ["embeds"] = {{
            ["title"] = "⭐ Stellar System | " .. tostring(rarity) .. " Catch!",
            ["description"] = "Congratulations!! You have obtained a new **" .. tostring(rarity) .. "** fish!",
            ["color"] = 16723110, -- Pink Stellar
            ["fields"] = {
                {["name"] = "〢Player Name", ["value"] = "```" .. tostring(playerName) .. "```", ["inline"] = false},
                {["name"] = "〢Fish Name", ["value"] = "```" .. tostring(fishName) .. "```", ["inline"] = false},
                {["name"] = "〢Fish Tier", ["value"] = "```" .. tostring(rarity) .. "```", ["inline"] = true},
                {["name"] = "〢Weight", ["value"] = "```" .. tostring(weight) .. "```", ["inline"] = true},
                {["name"] = "〢Mutation", ["value"] = "```" .. (mutation ~= "" and mutation or "None") .. "```", ["inline"] = true},
                {["name"] = "〢Value", ["value"] = "```$" .. tostring(price) .. "```", ["inline"] = true},
                {["name"] = "〢Zone", ["value"] = "```" .. tostring(zone) .. "```", ["inline"] = false}
            },
            ["footer"] = { ["text"] = "Stellar System • Luc Aetheryn", ["icon_url"] = stellarLogo },
            ["thumbnail"] = { ["url"] = thumbnailURL },
            ["timestamp"] = DateTime.now():ToIsoDate()
        }}
    }
    
    pcall(function()
        (request or http_request or syn.request)({
            Url = url, Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode(data)
        })
    end)
end

-- [[ 7. ULTIMATE DETECTOR - FISH IT! EDITION ]]
local function AutoHookFish()
    local RS = game:GetService("ReplicatedStorage")
    local CatchRemote = nil
    
    for _, v in pairs(RS:GetDescendants()) do
        if v:IsA("RemoteEvent") and (v.Name:find("Catch") or v.Name:find("Fish")) then
            CatchRemote = v; break
        end
    end

    if CatchRemote then
        CatchRemote.OnClientEvent:Connect(function(...)
            local args = {...}
            if not _G.WebhookEnabled then return end

            local playerName = tostring(args[1])
            local rarity = "Common"
            local fishName = "Unknown Fish"
            local weight = "0kg"
            local zone = "Main Ocean"
            local price = 0
            local mutation = "None"
            
            local validRarities = {"Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic", "Secret"}

            -- [[ PENCARIAN DATA AGRESIF ]]
            for i, v in ipairs(args) do
                local s = tostring(v)
                
                -- 1. Deteksi Rarity (Prioritas)
                if table.find(validRarities, s) then
                    rarity = s
                
                -- 2. Deteksi Berat (Mencari angka yang ada kg/lb)
                elseif s:match("%d+%.?%d*kg") or s:match("%d+%.?%d*lb") then
                    weight = s
                
                -- 3. Deteksi Harga (Mencari angka murni > 2)
                elseif type(v) == "number" and v > 2 then
                    price = v
                
                -- 4. Deteksi Zone (Mencari kata spesifik lokasi)
                elseif s:find("Zone") or s:find("Sea") or s:find("Ocean") then
                    zone = s

                -- 5. Deteksi Mutasi
                elseif s:find("Shiny") or s:find("Albino") or s:find("Giant") then
                    mutation = s
                end
            end

            -- 6. Deteksi Nama Ikan (Cari string yang bukan player/rarity/zone/weight)
            for i, v in ipairs(args) do
                local s = tostring(v)
                if type(v) == "string" and i > 1 
                   and not table.find(validRarities, s) 
                   and not s:find("kg") and not s:find("lb") 
                   and not s:find("Zone") and not s:find("Ocean")
                   and s ~= playerName and s ~= mutation and #s > 2 then
                    fishName = s
                    break
                end
            end

            -- [[ FILTER TIER - MENGGUNAKAN LOWERCASE AGAR PASTI COCOK ]]
            if #SelectedTiers > 0 then
                local isMatch = false
                for _, t in pairs(SelectedTiers) do
                    if rarity:lower() == t:lower() then 
                        isMatch = true 
                        break 
                    end
                end
                if not isMatch then return end -- Jika tidak cocok, jangan kirim
            end

            -- [[ KIRIM KE WEBHOOK ]]
            SendFishNotification(fishName, rarity, price, zone, nil, mutation, weight, playerName)
        end)
    end
end
task.spawn(AutoHookFish)
ShowPage("Info")
