-- [[ STELLAR UNIVERSE - OFFICIAL FISH LOGIC ]]
local FishIt = {}

-- Panggil OrionLib di sini agar notifikasi bisa muncul (PENTING!)
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

function FishIt:StartAutoFarm()
    _G.StellarAutoFarm = true
    OrionLib:MakeNotification({
        Name = "Stellar System", 
        Content = "Auto Farm diaktifkan!", 
        Time = 2
    })
    
    task.spawn(function()
        while _G.StellarAutoFarm do
            task.wait(1)
            -- Logika deteksi ikan akan berjalan di sini
            print("Stellar System: Scanning for fish...")
        end
    end)
end

function FishIt:StopAutoFarm()
    _G.StellarAutoFarm = false
    OrionLib:MakeNotification({
        Name = "Stellar System", 
        Content = "Auto Farm dimatikan!", 
        Time = 2
    })
end

function FishIt:SendLog(fish, tier, weight, price)
    local webhookURL = _G.FishWebhook 
    
    if webhookURL and webhookURL ~= "" then
        local request = syn and syn.request or http_request or request
        request({
            Url = webhookURL,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = game:GetService("HttpService"):JSONEncode({
                ["embeds"] = {{
                    ["title"] = "🪐 STELLAR UNIVERSE LOGGER",
                    ["color"] = 65535,
                    ["fields"] = {
                        {["name"] = "👤 Player", ["value"] = game.Players.LocalPlayer.Name, ["inline"] = true},
                        {["name"] = "🐟 Fish", ["value"] = fish, ["inline"] = true},
                        {["name"] = "💎 Tier", ["value"] = tier, ["inline"] = true},
                        {["name"] = "⚖️ Weight", ["value"] = weight, ["inline"] = true}
                    },
                    ["footer"] = {["text"] = "Stellar System v1.2"}
                }}
            })
        })
    end
end

return FishIt
