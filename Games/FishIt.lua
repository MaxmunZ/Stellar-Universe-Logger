-- [[ STELLAR SYSTEM FINAL UI - REVISED VERSION ]]
-- Developer: Luc Aetheryn
-- Fix: Webhook Test Functionality for Executors

local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")

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

if CoreGui:FindFirstChild("StellarFinal") then CoreGui.StellarFinal:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "StellarFinal"
ScreenGui.ResetOnSpawn = false

-- [[ 1. SEARCH MENU (FLOATING) ]]
local SearchMenu = Instance.new("Frame", ScreenGui)
SearchMenu.Size = UDim2.fromOffset(180, 240); SearchMenu.Position = UDim2.new(0.5, 260, 0.5, -120)
SearchMenu.BackgroundColor3 = Color3.fromRGB(35, 35, 45); SearchMenu.Visible = false
local SStroke = Instance.new("UIStroke", SearchMenu); SStroke.Color = Color3.fromRGB(255, 50, 150); SStroke.Thickness = 2
Instance.new("UICorner", SearchMenu)

local SList = Instance.new("ScrollingFrame", SearchMenu); SList.Size = UDim2.new(1, 0, 1, -10); SList.BackgroundTransparency = 1; SList.ScrollBarThickness = 0
Instance.new("UIListLayout", SList)
local SelectedTiers = {} -- Tempat menyimpan pilihan yang dipilih

for _, t in pairs({"Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic", "Secret"}) do
    local b = Instance.new("TextButton", SList)
    b.Size = UDim2.new(1, 0, 0, 30)
    b.Text = t
    b.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    b.TextColor3 = Color3.fromRGB(200, 200, 200)
    b.Font = Enum.Font.Gotham
    b.BorderSizePixel = 0
    
    b.MouseButton1Click:Connect(function()
        if table.find(SelectedTiers, t) then
            -- Jika sudah ada, hapus dari daftar (Deselect)
            for i, v in ipairs(SelectedTiers) do
                if v == t then table.remove(SelectedTiers, i) end
            end
            b.TextColor3 = Color3.fromRGB(200, 200, 200) -- Warna normal
        else
            -- Jika belum ada, tambahkan ke daftar (Select)
            table.insert(SelectedTiers, t)
            b.TextColor3 = Color3.fromRGB(255, 50, 150) -- Warna pink (aktif)
        end
        
        -- Update teks tombol di Webhook Page agar menampilkan pilihan
        if _G.TierBtn then
            if #SelectedTiers == 0 then
                _G.TierBtn.Text = "Select Options"
            else
                _G.TierBtn.Text = table.concat(SelectedTiers, ", ")
            end
        end
    end)
end

-- Tambahkan tombol "Close" di bawah list agar user bisa menutup menu setelah memilih
local CloseSearch = Instance.new("TextButton", SearchMenu)
CloseSearch.Size = UDim2.new(1, 0, 0, 25)
CloseSearch.Position = UDim2.new(0, 0, 1, 0)
CloseSearch.BackgroundColor3 = Color3.fromRGB(255, 50, 150)
CloseSearch.Text = "Done"
CloseSearch.TextColor3 = Color3.new(1,1,1)
CloseSearch.MouseButton1Click:Connect(function() SearchMenu.Visible = false end)


-- [[ 2. MAIN FRAME & CONTROLS ]]
local FloatBtn = Instance.new("ImageButton", ScreenGui); FloatBtn.Size = UDim2.fromOffset(50, 50); FloatBtn.Position = UDim2.new(0.05, 0, 0.2, 0); FloatBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 35); FloatBtn.Image = LogoStellar; FloatBtn.Visible = false; FloatBtn.Active = true; FloatBtn.Draggable = true; Instance.new("UICorner", FloatBtn).CornerRadius = UDim.new(1, 0)

