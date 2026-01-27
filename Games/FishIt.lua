-- [[ STELLAR SYSTEM HUB - FINAL REPAIR ]]
-- Developer: Luc Aetheryn
-- Last Fix: Alignment & Visibility Restoration

local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("StellarFinal") then CoreGui.StellarFinal:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "StellarFinal"

-- FRAME UTAMA
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.fromOffset(500, 320)
Main.Position = UDim2.new(0.5, -250, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 6)

-- TOP BAR (Logo & Title)
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundTransparency = 1

local TitleLogo = Instance.new("ImageLabel", Header)
TitleLogo.Size = UDim2.fromOffset(22, 22)
TitleLogo.Position = UDim2.new(0, 12, 0.5, -11)
TitleLogo.Image = "rbxassetid://133361483813672" -- Asset ID Logo 
TitleLogo.BackgroundTransparency = 1

local TitleText = Instance.new("TextLabel", Header)
TitleText.Text = "Stellar System | Fish It"
TitleText.Position = UDim2.new(0, 42, 0, 0)
TitleText.Size = UDim2.new(1, -42, 1, 0)
TitleText.Font = Enum.Font.GothamMedium
TitleText.TextColor3 = Color3.new(1, 1, 1)
TitleText.TextSize = 14
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.BackgroundTransparency = 1

-- SIDEBAR (Menu Buttons)
local Sidebar = Instance.new("Frame", Main)
Sidebar.Position = UDim2.new(0, 10, 0, 50)
Sidebar.Size = UDim2.new(0, 150, 1, -60)
Sidebar.BackgroundTransparency = 1

local UIListLayout = Instance.new("UIListLayout", Sidebar)
UIListLayout.Padding = UDim.new(0, 6)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

local function CreateTab(name, order)
    local Btn = Instance.new("TextButton", Sidebar)
    Btn.Size = UDim2.new(1, 0, 0, 32)
    Btn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    Btn.Text = "  || " .. name
    Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 13
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Btn.LayoutOrder = order
    Btn.BorderSizePixel = 0
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 4)
end

local Tabs = {"Info", "Fishing", "Automatically", "Menu", "Quest", "Webhook", "Config"}
for i, tabName in pairs(Tabs) do CreateTab(tabName, i) end

-- MAIN CONTENT BOX (The fix for visibility)
local Content = Instance.new("Frame", Main)
Content.Position = UDim2.new(0, 170, 0, 50)
Content.Size = UDim2.new(1, -180, 1, -60)
Content.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 6)

local HubTitle = Instance.new("TextLabel", Content)
HubTitle.Text = "-- Stellar System Hub --"
HubTitle.Size = UDim2.new(1, 0, 0, 45)
HubTitle.Font = Enum.Font.GothamBold
HubTitle.TextSize = 18
HubTitle.TextColor3 = Color3.new(1, 1, 1)
HubTitle.BackgroundTransparency = 1

-- INFO SECTION (Fixed Alignment)
local InfoContainer = Instance.new("Frame", Content)
InfoContainer.Size = UDim2.new(0.9, 0, 0.4, 0)
InfoContainer.Position = UDim2.new(0.05, 0, 0.15, 0)
InfoContainer.BackgroundTransparency = 1

local function AddInfo(label, val, y)
    local Row = Instance.new("Frame", InfoContainer)
    Row.Size = UDim2.new(1, 0, 0, 18)
    Row.Position = UDim2.new(0, 0, y, 0)
    Row.BackgroundTransparency = 1
    
    local L = Instance.new("TextLabel", Row)
    L.Text = label
    L.Size = UDim2.new(0, 80, 1, 0)
    L.Font = Enum.Font.GothamBold
    L.TextColor3 = Color3.new(1, 1, 1)
    L.TextSize = 13
    L.TextXAlignment = Enum.TextXAlignment.Left
    L.BackgroundTransparency = 1
    
    local V = Instance.new("TextLabel", Row)
    V.Text = ":  " .. val
    V.Position = UDim2.new(0, 80, 0, 0)
    V.Size = UDim2.new(1, -80, 1, 0)
    V.Font = Enum.Font.Gotham
    V.TextColor3 = Color3.fromRGB(220, 220, 220)
    V.TextSize = 13
    V.TextXAlignment = Enum.TextXAlignment.Left
    V.BackgroundTransparency = 1
end

AddInfo("Info", "", 0)
AddInfo("Version", "V1.0.0 [BETA]", 0.2)
AddInfo("Owner", "Luc Aetheryn", 0.4)
AddInfo("Status", "Undetected", 0.6)
AddInfo("Last Update", "Tuesday, Jan 27, 2026", 0.8)

-- GRADIENT LINE
local Line = Instance.new("Frame", Content)
Line.Position = UDim2.new(0.05, 0, 0.55, 0)
Line.Size = UDim2.new(0.9, 0, 0, 2)
Line.BorderSizePixel = 0
local G = Instance.new("UIGradient", Line)
G.Color = ColorSequence.new(Color3.fromRGB(255, 50, 150), Color3.fromRGB(100, 20, 150))

-- DISCORD SECTION (Fixed Text Weight)
local DiscordFrame = Instance.new("Frame", Content)
DiscordFrame.Size = UDim2.new(0.9, 0, 0, 50)
DiscordFrame.Position = UDim2.new(0.05, 0, 0.62, 0)
DiscordFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
Instance.new("UICorner", DiscordFrame)

local DIcon = Instance.new("ImageLabel", DiscordFrame)
DIcon.Size = UDim2.fromOffset(30, 30)
DIcon.Position = UDim2.new(0, 10, 0.5, -15)
DIcon.Image = "rbxassetid://100344740949293" -- ID Logo Discord
DIcon.BackgroundTransparency = 1

local DTitle = Instance.new("TextLabel", DiscordFrame)
DTitle.Text = "Stellar Discord"
DTitle.Position = UDim2.new(0, 50, 0.15, 0)
DTitle.Size = UDim2.new(1, -60, 0.4, 0)
DTitle.Font = Enum.Font.GothamBold
DTitle.TextColor3 = Color3.new(1, 1, 1)
DTitle.TextSize = 14
DTitle.TextXAlignment = Enum.TextXAlignment.Left
DTitle.BackgroundTransparency = 1

local DSub = Instance.new("TextLabel", DiscordFrame)
DSub.Text = "Official Link Discord Server"
DSub.Position = UDim2.new(0, 50, 0.5, 0)
DSub.Size = UDim2.new(1, -60, 0.4, 0)
DSub.Font = Enum.Font.Gotham
DSub.TextColor3 = Color3.fromRGB(180, 180, 180)
DSub.TextSize = 11
DSub.TextXAlignment = Enum.TextXAlignment.Left
DSub.BackgroundTransparency = 1

-- COPY BUTTON
local CopyBtn = Instance.new("TextButton", Content)
CopyBtn.Size = UDim2.new(0.9, 0, 0, 30)
CopyBtn.Position = UDim2.new(0.05, 0, 0.82, 0)
CopyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
CopyBtn.Text = "Copy Link Discord"
CopyBtn.Font = Enum.Font.Gotham
CopyBtn.TextColor3 = Color3.new(1, 1, 1)
CopyBtn.TextSize = 13
Instance.new("UICorner", CopyBtn)

CopyBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/QEhHc6UBHH")
    CopyBtn.Text = "Copied!"
    task.wait(2)
    CopyBtn.Text = "Copy Link Discord"
end)
