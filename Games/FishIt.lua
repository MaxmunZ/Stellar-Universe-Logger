-- [[ STELLAR SYSTEM FINAL UI - INTEGRATED VERSION ]]
-- Developer: Luc Aetheryn
-- Fix: Visual Restoration & Detailed Explanation

local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- [[ GITHUB ASSET HANDLER ]]
local function GetStellarAsset(fileName, url)
    if not isfile(fileName) then
        local success, result = pcall(function() return game:HttpGet(url) end)
        if success then writefile(fileName, result) end
    end
    return getcustomasset(fileName)
end

local LogoStellar = GetStellarAsset("StellarLogo_v3.png", "https://raw.githubusercontent.com/MaxmunZ/Stellar-Assets/refs/heads/main/Stellar%20System.png.jpg")
local LogoDiscord = GetStellarAsset("DiscordLogo_v3.png", "https://raw.githubusercontent.com/MaxmunZ/Stellar-Assets/refs/heads/main/Discord.png")
local VerticalBG = GetStellarAsset("StellarBG_Vertical.png", "https://raw.githubusercontent.com/MaxmunZ/Stellar-Assets/main/Stellar%20Background%20Vertical.jpg")

if CoreGui:FindFirstChild("StellarFinal") then CoreGui.StellarFinal:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "StellarFinal"
ScreenGui.ResetOnSpawn = false

-- [[ INITIALIZE VARIABLES ]]
local SelectedTiers = {}
_G.WebhookEnabled = false

-- [[ 1. MAIN FRAME ]]
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.fromOffset(500, 320)
Main.Position = UDim2.new(0.5, -250, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 6)

-- [[ 2. SEARCH MENU (INTERNAL) ]]
local SearchMenu = Instance.new("ImageLabel", Main) 
SearchMenu.Name = "TierSearchMenu"
SearchMenu.Size = UDim2.new(0, 180, 0, 240)
SearchMenu.Position = UDim2.new(0, 310, 0, 50) 
SearchMenu.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
SearchMenu.Image = VerticalBG
SearchMenu.ScaleType = Enum.ScaleType.Stretch
SearchMenu.Visible = false
SearchMenu.ZIndex = 50 

local SStroke = Instance.new("UIStroke", SearchMenu)
SStroke.Color = Color3.fromRGB(255, 50, 150)
SStroke.Thickness = 2
Instance.new("UICorner", SearchMenu)

local STitle = Instance.new("TextLabel", SearchMenu)
STitle.Text = "Search"; STitle.Size = UDim2.new(1, 0, 0, 30); STitle.BackgroundTransparency = 1; STitle.TextColor3 = Color3.new(1,1,1); STitle.Font = Enum.Font.GothamMedium; STitle.ZIndex = 51

local SList = Instance.new("ScrollingFrame", SearchMenu)
SList.Size = UDim2.new(1, -10, 1, -70); SList.Position = UDim2.new(0, 5, 0, 35); SList.BackgroundTransparency = 1; SList.ScrollBarThickness = 0; SList.ZIndex = 51
Instance.new("UIListLayout", SList).Padding = UDim.new(0, 5)

for _, t in pairs({"Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic", "Secret"}) do
    local b = Instance.new("TextButton", SList)
    b.Size = UDim2.new(1, 0, 0, 30); b.Text = t; b.BackgroundColor3 = Color3.fromRGB(45, 45, 55); b.BackgroundTransparency = 0.5; b.TextColor3 = Color3.fromRGB(200, 200, 200); b.Font = Enum.Font.Gotham; b.ZIndex = 52; Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        if table.find(SelectedTiers, t) then
            for i, v in ipairs(SelectedTiers) do if v == t then table.remove(SelectedTiers, i) end end
            b.TextColor3 = Color3.fromRGB(200, 200, 200)
        else
            table.insert(SelectedTiers, t)
            b.TextColor3 = Color3.fromRGB(255, 50, 150)
        end
        if _G.TierBtn then _G.TierBtn.Text = #SelectedTiers == 0 and "Select Options" or table.concat(SelectedTiers, ", ") end
    end)
end

