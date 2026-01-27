-- [[ STELLAR SYSTEM - FINAL ULTIMATE CODE ]]
-- Developer: Luc Aetheryn
-- Integrasi: Info Hub, Scrollable Webhook, Search Menu, & Functional Test Webhook

local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")

-- Assets Helper
local function GetStellarAsset(fileName, url)
    if not isfile(fileName) then
        local success, result = pcall(function() return game:HttpGet(url) end)
        if success then writefile(fileName, result) end
    end
    return getcustomasset(fileName)
end

if CoreGui:FindFirstChild("StellarFinal") then CoreGui.StellarFinal:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "StellarFinal"
ScreenGui.ResetOnSpawn = false

-- [[ 1. SEARCH MENU (FLOATING) ]]
local SearchMenu = Instance.new("Frame", ScreenGui)
SearchMenu.Size = UDim2.fromOffset(180, 240); SearchMenu.Position = UDim2.new(0.5, 260, 0.5, -120)
SearchMenu.BackgroundColor3 = Color3.fromRGB(35, 35, 45); SearchMenu.Visible = false
local SStroke = Instance.new("UIStroke", SearchMenu); SStroke.Color = Color3.fromRGB(255, 50, 150); SStroke.Thickness = 2
Instance.new("UICorner", SearchMenu)

local STitle = Instance.new("TextLabel", SearchMenu); STitle.Text = "Search"; STitle.Size = UDim2.new(1, 0, 0, 30); STitle.TextColor3 = Color3.fromRGB(200, 200, 200); STitle.BackgroundTransparency = 1; STitle.Font = Enum.Font.Gotham
local SList = Instance.new("ScrollingFrame", SearchMenu); SList.Size = UDim2.new(1, 0, 1, -40); SList.Position = UDim2.new(0, 0, 0, 35); SList.BackgroundTransparency = 1; SList.ScrollBarThickness = 0
Instance.new("UIListLayout", SList)

local tiers = {"Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic", "Secret"}
for _, t in pairs(tiers) do
    local b = Instance.new("TextButton", SList); b.Size = UDim2.new(1, 0, 0, 30); b.Text = t; b.BackgroundColor3 = Color3.fromRGB(35, 35, 45); b.TextColor3 = Color3.new(1,1,1); b.Font = Enum.Font.Gotham; b.BorderSizePixel = 0
    b.MouseButton1Click:Connect(function() SearchMenu.Visible = false end)
end

-- [[ 2. MAIN UI BASE ]]
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.fromOffset(500, 320); Main.Position = UDim2.new(0.5, -250, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 35); Main.Active = true; Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 6)

local Container = Instance.new("Frame", Main)
Container.Position = UDim2.new(0, 170, 0, 50); Container.Size = UDim2.new(1, -180, 1, -60); Container.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
Instance.new("UICorner", Container).CornerRadius = UDim.new(0, 6)

local Sidebar = Instance.new("Frame", Main); Sidebar.Position = UDim2.new(0, 10, 0, 50); Sidebar.Size = UDim2.new(0, 150, 1, -60); Sidebar.BackgroundTransparency = 1
Instance.new("UIListLayout", Sidebar).Padding = UDim.new(0, 6)

local Pages = {}
local TabButtons = {}

local function CreatePage(name, scrollable)
    local Page
    if scrollable then
        Page = Instance.new("ScrollingFrame", Container)
        Page.ScrollBarThickness = 2; Page.ScrollBarImageColor3 = Color3.fromRGB(255, 50, 150); Page.CanvasSize = UDim2.new(0, 0, 0, 500)
    else
        Page = Instance.new("Frame", Container)
    end
    Page.Name = name .. "Page"; Page.Size = UDim2.new(1, 0, 1, 0); Page.BackgroundTransparency = 1; Page.Visible = false
    Pages[name] = Page
    return Page
end

-- [[ 3. PAGE: INFO ]]
local InfoPage = CreatePage("Info", false)
local HubTitle = Instance.new("TextLabel", InfoPage); HubTitle.Text = "-- Stellar System Hub --"; HubTitle.Size = UDim2.new(1, 0, 0, 45); HubTitle.Font = Enum.Font.GothamBold; HubTitle.TextSize = 18; HubTitle.TextColor3 = Color3.new(1, 1, 1); HubTitle.BackgroundTransparency = 1

