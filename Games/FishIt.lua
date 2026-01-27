-- [[ STELLAR SYSTEM FINAL UI - GITHUB ASSETS VERSION ]]
-- Developer: Luc Aetheryn
-- Precision Alignment & Clean UI

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

-- Menghapus UI lama
if CoreGui:FindFirstChild("StellarFinal") then 
    CoreGui.StellarFinal:Destroy() 
end

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

-- TOP BAR (Header)
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundTransparency = 1

local TitleLogo = Instance.new("ImageLabel", Header)
TitleLogo.Size = UDim2.fromOffset(20, 20)
TitleLogo.Position = UDim2.new(0, 12, 0.5, -10)
TitleLogo.Image = "rbxassetid://133361483813672" -- ID Logo Stellarmu
TitleLogo.BackgroundTransparency = 1

local Title = Instance.new("TextLabel", Header)
Title.Text = "Stellar System | Fish It"
Title.Font = Enum.Font.GothamMedium
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 15
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Position = UDim2.new(0, 40, 0, 0)
Title.Size = UDim2.new(1, -40, 1, 0)
Title.BackgroundTransparency = 1

-- SIDEBAR (Navigasi Kiri)
local Sidebar = Instance.new("Frame", Main)
Sidebar.Position = UDim2.new(0, 10, 0, 50)
Sidebar.Size = UDim2.new(0, 150, 1, -60)
Sidebar.BackgroundTransparency = 1

local UIList = Instance.new("UIListLayout", Sidebar)
UIList.Padding = UDim.new(0, 6)

-- Pembuatan Tombol Sidebar Manual agar Urutan Terjaga
local function AddSidebarBtn(name)
    local B = Instance.new("TextButton", Sidebar)
    B.Size = UDim2.new(1, 0, 0, 32)
    B.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    B.Text = "|| " .. name
    B.TextColor3 = Color3.fromRGB(200, 200, 200)
    B.Font = Enum.Font.Gotham
    B.TextSize = 13
    B.TextXAlignment = Enum.TextXAlignment.Left
    B.BorderSizePixel = 0
    Instance.new("UICorner", B).CornerRadius = UDim.new(0, 4)
    local P = Instance.new("UIPadding", B)
    P.PaddingLeft = UDim.new(0, 10)
    return B
end

AddSidebarBtn("Info")
AddSidebarBtn("Fishing")
AddSidebarBtn("Automatically")
AddSidebarBtn("Menu")
AddSidebarBtn("Quest")
AddSidebarBtn("Webhook")
AddSidebarBtn("Config")

-- CONTENT AREA (Box Kanan)
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

-- BAGIAN INFO (REVISI SEJAJAR)
local InfoLabel = Instance.new("TextLabel", Content)
InfoLabel.Text = "Info"
InfoLabel.Position = UDim2.new(0.05, 0, 0.15, 0)
InfoLabel.Size = UDim2.new(0.9, 0, 0, 20)
InfoLabel.Font = Enum.Font.GothamBold
InfoLabel.TextSize = 14
InfoLabel.TextColor3 = Color3.new(1, 1, 1)
InfoLabel.TextXAlignment = Enum.TextXAlignment.Left
InfoLabel.BackgroundTransparency = 1

-- Baris Data (Version, Owner, Status, Update)
local function CreateRow(txt, val, y)
    local F = Instance.new("Frame", Content)
    F.BackgroundTransparency = 1
    F.Size = UDim2.new(0.9, 0, 0, 18)
    F.Position = UDim2.new(0.05, 0, y, 0)
    
    local L = Instance.new("TextLabel", F)
    L.Text = txt
    L.Size = UDim2.new(0, 80, 1, 0)
    L.Font = Enum.Font.Gotham
    L.TextSize = 13
    L.TextColor3 = Color3.fromRGB(220, 220, 220)
    L.TextXAlignment = Enum.TextXAlignment.Left
    L.BackgroundTransparency = 1
    
    local V = Instance.new("TextLabel", F)
    V.Text = ":  " .. val
    V.Position = UDim2.new(0, 80, 0, 0)
    V.Size = UDim2.new(1, -80, 1, 0)
    V.Font = Enum.Font.Gotham
    V.TextSize = 13
    V.TextColor3 = Color3.fromRGB(220, 220, 220)
    V.TextXAlignment = Enum.TextXAlignment.Left
    V.BackgroundTransparency = 1
end

CreateRow("Version", "V1.0.0 [BETA]", 0.22)
CreateRow("Owner", "Luc Aetheryn", 0.29)
CreateRow("Status", "Undetected", 0.36)
CreateRow("Last Update", "Tuesday, January 27, 2026", 0.43)

-- GRADIENT LINE
local Line = Instance.new("Frame", Content)
Line.Position = UDim2.new(0.05, 0, 0.52, 0)
Line.Size = UDim2.new(0.9, 0, 0, 3)
Line.BorderSizePixel = 0
local G = Instance.new("UIGradient", Line)
G.Color = ColorSequence.new(Color3.fromRGB(255, 50, 150), Color3.fromRGB(120, 20, 150))

-- DISCORD BOX
local DBox = Instance.new("Frame", Content)
DBox.Position = UDim2.new(0.05, 0, 0.58, 0)
DBox.Size = UDim2.new(0.9, 0, 0, 55)
DBox.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
Instance.new("UICorner", DBox).CornerRadius = UDim.new(0, 4)

local DIcon = Instance.new("ImageLabel", DBox)
DIcon.Size = UDim2.fromOffset(30, 30)
DIcon.Position = UDim2.new(0, 12, 0.5, -15)
DIcon.Image = "rbxassetid://100344740949293" -- Logo Discordmu
DIcon.BackgroundTransparency = 1

local DName = Instance.new("TextLabel", DBox)
DName.Text = "Stellar Discord"
DName.Position = UDim2.new(0, 52, 0.2, 0)
DName.Size = UDim2.new(1, -60, 0.3, 0)
DName.Font = Enum.Font.GothamBold
DName.TextSize = 14
DName.TextColor3 = Color3.new(1, 1, 1)
DName.TextXAlignment = Enum.TextXAlignment.Left
DName.BackgroundTransparency = 1

local DSub = Instance.new("TextLabel", DBox)
DSub.Text = "Official Link Discord Server"
DSub.Position = UDim2.new(0, 52, 0.5, 0)
DSub.Size = UDim2.new(1, -60, 0.3, 0)
DSub.Font = Enum.Font.Gotham -- REVISI: NO BOLD
DSub.TextSize = 12
DSub.TextColor3 = Color3.fromRGB(200, 200, 200)
DSub.TextXAlignment = Enum.TextXAlignment.Left
DSub.BackgroundTransparency = 1

-- COPY BUTTON
local Copy = Instance.new("TextButton", Content)
Copy.Position = UDim2.new(0.05, 0, 0.8, 0)
Copy.Size = UDim2.new(0.9, 0, 0, 32)
Copy.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
Copy.Text = "Copy Link Discord"
Copy.Font = Enum.Font.Gotham
Copy.TextSize = 13
Copy.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", Copy).CornerRadius = UDim.new(0, 4)

Copy.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/QEhHc6UBHH")
    Copy.Text = "Copied!"
    task.wait(2)
    Copy.Text = "Copy Link Discord"
end)
