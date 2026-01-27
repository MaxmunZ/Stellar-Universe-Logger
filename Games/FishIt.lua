-- [[ STELLAR SYSTEM HUB - THE ABSOLUTE FINAL ]]
-- Developer: Luc Aetheryn
-- Restoration: Gradient, Discord, Logos, and Floating UI

local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("StellarFinal") then CoreGui.StellarFinal:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "StellarFinal"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- [[ FLOATING BUTTON ]]
local FloatingBtn = Instance.new("TextButton", ScreenGui)
FloatingBtn.Size = UDim2.fromOffset(45, 45)
FloatingBtn.Position = UDim2.new(0, 15, 0.5, -22)
FloatingBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
FloatingBtn.Text = ""
FloatingBtn.Visible = false
FloatingBtn.Draggable = true
Instance.new("UICorner", FloatingBtn).CornerRadius = UDim.new(0, 8)

local FloatLogo = Instance.new("ImageLabel", FloatingBtn)
FloatLogo.Size = UDim2.new(0.7, 0, 0.7, 0)
FloatLogo.Position = UDim2.new(0.15, 0, 0.15, 0)
FloatLogo.Image = "rbxassetid://133361483813672" -- Logo kamu
FloatLogo.BackgroundTransparency = 1

-- [[ MAIN FRAME ]]
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.fromOffset(500, 320)
Main.Position = UDim2.new(0.5, -250, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 6)

-- [[ HEADER ]]
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundTransparency = 1

local TitleLogo = Instance.new("ImageLabel", Header)
TitleLogo.Size = UDim2.fromOffset(22, 22)
TitleLogo.Position = UDim2.new(0, 12, 0.5, -11)
TitleLogo.Image = "rbxassetid://133361483813672" -- Logo kamu
TitleLogo.BackgroundTransparency = 1

local Title = Instance.new("TextLabel", Header)
Title.Text = "Stellar System | Fish It"
Title.Position = UDim2.new(0, 42, 0, 0)
Title.Size = UDim2.new(1, -120, 1, 0)
Title.Font = Enum.Font.GothamMedium
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1

-- CLOSE & MINIMIZE BUTTONS
local function CreateControl(txt, pos, color)
    local B = Instance.new("TextButton", Header)
    B.Text = txt
    B.Size = UDim2.fromOffset(28, 28)
    B.Position = pos
    B.BackgroundColor3 = color
    B.TextColor3 = Color3.new(1, 1, 1)
    B.Font = Enum.Font.GothamBold
    Instance.new("UICorner", B).CornerRadius = UDim.new(0, 4)
    return B
end

local Close = CreateControl("X", UDim2.new(1, -35, 0.5, -14), Color3.fromRGB(200, 50, 50))
local Mini = CreateControl("—", UDim2.new(1, -68, 0.5, -14), Color3.fromRGB(45, 45, 55))

-- [[ SIDEBAR ]]
local Sidebar = Instance.new("Frame", Main)
Sidebar.Position = UDim2.new(0, 10, 0, 50)
Sidebar.Size = UDim2.new(0, 150, 1, -60)
Sidebar.BackgroundTransparency = 1
local List = Instance.new("UIListLayout", Sidebar)
List.Padding = UDim.new(0, 6)

for _, n in pairs({"Info", "Fishing", "Automatically", "Menu", "Quest", "Webhook", "Config"}) do
    local B = Instance.new("TextButton", Sidebar)
    B.Size = UDim2.new(1, 0, 0, 32)
    B.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    B.Text = "  || " .. n
    B.TextColor3 = Color3.fromRGB(200, 200, 200)
    B.Font = Enum.Font.Gotham
    B.TextSize = 13
    B.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", B).CornerRadius = UDim.new(0, 4)
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

-- INFO SECTION
local InfoTitle = Instance.new("TextLabel", Content)
InfoTitle.Text = "Info"
InfoTitle.Position = UDim2.new(0.05, 0, 0.15, 0)
InfoTitle.Size = UDim2.new(0.9, 0, 0, 20)
InfoTitle.Font = Enum.Font.GothamBold
InfoTitle.TextColor3 = Color3.new(1, 1, 1)
InfoTitle.TextXAlignment = Enum.TextXAlignment.Left
InfoTitle.BackgroundTransparency = 1

