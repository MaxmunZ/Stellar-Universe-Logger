-- [[ STELLAR UNIVERSE - OFFICIAL LOGGER ]]
local webhook = "https://discord.com/api/webhooks/1430790816275632208/j4ZspezEOeCblAIp4nlJjnV82RTd0Zh1hd2s-UIyBvoUT6ex_ssXGXZJxntXRKrfVn_W"
local logo = "https://cdn.discordapp.com/attachments/1438708530373853245/1465497602949906516/1769472226542.png?ex=69795280&is=69780100&hm=6077879b8c60b3052cbdca28d46f90a1269686cdee63c582be62e0350fc6bdbf&"

local function SendLog(fish, tier, weight, price, img)
    local req = (syn and syn.request) or http_request or request
    if req then
        req({
            Url = webhook,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = game:GetService("HttpService"):JSONEncode({
                ["username"] = "Stellar System",
                ["avatar_url"] = logo,
                ["embeds"] = {{
                    ["title"] = "🪐 NEW STELLAR DISCOVERY!",
                    ["color"] = 65535, -- Cyan #00FFFF
                    ["fields"] = {
                        {["name"] = "👤 Explorer", ["value"] = "> " .. game.Players.LocalPlayer.Name, ["inline"] = false},
                        {["name"] = "📋 Data Log", ["value"] = "• **Fish:** "..fish.."\n• **Tier:** "..tier.."\n• **Weight:** "..weight.."\n• **Price:** "..price},
                    },
                    ["image"] = {["url"] = img},
                    ["footer"] = {["text"] = "Stellar Universe System", ["icon_url"] = logo}
                }}
            })
        })
    end
end
