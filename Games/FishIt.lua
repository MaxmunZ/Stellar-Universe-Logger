-- [[ STELLAR SYSTEM FINAL UI - REVISED VERSION ]]
-- Developer: Luc Aetheryn
-- Current Date: Jan 28, 2026

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

-- [[ 1. SEARCH MENU ]]
local SearchMenu = Instance.new("Frame", ScreenGui)
SearchMenu.Size = UDim2.fromOffset(180, 240); SearchMenu.Position = UDim2.new(0.5, 260, 0.5, -120); SearchMenu.BackgroundColor3 = Color3.fromRGB(35, 35, 45); SearchMenu.Visible = false
local SStroke = Instance.new("UIStroke", SearchMenu); SStroke.Color = Color3.fromRGB(255, 50, 150); SStroke.Thickness = 2; Instance.new("UICorner", SearchMenu)
local SList = Instance.new("ScrollingFrame", SearchMenu); SList.Size = UDim2.new(1, 0, 1, -10); SList.BackgroundTransparency = 1; SList.ScrollBarThickness = 0; Instance.new("UIListLayout", SList)
local SelectedTiers = {}

for _, t in pairs({"Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic", "Secret"}) do
    local b = Instance.new("TextButton", SList); b.Size = UDim2.new(1, 0, 0, 30); b.Text = t; b.BackgroundColor3 = Color3.fromRGB(35, 35, 45); b.TextColor3 = Color3.fromRGB(200, 200, 200); b.Font = Enum.Font.Gotham; b.BorderSizePixel = 0
    b.MouseButton1Click:Connect(function()
        if table.find(SelectedTiers, t) then
            for i, v in ipairs(SelectedTiers) do if v == t then table.remove(SelectedTiers, i) end end
            b.TextColor3 = Color3.fromRGB(200, 200, 200)
        else
            table.insert(SelectedTiers, t)
            b.TextColor3 = Color3.fromRGB(255, 50, 150)
        end
        if _G.TierBtn then _G.TierBtn.Text = #SelectedTiers == 0 and "Select Options" or table.concat(SelectedTiers, ", ") end
    end)
end
local CloseSearch = Instance.new("TextButton", SearchMenu); CloseSearch.Size = UDim2.new(1, 0, 0, 25); CloseSearch.Position = UDim2.new(0, 0, 1, 0); CloseSearch.BackgroundColor3 = Color3.fromRGB(255, 50, 150); CloseSearch.Text = "Done"; CloseSearch.TextColor3 = Color3.new(1,1,1)
CloseSearch.MouseButton1Click:Connect(function() SearchMenu.Visible = false end)

