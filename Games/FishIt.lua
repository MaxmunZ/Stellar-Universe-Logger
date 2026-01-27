-- [[ STELLAR SYSTEM FINAL - RE-FIXED VERSION ]]
-- Developer: Luc Aetheryn
-- Fix: GitHub Assets, Window Controls, Precision Webhook & Discord Test

local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")

-- [[ FUNGSI ASSET GITHUB ]]
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

-- [[ SEARCH MENU ]]
local SearchMenu = Instance.new("Frame", ScreenGui)
SearchMenu.Size = UDim2.fromOffset(180, 240); SearchMenu.Position = UDim2.new(0.5, 260, 0.5, -120)
SearchMenu.BackgroundColor3 = Color3.fromRGB(35, 35, 45); SearchMenu.Visible = false
local SStroke = Instance.new("UIStroke", SearchMenu); SStroke.Color = Color3.fromRGB(255, 50, 150); SStroke.Thickness = 2
Instance.new("UICorner", SearchMenu)

local SList = Instance.new("ScrollingFrame", SearchMenu); SList.Size = UDim2.new(1, 0, 1, -10); SList.BackgroundTransparency = 1; SList.ScrollBarThickness = 0
Instance.new("UIListLayout", SList)
for _, t in pairs({"Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic", "Secret"}) do
    local b = Instance.new("TextButton", SList); b.Size = UDim2.new(1, 0, 0, 30); b.Text = t; b.BackgroundColor3 = Color3.fromRGB(35, 35, 45); b.TextColor3 = Color3.new(1,1,1); b.Font = Enum.Font.Gotham; b.BorderSizePixel = 0
    b.MouseButton1Click:Connect(function() SearchMenu.Visible = false end)
end

-- [[ MAIN FRAME ]]
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.fromOffset(500, 320); Main.Position = UDim2.new(0.5, -250, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 35); Main.Active = true; Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 8)

-- [[ HEADER & WINDOW CONTROLS ]]
local Header = Instance.new("Frame", Main); Header.Size = UDim2.new(1, 0, 0, 40); Header.BackgroundTransparency = 1
local Icon = Instance.new("ImageLabel", Header); Icon.Size = UDim2.fromOffset(25, 25); Icon.Position = UDim2.new(0, 15, 0.5, -12); Icon.Image = LogoStellar; Icon.BackgroundTransparency = 1
local Title = Instance.new("TextLabel", Header); Title.Text = "Stellar System | Fish It"; Title.Position = UDim2.new(0, 50, 0, 0); Title.Size = UDim2.new(0, 200, 1, 0); Title.TextColor3 = Color3.new(1, 1, 1); Title.Font = Enum.Font.GothamBold; Title.TextXAlignment = 0; Title.BackgroundTransparency = 1

local CloseBtn = Instance.new("TextButton", Header); CloseBtn.Text = "X"; CloseBtn.Size = UDim2.fromOffset(30, 30); CloseBtn.Position = UDim2.new(1, -40, 0.5, -15); CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50); CloseBtn.TextColor3 = Color3.new(1, 1, 1); CloseBtn.Font = Enum.Font.GothamBold; Instance.new("UICorner", CloseBtn)
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

local MiniBtn = Instance.new("TextButton", Header); MiniBtn.Text = "-"; MiniBtn.Size = UDim2.fromOffset(30, 30); MiniBtn.Position = UDim2.new(1, -80, 0.5, -15); MiniBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55); MiniBtn.TextColor3 = Color3.new(1, 1, 1); MiniBtn.Font = Enum.Font.GothamBold; Instance.new("UICorner", MiniBtn)

-- [[ SIDEBAR & CONTAINER ]]
local Container = Instance.new("Frame", Main); Container.Position = UDim2.new(0, 170, 0, 50); Container.Size = UDim2.new(1, -180, 1, -65); Container.BackgroundColor3 = Color3.fromRGB(20, 20, 28); Instance.new("UICorner", Container)
local Sidebar = Instance.new("Frame", Main); Sidebar.Position = UDim2.new(0, 10, 0, 50); Sidebar.Size = UDim2.new(0, 150, 1, -65); Sidebar.BackgroundTransparency = 1; Instance.new("UIListLayout", Sidebar).Padding = UDim.new(0, 5)

