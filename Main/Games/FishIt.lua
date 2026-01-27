-- [[ STELLAR UNIVERSE - OFFICIAL FISH LOGIC ]]
local FishIt = {}

function FishIt:StartAutoFarm()
    _G.StellarAutoFarm = true
    OrionLib:MakeNotification({Name = "Stellar System", Content = "Auto Farm diaktifkan!", Time = 2})
    
    task.spawn(function()
        while _G.StellarAutoFarm do
            task.wait(1)
            -- Di sini staff @Arcane akan memasukkan RemoteEvent untuk pancing otomatis
            print("Stellar System: Scanning for fish...")
        end
    end)
end

function FishIt:SendLog(fish, tier, weight, price)
    -- Mengambil webhook dari variabel global yang diisi di GUI (seperti Chloe X)
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
                    }
                }}
            })
        })
    end
end

return FishIt
