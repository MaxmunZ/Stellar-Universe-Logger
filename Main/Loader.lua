-- [[ STELLAR SYSTEM LOADER - ANTI ERROR ]]
repeat task.wait() until game:IsLoaded()

-- Pastikan link ini mengarah ke file FishIt.lua kamu yang isinya Kavo tadi
local fishItURL = "https://raw.githubusercontent.com/MaxmunZ/Stellar-Universe-Logger/main/Games/FishIt.lua"

-- Daftar ID Game (Gunakan string agar angka besar tidak error)
local games = {
    ["121864768012064"] = fishItURL,
    ["16140080763"] = fishItURL,
}

local currentId = tostring(game.PlaceId)

if games[currentId] then
    print("Stellar: Game terdaftar, memuat...")
    loadstring(game:HttpGet(games[currentId] .. "?t=" .. os.time()))()
else
    print("Stellar: ID " .. currentId .. " tidak terdaftar, tapi tetap memuat FishIt...")
    -- JALUR DARURAT: Tetap panggil script supaya menu muncul
    loadstring(game:HttpGet(fishItURL .. "?t=" .. os.time()))()
end
