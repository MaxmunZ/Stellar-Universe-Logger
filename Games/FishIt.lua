-- [[ STELLAR SYSTEM FINAL UI - GITHUB ASSETS VERSION ]]
-- Developer: Luc Aetheryn
-- Precision Alignment & Clean UI

local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")

-- Fungsi Download Asset dari GitHub khusus Delta/Mobile
local function GetStellarAsset(fileName, url)
    if not isfile(fileName) then
        local success, result = pcall(function() return game:HttpGet(url) end)
        if success then 
            writefile(fileName, result) 
        else
            return "rbxassetid://13543168532" -- Fallback jika link mati
        end
    end
    return getcustomasset(fileName)
end

-- Link Baru dari GitHub kamu
local LogoStellar = GetStellarAsset("StellarLogo_v2.png", "https://raw.githubusercontent.com/MaxmunZ/Stellar-Assets/refs/heads/main/Stellar%20System.png.jpg")
local LogoDiscord = GetStellarAsset("DiscordLogo_v2.png", "https://raw.githubusercontent.com/MaxmunZ/Stellar-Assets/refs/heads/main/Discord.png")

-- Membersihkan UI lama
if CoreGui:FindFirstChild("StellarFinal") then CoreGui.StellarFinal:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "StellarFinal"
ScreenGui.ResetOnSpawn = false

-- [[ FLOATING BUTTON (RESTORE) ]]
local FloatBtn = Instance.new("ImageButton", ScreenGui)
FloatBtn.Name = "FloatingButton"
FloatBtn.Size = UDim2.fromOffset(50, 50)
FloatBtn.Position = UDim2.new(0.05, 0, 0.2, 0)
FloatBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
FloatBtn.Image = LogoStellar
FloatBtn.Visible = false
FloatBtn.Active = true
FloatBtn.Draggable = true

local FloatCorner = Instance.new("UICorner", FloatBtn)
FloatCorner.CornerRadius = UDim.new(1, 0)

local FloatStroke = Instance.new("UIStroke", FloatBtn)
FloatStroke.Color = Color3.fromRGB(255, 50, 150)
FloatStroke.Thickness = 2

-- [[ FRAME UTAMA ]]
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.fromOffset(500, 320)
Main.Position = UDim2.new(0.5, -250, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 6)

-- [[ CONTROL BUTTONS ]]
local Controls = Instance.new("Frame", Main)
Controls.Size = UDim2.new(0, 80, 0, 40)
Controls.Position = UDim2.new(1, -85, 0, 0)
Controls.BackgroundTransparency = 1

local CloseBtn = Instance.new("TextButton", Controls)
CloseBtn.Size = UDim2.fromOffset(30, 30)
CloseBtn.Position = UDim2.new(0.5, 0, 0.5, -15)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
CloseBtn.TextSize = 25
CloseBtn.Font = Enum.Font.GothamBold

local MiniBtn = Instance.new("TextButton", Controls)
MiniBtn.Size = UDim2.fromOffset(30, 30)
MiniBtn.Position = UDim2.new(0, 0, 0.5, -15)
MiniBtn.BackgroundTransparency = 1
MiniBtn.Text = "−"
MiniBtn.TextColor3 = Color3.new(1, 1, 1)
MiniBtn.TextSize = 25
MiniBtn.Font = Enum.Font.GothamBold

MiniBtn.MouseButton1Click:Connect(function()
    Main.Visible = false
    FloatBtn.Visible = true
end)

FloatBtn.MouseButton1Click:Connect(function()
    Main.Visible = true
    FloatBtn.Visible = false
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- [[ HEADER ]]
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, -90, 0, 40)
Header.BackgroundTransparency = 1

local TitleLogo = Instance.new("ImageLabel", Header)
TitleLogo.Size = UDim2.fromOffset(20, 20)
TitleLogo.Position = UDim2.new(0, 12, 0.5, -10)
TitleLogo.Image = LogoStellar
TitleLogo.BackgroundTransparency = 1

local Title = Instance.new("TextLabel", Header)
Title.Text = "Stellar System | Fish It"
Title.Font = Enum.Font.GothamMedium
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 15
Title.Position = UDim2.new(0, 40, 0, 0)
Title.Size = UDim2.new(1, -40, 1, 0)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1

-- [[ SIDEBAR ]]
local Sidebar = Instance.new("Frame", Main)
Sidebar.Position = UDim2.new(0, 10, 0, 50)
Sidebar.Size = UDim2.new(0, 150, 1, -60)
Sidebar.BackgroundTransparency = 1

