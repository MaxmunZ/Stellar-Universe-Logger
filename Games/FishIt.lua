-- [[ STELLAR SYSTEM HUB - FULL FINAL VERSION + FLOATING BUTTON ]]
-- Developer: Luc Aetheryn
-- Fitur: Auto-Hide Floating, Bold Info Title, Status Color Logic

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

-- Membersihkan UI lama jika ada
if CoreGui:FindFirstChild("StellarFinal") then 
    CoreGui.StellarFinal:Destroy() 
end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "StellarFinal"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- [[ FLOATING OPEN BUTTON (Hanya muncul saat minimize) ]]
local FloatingBtn = Instance.new("TextButton", ScreenGui)
FloatingBtn.Name = "FloatingBtn"
FloatingBtn.Size = UDim2.fromOffset(50, 50)
FloatingBtn.Position = UDim2.new(0, 20, 0.5, -25) -- Di sisi kiri tengah
FloatingBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
FloatingBtn.BorderSizePixel = 0
FloatingBtn.Text = "" -- Kita gunakan logo sebagai gantinya
FloatingBtn.Visible = false -- Sembunyi di awal
FloatingBtn.Active = true
FloatingBtn.Draggable = true -- Bisa dipindah-pindah

local FloatCorner = Instance.new("UICorner", FloatingBtn)
FloatCorner.CornerRadius = UDim.new(0, 8)

local FloatLogo = Instance.new("ImageLabel", FloatingBtn)
FloatLogo.Size = UDim2.new(0.7, 0, 0.7, 0)
FloatLogo.Position = UDim2.new(0.15, 0, 0.15, 0)
FloatLogo.Image = "rbxassetid://133361483813672" -- Logo kamu
FloatLogo.BackgroundTransparency = 1

-- [[ MAIN FRAME ]]
local Main = Instance.new("Frame", ScreenGui)
Main.Name = "MainFrame"
Main.Size = UDim2.fromOffset(500, 320)
Main.Position = UDim2.new(0.5, -250, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 35) 
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true 

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 6)

-- [[ TOP BAR / HEADER ]]
local Header = Instance.new("Frame", Main)
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundTransparency = 1

local TitleLogo = Instance.new("ImageLabel", Header)
TitleLogo.Size = UDim2.fromOffset(22, 22)
TitleLogo.Position = UDim2.new(0, 12, 0.5, -11)
TitleLogo.Image = "rbxassetid://133361483813672" 
TitleLogo.BackgroundTransparency = 1

local Title = Instance.new("TextLabel", Header)
Title.Text = "Stellar System | Fish It"
Title.Font = Enum.Font.GothamMedium
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Position = UDim2.new(0, 42, 0, 0)
Title.Size = UDim2.new(1, -120, 1, 0)
Title.BackgroundTransparency = 1

-- Tombol Close (X)
local CloseBtn = Instance.new("TextButton", Header)
CloseBtn.Text = "X"
CloseBtn.Size = UDim2.fromOffset(28, 28)
CloseBtn.Position = UDim2.new(1, -35, 0.5, -14)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 4)

-- Tombol Minimize (-)
local MiniBtn = Instance.new("TextButton", Header)
MiniBtn.Text = "—"
MiniBtn.Size = UDim2.fromOffset(28, 28)
MiniBtn.Position = UDim2.new(1, -68, 0.5, -14)
MiniBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
MiniBtn.TextColor3 = Color3.new(1, 1, 1)
MiniBtn.Font = Enum.Font.GothamBold
MiniBtn.TextSize = 14
Instance.new("UICorner", MiniBtn).CornerRadius = UDim.new(0, 4)

-- [[ SIDEBAR & CONTENT (Sama seperti sebelumnya) ]]
local Sidebar = Instance.new("Frame", Main)
Sidebar.Position = UDim2.new(0, 10, 0, 50)
Sidebar.Size = UDim2.new(0, 150, 1, -60)
Sidebar.BackgroundTransparency = 1
Instance.new("UIListLayout", Sidebar).Padding = UDim.new(0, 6)

local function CreateTab(name)
    local Btn = Instance.new("TextButton", Sidebar)
    Btn.Size = UDim2.new(1, 0, 0, 32)
    Btn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    Btn.Text = "  || " .. name
    Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 13
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 4)
end
for _, name in pairs({"Info", "Fishing", "Automatically", "Menu", "Quest", "Webhook", "Config"}) do CreateTab(name) end

local Content = Instance.new("Frame", Main)
Content.Position = UDim2.new(0, 170, 0, 50)
Content.Size = UDim2.new(1, -180, 1, -60)
Content.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 6)

-- [[ INFO SECTION REVISION ]]
local InfoTitle = Instance.new("TextLabel", Content)
InfoTitle.Text = "Info" -- BOLD & NO COLON
InfoTitle.Position = UDim2.new(0.05, 0, 0.15, 0)
InfoTitle.Size = UDim2.new(0.9, 0, 0, 20)
InfoTitle.Font = Enum.Font.GothamBold
InfoTitle.TextSize = 14
InfoTitle.TextColor3 = Color3.new(1, 1, 1)
InfoTitle.TextXAlignment = Enum.TextXAlignment.Left
InfoTitle.BackgroundTransparency = 1

local function AddRow(label, value, y, isGreen)
    local Row = Instance.new("Frame", Content)
    Row.Size = UDim2.new(0.9, 0, 0, 20)
    Row.Position = UDim2.new(0.05, 0, y, 0)
    Row.BackgroundTransparency = 1
    
    local L = Instance.new("TextLabel", Row)
    L.Text = label
    L.Size = UDim2.new(0, 80, 1, 0)
    L.Font = Enum.Font.Gotham
    L.TextColor3 = Color3.fromRGB(200, 200, 200)
    L.TextSize = 13
    L.TextXAlignment = Enum.TextXAlignment.Left
    L.BackgroundTransparency = 1
    
    local V = Instance.new("TextLabel", Row)
    V.Text = ":  " .. value
    V.Position = UDim2.new(0, 80, 0, 0)
    V.Size = UDim2.new(1, -80, 1, 0)
    V.Font = Enum.Font.Gotham
    V.TextColor3 = isGreen and Color3.fromRGB(0, 255, 127) or Color3.fromRGB(200, 200, 200)
    V.TextSize = 13
    V.TextXAlignment = Enum.TextXAlignment.Left
    V.BackgroundTransparency = 1
end

AddRow("Version", "V1.0.0 [BETA]", 0.22)
AddRow("Owner", "Luc Aetheryn", 0.29)
AddRow("Status", "Undetected", 0.36, true) -- STATUS GREEN
AddRow("Last Update", "Tuesday, Jan 27, 2026", 0.43)

-- [[ DISCORD SECTION & COPY BUTTON (Sama seperti sebelumnya) ]]
-- ... (Bagian Discord & Line tetap ada untuk estetika)

-- [[ LOGIC: CLOSE / MINIMIZE / RESTORE ]]

-- Tutup Script
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Minimize Menu
MiniBtn.MouseButton1Click:Connect(function()
    Main.Visible = false
    FloatingBtn.Visible = true -- Tampilkan tombol floating
end)

-- Restore Menu (Klik tombol floating)
FloatingBtn.MouseButton1Click:Connect(function()
    Main.Visible = true
    FloatingBtn.Visible = false -- Sembunyikan tombol floating
end)
