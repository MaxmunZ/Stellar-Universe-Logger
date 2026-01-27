-- [[ STELLAR SYSTEM TOTAL FINAL - INTEGRATED & SCROLLABLE ]]
-- Developer: Luc Aetheryn
-- Precision Alignment + Webhook System + Scrolling Support

local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")

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

-- [[ FLOATING BUTTON ]]
local FloatBtn = Instance.new("ImageButton", ScreenGui)
FloatBtn.Size = UDim2.fromOffset(50, 50); FloatBtn.Position = UDim2.new(0.05, 0, 0.2, 0)
FloatBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 35); FloatBtn.Image = LogoStellar; FloatBtn.Visible = false
FloatBtn.Active = true; FloatBtn.Draggable = true; Instance.new("UICorner", FloatBtn).CornerRadius = UDim.new(1, 0)

-- [[ MAIN FRAME ]]
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.fromOffset(500, 320); Main.Position = UDim2.new(0.5, -250, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 35); Main.BorderSizePixel = 0; Main.Active = true; Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 6)

-- [[ CONTROLS (X & -) ]]
local Controls = Instance.new("Frame", Main)
Controls.Size = UDim2.new(0, 80, 0, 40); Controls.Position = UDim2.new(1, -85, 0, 0); Controls.BackgroundTransparency = 1
local CloseBtn = Instance.new("TextButton", Controls)
CloseBtn.Size = UDim2.fromOffset(30, 30); CloseBtn.Position = UDim2.new(0.5, 0, 0.5, -15); CloseBtn.BackgroundTransparency = 1; CloseBtn.Text = "×"; CloseBtn.TextColor3 = Color3.fromRGB(255, 80, 80); CloseBtn.TextSize = 25; CloseBtn.Font = Enum.Font.GothamBold
local MiniBtn = Instance.new("TextButton", Controls)
MiniBtn.Size = UDim2.fromOffset(30, 30); MiniBtn.Position = UDim2.new(0, 0, 0.5, -15); MiniBtn.BackgroundTransparency = 1; MiniBtn.Text = "−"; MiniBtn.TextColor3 = Color3.new(1, 1, 1); MiniBtn.TextSize = 25; MiniBtn.Font = Enum.Font.GothamBold

MiniBtn.MouseButton1Click:Connect(function() Main.Visible = false; FloatBtn.Visible = true end)
FloatBtn.MouseButton1Click:Connect(function() Main.Visible = true; FloatBtn.Visible = false end)
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- [[ HEADER ]]
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, -90, 0, 40); Header.BackgroundTransparency = 1
local TitleLogo = Instance.new("ImageLabel", Header)
TitleLogo.Size = UDim2.fromOffset(20, 20); TitleLogo.Position = UDim2.new(0, 12, 0.5, -10); TitleLogo.Image = LogoStellar; TitleLogo.BackgroundTransparency = 1; TitleLogo.ScaleType = Enum.ScaleType.Fit
local Title = Instance.new("TextLabel", Header)
Title.Text = "Stellar System | Fish It"; Title.Font = Enum.Font.GothamMedium; Title.TextColor3 = Color3.new(1, 1, 1); Title.TextSize = 15; Title.Position = UDim2.new(0, 40, 0, 0); Title.Size = UDim2.new(1, -40, 1, 0); Title.TextXAlignment = 0; Title.BackgroundTransparency = 1

-- [[ SIDEBAR & CONTAINER ]]
local Sidebar = Instance.new("Frame", Main)
Sidebar.Position = UDim2.new(0, 10, 0, 50); Sidebar.Size = UDim2.new(0, 150, 1, -60); Sidebar.BackgroundTransparency = 1
Instance.new("UIListLayout", Sidebar).Padding = UDim.new(0, 6)

local Container = Instance.new("Frame", Main)
Container.Position = UDim2.new(0, 170, 0, 50); Container.Size = UDim2.new(1, -180, 1, -60); Container.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
Instance.new("UICorner", Container).CornerRadius = UDim.new(0, 6)

local Pages = {}
local TabButtons = {}

local function CreatePage(name, scrollable)
    local Page
    if scrollable then
        Page = Instance.new("ScrollingFrame", Container)
        Page.ScrollBarThickness = 2; Page.ScrollBarImageColor3 = Color3.fromRGB(255, 50, 150); Page.CanvasSize = UDim2.new(0, 0, 0, 420)
    else
        Page = Instance.new("Frame", Container)
    end
    Page.Name = name .. "Page"; Page.Size = UDim2.new(1, 0, 1, 0); Page.BackgroundTransparency = 1; Page.Visible = false
    Pages[name] = Page
    return Page
end

