local Players = game:GetService("Players")
local player = Players.LocalPlayer
local root = (player.Character or player.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
local frame = workspace:WaitForChild("RKDKCW_RotatingFrame")

local function safeFire(p)
    -- Memastikan prompt siap diinteraksi
    p.HoldDuration = 0
    p.RequiresLineOfSight = false
    
    if typeof(fireproximityprompt) == "function" then 
        fireproximityprompt(p)
    else 
        p:InputHoldBegin() 
        task.wait(0.05) -- Jeda super singkat untuk simulasi tekan
        p:InputHoldEnd() 
    end
end

for _, obj in pairs(frame:GetChildren()) do
    -- Mencari semua yang namanya mengandung Bordighera
    if obj.Name:match("Bordighera") then
        print("📍 Fokus pada: " .. obj.Name)
        
        -- Teleport tepat di atas objek
        root.CFrame = obj:GetPivot() * CFrame.new(0, 3, 0)
        task.wait(0.3)
        
        -- Cari prompt di dalam objek
        local p = obj:FindFirstChildWhichIsA("ProximityPrompt", true)
        
        if p then
            -- LOOPING TANPA BATAS: Terus fire sampai Enabled jadi false
            local attempt = 0
            while p and p.Enabled do
                attempt = attempt + 1
                print("⚡ Mencoba " .. obj.Name .. " - Percobaan ke: " .. attempt)
                
                safeFire(p)
                
                -- Jeda 0.2 detik per klik agar server sempat memproses
                -- Kalau terlalu cepat (0 detik), seringkali server malah mengabaikan
                task.wait(0.2) 
                
                -- Tambahan: Jika objek tiba-tiba hancur/hilang dari workspace, stop.
                if not p.Parent or not p.Parent:IsDescendantOf(workspace) then
                    break
                end
            end
            print("✅ Berhasil! " .. obj.Name .. " sudah nonaktif.")
        end
    end
end

print("✨ Step 4 Selesai Sepenuhnya!")