local Main = Instance.new("Frame", ScreenGui); Main.Size = UDim2.fromOffset(500, 320); Main.Position = UDim2.new(0.5, -250, 0.5, -160); Main.BackgroundColor3 = Color3.fromRGB(25, 25, 35); Main.Active = true; Main.Draggable = true; Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 6)

local CloseBtn = Instance.new("TextButton", Main); CloseBtn.Text = "×"; CloseBtn.Size = UDim2.fromOffset(30, 30); CloseBtn.Position = UDim2.new(1, -40, 0, 5); CloseBtn.BackgroundTransparency = 1; CloseBtn.TextColor3 = Color3.fromRGB(255, 80, 80); CloseBtn.TextSize = 25; CloseBtn.Font = Enum.Font.GothamBold
local MiniBtn = Instance.new("TextButton", Main); MiniBtn.Text = "−"; MiniBtn.Size = UDim2.fromOffset(30, 30); MiniBtn.Position = UDim2.new(1, -75, 0, 5); MiniBtn.BackgroundTransparency = 1; MiniBtn.TextColor3 = Color3.new(1, 1, 1); MiniBtn.TextSize = 25; MiniBtn.Font = Enum.Font.GothamBold

MiniBtn.MouseButton1Click:Connect(function() Main.Visible = false; FloatBtn.Visible = true end)
FloatBtn.MouseButton1Click:Connect(function() Main.Visible = true; FloatBtn.Visible = false end)
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- [[ 3. HEADER & SIDEBAR ]]
local Header = Instance.new("Frame", Main); Header.Size = UDim2.new(1, -90, 0, 40); Header.BackgroundTransparency = 1
local TitleLogo = Instance.new("ImageLabel", Header); TitleLogo.Size = UDim2.fromOffset(20, 20); TitleLogo.Position = UDim2.new(0, 12, 0.5, -10); TitleLogo.Image = LogoStellar; TitleLogo.BackgroundTransparency = 1; TitleLogo.ScaleType = Enum.ScaleType.Fit
local Title = Instance.new("TextLabel", Header); Title.Text = "Stellar System | Fish It"; Title.Font = Enum.Font.GothamMedium; Title.TextColor3 = Color3.new(1, 1, 1); Title.TextSize = 15; Title.Position = UDim2.new(0, 40, 0, 0); Title.Size = UDim2.new(1, -40, 1, 0); Title.TextXAlignment = 0; Title.BackgroundTransparency = 1

local Sidebar = Instance.new("Frame", Main); Sidebar.Position = UDim2.new(0, 10, 0, 50); Sidebar.Size = UDim2.new(0, 150, 1, -60); Sidebar.BackgroundTransparency = 1; Instance.new("UIListLayout", Sidebar).Padding = UDim.new(0, 6)

-- [[ 4. CONTENT AREA & PAGE SYSTEM ]]
local Content = Instance.new("Frame", Main); Content.Position = UDim2.new(0, 170, 0, 50); Content.Size = UDim2.new(1, -180, 1, -60); Content.BackgroundColor3 = Color3.fromRGB(20, 20, 28); Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 6)

local Pages = {}
local TabButtons = {}

local function CreatePage(name, scroll)
    local P = scroll and Instance.new("ScrollingFrame", Content) or Instance.new("Frame", Content)
    P.Size = UDim2.new(1, 0, 1, 0); P.BackgroundTransparency = 1; P.Visible = false
    if scroll then P.ScrollBarThickness = 2; P.CanvasSize = UDim2.new(0, 0, 0, 550); P.ScrollBarImageColor3 = Color3.fromRGB(255, 50, 150) end
    Pages[name] = P; return P
end

-- [[ INFO PAGE ]]
local InfoPage = CreatePage("Info", false)
local HubTitle = Instance.new("TextLabel", InfoPage); HubTitle.Text = "-- Stellar System Hub --"; HubTitle.Size = UDim2.new(1, 0, 0, 45); HubTitle.Font = Enum.Font.GothamBold; HubTitle.TextSize = 18; HubTitle.TextColor3 = Color3.new(1, 1, 1); HubTitle.BackgroundTransparency = 1

