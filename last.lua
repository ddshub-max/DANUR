local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
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

-- Fungsi Tween untuk jalan pelan
local function tweenTo(targetCFrame)
    local distance = (root.Position - targetCFrame.Position).Magnitude
    local speed = 50 -- Kamu bisa ubah angka ini untuk mengatur kecepatan (semakin kecil semakin pelan)
    local duration = distance / speed
    
    local info = TweenInfo.new(duration, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(root, info, {CFrame = targetCFrame})
    
    tween:Play()
    tween.Completed:Wait() -- Tunggu sampai sampai di tujuan
end

local function scanBordighera()
    print("🔍 Mencari Bordighera dengan Tween dan Cooldown 1 Detik...")
    
    local objects = workspace:GetChildren()
    local foundCount = 0

    for _, obj in pairs(objects) do
        if obj.Name == "Bordighera" then
            local prompt = obj:FindFirstChildWhichIsA("ProximityPrompt", true)
            
            -- HANYA proses jika prompt ada dan masih Enabled
            if prompt and prompt.Enabled == true then
                foundCount = foundCount + 1
                print("📍 Menuju Bordighera ke-" .. foundCount .. " (" .. obj.Name .. ")")
                
                -- TWEEN ke lokasi (3 stud di atas objek agar tidak nyangkut di lantai)
                local targetCF = obj:GetPivot() * CFrame.new(0, 3, 0)
                tweenTo(targetCF)
                
                task.wait(0.3) -- Jeda singkat setelah sampai sebelum menembak
                
                -- LOOPING: Fokus pada satu Bordighera sampai kelar
                while prompt and prompt.Parent and prompt.Enabled == true do
                    print("⚡ Firing prompt... Menunggu cooldown 1 detik.")
                    safeFire(prompt)
                    
                    task.wait(1) -- Cooldown 1 detik sesuai permintaan
                    
                    -- Verifikasi status setelah cooldown
                    if not prompt or not prompt.Parent or not prompt.Enabled then
                        break
                    end
                end
                
                print("✅ Selesai dengan " .. obj.Name)
            end
        end
    end
    
    print("✨ Seluruh proses Bordighera selesai!")
end

scanBordighera()