local Pages = {}
local TabButtons = {}

local function CreatePage(name, scrollable)
    local Page = scrollable and Instance.new("ScrollingFrame", Container) or Instance.new("Frame", Container)
    Page.Size = UDim2.new(1, 0, 1, 0); Page.BackgroundTransparency = 1; Page.Visible = false
    if scrollable then Page.ScrollBarThickness = 2; Page.CanvasSize = UDim2.new(0, 0, 0, 500); Page.ScrollBarImageColor3 = Color3.fromRGB(255, 50, 150) end
    Pages[name] = Page; return Page
end

-- [[ PAGE: INFO ]]
local InfoPage = CreatePage("Info", false)
local HubTitle = Instance.new("TextLabel", InfoPage); HubTitle.Text = "-- Stellar System Hub --"; HubTitle.Size = UDim2.new(1, 0, 0, 45); HubTitle.Font = Enum.Font.GothamBold; HubTitle.TextColor3 = Color3.new(1, 1, 1); HubTitle.BackgroundTransparency = 1

local function AddInfoRow(lbl, val, y)
    local F = Instance.new("Frame", InfoPage); F.BackgroundTransparency = 1; F.Size = UDim2.new(0.9, 0, 0, 20); F.Position = UDim2.new(0.05, 0, y, 0)
    local L = Instance.new("TextLabel", F); L.Text = lbl; L.Size = UDim2.new(0.4, 0, 1, 0); L.TextColor3 = Color3.new(0.8,0.8,0.8); L.TextXAlignment = 0; L.BackgroundTransparency = 1; L.Font = Enum.Font.Gotham
    local V = Instance.new("TextLabel", F); V.Text = ":  "..val; V.Position = UDim2.new(0.4, 0, 0, 0); V.Size = UDim2.new(0.6, 0, 1, 0); V.TextColor3 = Color3.new(0.8,0.8,0.8); V.TextXAlignment = 0; V.BackgroundTransparency = 1; V.Font = Enum.Font.Gotham
end
AddInfoRow("Version", "V1.0.0 [BETA]", 0.2); AddInfoRow("Owner", "Luc Aetheryn", 0.3); AddInfoRow("Status", "Undetected", 0.4); AddInfoRow("Last Update", "Jan 27, 2026", 0.5)

-- [[ PAGE: WEBHOOK ]]
local WebhookPage = CreatePage("Webhook", true)
local WhTitle = Instance.new("TextLabel", WebhookPage); WhTitle.Text = "Webhook"; WhTitle.Size = UDim2.new(1, 0, 0, 40); WhTitle.Font = Enum.Font.GothamBold; WhTitle.TextColor3 = Color3.new(1,1,1); WhTitle.BackgroundTransparency = 1

local WhDrop = Instance.new("TextButton", WebhookPage); WhDrop.Size = UDim2.new(0.9, 0, 0, 35); WhDrop.Position = UDim2.new(0.05, 0, 0, 45); WhDrop.BackgroundColor3 = Color3.fromRGB(35, 35, 45); WhDrop.Text = "Webhook Fish Caught"; WhDrop.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", WhDrop)

local function AddInput(lbl, y)
    local L = Instance.new("TextLabel", WebhookPage); L.Text = lbl; L.Size = UDim2.new(0.9, 0, 0, 20); L.Position = UDim2.new(0.05, 0, 0, y); L.TextColor3 = Color3.new(1,1,1); L.TextXAlignment = 0; L.BackgroundTransparency = 1
    local I = Instance.new("TextBox", WebhookPage); I.Size = UDim2.new(0.9, 0, 0, 35); I.Position = UDim2.new(0.05, 0, 0, y+22); I.BackgroundColor3 = Color3.fromRGB(30, 30, 40); I.PlaceholderText = "Input Here"; I.Text = ""; I.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", I)
    return I
end
local WebhookURL = AddInput("Webhook URL", 95)