local function AddInfoRow(lbl, val, y)
    local F = Instance.new("Frame", InfoPage); F.BackgroundTransparency = 1; F.Size = UDim2.new(0.9, 0, 0, 18); F.Position = UDim2.new(0.05, 0, y, 0)
    local L = Instance.new("TextLabel", F); L.Text = lbl; L.Size = UDim2.new(0, 85, 1, 0); L.Font = Enum.Font.Gotham; L.TextColor3 = Color3.fromRGB(220, 220, 220); L.TextXAlignment = 0; L.BackgroundTransparency = 1
    local V = Instance.new("TextLabel", F); V.Text = ":  "..val; V.Position = UDim2.new(0, 85, 0, 0); V.Size = UDim2.new(1, -85, 1, 0); V.Font = Enum.Font.Gotham; V.TextColor3 = Color3.fromRGB(220, 220, 220); V.TextXAlignment = 0; V.BackgroundTransparency = 1
end
AddInfoRow("Version", "V1.0.0 [BETA]", 0.22); AddInfoRow("Owner", "Luc Aetheryn", 0.29); AddInfoRow("Status", "Undetected", 0.36); AddInfoRow("Last Update", "Jan 27, 2026", 0.43)

-- DISCORD UI
local Line = Instance.new("Frame", InfoPage); Line.Position = UDim2.new(0.05, 0, 0.52, 0); Line.Size = UDim2.new(0.9, 0, 0, 3); Line.BorderSizePixel = 0; local G = Instance.new("UIGradient", Line); G.Color = ColorSequence.new(Color3.fromRGB(255, 50, 150), Color3.fromRGB(120, 20, 150))
local DBox = Instance.new("Frame", InfoPage); DBox.Position = UDim2.new(0.05, 0, 0.58, 0); DBox.Size = UDim2.new(0.9, 0, 0, 60); DBox.BackgroundColor3 = Color3.fromRGB(35, 35, 45); Instance.new("UICorner", DBox)
local DIcon = Instance.new("ImageLabel", DBox); DIcon.Size = UDim2.fromOffset(40, 40); DIcon.Position = UDim2.new(0, 10, 0.5, -20); DIcon.Image = LogoDiscord; DIcon.BackgroundTransparency = 1; DIcon.ScaleType = Enum.ScaleType.Fit
local DName = Instance.new("TextLabel", DBox); DName.Text = "Stellar Discord"; DName.Position = UDim2.new(0, 60, 0.2, 0); DName.Size = UDim2.new(1, -70, 0.4, 0); DName.Font = Enum.Font.GothamBold; DName.TextColor3 = Color3.new(1, 1, 1); DName.TextXAlignment = 0; DName.BackgroundTransparency = 1
local DSub = Instance.new("TextLabel", DBox); DSub.Text = "Official Link Discord Server"; DSub.Position = UDim2.new(0, 60, 0.5, 0); DSub.Size = UDim2.new(1, -70, 0.4, 0); DSub.Font = Enum.Font.Gotham; DSub.TextColor3 = Color3.fromRGB(200, 200, 200); DSub.TextXAlignment = 0; DSub.BackgroundTransparency = 1
local CopyBtn = Instance.new("TextButton", InfoPage); CopyBtn.Position = UDim2.new(0.05, 0, 0.82, 0); CopyBtn.Size = UDim2.new(0.9, 0, 0, 32); CopyBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55); CopyBtn.Text = "Copy Link Discord"; CopyBtn.Font = Enum.Font.Gotham; CopyBtn.TextColor3 = Color3.new(1, 1, 1); Instance.new("UICorner", CopyBtn)
CopyBtn.MouseButton1Click:Connect(function() setclipboard("https://discord.gg/QEhHc6UBHH"); CopyBtn.Text = "Copied!"; task.wait(2); CopyBtn.Text = "Copy Link Discord" end)