-- [[ 2. MAIN FRAME ]]
local FloatBtn = Instance.new("ImageButton", ScreenGui); FloatBtn.Size = UDim2.fromOffset(50, 50); FloatBtn.Position = UDim2.new(0.05, 0, 0.2, 0); FloatBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 35); FloatBtn.Image = LogoStellar; FloatBtn.Visible = false; FloatBtn.Active = true; FloatBtn.Draggable = true; Instance.new("UICorner", FloatBtn).CornerRadius = UDim.new(1, 0)
local Main = Instance.new("Frame", ScreenGui); Main.Size = UDim2.fromOffset(500, 320); Main.Position = UDim2.new(0.5, -250, 0.5, -160); Main.BackgroundColor3 = Color3.fromRGB(25, 25, 35); Main.Active = true; Main.Draggable = true; Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 6)
local CloseBtn = Instance.new("TextButton", Main); CloseBtn.Text = "×"; CloseBtn.Size = UDim2.fromOffset(30, 30); CloseBtn.Position = UDim2.new(1, -40, 0, 5); CloseBtn.BackgroundTransparency = 1; CloseBtn.TextColor3 = Color3.fromRGB(255, 80, 80); CloseBtn.TextSize = 25; CloseBtn.Font = Enum.Font.GothamBold
local MiniBtn = Instance.new("TextButton", Main); MiniBtn.Text = "−"; MiniBtn.Size = UDim2.fromOffset(30, 30); MiniBtn.Position = UDim2.new(1, -75, 0, 5); MiniBtn.BackgroundTransparency = 1; MiniBtn.TextColor3 = Color3.new(1, 1, 1); MiniBtn.TextSize = 25; MiniBtn.Font = Enum.Font.GothamBold
MiniBtn.MouseButton1Click:Connect(function() Main.Visible = false; FloatBtn.Visible = true end)
FloatBtn.MouseButton1Click:Connect(function() Main.Visible = true; FloatBtn.Visible = false end)
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- [[ 3. HEADER & CONTENT ]]
local Header = Instance.new("Frame", Main); Header.Size = UDim2.new(1, -90, 0, 40); Header.BackgroundTransparency = 1
local Title = Instance.new("TextLabel", Header); Title.Text = "Stellar System | Fish It"; Title.Font = Enum.Font.GothamMedium; Title.TextColor3 = Color3.new(1, 1, 1); Title.TextSize = 15; Title.Position = UDim2.new(0, 40, 0, 0); Title.Size = UDim2.new(1, -40, 1, 0); Title.TextXAlignment = 0; Title.BackgroundTransparency = 1
local Sidebar = Instance.new("Frame", Main); Sidebar.Position = UDim2.new(0, 10, 0, 50); Sidebar.Size = UDim2.new(0, 150, 1, -60); Sidebar.BackgroundTransparency = 1; Instance.new("UIListLayout", Sidebar).Padding = UDim.new(0, 6)
local Content = Instance.new("Frame", Main); Content.Position = UDim2.new(0, 170, 0, 50); Content.Size = UDim2.new(1, -180, 1, -60); Content.BackgroundColor3 = Color3.fromRGB(20, 20, 28); Instance.new("UICorner", Content)

local Pages = {}
local TabButtons = {}
local function CreatePage(name, scroll)
    local P = scroll and Instance.new("ScrollingFrame", Content) or Instance.new("Frame", Content)
    P.Size = UDim2.new(1, 0, 1, 0); P.BackgroundTransparency = 1; P.Visible = false
    if scroll then P.ScrollBarThickness = 2; P.CanvasSize = UDim2.new(0, 0, 0, 600); P.ScrollBarImageColor3 = Color3.fromRGB(255, 50, 150) end
    Pages[name] = P; return P
end

-- [[ INFO PAGE (LENGKAP) ]]
local InfoPage = CreatePage("Info", true)
local function AddDetail(txt, y, color)
    local L = Instance.new("TextLabel", InfoPage); L.Text = txt; L.Size = UDim2.new(0.9, 0, 0, 20); L.Position = UDim2.new(0.05, 0, 0, y); L.Font = Enum.Font.Gotham; L.TextColor3 = color or Color3.new(1,1,1); L.TextSize = 12; L.TextXAlignment = 0; L.BackgroundTransparency = 1; L.TextWrapped = true; L.AutomaticSize = Enum.AutomaticSize.Y
end

AddDetail("STELLAR SYSTEM HUB", 10, Color3.fromRGB(255, 50, 150))
AddDetail("------------------------------------------", 30)
AddDetail("• Version: V1.0.0 [BETA]", 50)
AddDetail("• Developer: Luc Aetheryn", 70)
AddDetail("• Last Update: Jan 28, 2026", 90)
AddDetail("• Status: Undetected", 110)
AddDetail("\nDESKRIPSI FITUR:", 140, Color3.fromRGB(255, 50, 150))
AddDetail("- Webhook: Mengirim notifikasi tangkapan ke Discord.", 165)
AddDetail("- Tier Filter: Memilih rarity ikan yang ingin dikirim.", 185)
AddDetail("- Smart Detector: Mendeteksi ID Ikan & menerjemahkannya.", 205)
AddDetail("\nCARA PENGGUNAAN:", 235, Color3.fromRGB(255, 50, 150))
AddDetail("1. Copy Webhook URL dari Channel Discord Anda.", 260)
AddDetail("2. Paste di Tab Webhook, lalu aktifkan Toggle.", 280)
AddDetail("3. Pilih Tier yang diinginkan di Filter.", 300)

