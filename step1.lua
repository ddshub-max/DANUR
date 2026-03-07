local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local kitchen = workspace:WaitForChild("Kitchen")
-- Urutan sesuai permintaanmu
local sequence = {"Frying Pan", "Part", "telor", "Part"}

-- Fungsi Trigger Utama
local function trigger(prompt)
    if fireproximityprompt then
        fireproximityprompt(prompt) -- Menggunakan fungsi executor (Instan)
    else
        prompt:InputHoldBegin()
        task.wait(prompt.HoldDuration)
        prompt:InputHoldEnd()
    end
end

local function startCooking()
    for _, name in ipairs(sequence) do
        local target = kitchen:FindFirstChild(name)
        
        if target then
            -- 1. Teleport ke atas objek sedikit (biar gak nyangkut)
            humanoidRootPart.CFrame = target:GetPivot() * CFrame.new(0, 3, 0)
            task.wait(0.2) -- Jeda teleport agar posisi sinkron

            -- 2. Cari Prompt
            local prompt = target:FindFirstChildWhichIsA("ProximityPrompt", true)
            
            if prompt then
                print("🍳 Mengambil/Interaksi: " .. name)
                
                -- Pastikan settingan prompt pas
                prompt.HoldDuration = 0 -- Opsional: buat jadi instan jika mau lebih cepat
                
                trigger(prompt)
                
                -- 3. Jeda 0.3 detik sesuai permintaan sebelum lanjut ke objek berikutnya
                task.wait(0.3)
            else
                warn("⚠️ Prompt tidak ketemu di " .. name)
            end
        else
            warn("❌ Objek " .. name .. " hilang dari Kitchen!")
        end
    end
    print("✅ Urutan masak selesai!")
end

-- Jalankan Fungsi
startCooking()
