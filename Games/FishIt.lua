-- [[ STELLAR SYSTEM FINAL UI ]]
-- Developer: Luc Aetheryn
-- Base Style: Custom Fluent (Hard-Coded)

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

-- Menghapus UI lama agar tidak menumpuk saat re-execute
if CoreGui:FindFirstChild("StellarFinal") then 
    CoreGui.StellarFinal:Destroy() 
end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "StellarFinal"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- [[ MAIN FRAME ]]
local Main = Instance.new("Frame", ScreenGui)
Main.Name = "MainFrame"
Main.Size = UDim2.fromOffset(500, 320)
Main.Position = UDim2.new(0.5, -250, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 35) -- Warna gelap elegan
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true -- Support untuk pengguna Delta/Mobile

local MainCorner = Instance.new("UICorner", Main)
MainCorner.CornerRadius = UDim.new(0, 6)

-- [[ TOP BAR / HEADER ]]
local Header = Instance.new("Frame", Main)
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundTransparency = 1

-- Logo Stellar di Pojok Kiri Atas
local TitleLogo = Instance.new("ImageLabel", Header)
TitleLogo.Name = "TitleLogo"
TitleLogo.Size = UDim2.fromOffset(20, 20)
TitleLogo.Position = UDim2.new(0, 12, 0.5, -10)
TitleLogo.Image = "rbxassetid://133361483813672"  -- ID Logo dari visualmu
TitleLogo.BackgroundTransparency = 1
TitleLogo.ScaleType = Enum.ScaleType.Fit

-- Judul Script
local Title = Instance.new("TextLabel", Header)
Title.Name = "TitleText"
Title.Text = "Stellar System | Fish It"
Title.Font = Enum.Font.GothamMedium
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 15
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Position = UDim2.new(0, 40, 0, 0)
Title.Size = UDim2.new(1, -40, 1, 0)
Title.BackgroundTransparency = 1

-- [[ SIDEBAR NAVIGATION ]]
local Sidebar = Instance.new("Frame", Main)
Sidebar.Name = "Sidebar"
Sidebar.Position = UDim2.new(0, 10, 0, 50)
Sidebar.Size = UDim2.new(0, 150, 1, -60)
Sidebar.BackgroundTransparency = 1

local UIListLayout = Instance.new("UIListLayout", Sidebar)
UIListLayout.Padding = UDim.new(0, 6)

-- Fungsi Pembuat Tombol Tab (Sidebar)
local function CreateTab(name)
    local Btn = Instance.new("TextButton", Sidebar)
    Btn.Name = name .. "Tab"
    Btn.Size = UDim2.new(1, 0, 0, 32)
    Btn.BackgroundColor3 = Color3.fromRGB(35, 35, 45) -- Warna button sidebar
    Btn.Text = "|| " .. name
    Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 13
    Btn.BorderSizePixel = 0
    Btn.AutoButtonColor = true
    
    local BtnCorner = Instance.new("UICorner", Btn)
    BtnCorner.CornerRadius = UDim.new(0, 4)
    
    return Btn
end

local Tabs = {"Info", "Fishing", "Automatically", "Menu", "Quest", "Webhook", "Config"}
for _, tabName in pairs(Tabs) do
    CreateTab(tabName)
end

-- [[ MAIN CONTENT BOX ]]
local Content = Instance.new("Frame", Main)
Content.Name = "ContentArea"
Content.Position = UDim2.new(0, 170, 0, 50)
Content.Size = UDim2.new(1, -180, 1, -60)
Content.BackgroundColor3 = Color3.fromRGB(20, 20, 28) -- Background konten lebih gelap
Content.BorderSizePixel = 0

local ContentCorner = Instance.new("UICorner", Content)
ContentCorner.CornerRadius = UDim.new(0, 6)

-- Judul Hub
local HubTitle = Instance.new("TextLabel", Content)
HubTitle.Text = "-- Stellar System Hub --"
HubTitle.Size = UDim2.new(1, 0, 0, 45)
HubTitle.Font = Enum.Font.GothamBold
HubTitle.TextSize = 18
HubTitle.TextColor3 = Color3.new(1, 1, 1)
HubTitle.BackgroundTransparency = 1

