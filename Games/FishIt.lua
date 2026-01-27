-- [[ STELLAR SYSTEM FINAL UI - GITHUB ASSETS VERSION ]]
-- Developer: Luc Aetheryn
-- Precision Alignment & Clean UI

local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")

-- Fungsi khusus untuk menangani Gambar dari GitHub di Delta
local function GetStellarAsset(fileName, url)
    if not isfile(fileName) then
        local success, result = pcall(function()
            return game:HttpGet(url)
        end)
        if success then
            writefile(fileName, result)
        end
    end
    return getcustomasset(fileName)
end

-- Persiapan Asset Logo
local LogoStellar = GetStellarAsset("StellarLogo.jpg", "https://raw.githubusercontent.com/MaxmunZ/Stellar-Assets/refs/heads/main/Stellar%20System.jpg")
local LogoDiscord = GetStellarAsset("DiscordLogo.jpg", "https://raw.githubusercontent.com/MaxmunZ/Stellar-Assets/refs/heads/main/Discord.jpg")

-- Membersihkan UI lama
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

-- SIDEBAR (Navigasi Kiri)
local Sidebar = Instance.new("Frame", Main)
Sidebar.Position = UDim2.new(0, 10, 0, 50)
Sidebar.Size = UDim2.new(0, 150, 1, -60)
Sidebar.BackgroundTransparency = 1

local UIList = Instance.new("UIListLayout", Sidebar)
UIList.Padding = UDim.new(0, 6)

local function CreateTabBtn(name)
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
    Instance.new("UIPadding", B).PaddingLeft = UDim.new(0, 10)
end

-- Urutan Tab Sesuai Gambar
local tabs = {"Info", "Fishing", "Automatically", "Menu", "Quest", "Webhook", "Config"}
for _, t in pairs(tabs) do CreateTabBtn(t) end

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

-- BAGIAN INFO (PERAPIAN TEKS & TITIK DUA)
local function AddInfoRow(label, value, y)
    local F = Instance.new("Frame", Content)
    F.BackgroundTransparency = 1
    F.Size = UDim2.new(0.9, 0, 0, 18)
    F.Position = UDim2.new(0.05, 0, y, 0)
    
    local L = Instance.new("TextLabel", F)
    L.Text = label
    L.Size = UDim2.new(0, 85, 1, 0) -- Mengunci lebar agar ":" sejajar
    L.Font = Enum.Font.Gotham
    L.TextSize = 13
    L.TextColor3 = Color3.fromRGB(220, 220, 220)
    L.TextXAlignment = Enum.TextXAlignment.Left
    L.BackgroundTransparency = 1
    
    local V = Instance.new("TextLabel", F)
    V.Text = ":  " .. value
    V.Position = UDim2.new(0, 85, 0, 0)
    V.Size = UDim2.new(1, -85, 1, 0)
    V.Font = Enum.Font.Gotham
    V.TextSize = 13
    V.TextColor3 = Color3.fromRGB(220, 220, 220)
    V.TextXAlignment = Enum.TextXAlignment.Left
    V.BackgroundTransparency = 1
end

AddInfoRow("Version", "V1.0.0 [BETA]", 0.22)
AddInfoRow("Owner", "Luc Aetheryn", 0.29)
AddInfoRow("Status", "Undetected", 0.36)
AddInfoRow("Last Update", "Tuesday, January 27, 2026", 0.43)

-- GRADIENT LINE
local Line = Instance.new("Frame", Content)
Line.Position = UDim2.new(0.05, 0, 0.52, 0)
Line.Size = UDim2.new(0.9, 0, 0, 3)
Line.BorderSizePixel = 0
local G = Instance.new("UIGradient", Line)
G.Color = ColorSequence.new(Color3.fromRGB(255, 50, 150), Color3.fromRGB(120, 20, 150))

-- DISCORD SECTION
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
DName.TextSize = 14
DName.TextColor3 = Color3.new(1, 1, 1)
DName.TextXAlignment = Enum.TextXAlignment.Left
DName.BackgroundTransparency = 1

local DSub = Instance.new("TextLabel", DBox)
DSub.Text = "Official Link Discord Server"
DSub.Position = UDim2.new(0, 52, 0.5, 0)
DSub.Font = Enum.Font.Gotham -- REVISI: NO BOLD
DSub.TextSize = 12
DSub.TextColor3 = Color3.fromRGB(200, 200, 200)
DSub.TextXAlignment = Enum.TextXAlignment.Left
DSub.BackgroundTransparency = 1

-- COPY BUTTON
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
