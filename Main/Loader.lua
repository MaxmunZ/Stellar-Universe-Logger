-- [[ STELLAR SYSTEM LOADER ]]
repeat task.wait() until game:IsLoaded()

local games = {
    [6701277882] = "https://raw.githubusercontent.com/MaxmunZ/Stellar-Universe-Logger/main/Games/FishIt.lua",
}

local scriptURL = games[game.PlaceId]

if scriptURL then
    loadstring(game:HttpGet(scriptURL))()
else
    warn("Stellar System: Game ID " .. game.PlaceId .. " belum didukung.")
end