-- [[ WEBHOOK PAGE ]]
local WebhookPage = CreatePage("Webhook", true)
local WhTitle = Instance.new("TextLabel", WebhookPage); WhTitle.Text = "Webhook Settings"; WhTitle.Size = UDim2.new(1, 0, 0, 40); WhTitle.Font = Enum.Font.GothamBold; WhTitle.TextSize = 20; WhTitle.TextColor3 = Color3.new(1,1,1); WhTitle.BackgroundTransparency = 1

local function AddInput(lbl, y, placeholder)
    local L = Instance.new("TextLabel", WebhookPage); L.Text = lbl; L.Size = UDim2.new(0.9, 0, 0, 20); L.Position = UDim2.new(0.05, 0, 0, y); L.Font = Enum.Font.Gotham; L.TextColor3 = Color3.new(1,1,1); L.TextXAlignment = 0; L.BackgroundTransparency = 1
    local I = Instance.new("TextBox", WebhookPage); I.Size = UDim2.new(0.9, 0, 0, 35); I.Position = UDim2.new(0.05, 0, 0, y+22); I.BackgroundColor3 = Color3.fromRGB(30, 30, 40); I.PlaceholderText = placeholder; I.Text = ""; I.TextColor3 = Color3.new(1, 1, 1); Instance.new("UICorner", I)
    return I
end

local DiscordIDBox = AddInput("Input ID Discord", 50, "Input Here")
local WebhookURLBox = AddInput("Webhook URL", 115, "Input Here")

local function AddWhFilter(lbl, y, search)
    local F = Instance.new("Frame", WebhookPage)
    F.Size = UDim2.new(0.9, 0, 0, 35)
    F.Position = UDim2.new(0.05, 0, 0, y)
    F.BackgroundTransparency = 1
    
    local L = Instance.new("TextLabel", F)
    L.Text = lbl
    L.Size = UDim2.new(0.4, 0, 1, 0)
    L.Font = Enum.Font.Gotham
    L.TextColor3 = Color3.new(1, 1, 1)
    L.TextXAlignment = 0; L.BackgroundTransparency = 1
    
    local B = Instance.new("TextButton", F)
    B.Text = "Select Options"
    B.Position = UDim2.new(0.4, 0, 0, 0)
    B.Size = UDim2.new(0.6, 0, 1, 0)
    B.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    B.TextColor3 = Color3.fromRGB(200, 200, 200)
    Instance.new("UICorner", B)
    
    -- JIKA INI ADALAH TIER FILTER, SIMPAN REFERENSINYA
    if lbl == "Tier Filter" then
        _G.TierBtn = B
    end

    if search then 
        B.MouseButton1Click:Connect(function() 
            SearchMenu.Visible = not SearchMenu.Visible 
        end) 
    end
end

AddWhFilter("Tier Filter", 185, true)
AddWhFilter("Variant Filter", 225, false)
AddWhFilter("Name Filter", 265, false)

local function AddWhToggle(lbl, y)
    local F = Instance.new("Frame", WebhookPage); F.Size = UDim2.new(0.9, 0, 0, 35); F.Position = UDim2.new(0.05, 0, 0, y); F.BackgroundTransparency = 1
    local L = Instance.new("TextLabel", F); L.Text = lbl; L.Size = UDim2.new(0.7, 0, 1, 0); L.Font = Enum.Font.Gotham; L.TextColor3 = Color3.new(1, 1, 1); L.TextXAlignment = 0; L.BackgroundTransparency = 1
    local BG = Instance.new("TextButton", F); BG.Size = UDim2.fromOffset(45, 22); BG.Position = UDim2.new(1, -45, 0.5, -11); BG.BackgroundColor3 = Color3.fromRGB(45, 45, 55); BG.Text = ""; Instance.new("UICorner", BG).CornerRadius = UDim.new(1, 0)
    local T = Instance.new("Frame", BG); T.Size = UDim2.fromOffset(18, 18); T.Position = UDim2.new(0, 2, 0.5, -9); T.BackgroundColor3 = Color3.new(1,1,1); Instance.new("UICorner", T).CornerRadius = UDim.new(1, 0)
    
    BG.MouseButton1Click:Connect(function() 
        local s = BG.BackgroundColor3 == Color3.fromRGB(45, 45, 55)
        BG.BackgroundColor3 = s and Color3.fromRGB(255, 50, 150) or Color3.fromRGB(45, 45, 55)
        TweenService:Create(T, TweenInfo.new(0.2), {Position = s and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)}):Play()
        
        -- SIMPAN STATUS TOGEL
        if lbl == "Send Fish Webhook" then _G.WebhookEnabled = s end
    end)