local function AddInfoRow(label, value, y)
    local F = Instance.new("Frame", InfoPage); F.BackgroundTransparency = 1; F.Size = UDim2.new(0.9, 0, 0, 18); F.Position = UDim2.new(0.05, 0, y, 0)
    local L = Instance.new("TextLabel", F); L.Text = label; L.Size = UDim2.new(0, 85, 1, 0); L.Font = Enum.Font.Gotham; L.TextColor3 = Color3.fromRGB(220, 220, 220); L.TextXAlignment = 0; L.BackgroundTransparency = 1
    local V = Instance.new("TextLabel", F); V.Text = ":  " .. value; V.Position = UDim2.new(0, 85, 0, 0); V.Size = UDim2.new(1, -85, 1, 0); V.Font = Enum.Font.Gotham; V.TextColor3 = Color3.fromRGB(220, 220, 220); V.TextXAlignment = 0; V.BackgroundTransparency = 1
end
AddInfoRow("Version", "V1.0.0 [BETA]", 0.22)
AddInfoRow("Owner", "Luc Aetheryn", 0.29)
AddInfoRow("Status", "Undetected", 0.36)
AddInfoRow("Last Update", "Tuesday, January 27, 2026", 0.43)

-- [[ 4. PAGE: WEBHOOK ]]
local WebhookPage = CreatePage("Webhook", true)
local WhTitle = Instance.new("TextLabel", WebhookPage); WhTitle.Text = "Webhook"; WhTitle.Size = UDim2.new(1, 0, 0, 40); WhTitle.Font = Enum.Font.GothamBold; WhTitle.TextSize = 22; WhTitle.TextColor3 = Color3.new(1, 1, 1); WhTitle.BackgroundTransparency = 1

local WhDrop = Instance.new("TextButton", WebhookPage); WhDrop.Size = UDim2.new(0.9, 0, 0, 32); WhDrop.Position = UDim2.new(0.05, 0, 0, 45); WhDrop.BackgroundColor3 = Color3.fromRGB(35, 35, 45); WhDrop.Text = "Webhook Fish Caught"; WhDrop.TextColor3 = Color3.new(1, 1, 1); WhDrop.Font = Enum.Font.Gotham; Instance.new("UICorner", WhDrop)
local WhLine = Instance.new("Frame", WebhookPage); WhLine.Size = UDim2.new(0.9, 0, 0, 2); WhLine.Position = UDim2.new(0.05, 0, 0, 80); WhLine.BorderSizePixel = 0; local WG = Instance.new("UIGradient", WhLine); WG.Color = ColorSequence.new(Color3.fromRGB(255, 50, 150), Color3.fromRGB(50, 20, 100))

local function AddInput(label, placeholder, y)
    local L = Instance.new("TextLabel", WebhookPage); L.Text = label; L.Size = UDim2.new(0.9, 0, 0, 20); L.Position = UDim2.new(0.05, 0, 0, y); L.Font = Enum.Font.Gotham; L.TextColor3 = Color3.new(1,1,1); L.TextXAlignment = 0; L.BackgroundTransparency = 1
    local I = Instance.new("TextBox", WebhookPage); I.Size = UDim2.new(0.9, 0, 0, 35); I.Position = UDim2.new(0.05, 0, 0, y+22); I.BackgroundColor3 = Color3.fromRGB(30, 30, 40); I.PlaceholderText = placeholder; I.Text = ""; I.TextColor3 = Color3.new(1, 1, 1); I.Font = Enum.Font.Gotham; Instance.new("UICorner", I)
    return I
end
local DiscordID = AddInput("Input ID Discord", "Input Here", 90)
local WebhookURL = AddInput("Webhook URL", "Input Here", 155)

local function AddFilter(label, y, isSearch)
    local F = Instance.new("Frame", WebhookPage); F.Size = UDim2.new(0.9, 0, 0, 35); F.Position = UDim2.new(0.05, 0, 0, y); F.BackgroundTransparency = 1
    local L = Instance.new("TextLabel", F); L.Text = label; L.Size = UDim2.new(0.4, 0, 1, 0); L.Font = Enum.Font.Gotham; L.TextColor3 = Color3.new(1, 1, 1); L.TextXAlignment = 0; L.BackgroundTransparency = 1
    local B = Instance.new("TextButton", F); B.Text = "Select Options"; B.Position = UDim2.new(0.4, 0, 0, 0); B.Size = UDim2.new(0.6, 0, 1, 0); B.BackgroundColor3 = Color3.fromRGB(35, 35, 45); B.TextColor3 = Color3.fromRGB(200, 200, 200); B.Font = Enum.Font.Gotham; Instance.new("UICorner", B)
    if isSearch then B.MouseButton1Click:Connect(function() SearchMenu.Visible = not SearchMenu.Visible end) end
