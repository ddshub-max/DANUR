local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

-- Folder Target
local frame = workspace:WaitForChild("RKDKCW_RotatingFrame")

-- Fungsi interaksi aman (Safe Fire)
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

-- Fungsi Tween dengan Speed 60
local function tweenTo(targetCFrame)
    local distance = (root.Position - targetCFrame.Position).Magnitude
    local speed = 60 -- Sesuai permintaan: Speed 60
    local duration = distance / speed
    
    local info = TweenInfo.new(duration, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(root, info, {CFrame = targetCFrame})
    
    tween:Play()
    tween.Completed:Wait() -- Tunggu sampai sampai tujuan
end

local function runBordigheraTask()
    print("🚀 Memulai pembersihan Bordighera (Tween Speed 60)...")

    for _, obj in pairs(frame:GetChildren()) do
        -- Mencari objek yang mengandung nama "Bordighera"
        if obj.Name:match("Bordighera") then
            local prompt = obj:FindFirstChildWhichIsA("ProximityPrompt", true)
            
            -- HANYA jalan jika prompt ada dan aktif (Enabled)
            if prompt and prompt.Enabled then
                print("📍 Menuju: " .. obj.Name)
                
                -- Tween ke posisi 3 stud di atas objek
                local targetCF = obj:GetPivot() * CFrame.new(0, 3, 0)
                tweenTo(targetCF)
                
                task.wait(0.3) -- Jeda sebentar setelah sampai
                
                -- LOOPING: Terus fire sampai Enabled jadi false
                while prompt and prompt.Parent and prompt.Enabled do
                    print("⚡ Firing " .. obj.Name .. "...")
                    safeFire(prompt)
                    
                    task.wait(1) -- Cooldown 1 detik sesuai skrip sebelumnya
                    
                    -- Proteksi: Cek ulang status sebelum looping lagi
                    if not prompt or not prompt.Parent or not prompt.Enabled then
                        break
                    end
                end
                print("✅ " .. obj.Name .. " dinonaktifkan.")
            end
        end
    end
    print("✨ Seluruh Bordighera di RotatingFrame selesai!")
end

runBordigheraTask()