end

AddWhToggle("Send Fish Webhook", 310)

local TestBtn = Instance.new("TextButton", WebhookPage); TestBtn.Size = UDim2.new(0.9, 0, 0, 35); TestBtn.Position = UDim2.new(0.05, 0, 0, 355); TestBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55); TestBtn.Text = "Tests Webhook Connection"; TestBtn.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", TestBtn)

-- [[ FIX: PENGGUNAAN REQUEST UNTUK EXECUTOR ]]
TestBtn.MouseButton1Click:Connect(function()
    local url = WebhookURL.Text:gsub("%s+", "")
    if url == "" or not url:find("discord") then
        TestBtn.Text = "Invalid Webhook URL!"
        task.wait(2)
        TestBtn.Text = "Tests Webhook Connection"
        return
    end

    local payload = HttpService:JSONEncode({
        ["content"] = DiscordID.Text ~= "" and "Notification for <@"..DiscordID.Text..">" or "Stellar System Test",
        ["embeds"] = {{
            ["title"] = "Connection Test",
            ["description"] = "Webhook is connected!",
            ["color"] = 41727,
            ["image"] = {["url"] = "https://raw.githubusercontent.com/MaxmunZ/Stellar-Assets/main/HelloChat.png"}
        }}
    })

    local success, response = pcall(function()
        return (request or http_request or syn.request)({
            Url = url,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = payload
        })
    end)

    if success then
        TestBtn.Text = "Successfully Sent!"
    else
        TestBtn.Text = "Failed To Send"
    end
    task.wait(2)
    TestBtn.Text = "Test Webhook Connection"
end)

-- [[ 5. TAB SYSTEM ]]
local function ShowPage(name)
    for k, v in pairs(Pages) do v.Visible = (k == name) end
    for k, v in pairs(TabButtons) do v.BackgroundColor3 = (k == name) and Color3.fromRGB(255, 50, 150) or Color3.fromRGB(35, 35, 45) end
end

for _, name in pairs({"Info", "Fishing", "Automatically", "Menu", "Quest", "Webhook", "Config"}) do
    if not Pages[name] then CreatePage(name, false) end
    local B = Instance.new("TextButton", Sidebar); B.Size = UDim2.new(1, 0, 0, 32); B.BackgroundColor3 = Color3.fromRGB(35, 35, 45); B.Text = "|| " .. name; B.TextColor3 = Color3.fromRGB(200, 200, 200); B.Font = Enum.Font.Gotham; B.TextSize = 13; B.TextXAlignment = 0; Instance.new("UICorner", B).CornerRadius = UDim.new(0, 4); Instance.new("UIPadding", B).PaddingLeft = UDim.new(0, 10)
    TabButtons[name] = B; B.MouseButton1Click:Connect(function() ShowPage(name) end)
end