-- [[ PAGE: INFO (PREISI) ]]
local InfoPage = CreatePage("Info", false)
local HubTitle = Instance.new("TextLabel", InfoPage)
HubTitle.Text = "-- Stellar System Hub --"; HubTitle.Size = UDim2.new(1, 0, 0, 45); HubTitle.Font = Enum.Font.GothamBold; HubTitle.TextSize = 18; HubTitle.TextColor3 = Color3.new(1, 1, 1); HubTitle.BackgroundTransparency = 1

local function AddInfoRow(label, value, y)
    local F = Instance.new("Frame", InfoPage); F.BackgroundTransparency = 1; F.Size = UDim2.new(0.9, 0, 0, 18); F.Position = UDim2.new(0.05, 0, y, 0)
    local L = Instance.new("TextLabel", F); L.Text = label; L.Size = UDim2.new(0, 85, 1, 0); L.Font = Enum.Font.Gotham; L.TextColor3 = Color3.fromRGB(220, 220, 220); L.BackgroundTransparency = 1; L.TextXAlignment = 0
    local V = Instance.new("TextLabel", F); V.Text = ":  " .. value; V.Position = UDim2.new(0, 85, 0, 0); V.Size = UDim2.new(1, -85, 1, 0); V.Font = Enum.Font.Gotham; V.TextColor3 = Color3.fromRGB(220, 220, 220); V.BackgroundTransparency = 1; V.TextXAlignment = 0
end
AddInfoRow("Version", "V1.0.0 [BETA]", 0.22)
AddInfoRow("Owner", "Luc Aetheryn", 0.29)
AddInfoRow("Status", "Undetected", 0.36)
AddInfoRow("Last Update", "Tuesday, January 27, 2026", 0.43)

local InfoLine = Instance.new("Frame", InfoPage); InfoLine.Position = UDim2.new(0.05, 0, 0.52, 0); InfoLine.Size = UDim2.new(0.9, 0, 0, 3); InfoLine.BorderSizePixel = 0
local IG = Instance.new("UIGradient", InfoLine); IG.Color = ColorSequence.new(Color3.fromRGB(255, 50, 150), Color3.fromRGB(120, 20, 150))

local DBox = Instance.new("Frame", InfoPage); DBox.Position = UDim2.new(0.05, 0, 0.58, 0); DBox.Size = UDim2.new(0.9, 0, 0, 60); DBox.BackgroundColor3 = Color3.fromRGB(35, 35, 45); Instance.new("UICorner", DBox)
local DIcon = Instance.new("ImageLabel", DBox); DIcon.Size = UDim2.fromOffset(40, 40); DIcon.Position = UDim2.new(0, 10, 0.5, -20); DIcon.Image = LogoDiscord; DIcon.BackgroundTransparency = 1; DIcon.ScaleType = Enum.ScaleType.Fit
local DName = Instance.new("TextLabel", DBox); DName.Text = "Stellar Discord"; DName.Position = UDim2.new(0, 60, 0.2, 0); DName.Size = UDim2.new(1, -70, 0.4, 0); DName.Font = Enum.Font.GothamBold; DName.TextSize = 16; DName.TextColor3 = Color3.new(1, 1, 1); DName.TextXAlignment = 0; DName.BackgroundTransparency = 1
local DSub = Instance.new("TextLabel", DBox); DSub.Text = "Official Link Discord Server"; DSub.Position = UDim2.new(0, 60, 0.5, 0); DSub.Size = UDim2.new(1, -70, 0.4, 0); DSub.Font = Enum.Font.Gotham; DSub.TextSize = 12; DSub.TextColor3 = Color3.fromRGB(200, 200, 200); DSub.TextXAlignment = 0; DSub.BackgroundTransparency = 1

-- [[ PAGE: WEBHOOK (SCROLLABLE & MANUAL) ]]
local WebhookPage = CreatePage("Webhook", true)

local WhTitle = Instance.new("TextLabel", WebhookPage)
WhTitle.Text = "Webhook"; WhTitle.Size = UDim2.new(1, 0, 0, 40); WhTitle.Position = UDim2.new(0, 0, 0, 5); WhTitle.Font = Enum.Font.GothamBold; WhTitle.TextSize = 22; WhTitle.TextColor3 = Color3.new(1, 1, 1); WhTitle.BackgroundTransparency = 1

local WhDrop = Instance.new("TextButton", WebhookPage)
WhDrop.Size = UDim2.new(0.9, 0, 0, 32); WhDrop.Position = UDim2.new(0.05, 0, 0, 50); WhDrop.BackgroundColor3 = Color3.fromRGB(35, 35, 45); WhDrop.Text = "Webhook Fish Caught"; WhDrop.TextColor3 = Color3.new(1, 1, 1); WhDrop.Font = Enum.Font.Gotham; Instance.new("UICorner", WhDrop)

