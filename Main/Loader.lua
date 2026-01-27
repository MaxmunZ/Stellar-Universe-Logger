-- [[ STELLAR SYSTEM LOADER ]]
repeat task.wait() until game:IsLoaded()

-- Gunakan tanda kutip ["nomor"] agar ID panjang tidak error
local games = {
    ["121864768012064"] = "https://raw.githubusercontent.com/MaxmunZ/Stellar-Universe-Logger/main/Games/FishIt.lua",
    ["16140080763"] = "https://raw.githubusercontent.com/MaxmunZ/Stellar-Universe-Logger/main/Games/FishIt.lua",
}

-- Ubah ID game yang sedang dimainkan jadi teks juga supaya cocok
local currentId = tostring(game.PlaceId)
local scriptURL = games[currentId]

if scriptURL then
    print("Stellar System: Game Ditemukan (" .. currentId .. ")! Memuat Script...")
    -- Memanggil script dari GitHub kamu
    local success, err = pcall(function()
        loadstring(game:HttpGet(scriptURL .. "?t=" .. os.time()))()
    end)
    
    if not success then
        warn("Stellar System: Gagal memuat file game! Error: " .. err)
    end
else
    print("Stellar System: Game ID " .. currentId .. " Belum Didukung.")
    -- JALUR DARURAT: Jika ID tidak cocok, tetap coba panggil FishIt.lua buat ngetes
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MaxmunZ/Stellar-Universe-Logger/main/Games/FishIt.lua"))()
end
