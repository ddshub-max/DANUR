local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

-- Fungsi interaksi aman (Safe Fire)
local function safeFire(p)
    if not p then return end
    p.HoldDuration = 0
    p.RequiresLineOfSight = false
    
    -- Jeda acak sedikit agar tidak terdeteksi bot murni
    task.wait(math.random(1, 5) / 10)

    if typeof(fireproximityprompt) == "function" then 
        fireproximityprompt(p)
    else 
        p:InputHoldBegin() task.wait(0.1) p:InputHoldEnd() 
    end
end

-- Fungsi Tween Speed 30
local function tweenTo(targetCFrame)
    local distance = (root.Position - targetCFrame.Position).Magnitude
    if distance < 1 then return end
    local speed = 30 
    local duration = distance / speed
    local info = TweenInfo.new(duration, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(root, info, {CFrame = targetCFrame})
    tween:Play()
    tween.Completed:Wait()
end

-- FUNGSI BARU: Mencari target yang PALING DEKAT
local function getClosestTarget()
    local closestObj = nil
    local closestPrompt = nil
    local shortestDistance = math.huge -- Set awal ke tak terhingga

    for _, obj in pairs(workspace:GetChildren()) do
        if obj.Name == "Bordighera" then
            local prompt = obj:FindFirstChildWhichIsA("ProximityPrompt", true)
            
            -- Cek apakah prompt ada dan aktif
            if prompt and prompt.Enabled then
                local dist = (root.Position - obj:GetPivot().Position).Magnitude
                
                -- Jika jaraknya lebih dekat dari yang sebelumnya ditemukan
                if dist < shortestDistance then
                    shortestDistance = dist
                    closestObj = obj
                    closestPrompt = prompt
                end
            end
        end
    end
    return closestObj, closestPrompt
end

local function scanBordighera()
    print("🎯 Memulai pemindaian dengan Prioritas Terdekat...")

    while true do
        -- Cari yang paling dekat dari posisi saat ini
        local targetObj, targetPrompt = getClosestTarget()
        
        if not targetObj then 
            print("✨ Semua Bordighera sudah dibersihkan.")
            break 
        end

        print("📍 Menuju terdekat: " .. targetObj.Name .. " (Jarak: " .. math.floor((root.Position - targetObj:GetPivot().Position).Magnitude) .. " studs)")
        
        -- Bergerak ke target (turunkan offset ke 1.5 agar lebih menapak)
        tweenTo(targetObj:GetPivot() * CFrame.new(0, 1.5, 0))
        
        -- Jeda sinkronisasi posisi untuk menghindari kick magnitude
        task.wait(1.5)

        local attempts = 0
        while targetPrompt and targetPrompt.Parent and targetPrompt.Enabled do
            attempts = attempts + 1
            print("⚡ Firing " .. targetObj.Name .. " (Cek ke-" .. attempts .. ")")
            
            safeFire(targetPrompt)
            
            -- Cooldown (Gunakan 3 detik sesuai skrip terakhirmu agar aman)
            task.wait(3)

            if not targetPrompt or not targetPrompt.Enabled then break end
            if attempts > 8 then break end
        end
        
        task.wait(0.5) 
    end
    
    print("✅ Tugas Selesai.")
end

scanBordighera()