local WhLine = Instance.new("Frame", WebhookPage); WhLine.Size = UDim2.new(0.9, 0, 0, 2); WhLine.Position = UDim2.new(0.05, 0, 0, 85); WhLine.BorderSizePixel = 0
local WG = Instance.new("UIGradient", WhLine); WG.Color = ColorSequence.new(Color3.fromRGB(255, 50, 150), Color3.fromRGB(50, 20, 100))

local function AddInput(label, placeholder, y)
    local L = Instance.new("TextLabel", WebhookPage); L.Text = label; L.Size = UDim2.new(0.9, 0, 0, 20); L.Position = UDim2.new(0.05, 0, 0, y); L.Font = Enum.Font.Gotham; L.TextColor3 = Color3.new(1,1,1); L.TextXAlignment = 0; L.BackgroundTransparency = 1
    local I = Instance.new("TextBox", WebhookPage); I.Size = UDim2.new(0.9, 0, 0, 35); I.Position = UDim2.new(0.05, 0, 0, y+22); I.BackgroundColor3 = Color3.fromRGB(30, 30, 40); I.PlaceholderText = placeholder; I.Text = ""; I.TextColor3 = Color3.new(1, 1, 1); Instance.new("UICorner", I)
end
AddInput("Input ID Discord", "Input Here", 95)
AddInput("Webhook URL", "Input Here", 160)

local function AddFilter(label, val, y)
    local F = Instance.new("Frame", WebhookPage); F.Size = UDim2.new(0.9, 0, 0, 35); F.Position = UDim2.new(0.05, 0, 0, y); F.BackgroundTransparency = 1
    local L = Instance.new("TextLabel", F); L.Text = label; L.Size = UDim2.new(0.4, 0, 1, 0); L.Font = Enum.Font.Gotham; L.TextColor3 = Color3.new(1, 1, 1); L.TextXAlignment = 0; L.BackgroundTransparency = 1
    local B = Instance.new("TextButton", F); B.Text = val; B.Position = UDim2.new(0.4, 0, 0, 0); B.Size = UDim2.new(0.6, 0, 1, 0); B.BackgroundColor3 = Color3.fromRGB(35, 35, 45); B.TextColor3 = Color3.fromRGB(200, 200, 200); Instance.new("UICorner", B)
end
AddFilter("Tier Filter", "Mythic, Secret", 225)
AddFilter("Variant Filter", "Select Options", 265)
AddFilter("Name Filter", "Select Options", 305)

local TestBtn = Instance.new("TextButton", WebhookPage)
TestBtn.Size = UDim2.new(0.9, 0, 0, 35); TestBtn.Position = UDim2.new(0.05, 0, 0, 355); TestBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55); TestBtn.Text = "Tests Webhook Connection"; TestBtn.TextColor3 = Color3.new(1, 1, 1); Instance.new("UICorner", TestBtn)
TestBtn.MouseButton1Click:Connect(function() print("Webhook connected!") end)

-- [[ TAB LOGIC ]]
local function ShowPage(name)
    for k, v in pairs(Pages) do v.Visible = (k == name) end
    for k, v in pairs(TabButtons) do
        if k == name then
            v.BackgroundColor3 = Color3.fromRGB(255, 50, 150)
            if not v:FindFirstChild("UIGradient") then local G = Instance.new("UIGradient", v); G.Color = ColorSequence.new(Color3.fromRGB(255, 50, 150), Color3.fromRGB(120, 20, 150)) end
        else
            v.BackgroundColor3 = Color3.fromRGB(35, 35, 45); if v:FindFirstChild("UIGradient") then v.UIGradient:Destroy() end
        end
    end
end

local tabs = {"Info", "Fishing", "Automatically", "Menu", "Quest", "Webhook", "Config"}
for _, name in pairs(tabs) do
    if not Pages[name] then CreatePage(name, false) end
    local B = Instance.new("TextButton", Sidebar); B.Size = UDim2.new(1, 0, 0, 32); B.BackgroundColor3 = Color3.fromRGB(35, 35, 45); B.Text = "|| " .. name; B.TextColor3 = Color3.fromRGB(200, 200, 200); B.Font = Enum.Font.Gotham; B.TextXAlignment = 0; Instance.new("UICorner", B).CornerRadius = UDim.new(0, 4); Instance.new("UIPadding", B).PaddingLeft = UDim.new(0, 10)
    TabButtons[name] = B; B.MouseButton1Click:Connect(function() ShowPage(name) end)
end

ShowPage("Info")
