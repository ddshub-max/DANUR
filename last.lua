local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

-- Fungsi interaksi aman
local function safeFire(p)
    p.HoldDuration = 0
    p.RequiresLineOfSight = false
    
    if typeof(fireproximityprompt) == "function" then 
        fireproximityprompt(p)
    else 
        p:InputHoldBegin() 
        task.wait(0.1)
        p:InputHoldEnd() 
    end
end

local function scanBordighera()
    print("🔍 Mencari Bordighera dengan Cooldown 3 Detik...")
    
    local objects = workspace:GetChildren()
    local foundCount = 0

    for _, obj in pairs(objects) do
        if obj.Name == "Bordighera" then
            -- Cari prompt di dalam model
            local prompt = obj:FindFirstChildWhichIsA("ProximityPrompt", true)
            
            -- HANYA proses jika prompt ada dan masih Enabled
            if prompt and prompt.Enabled == true then
                foundCount = foundCount + 1
                print("📍 Menuju Bordighera ke-" .. foundCount .. " (" .. obj.Name .. ")")
                
                -- Teleport ke model
                root.CFrame = obj:GetPivot() * CFrame.new(0, 3, 0)
                task.wait(0.5)
                
                -- LOOPING: Fokus pada satu Bordighera sampai kelar
                while prompt and prompt.Parent and prompt.Enabled == true do
                    print("⚡ Firing prompt... Menunggu cooldown 3 detik.")
                    safeFire(prompt)
                    
                    -- Cooldown 3 detik sesuai permintaan
                    task.wait(3) 
                    
                    -- Cek ulang status setelah cooldown untuk mencegah race condition
                    if not prompt or not prompt.Parent or not prompt.Enabled then
                        break
                    end
                end
                
                print("✅ Proximity mati atau objek hilang. Mencari Bordighera selanjutnya...")
            end
            
            -- Jeda kecil sebelum pindah ke pencarian objek berikutnya di loop besar
            task.wait(0.1)
        end
    end
    
    print("✨ Selesai. Total " .. foundCount .. " Bordighera diproses.")
end

scanBordighera()
