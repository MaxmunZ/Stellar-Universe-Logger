-- Menghapus UI lama jika ada
if game.CoreGui:FindFirstChild("StellarUI") then game.CoreGui.StellarUI:Destroy() end

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "StellarUI"

-- Main Frame (Menu Utama)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 400, 0, 250)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35) -- Gelap Elegan
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true -- Bisa digeser!

-- Membuat Sudut Membulat (Gaya Chloe/Zenith)
local Corner = Instance.new("UICorner", MainFrame)
Corner.CornerRadius = UDim.new(0, 10)

-- Header (Warna Ungu-Magenta kamu)
local Header = Instance.new("Frame", MainFrame)
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(191, 64, 191) 
local HeaderCorner = Instance.new("UICorner", Header)

local Title = Instance.new("TextLabel", Header)
Title.Text = "STELLAR SYSTEM | Luc Aetheryn"
Title.Size = UDim2.new(1, -40, 1, 0)
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16

-- Tombol Minimize (Ke Logo)
local MinBtn = Instance.new("TextButton", Header)
MinBtn.Text = "-"
MinBtn.Size = UDim2.new(0, 30, 0, 30)
MinBtn.Position = UDim2.new(1, -35, 0.5, -15)
MinBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
local MinCorner = Instance.new("UICorner", MinBtn)

-- Konten Sederhana (Contoh Tab Quest)
local Content = Instance.new("TextLabel", MainFrame)
Content.Text = "Ghostfin Quest & Diamond Quest Ready"
Content.Position = UDim2.new(0, 0, 0.5, 0)
Content.Size = UDim2.new(1, 0, 0, 50)
Content.TextColor3 = Color3.new(0.8, 0.8, 0.8)
Content.BackgroundTransparency = 1

-- Fungsi Minimize ke Logo
local MiniLogo = Instance.new("ImageButton", ScreenGui)
MiniLogo.Size = UDim2.new(0, 50, 0, 50)
MiniLogo.Position = UDim2.new(0, 10, 0.5, 0)
MiniLogo.Image = "rbxassetid://1000304092" -- Logo Stellar kamu
MiniLogo.Visible = false
MiniLogo.Draggable = true

MinBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    MiniLogo.Visible = true
end)

MiniLogo.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    MiniLogo.Visible = false
end)