-- [[ WEBHOOK PAGE ]]
local WebhookPage = CreatePage("Webhook", true)
local function AddInput(lbl, y, placeholder)
    local L = Instance.new("TextLabel", WebhookPage); L.Text = lbl; L.Size = UDim2.new(0.9, 0, 0, 20); L.Position = UDim2.new(0.05, 0, 0, y); L.Font = Enum.Font.Gotham; L.TextColor3 = Color3.new(1,1,1); L.TextXAlignment = 0; L.BackgroundTransparency = 1
    local I = Instance.new("TextBox", WebhookPage); I.Size = UDim2.new(0.9, 0, 0, 35); I.Position = UDim2.new(0.05, 0, 0, y+22); I.BackgroundColor3 = Color3.fromRGB(30, 30, 40); I.PlaceholderText = placeholder; I.Text = ""; I.TextColor3 = Color3.new(1, 1, 1); Instance.new("UICorner", I); return I
end
local DiscordIDBox = AddInput("Input ID Discord (Optional)", 20, "1234567890")
local WebhookURLBox = AddInput("Webhook URL", 85, "https://discord.com/api/webhooks/...")

local function AddWhFilter(lbl, y, search)
    local F = Instance.new("Frame", WebhookPage); F.Size = UDim2.new(0.9, 0, 0, 35); F.Position = UDim2.new(0.05, 0, 0, y); F.BackgroundTransparency = 1
    local L = Instance.new("TextLabel", F); L.Text = lbl; L.Size = UDim2.new(0.4, 0, 1, 0); L.Font = Enum.Font.Gotham; L.TextColor3 = Color3.new(1, 1, 1); L.TextXAlignment = 0; L.BackgroundTransparency = 1
    local B = Instance.new("TextButton", F); B.Text = "Select Options"; B.Position = UDim2.new(0.4, 0, 0, 0); B.Size = UDim2.new(0.6, 0, 1, 0); B.BackgroundColor3 = Color3.fromRGB(35, 35, 45); B.TextColor3 = Color3.fromRGB(200, 200, 200); Instance.new("UICorner", B)
    if lbl == "Tier Filter" then _G.TierBtn = B end
    if search then B.MouseButton1Click:Connect(function() SearchMenu.Visible = not SearchMenu.Visible end) end
end
AddWhFilter("Tier Filter", 155, true)

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
AddWhToggle("Send Fish Webhook", 210)

local TestBtn = Instance.new("TextButton", WebhookPage); TestBtn.Size = UDim2.new(0.9, 0, 0, 35); TestBtn.Position = UDim2.new(0.05, 0, 0, 260); TestBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55); TestBtn.Text = "Tests Webhook Connection"; TestBtn.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", TestBtn)

-- [[ 4. LOGIC & TAB SYSTEM ]]
local function ShowPage(name)
    for k, v in pairs(Pages) do v.Visible = (k == name) end
    for k, v in pairs(TabButtons) do v.BackgroundColor3 = (k == name) and Color3.fromRGB(255, 50, 150) or Color3.fromRGB(35, 35, 45) end
end
for _, name in pairs({"Info", "Fishing", "Webhook", "Config"}) do
    if not Pages[name] then CreatePage(name, false) end
    local B = Instance.new("TextButton", Sidebar); B.Size = UDim2.new(1, 0, 0, 32); B.BackgroundColor3 = Color3.fromRGB(35, 35, 45); B.Text = "|| " .. name; B.TextColor3 = Color3.fromRGB(200, 200, 200); B.Font = Enum.Font.Gotham; B.TextSize = 13; B.TextXAlignment = 0; Instance.new("UICorner", B); Instance.new("UIPadding", B).PaddingLeft = UDim.new(0, 10)
    TabButtons[name] = B; B.MouseButton1Click:Connect(function() ShowPage(name) end)
end