-- Area Informasi (Teks Detail)
local InfoLabel = Instance.new("TextLabel", Content)
InfoLabel.Position = UDim2.new(0.05, 0, 0.18, 0)
InfoLabel.Size = UDim2.new(0.9, 0, 0.35, 0)
InfoLabel.Text = "Info\nVersion      : V1.0.0 [BETA]\nOwner        : Luc Aetheryn\nStatus       : Undetected\nLast Update : Tuesday, January 27, 2026"
InfoLabel.Font = Enum.Font.Gotham
InfoLabel.TextSize = 13
InfoLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
InfoLabel.TextXAlignment = Enum.TextXAlignment.Left
InfoLabel.TextYAlignment = Enum.TextYAlignment.Top
InfoLabel.BackgroundTransparency = 1
InfoLabel.LineHeight = 1.4 -- Jarak antar baris teks

-- [[ AKSEN GRADASI MAGENTA ]]
local Line = Instance.new("Frame", Content)
Line.Name = "GradientLine"
Line.Position = UDim2.new(0.05, 0, 0.52, 0)
Line.Size = UDim2.new(0.9, 0, 0, 3)
Line.BorderSizePixel = 0

local UIGradient = Instance.new("UIGradient", Line)
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 50, 150)), -- Magenta
    ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 20, 150))  -- Ungu Tua
})

-- [[ SEKSI DISCORD ]]
local DiscordBox = Instance.new("Frame", Content)
DiscordBox.Position = UDim2.new(0.05, 0, 0.58, 0)
DiscordBox.Size = UDim2.new(0.9, 0, 0, 55)
DiscordBox.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
DiscordBox.BorderSizePixel = 0

local DiscordCorner = Instance.new("UICorner", DiscordBox)
DiscordCorner.CornerRadius = UDim.new(0, 4)

-- Ikon Discord (Placeholder)
local DiscordIcon = Instance.new("ImageLabel", DiscordBox)
DiscordIcon.Size = UDim2.fromOffset(30, 30)
DiscordIcon.Position = UDim2.new(0, 12, 0.5, -15)
DiscordIcon.Image = "rbxassetid://100344740949293" -- Ikon Discord standar
DiscordIcon.BackgroundTransparency = 1

local DiscordText = Instance.new("TextLabel", DiscordBox)
DiscordText.Text = "Stellar Discord\nOfficial Link Discord Server"
DiscordText.Position = UDim2.new(0, 52, 0, 0)
DiscordText.Size = UDim2.new(1, -60, 1, 0)
DiscordText.TextColor3 = Color3.new(1, 1, 1)
DiscordText.BackgroundTransparency = 1
DiscordText.Font = Enum.Font.GothamBold
DiscordText.TextSize = 12
DiscordText.TextXAlignment = Enum.TextXAlignment.Left

-- Tombol Copy Link
local CopyBtn = Instance.new("TextButton", Content)
CopyBtn.Name = "CopyButton"
CopyBtn.Position = UDim2.new(0.05, 0, 0.8, 0)
CopyBtn.Size = UDim2.new(0.9, 0, 0, 32)
CopyBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
CopyBtn.Text = "Copy Link Discord"
CopyBtn.Font = Enum.Font.Gotham
CopyBtn.TextSize = 13
CopyBtn.TextColor3 = Color3.new(1, 1, 1)
CopyBtn.BorderSizePixel = 0

local BtnCorner = Instance.new("UICorner", CopyBtn)
BtnCorner.CornerRadius = UDim.new(0, 4)

-- Fungsi Copy Link ke Clipboard
CopyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://discord.gg/QEhHc6UBHH") -- Link Discordmu
        CopyBtn.Text = "Copied to Clipboard!"
        CopyBtn.TextColor3 = Color3.fromRGB(0, 255, 127)
        task.wait(2)
        CopyBtn.Text = "Copy Link Discord"
        CopyBtn.TextColor3 = Color3.new(1, 1, 1)
    end
end)

print("Stellar System Loaded Successfully!")