local function AddFilter(lbl, y, search)
    local F = Instance.new("Frame", WebhookPage); F.Size = UDim2.new(0.9, 0, 0, 35); F.Position = UDim2.new(0.05, 0, 0, y); F.BackgroundTransparency = 1
    local L = Instance.new("TextLabel", F); L.Text = lbl; L.Size = UDim2.new(0.4, 0, 1, 0); L.TextColor3 = Color3.new(1,1,1); L.TextXAlignment = 0; L.BackgroundTransparency = 1
    local B = Instance.new("TextButton", F); B.Text = "Select Options"; B.Position = UDim2.new(0.4, 0, 0, 0); B.Size = UDim2.new(0.6, 0, 1, 0); B.BackgroundColor3 = Color3.fromRGB(35, 35, 45); B.TextColor3 = Color3.fromRGB(200, 200, 200); Instance.new("UICorner", B)
    if search then B.MouseButton1Click:Connect(function() SearchMenu.Visible = not SearchMenu.Visible end) end
end
AddFilter("Tier Filter", 165, true); AddFilter("Variant Filter", 205, false)

local function AddToggle(lbl, y)
    local F = Instance.new("Frame", WebhookPage); F.Size = UDim2.new(0.9, 0, 0, 35); F.Position = UDim2.new(0.05, 0, 0, y); F.BackgroundTransparency = 1
    local L = Instance.new("TextLabel", F); L.Text = lbl; L.Size = UDim2.new(0.7, 0, 1, 0); L.TextColor3 = Color3.new(1,1,1); L.TextXAlignment = 0; L.BackgroundTransparency = 1
    local BG = Instance.new("TextButton", F); BG.Size = UDim2.fromOffset(45, 22); BG.Position = UDim2.new(1, -45, 0.5, -11); BG.BackgroundColor3 = Color3.fromRGB(45, 45, 55); BG.Text = ""; Instance.new("UICorner", BG).CornerRadius = UDim.new(1, 0)
    local T = Instance.new("Frame", BG); T.Size = UDim2.fromOffset(18, 18); T.Position = UDim2.new(0, 2, 0.5, -9); T.BackgroundColor3 = Color3.new(1,1,1); Instance.new("UICorner", T).CornerRadius = UDim.new(1, 0)
    BG.MouseButton1Click:Connect(function() local s = BG.BackgroundColor3 == Color3.fromRGB(45, 45, 55); BG.BackgroundColor3 = s and Color3.fromRGB(255, 50, 150) or Color3.fromRGB(45, 45, 55); TweenService:Create(T, TweenInfo.new(0.2), {Position = s and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)}):Play() end)
end
AddToggle("Send Fish Webhook", 245)

local TestBtn = Instance.new("TextButton", WebhookPage); TestBtn.Size = UDim2.new(0.9, 0, 0, 35); TestBtn.Position = UDim2.new(0.05, 0, 0, 290); TestBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55); TestBtn.Text = "Tests Webhook Connection"; TestBtn.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", TestBtn)
TestBtn.MouseButton1Click:Connect(function()
    local data = {["content"] = "Ding dongggg! Webhook is connected :3", ["embeds"] = {{["image"] = {["url"] = "https://raw.githubusercontent.com/MaxmunZ/Stellar-Assets/main/HelloChat.png"}, ["color"] = 41727}}}
    pcall(function() HttpService:PostAsync(WebhookURL.Text, HttpService:JSONEncode(data)) end)
end)

-- [[ TAB NAVIGATION ]]
local function ShowPage(name)
    for k, v in pairs(Pages) do v.Visible = (k == name) end
    for k, v in pairs(TabButtons) do v.BackgroundColor3 = (k == name) and Color3.fromRGB(255, 50, 150) or Color3.fromRGB(35, 35, 45) end
end

for _, name in pairs({"Info", "Fishing", "Automatically", "Menu", "Quest", "Webhook", "Config"}) do
    local B = Instance.new("TextButton", Sidebar); B.Size = UDim2.new(1, 0, 0, 32); B.BackgroundColor3 = Color3.fromRGB(35, 35, 45); B.Text = "|| " .. name; B.TextColor3 = Color3.new(0.8,0.8,0.8); B.Font = Enum.Font.Gotham; B.TextXAlignment = 0; Instance.new("UICorner", B); Instance.new("UIPadding", B).PaddingLeft = UDim.new(0, 10)
    TabButtons[name] = B; B.MouseButton1Click:Connect(function() ShowPage(name) end)
end
ShowPage("Info")
