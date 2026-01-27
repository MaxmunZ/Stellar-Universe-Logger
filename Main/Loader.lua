-- [[ STELLAR SYSTEM LOADER ]]
repeat task.wait() until game:IsLoaded()

local games = {
    [6701277882] = "https://raw.githubusercontent.com/MaxmunZ/Stellar-Universe-Logger/main/Games/FishIt.lua",
    -- Anda bisa tambah ID game lain di bawah sini nanti
}

local scriptURL = games[game.PlaceId]

if scriptURL then
    -- Memanggil menu utama
    loadstring(game:HttpGet(scriptURL))()
else
    -- Notifikasi jika game tidak terdaftar
    game.StarterGui:SetCore("SendNotification", {
        Title = "Stellar System",
        Text = "Game tidak didukung!",
        Duration = 5
    })
end