local CloseSearch = Instance.new("TextButton", SearchMenu)
CloseSearch.Size = UDim2.new(0.9, 0, 0, 25); CloseSearch.Position = UDim2.new(0.05, 0, 1, -30); CloseSearch.BackgroundColor3 = Color3.fromRGB(255, 50, 150); CloseSearch.Text = "Done"; CloseSearch.TextColor3 = Color3.new(1,1,1); CloseSearch.ZIndex = 55; Instance.new("UICorner", CloseSearch)
CloseSearch.MouseButton1Click:Connect(function() SearchMenu.Visible = false end)

-- [[ 3. MAIN CONTROLS ]]
local FloatBtn = Instance.new("ImageButton", ScreenGui); FloatBtn.Size = UDim2.fromOffset(50, 50); FloatBtn.Position = UDim2.new(0.05, 0, 0.2, 0); FloatBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 35); FloatBtn.Image = LogoStellar; FloatBtn.Visible = false; FloatBtn.Active = true; FloatBtn.Draggable = true; Instance.new("UICorner", FloatBtn).CornerRadius = UDim.new(1, 0)
local CloseBtn = Instance.new("TextButton", Main); CloseBtn.Text = "×"; CloseBtn.Size = UDim2.fromOffset(30, 30); CloseBtn.Position = UDim2.new(1, -40, 0, 5); CloseBtn.BackgroundTransparency = 1; CloseBtn.TextColor3 = Color3.fromRGB(255, 80, 80); CloseBtn.TextSize = 25; CloseBtn.Font = Enum.Font.GothamBold
local MiniBtn = Instance.new("TextButton", Main); MiniBtn.Text = "−"; MiniBtn.Size = UDim2.fromOffset(30, 30); MiniBtn.Position = UDim2.new(1, -75, 0, 5); MiniBtn.BackgroundTransparency = 1; MiniBtn.TextColor3 = Color3.new(1, 1, 1); MiniBtn.TextSize = 25; MiniBtn.Font = Enum.Font.GothamBold

MiniBtn.MouseButton1Click:Connect(function() Main.Visible = false; FloatBtn.Visible = true end)
FloatBtn.MouseButton1Click:Connect(function() Main.Visible = true; FloatBtn.Visible = false end)
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- [[ 4. HEADER & SIDEBAR ]]
local Header = Instance.new("Frame", Main); Header.Size = UDim2.new(1, -90, 0, 40); Header.BackgroundTransparency = 1
local TitleLogo = Instance.new("ImageLabel", Header); TitleLogo.Size = UDim2.fromOffset(20, 20); TitleLogo.Position = UDim2.new(0, 12, 0.5, -10); TitleLogo.Image = LogoStellar; TitleLogo.BackgroundTransparency = 1; TitleLogo.ScaleType = Enum.ScaleType.Fit
local Title = Instance.new("TextLabel", Header); Title.Text = "Stellar System | Fish It"; Title.Font = Enum.Font.GothamMedium; Title.TextColor3 = Color3.new(1, 1, 1); Title.TextSize = 15; Title.Position = UDim2.new(0, 40, 0, 0); Title.Size = UDim2.new(1, -40, 1, 0); Title.TextXAlignment = 0; Title.BackgroundTransparency = 1
local Sidebar = Instance.new("Frame", Main); Sidebar.Position = UDim2.new(0, 10, 0, 50); Sidebar.Size = UDim2.new(0, 150, 1, -60); Sidebar.BackgroundTransparency = 1; Instance.new("UIListLayout", Sidebar).Padding = UDim.new(0, 6)
local Content = Instance.new("Frame", Main); Content.Position = UDim2.new(0, 170, 0, 50); Content.Size = UDim2.new(1, -180, 1, -60); Content.BackgroundColor3 = Color3.fromRGB(20, 20, 28); Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 6)

local Pages = {}
local TabButtons = {}

local function CreatePage(name, scroll)
    local P = scroll and Instance.new("ScrollingFrame", Content) or Instance.new("Frame", Content)
    P.Size = UDim2.new(1, 0, 1, 0); P.BackgroundTransparency = 1; P.Visible = false
    if scroll then P.ScrollBarThickness = 0; P.CanvasSize = UDim2.new(0, 0, 0, 600) end
    Pages[name] = P; return P
end

-- [[ PAGES ]]
local InfoPage = CreatePage("Info", true)
local WebhookPage = CreatePage("Webhook", true)

