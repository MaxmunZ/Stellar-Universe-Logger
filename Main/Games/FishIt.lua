-- [[ STELLAR UNIVERSE - AUTO FARM LOGIC ]]
local FishLogic = {}

-- Fungsi Utama Memancing
function FishLogic:StartAutoFarm()
    _G.AutoFishing = true
    spawn(function()
        while _G.AutoFishing do
            task.wait(1)
            -- Di sini nanti diisi dengan RemoteEvent pancingan game
            print("Stellar System: Menunggu Ikan...")
            
            -- Contoh logika pemicu jika berhasil dapat ikan:
            -- local fishData = "Shark"
            -- local tier = "Legendary"
            -- SendLog(fishData, tier, "50kg", "5000") 
        end
    end)
end

-- Fungsi Berhenti
function FishLogic:StopAutoFarm()
    _G.AutoFishing = false
    print("Stellar System: Pancing Berhenti.")
end

return FishLogic
