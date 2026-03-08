local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

-- Fungsi interaksi aman
local function safeFire(p)
    if not p then return end
    p.HoldDuration = 0
    p.RequiresLineOfSight = false
    if typeof(fireproximityprompt) == "function" then 
        fireproximityprompt(p)
    else 
        p:InputHoldBegin() task.wait(0.1) p:InputHoldEnd() 
    end
end

-- Fungsi Tween Speed 60
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

-- Fungsi mencari satu target yang masih aktif
local function getNextTarget()
    for _, obj in pairs(workspace:GetChildren()) do
        if obj.Name == "Bordighera" then
            local prompt = obj:FindFirstChildWhichIsA("ProximityPrompt", true)
            if prompt and prompt.Enabled then
                return obj, prompt
            end
        end
    end
    return nil, nil
end

local function scanBordighera()
    print("🔍 Memulai pemindaian Anti-Skip...")

    while true do
        local targetObj, targetPrompt = getNextTarget()
        
        -- Jika sudah tidak ada lagi yang aktif, berhenti
        if not targetObj then 
            print("✨ Tidak ada lagi Bordighera aktif ditemukan.")
            break 
        end

        print("📍 Menuju: " .. targetObj.Name)
        tweenTo(targetObj:GetPivot() * CFrame.new(0, 3, 0))
        task.wait(1)

        -- Loop interaksi pada objek ini sampai mati
        local attempts = 0
        while targetPrompt and targetPrompt.Parent and targetPrompt.Enabled do
            attempts = attempts + 1
            print("⚡ Firing " .. targetObj.Name .. " (Cek ke-" .. attempts .. ")")
            safeFire(targetPrompt)
            task.wait(3) -- Cooldown 1 detik

            -- Double check status
            if not targetPrompt or not targetPrompt.Enabled then break end
            
            -- Anti-stuck jika lebih dari 10x
            if attempts > 10 then break end
        end
        
        task.wait(0.5) -- Jeda antar objek
    end
    
    print("✅ Pembersihan Selesai.")
end

scanBordighera()