-- [[ WEBHOOK CONTENT ]]
local WhTitle = Instance.new("TextLabel", WebhookPage); WhTitle.Text = "Webhook Settings"; WhTitle.Size = UDim2.new(1, 0, 0, 40); WhTitle.Font = Enum.Font.GothamBold; WhTitle.TextSize = 20; WhTitle.TextColor3 = Color3.new(1,1,1); WhTitle.BackgroundTransparency = 1

local function AddInput(lbl, y, placeholder)
    local L = Instance.new("TextLabel", WebhookPage); L.Text = lbl; L.Size = UDim2.new(0.9, 0, 0, 20); L.Position = UDim2.new(0.05, 0, 0, y); L.Font = Enum.Font.Gotham; L.TextColor3 = Color3.new(1,1,1); L.TextXAlignment = 0; L.BackgroundTransparency = 1
    local I = Instance.new("TextBox", WebhookPage); I.Size = UDim2.new(0.9, 0, 0, 35); I.Position = UDim2.new(0.05, 0, 0, y+22); I.BackgroundColor3 = Color3.fromRGB(30, 30, 40); I.PlaceholderText = placeholder; I.Text = ""; I.TextColor3 = Color3.new(1, 1, 1); I.TextSize = 12; I.ClipsDescendants = true; I.ClearTextOnFocus = false; I.TextXAlignment = 0; Instance.new("UICorner", I); Instance.new("UIPadding", I).PaddingLeft = UDim.new(0, 10)
    return I
end

local DiscordIDBox = AddInput("Input ID Discord", 50, "Input Here")
local WebhookURLBox = AddInput("Webhook URL", 115, "Input Here")

local function AddWhFilter(lbl, y, search)
    local F = Instance.new("Frame", WebhookPage); F.Size = UDim2.new(0.9, 0, 0, 35); F.Position = UDim2.new(0.05, 0, 0, y); F.BackgroundTransparency = 1
    local L = Instance.new("TextLabel", F); L.Text = lbl; L.Size = UDim2.new(0.4, 0, 1, 0); L.Font = Enum.Font.Gotham; L.TextColor3 = Color3.new(1, 1, 1); L.TextXAlignment = 0; L.BackgroundTransparency = 1
    local B = Instance.new("TextButton", F); B.Text = "Select Options"; B.Position = UDim2.new(0.4, 0, 0, 0); B.Size = UDim2.new(0.6, 0, 1, 0); B.BackgroundColor3 = Color3.fromRGB(35, 35, 45); B.TextColor3 = Color3.fromRGB(200, 200, 200); Instance.new("UICorner", B)
    if lbl == "Tier Filter" then _G.TierBtn = B end
    if search then B.MouseButton1Click:Connect(function() SearchMenu.Visible = not SearchMenu.Visible end) end
end
AddWhFilter("Tier Filter", 185, true)

local function AddWhToggle(lbl, y)
    local F = Instance.new("Frame", WebhookPage); F.Size = UDim2.new(0.9, 0, 0, 35); F.Position = UDim2.new(0.05, 0, 0, y); F.BackgroundTransparency = 1
    local L = Instance.new("TextLabel", F); L.Text = lbl; L.Size = UDim2.new(0.7, 0, 1, 0); L.Font = Enum.Font.Gotham; L.TextColor3 = Color3.new(1, 1, 1); L.TextXAlignment = 0; L.BackgroundTransparency = 1
    local BG = Instance.new("TextButton", F); BG.Size = UDim2.fromOffset(45, 22); BG.Position = UDim2.new(1, -45, 0.5, -11); BG.BackgroundColor3 = Color3.fromRGB(45, 45, 55); BG.Text = ""; Instance.new("UICorner", BG).CornerRadius = UDim.new(1, 0)
    local T = Instance.new("Frame", BG); T.Size = UDim2.fromOffset(18, 18); T.Position = UDim2.new(0, 2, 0.5, -9); T.BackgroundColor3 = Color3.new(1,1,1); Instance.new("UICorner", T).CornerRadius = UDim.new(1, 0)
    BG.MouseButton1Click:Connect(function() 
        local s = BG.BackgroundColor3 == Color3.fromRGB(45, 45, 55)
        BG.BackgroundColor3 = s and Color3.fromRGB(255, 50, 150) or Color3.fromRGB(45, 45, 55)
        TweenService:Create(T, TweenInfo.new(0.2), {Position = s and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)}):Play()
        if lbl == "Send Fish Webhook" then _G.WebhookEnabled = s end
    end)
