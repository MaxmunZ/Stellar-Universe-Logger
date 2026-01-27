local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local TextService = game:GetService("TextService")

-- Bersihkan UI lama
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
Main.Draggable = true -- Agar bisa digeser di Delta

local MainCorner = Instance.new("UICorner", Main)
MainCorner.CornerRadius = UDim.new(0, 6)

-- TOP BAR (Header)
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundTransparency = 1

local Title = Instance.new("TextLabel", Header)
Title.Text = "  ✨ Stellar System | Fish It"
Title.Font = Enum.Font.GothamMedium
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Size = UDim2.new(1, 0, 1, 0)
Title.BackgroundTransparency = 1

-- SIDEBAR NAVIGATION
local Sidebar = Instance.new("Frame", Main)
Sidebar.Position = UDim2.new(0, 10, 0, 50)
Sidebar.Size = UDim2.new(0, 150, 1, -60)
Sidebar.BackgroundTransparency = 1

local UIListLayout = Instance.new("UIListLayout", Sidebar)
UIListLayout.Padding = UDim.new(0, 5)

local function CreateTab(name)
    local Btn = Instance.new("TextButton", Sidebar)
    Btn.Size = UDim2.new(1, 0, 0, 35)
    Btn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    Btn.Text = "|| " .. name
    Btn.TextColor3 = Color3.new(0.9, 0.9, 0.9)
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 14
    Btn.BorderSizePixel = 0
    Btn.AutoButtonColor = true
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 4)
    return Btn
end

local TabNames = {"Info", "Fishing", "Automatically", "Menu", "Quest", "Webhook", "Config"}
for _, name in pairs(TabNames) do CreateTab(name) end

-- MAIN CONTENT AREA
local Content = Instance.new("Frame", Main)
Content.Position = UDim2.new(0, 170, 0, 50)
Content.Size = UDim2.new(1, -180, 1, -60)
Content.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
Content.BorderSizePixel = 0
Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 6)

-- INFO TEXTS (Sesuai Gambar)
local HubTitle = Instance.new("TextLabel", Content)
HubTitle.Text = "-- Stellar System Hub --"
HubTitle.Size = UDim2.new(1, 0, 0, 40)
HubTitle.Font = Enum.Font.GothamBold
HubTitle.TextSize = 18
HubTitle.TextColor3 = Color3.new(1, 1, 1)
HubTitle.BackgroundTransparency = 1

local InfoLabel = Instance.new("TextLabel", Content)
InfoLabel.Position = UDim2.new(0.05, 0, 0.15, 0)
InfoLabel.Size = UDim2.new(0.9, 0, 0.4, 0)
InfoLabel.Text = "Info\nVersion      : V1.0.0 [BETA]\nOwner        : Luc Aetheryn\nStatus       : Undetected\nLast Update : Tuesday, January 27, 2026"
InfoLabel.Font = Enum.Font.Gotham
InfoLabel.TextSize = 14
InfoLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
InfoLabel.TextXAlignment = Enum.TextXAlignment.Left
InfoLabel.TextYAlignment = Enum.TextYAlignment.Top
InfoLabel.BackgroundTransparency = 1

-- GRADIENT LINE
local Line = Instance.new("Frame", Content)
Line.Position = UDim2.new(0.05, 0, 0.55, 0)
Line.Size = UDim2.new(0.9, 0, 0, 3)
Line.BorderSizePixel = 0
local UIGradient = Instance.new("UIGradient", Line)
UIGradient.Color = ColorSequence.new(Color3.fromRGB(255, 50, 150), Color3.fromRGB(100, 20, 150))

-- DISCORD SECTION
local DiscordBox = Instance.new("Frame", Content)
DiscordBox.Position = UDim2.new(0.05, 0, 0.6, 0)
DiscordBox.Size = UDim2.new(0.9, 0, 0, 50)
DiscordBox.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
Instance.new("UICorner", DiscordBox)

local DiscordIcon = Instance.new("ImageLabel", DiscordBox)
DiscordIcon.Size = UDim2.new(0, 30, 0, 30)
DiscordIcon.Position = UDim2.new(0, 10, 0.5, -15)
DiscordIcon.Image = "rbxassetid://1000304092" -- Bisa diganti ID Discord
DiscordIcon.BackgroundTransparency = 1

local DiscordText = Instance.new("TextLabel", DiscordBox)
DiscordText.Text = "Stellar Discord\nOfficial Link Discord Server"
DiscordText.Position = UDim2.new(0, 50, 0, 0)
DiscordText.Size = UDim2.new(1, -60, 1, 0)
DiscordText.TextColor3 = Color3.new(1, 1, 1)
DiscordText.BackgroundTransparency = 1
DiscordText.Font = Enum.Font.GothamBold
DiscordText.TextSize = 12
DiscordText.TextXAlignment = Enum.TextXAlignment.Left

-- TOMBOL COPY DISCORD
local CopyBtn = Instance.new("TextButton", Content)
CopyBtn.Position = UDim2.new(0.05, 0, 0.8, 0)
CopyBtn.Size = UDim2.new(0.9, 0, 0, 30)
CopyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
CopyBtn.Text = "Copy Link Discord"
CopyBtn.Font = Enum.Font.Gotham
CopyBtn.TextSize = 14
CopyBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", CopyBtn)

CopyBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/QEhHc6UBHH")
    CopyBtn.Text = "Copied!"
    wait(2)
    CopyBtn.Text = "Copy Link Discord"
end)
