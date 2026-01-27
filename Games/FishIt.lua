-- [[ STELLAR SYSTEM FINAL UI REVISED ]]
-- Developer: Luc Aetheryn
-- Precision Alignment Version

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

if CoreGui:FindFirstChild("StellarFinal") then 
    CoreGui.StellarFinal:Destroy() 
end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "StellarFinal"

-- [[ MAIN FRAME ]]
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.fromOffset(500, 320)
Main.Position = UDim2.new(0.5, -250, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 35) 
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true

local MainCorner = Instance.new("UICorner", Main)
MainCorner.CornerRadius = UDim.new(0, 6)

-- [[ TOP BAR ]]
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundTransparency = 1

local TitleLogo = Instance.new("ImageLabel", Header)
TitleLogo.Size = UDim2.fromOffset(20, 20)
TitleLogo.Position = UDim2.new(0, 12, 0.5, -10)
TitleLogo.Image = "rbxassetid://133361483813672" 
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

-- [[ SIDEBAR ]]
local Sidebar = Instance.new("Frame", Main)
Sidebar.Position = UDim2.new(0, 10, 0, 50)
Sidebar.Size = UDim2.new(0, 150, 1, -60)
Sidebar.BackgroundTransparency = 1

local UIListLayout = Instance.new("UIListLayout", Sidebar)
UIListLayout.Padding = UDim.new(0, 6)
UIListLayout.SortOrder = Enum.SortOrder.Name -- Menjaga urutan tombol

local function CreateTab(name)
    local Btn = Instance.new("TextButton", Sidebar)
    Btn.Name = name
    Btn.Size = UDim2.new(1, 0, 0, 32)
    Btn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    Btn.Text = "|| " .. name
    Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 13
    Btn.TextXAlignment = Enum.TextXAlignment.Left -- Sejajar kiri sesuai gambar
    Btn.BorderSizePixel = 0
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 4)
    
    -- Padding teks tombol agar tidak terlalu mepet garis
    local Padding = Instance.new("UIPadding", Btn)
    Padding.PaddingLeft = UDim.new(0, 10)
end

local Tabs = {"Info", "Fishing", "Automatically", "Menu", "Quest", "Webhook", "Config"}
for _, tabName in pairs(Tabs) do CreateTab(tabName) end

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

-- [[ REVISI TEKS INFO - PERAPIAN ":" ]]
local function CreateInfoRow(label, value, yPos)
    local Row = Instance.new("Frame", Content)
    Row.Size = UDim2.new(0.9, 0, 0, 20)
    Row.Position = UDim2.new(0.05, 0, yPos, 0)
    Row.BackgroundTransparency = 1
    
    local Lbl = Instance.new("TextLabel", Row)
    Lbl.Text = label
    Lbl.Size = UDim2.new(0, 80, 1, 0) -- Lebar label dikunci agar ":" sejajar
    Lbl.Font = Enum.Font.Gotham
    Lbl.TextSize = 13
    Lbl.TextColor3 = Color3.fromRGB(220, 220, 220)
    Lbl.TextXAlignment = Enum.TextXAlignment.Left
    Lbl.BackgroundTransparency = 1
    
    local Val = Instance.new("TextLabel", Row)
    Val.Text = ":  " .. value
    Val.Position = UDim2.new(0, 80, 0, 0)
    Val.Size = UDim2.new(1, -80, 1, 0)
    Val.Font = Enum.Font.Gotham
    Val.TextSize = 13
    Val.TextColor3 = Color3.fromRGB(220, 220, 220)
    Val.TextXAlignment = Enum.TextXAlignment.Left
    Val.BackgroundTransparency = 1
end

local InfoTitle = Instance