end
AddWhToggle("Send Fish Webhook", 230)

-- [[ 5. TAB SYSTEM ]]
local function ShowPage(name)
    for k, v in pairs(Pages) do v.Visible = (k == name) end
    if name ~= "Webhook" then SearchMenu.Visible = false end
end

for _, name in pairs({"Info", "Fishing", "Webhook"}) do
    local B = Instance.new("TextButton", Sidebar); B.Size = UDim2.new(1, 0, 0, 32); B.BackgroundColor3 = Color3.fromRGB(35, 35, 45); B.Text = "|| " .. name; B.TextColor3 = Color3.fromRGB(200, 200, 200); B.Font = Enum.Font.Gotham; B.TextSize = 13; B.TextXAlignment = 0; Instance.new("UICorner", B); Instance.new("UIPadding", B).PaddingLeft = UDim.new(0, 10)
    TabButtons[name] = B; B.MouseButton1Click:Connect(function() ShowPage(name) end)
end

-- [[ 6. LOGIC NOTIFICATION & DETECTOR ]]
local function SendFishNotification(fishName, rarity, price, zone, img, mutation, weight, playerName)
    if not _G.WebhookEnabled then return end
    local url = WebhookURLBox.Text:gsub("%s+", "")
    if url == "" or not url:find("discord") then return end

    local data = {
        ["embeds"] = {{
            ["title"] = "⭐ Stellar System | " .. tostring(rarity) .. " Catch!",
            ["description"] = "Congratulations!! You have obtained a new **" .. tostring(rarity) .. "** fish!",
            ["color"] = 16723110,
            ["fields"] = {
                {["name"] = "〢Player Name", ["value"] = "```" .. tostring(playerName) .. "```", ["inline"] = false},
                {["name"] = "〢Fish Name", ["value"] = "```" .. tostring(fishName) .. "```", ["inline"] = false},
                {["name"] = "〢Fish Tier", ["value"] = "```" .. tostring(rarity) .. "```", ["inline"] = true},
                {["name"] = "〢Weight", ["value"] = "```" .. tostring(weight) .. "```", ["inline"] = true},
                {["name"] = "〢Value", ["value"] = "```$" .. tostring(price) .. "```", ["inline"] = true},
                {["name"] = "〢Zone", ["value"] = "```" .. tostring(zone) .. "```", ["inline"] = false}
            },
            ["timestamp"] = DateTime.now():ToIsoDate()
        }}
    }
    pcall(function() (request or http_request or syn.request)({Url = url, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = HttpService:JSONEncode(data)}) end)
end

local function AutoHookFish()
    local RS = game:GetService("ReplicatedStorage")
    local CatchRemote = nil
    for _, v in pairs(RS:GetDescendants()) do if v:IsA("RemoteEvent") and (v.Name:find("Catch") or v.Name:find("Fish")) then CatchRemote = v; break end end

    if CatchRemote then
        CatchRemote.OnClientEvent:Connect(function(...)
            local args = {...}
            if not _G.WebhookEnabled then return end

            local playerName = tostring(args[1])
            local rarity, fishName, weight, zone, price = "Common", "Unknown", "0kg", "Ocean", 0
            local validRarities = {"Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic", "Secret"}

            for i, v in ipairs(args) do
                local s = tostring(v)
                if table.find(validRarities, s) then rarity = s
                elseif s:match("%d+%.?%d*kg") then weight = s
                elseif type(v) == "number" and v > 2 then price = v
                elseif s:find("Zone") or s:find("Ocean") then zone = s
                end
            end
            
            for i, v in ipairs(args) do
                local s = tostring(v)
                if type(v) == "string" and i > 1 and not table.find(validRarities, s) and not s:find("kg") and not s:find("Zone") and s ~= playerName then
                    fishName = s; break
                end
            end

            if #SelectedTiers > 0 then
                local isMatch = false
                for _, t in pairs(SelectedTiers) do if rarity:lower() == t:lower() then isMatch = true break end end
                if not isMatch then return end
            end

            SendFishNotification(fishName, rarity, price, zone, nil, "None", weight, playerName)
        end)
    end
end

task.spawn(AutoHookFish)
ShowPage("Info")