local UIList = Instance.new("UIListLayout", Sidebar)
UIList.Padding = UDim.new(0, 6)

local tabs = {"Info", "Fishing", "Automatically", "Menu", "Quest", "Webhook", "Config"}
for _, name in pairs(tabs) do
    local B = Instance.new("TextButton", Sidebar)
    B.Size = UDim2.new(1, 0, 0, 32)
    B.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    B.Text = "|| " .. name
    B.TextColor3 = Color3.fromRGB(200, 200, 200)
    B.Font = Enum.Font.Gotham
    B.TextSize = 13
    B.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", B).CornerRadius = UDim.new(0, 4)
    Instance.new("UIPadding", B).PaddingLeft = UDim.new(0, 10)
end

-- [[ CONTENT AREA ]]
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

-- [[ INFO ROW ALIGNMENT ]]
local function AddInfoRow(label, value, y)
    local F = Instance.new("Frame", Content)
    F.BackgroundTransparency = 1
    F.Size = UDim2.new(0.9, 0, 0, 18)
    F.Position = UDim2.new(0.05, 0, y, 0)
    
    local L = Instance.new("TextLabel", F)
    L.Text = label
    L.Size = UDim2.new(0, 85, 1, 0)
    L.Font = Enum.Font.Gotham
    L.TextColor3 = Color3.fromRGB(220, 220, 220)
    L.TextXAlignment = Enum.TextXAlignment.Left
    L.BackgroundTransparency = 1
    
    local V = Instance.new("TextLabel", F)
    V.Text = ":  " .. value
    V.Position = UDim2.new(0, 85, 0, 0)
    V.Size = UDim2.new(1, -85, 1, 0)
    V.Font = Enum.Font.Gotham
    V.TextColor3 = Color3.fromRGB(220, 220, 220)
    V.TextXAlignment = Enum.TextXAlignment.Left
    V.BackgroundTransparency = 1
end

AddInfoRow("Version", "V1.0.0 [BETA]", 0.22)
AddInfoRow("Owner", "Luc Aetheryn", 0.29)
AddInfoRow("Status", "Undetected", 0.36)
AddInfoRow("Last Update", "Tuesday, January 27, 2026", 0.43)

local Line = Instance.new("Frame", Content)
Line.Position = UDim2.new(0.05, 0, 0.52, 0)
Line.Size = UDim2.new(0.9, 0, 0, 3)
Line.BorderSizePixel = 0
local G = Instance.new("UIGradient", Line)
G.Color = ColorSequence.new(Color3.fromRGB(255, 50, 150), Color3.fromRGB(120, 20, 150))

-- [[ DISCORD SECTION ]]
local DBox = Instance.new("Frame", Content)
DBox.Position = UDim2.new(0.05, 0, 0.58, 0)
DBox.Size = UDim2.new(0.9, 0, 0, 55)
DBox.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
Instance.new("UICorner", DBox).CornerRadius = UDim.new(0, 4)

local DIcon = Instance.new("ImageLabel", DBox)
DIcon.Size = UDim2.fromOffset(30, 30)
DIcon.Position = UDim2.new(0, 12, 0.5, -15)
DIcon.Image = LogoDiscord
DIcon.BackgroundTransparency = 1

local DName = Instance.new("TextLabel", DBox)
DName.Text = "Stellar Discord"
DName.Position = UDim2.new(0, 52, 0.2, 0)
DName.Font = Enum.Font.GothamBold
DName.TextColor3 = Color3.new(1, 1, 1)
DName.TextXAlignment = Enum.TextXAlignment.Left
DName.BackgroundTransparency = 1

local DSub = Instance.new("TextLabel", DBox)
DSub.Text = "Official Link Discord Server"
DSub.Position = UDim2.new(0, 52, 0.5, 0)
DSub.Font = Enum.Font.Gotham
DSub.TextSize = 12
DSub.TextColor3 = Color3.fromRGB(200, 200, 200)
DSub.TextXAlignment = Enum.TextXAlignment.Left
DSub.BackgroundTransparency = 1

local CopyBtn = Instance.new("TextButton", Content)
CopyBtn.Position = UDim2.new(0.05, 0, 0.8, 0)
CopyBtn.Size = UDim2.new(0.9, 0, 0, 32)
CopyBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
CopyBtn.Text = "Copy Link Discord"
CopyBtn.Font = Enum.Font.Gotham
CopyBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", CopyBtn).CornerRadius = UDim.new(0, 4)

CopyBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/QEhHc6UBHH")
    CopyBtn.Text = "Copied!"
    task.wait(2)
    CopyBtn.Text = "Copy Link Discord"
end)