-- [[ 6. FISHING LOGIC & WEBHOOK SENDER - CUSTOM EMBED VERSION ]]
local function SendFishNotification(name, rarity, price, zone, img, mutation, weight, user)
    if not _G.WebhookEnabled then return end
    
    -- Mengambil teks langsung dari objek UI saat fungsi dipanggil
    local url = WebhookURLBox.Text:gsub("%s+", "")
    if url == "" or not url:find("discord") then return end
    
    -- Filter Tier (Case Insensitive Fix)
    local currentFilter = _G.TierBtn and _G.TierBtn.Text or ""
    if currentFilter ~= "Select Options" and not currentFilter:lower():find(rarity:lower()) then 
        return 
    end

    local embedColor = 16777215
    local r = rarity:lower()
    if r:find("legendary") then embedColor = 16761095
    elseif r:find("mythic") then embedColor = 11342935
    elseif r:find("secret") then embedColor = 16711820 
    end

    local data = {
        ["content"] = DiscordIDBox.Text ~= "" and "🎣 **NEW CATCH!** <@"..DiscordIDBox.Text..">" or "🎣 **NEW CATCH!**",
        ["embeds"] = {{
            ["title"] = "⭐ Stellar System | " .. rarity .. " Catch!",
            ["color"] = embedColor,
            ["fields"] = {
                {["name"] = "👤 Player", ["value"] = "```" .. user .. "```", ["inline"] = true},
                {["name"] = "🐟 Fish", ["value"] = "```" .. name .. "```", ["inline"] = true},
                {["name"] = "✨ Mutation", ["value"] = "```" .. mutation .. "```", ["inline"] = true},
                {["name"] = "💎 Rarity", ["value"] = "```" .. rarity .. "```", ["inline"] = true},
                {["name"] = "⚖️ Weight", ["value"] = "```" .. weight .. "```", ["inline"] = true},
                {["name"] = "💰 Value", ["value"] = "```$" .. price .. "```", ["inline"] = true},
                {["name"] = "📍 Zone", ["value"] = "```" .. zone .. "```", ["inline"] = false}
            },
            ["footer"] = {["text"] = "Stellar System • Luc Aetheryn"},
            ["timestamp"] = DateTime.now():ToIsoDate()
        }}
    }

    pcall(function()
        (request or http_request or syn.request)({
            Url = url,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode(data)
        })
    end)
end

-- [[ 7. UNIVERSAL DETECTOR - DEEP SCAN MODE ]]
local function ForceScan(tab)
    if type(tab) ~= "table" then return nil end
    
    -- Mencari kunci data yang umum digunakan di game fishing
    local n = tab.Name or tab.FishName or tab.fish_name or tab.Id
    local r = tab.Rarity or tab.Tier or tab.rarity_type or tab.Rank
    local p = tab.Price or tab.Value or tab.SellValue or tab.price
    local w = tab.Weight or tab.Lbs or tab.weight
    local m = tab.Mutation or tab.Variant or tab.is_shiny
    local z = tab.Zone or tab.Location or "Dynamic Zone"

    -- Jika minimal ada Nama atau Rarity, kirim!
    if n or r then
        return {
            Name = tostring(n or "Unknown"),
            Rarity = tostring(r or "Common"),
            Price = tostring(p or "0"),
            Weight = tostring(w or "N/A"),
            Mutation = tostring(m or "None"),
            Zone = tostring(z)
        }
    end
    return nil
end

-- Listener Utama
for _, v in pairs(game:GetDescendants()) do
    if v:IsA("RemoteEvent") then
        v.OnClientEvent:Connect(function(...)
            local args = {...}
            for _, arg in pairs(args) do
                if type(arg) == "table" then
                    -- Cek tabel utama
                    local found = ForceScan(arg)
                    
                    -- Jika tidak ketemu di utama, bongkar isinya satu-satu (Deep Scan)
                    if not found then
                        for _, sub in pairs(arg) do
                            if type(sub) == "table" then
                                found = ForceScan(sub)
                                if found then break end
                            end
                        end
                    end
                    
                    if found then
                        SendFishNotification(
                            found.Name, 
                            found.Rarity, 
                            found.Price, 
                            found.Zone, 
                            "", 
                            found.Mutation, 
                            found.Weight, 
                            game.Players.LocalPlayer.Name
                        )
                    end
                end
            end
        end)
    end
end


ShowPage("Info")
