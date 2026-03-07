local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local backpack = player:WaitForChild("Backpack")

-- Folder & Target
local targetDoor = workspace:WaitForChild("WilliamDoor")

local function runWilliamDoorStep()
    print("🔑 Menjalankan Step: William Door dengan Red Key...")

    -- 1. Cari Red Key di Backpack
    local redKey = backpack:FindFirstChild("Red Key")
    
    if redKey then
        -- Pakai Red Key
        player.Character.Humanoid:EquipTool(redKey)
        print("✅ Red Key di-equip!")
        task.wait(0.3)
    else
        -- Cek apakah sudah di-equip sebelumnya
        if not character:FindFirstChild("Red Key") then
            warn("⚠️ Red Key tidak ditemukan di Backpack atau Character!")
        end
    end

    -- 2. Teleport ke depan WilliamDoor
    root.CFrame = targetDoor:GetPivot() * CFrame.new(0, 0, 3)
    task.wait(0.5)

    -- 3. Cari dan Fire Prompt
    local prompt = targetDoor:FindFirstChildWhichIsA("ProximityPrompt", true)
    
    if prompt then
        prompt.Enabled = true
        prompt.HoldDuration = 0
        prompt.RequiresLineOfSight = false
        
        print("🔥 Firing WilliamDoor Prompt...")
        
        if typeof(fireproximityprompt) == "function" then
            fireproximityprompt(prompt)
        else
            prompt:InputHoldBegin()
            task.wait(0.2)
            prompt:InputHoldEnd()
        end
        print("✅ Interaksi William Door Selesai!")
    else
        warn("❌ ProximityPrompt tidak ditemukan di WilliamDoor!")
    end
end

runWilliamDoorStep()