-- [[ 5. WEBHOOK SENDER ]]
local function SendFishNotification(name, rarity, price, zone, weight, user)
    if not _G.WebhookEnabled then return end
    -- Filter Rarity
    if #SelectedTiers > 0 and not table.find(SelectedTiers, rarity) then return end
    
    local url = WebhookURLBox.Text:gsub("%s+", "")
    if url == "" or not url:find("discord") then return end

    local rarityColors = {["common"] = 12632256, ["uncommon"] = 3066993, ["rare"] = 3447003, ["epic"] = 10181046, ["legendary"] = 15105570, ["mythic"] = 15539236, ["secret"] = 16711680}
    local mainRepo = "https://raw.githubusercontent.com/MaxmunZ/Stellar-Assets/main/"
    
    local data = {
        ["content"] = DiscordIDBox.Text ~= "" and "🎣 **NEW CATCH!** <@"..DiscordIDBox.Text..">" or "🎣 **NEW CATCH!**",
        ["embeds"] = {{
            ["title"] = "⭐ Stellar System | " .. rarity .. " Catch!",
            ["description"] = "Congratulations!! **" .. user .. "** You have obtained a new **" .. rarity .. "** fish!",
            ["color"] = rarityColors[rarity:lower()] or 16723110,
            ["fields"] = {
                {["name"] = "〢Fish Name", ["value"] = "```" .. name .. "```", ["inline"] = false},
                {["name"] = "〢Fish Tier", ["value"] = "```" .. rarity .. "```", ["inline"] = true},
                {["name"] = "〢Weight", ["value"] = "```" .. weight .. "```", ["inline"] = true},
                {["name"] = "〢Value", ["value"] = "```$" .. price .. "```", ["inline"] = true},
                {["name"] = "〢Zone", ["value"] = "```" .. zone .. "```", ["inline"] = false}
            },
            ["footer"] = { ["text"] = "Stellar System • Luc Aetheryn", ["icon_url"] = mainRepo .. "Stellar%20System.png.jpg" },
            ["thumbnail"] = { ["url"] = mainRepo .. "Fishes/" .. name:gsub(" ", "%%20") .. ".png" },
            ["timestamp"] = DateTime.now():ToIsoDate()
        }}
    }
    pcall(function() (request or http_request or syn.request)({ Url = url, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = HttpService:JSONEncode(data) }) end)
end

-- [[ 6. SMART HOOK (THE MISSING LINK) ]]
-- Ini adalah bagian yang mendeteksi saat kamu mendapatkan ikan
local FishID_Map = { ["153"] = "Orca", ["1"] = "Azure Damsel", ["100"] = "Crystal Crab" }

local function ProcessFish(data)
    local rawName = data.DisplayName or data.FishName or data.Name or data.Id or "Unknown"
    local rarity = data.Rarity or data.Tier or "Common"
    local finalName = FishID_Map[tostring(rawName)] or tostring(rawName)
    
    SendFishNotification(
        finalName, 
        rarity, 
        data.Price or "0", 
        data.Location or "Ocean", 
        data.Weight or "N/A", 
        LocalPlayer.Name
    )
end

-- [[ DETECTION HOOK ]]
-- Kita scan RemoteEvents yang sering dipakai game fishing
for _, v in pairs(game:GetDescendants()) do
    if v:IsA("RemoteEvent") and (v.Name:find("Fish") or v.Name:find("Catch")) then
        v.OnClientEvent:Connect(function(...)
            local args = {...}
            for _, arg in pairs(args) do
                if type(arg) == "table" then ProcessFish(arg) end
            end
        end)
    end
end

-- [[ WEBHOOK TEST BUTTON ]]
TestBtn.MouseButton1Click:Connect(function()
    local url = WebhookURLBox.Text:gsub("%s+", "")
    if url == "" or not url:find("discord") then TestBtn.Text = "Invalid URL!"; task.wait(2); TestBtn.Text = "Tests Webhook Connection"; return end
    pcall(function() (request or http_request or syn.request)({ Url = url, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = HttpService:JSONEncode({["content"]="✅ Stellar System Connected!"}) }) end)
    TestBtn.Text = "Sent!"; task.wait(2); TestBtn.Text = "Tests Webhook Connection"
end)

ShowPage("Info")
