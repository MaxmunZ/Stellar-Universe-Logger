-- [[ STELLAR SYSTEM LOADER ]]
repeat task.wait() until game:IsLoaded()

local games = {
    -- Masukkan ID Fish It yang baru kamu dapatkan
    [121864768012064] = "https://raw.githubusercontent.com/MaxmunZ/Stellar-Universe-Logger/main/Games/FishIt.lua",
    -- Kamu bisa tambah ID game lain di sini
    [16140080763] = "https://raw.githubusercontent.com/MaxmunZ/Stellar-Universe-Logger/main/Games/FishIt.lua", -- Contoh ID Fisch
}

local scriptURL = games[game.PlaceId]

if scriptURL then
    print("Stellar System: Game Ditemukan! Memuat Script...")
    loadstring(game:HttpGet(scriptURL .. "?t=" .. os.time()))()
else
    print("Stellar System: Game ID " .. game.PlaceId .. " Belum Didukung.")
    -- Opsional: Memuat menu universal jika game tidak terdaftar
end