end
AddFilter("Tier Filter", 220, true)
AddFilter("Variant Filter", 260, false)
AddFilter("Name Filter", 300, false)

local function AddToggle(label, y)
    local F = Instance.new("Frame", WebhookPage); F.Size = UDim2.new(0.9, 0, 0, 35); F.Position = UDim2.new(0.05, 0, 0, y); F.BackgroundTransparency = 1
    local L = Instance.new("TextLabel", F); L.Text = label; L.Size = UDim2.new(0.7, 0, 1, 0); L.Font = Enum.Font.Gotham; L.TextColor3 = Color3.new(1, 1, 1); L.TextXAlignment = 0; L.BackgroundTransparency = 1
    local BG = Instance.new("TextButton", F); BG.Size = UDim2.new(0, 45, 0, 22); BG.Position = UDim2.new(1, -45, 0.5, -11); BG.BackgroundColor3 = Color3.fromRGB(45, 45, 55); BG.Text = ""; Instance.new("UICorner", BG).CornerRadius = UDim.new(1, 0)
    local T = Instance.new("Frame", BG); T.Size = UDim2.new(0, 18, 0, 18); T.Position = UDim2.new(0, 2, 0.5, -9); T.BackgroundColor3 = Color3.new(1, 1, 1); Instance.new("UICorner", T).CornerRadius = UDim.new(1, 0)
    local S = Instance.new("TextLabel", F); S.Text = "Off"; S.Position = UDim2.new(1, -80, 0, 0); S.Size = UDim2.new(0, 30, 1, 0); S.TextColor3 = Color3.new(1,1,1); S.BackgroundTransparency = 1
    BG.MouseButton1Click:Connect(function() 
        local state = S.Text == "Off"; S.Text = state and "On" or "Off"
        BG.BackgroundColor3 = state and Color3.fromRGB(255, 50, 150) or Color3.fromRGB(45, 45, 55)
        TweenService:Create(T, TweenInfo.new(0.2), {Position = state and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)}):Play()
    end)
end
AddToggle("Send Fish Webhook", 340)

local TestBtn = Instance.new("TextButton", WebhookPage); TestBtn.Size = UDim2.new(0.9, 0, 0, 35); TestBtn.Position = UDim2.new(0.05, 0, 0, 385); TestBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55); TestBtn.Text = "Test Webhook Connection"; TestBtn.TextColor3 = Color3.new(1, 1, 1); B.Font = Enum.Font.Gotham; Instance.new("UICorner", TestBtn)

-- [[ 5. FUNCTION: TEST WEBHOOK TO DISCORD ]]
TestBtn.MouseButton1Click:Connect(function()
    local url = WebhookURL.Text
    if url ~= "" and url:find("discord.com/api/webhooks") then
        local data = {
            ["content"] = "Ding dongggg! Webhook is connected :3",
            ["embeds"] = {{
                ["image"] = { ["url"] = "https://raw.githubusercontent.com/MaxmunZ/Stellar-Assets/main/HelloChat.png" },
                ["color"] = tonumber(0x00A2FF)
            }}
        }
        local success, err = pcall(function()
            HttpService:PostAsync(url, HttpService:JSONEncode(data))
        end)
        if not success then warn("Webhook Error: " .. err) end
    else
        warn("Silakan masukkan URL Webhook yang valid!")
    end
end)

-- [[ 6. TAB NAVIGATION ]]
local function ShowPage(name)
    for k, v in pairs(Pages) do v.Visible = (k == name) end
    for k, v in pairs(TabButtons) do
        v.BackgroundColor3 = (k == name) and Color3.fromRGB(255, 50, 150) or Color3.fromRGB(35, 35, 45)
    end
end

local tabs = {"Info", "Fishing", "Automatically", "Menu", "Quest", "Webhook", "Config"}
for _, name in pairs(tabs) do
    if not Pages[name] then CreatePage(name, false) end
    local B = Instance.new("TextButton", Sidebar); B.Size = UDim2.new(1, 0, 0, 32); B.BackgroundColor3 = Color3.fromRGB(35, 35, 45); B.Text = "|| " .. name; B.TextColor3 = Color3.fromRGB(200, 200, 200); B.Font = Enum.Font.Gotham; B.TextXAlignment = 0; Instance.new("UICorner", B); Instance.new("UIPadding", B).PaddingLeft = UDim.new(0, 10)
    TabButtons[name] = B; B.MouseButton1Click:Connect(function() ShowPage(name) end)
end

ShowPage("Info")
