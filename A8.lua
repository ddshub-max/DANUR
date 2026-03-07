local Players = game:GetService("Players")
local root = (Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
local hansJob = workspace:WaitForChild("RKDKCW_HansJob")

for _, obj in pairs(hansJob:GetChildren()) do
    if obj.Name == "Water" then
        print("💧 Memproses: " .. obj.Name)
        root.CFrame = obj:GetPivot() * CFrame.new(0, 3, 0)
        task.wait(0.4)
        
        local p = obj:FindFirstChildWhichIsA("ProximityPrompt", true)
        if p then
            -- Terus tekan sampai prompt mati
            while p and p.Enabled do
                if typeof(fireproximityprompt) == "function" then 
                    fireproximityprompt(p) 
                else
                    p:InputHoldBegin() task.wait(0.1) p:InputHoldEnd()
                end
                task.wait(0.3) -- Jeda antar klik
            end
        end
    end
end
print("✅ Semua Water selesai!")