local function Row(l, v, y, g)
    local F = Instance.new("Frame", Content)
    F.Size = UDim2.new(0.9, 0, 0, 20)
    F.Position = UDim2.new(0.05, 0, y, 0)
    F.BackgroundTransparency = 1
    local L = Instance.new("TextLabel", F)
    L.Text = l
    L.Size = UDim2.new(0, 80, 1, 0)
    L.Font = Enum.Font.Gotham
    L.TextColor3 = Color3.fromRGB(220, 220, 220)
    L.TextXAlignment = Enum.TextXAlignment.Left
    L.BackgroundTransparency = 1
    local V = Instance.new("TextLabel", F)
    V.Text = ":  " .. v
    V.Position = UDim2.new(0, 80, 0, 0)
    V.Size = UDim2.new(1, -80, 1, 0)
    V.Font = Enum.Font.Gotham
    V.TextColor3 = g and Color3.fromRGB(0, 255, 127) or Color3.fromRGB(220, 220, 220)
    V.TextXAlignment = Enum.TextXAlignment.Left
    V.BackgroundTransparency = 1
end

Row("Version", "V1.0.0 [BETA]", 0.22)
Row("Owner", "Luc Aetheryn", 0.29)
Row("Status", "Undetected", 0.36, true)
Row("Last Update", "Tuesday, Jan 27, 2026", 0.43)

-- THE MISSING GRADIENT LINE
local Line = Instance.new("Frame", Content)
Line.Position = UDim2.new(0.05, 0, 0.54, 0)
Line.Size = UDim2.new(0.9, 0, 0, 2)
Line.BorderSizePixel = 0
local Grad = Instance.new("UIGradient", Line)
Grad.Color = ColorSequence.new(Color3.fromRGB(255, 50, 150), Color3.fromRGB(120, 20, 150))

-- THE MISSING DISCORD BOX
local Dbox = Instance.new("Frame", Content)
Dbox.Position = UDim2.new(0.05, 0, 0.6, 0)
Dbox.Size = UDim2.new(0.9, 0, 0, 50)
Dbox.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
Instance.new("UICorner", Dbox)

local Dicon = Instance.new("ImageLabel", Dbox)
Dicon.Size = UDim2.fromOffset(30, 30)
Dicon.Position = UDim2.new(0, 10, 0.5, -15)
Dicon.Image = "rbxassetid://13543168532"
Dicon.BackgroundTransparency = 1

local Dname = Instance.new("TextLabel", Dbox)
Dname.Text = "Stellar Discord"
Dname.Position = UDim2.new(0, 50, 0.15, 0)
Dname.Size = UDim2.new(1, -60, 0.4, 0)
Dname.Font = Enum.Font.GothamBold
Dname.TextColor3 = Color3.new(1, 1, 1)
Dname.TextXAlignment = Enum.TextXAlignment.Left
Dname.BackgroundTransparency = 1

local Dsub = Instance.new("TextLabel", Dbox)
Dsub.Text = "Official Link Discord Server"
Dsub.Position = UDim2.new(0, 50, 0.5, 0)
Dsub.Size = UDim2.new(1, -60, 0.4, 0)
Dsub.Font = Enum.Font.Gotham
Dsub.TextColor3 = Color3.fromRGB(200, 200, 200)
Dsub.TextXAlignment = Enum.TextXAlignment.Left
Dsub.BackgroundTransparency = 1

-- THE MISSING COPY BUTTON
local Copy = Instance.new("TextButton", Content)
Copy.Position = UDim2.new(0.05, 0, 0.82, 0)
Copy.Size = UDim2.new(0.9, 0, 0, 30)
Copy.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
Copy.Text = "Copy Link Discord"
Copy.Font = Enum.Font.Gotham
Copy.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", Copy)

-- BUTTON LOGIC
Close.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)
Mini.MouseButton1Click:Connect(function() Main.Visible = false FloatingBtn.Visible = true end)
FloatingBtn.MouseButton1Click:Connect(function() Main.Visible = true FloatingBtn.Visible = false end)
Copy.MouseButton1Click:Connect(function() setclipboard("https://discord.gg/QEhHc6UBHH") Copy.Text = "Copied!" task.wait(2) Copy.Text = "Copy Link Discord" end)
