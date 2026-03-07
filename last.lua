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
    print("🔍 Mencari semua Bordighera di Workspace...")
    
    -- Mengambil semua objek langsung dari workspace
    local objects = workspace:GetChildren()
    local foundCount = 0

    for _, obj in pairs(objects) do
        -- Cek apakah nama objek adalah "Bordighera"
        if obj.Name == "Bordighera" then
            foundCount = foundCount + 1
            print("📍 Menuju Bordighera ke-" .. foundCount)
            
            -- Teleport ke model
            root.CFrame = obj:GetPivot() * CFrame.new(0, 3, 0)
            task.wait(0.5)
            
            -- Cari prompt di dalam model tersebut (termasuk child-nya)
            local prompt = obj:FindFirstChildWhichIsA("ProximityPrompt", true)
            
            if prompt then
                -- LOOPING: Terus tekan sampai server set Enable = false
                while prompt and prompt.Enabled == true do
                    print("⚡ Firing prompt " .. obj.Name .. "...")
                    safeFire(prompt)
                    
                    -- Jeda agar server punya waktu untuk memproses dan mengirim balik status false
                    task.wait(0.5) 
                    
                    -- Proteksi jika objek tiba-tiba dihapus dari game
                    if not prompt.Parent or not prompt:IsDescendantOf(workspace) then
                        break
                    end
                end
                print("✅ Berhasil dinonaktifkan!")
            else
                warn("⚠️ Tidak ada prompt di model ini.")
            end
            task.wait(0.2)
        end
    end
    
    if foundCount == 0 then
        warn("❌ Tidak ditemukan objek dengan nama 'Bordighera' di Workspace.")
    else
        print("✨ Selesai memproses " .. foundCount .. " Bordighera.")
    end
end

scanBordighera()
