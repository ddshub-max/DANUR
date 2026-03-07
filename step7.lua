local Players = game:GetService("Players")
local root = (Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
local dt = workspace:WaitForChild("RKDKCW_DrawerTemplate")
local items = {"Weapon_1", "Tie_1", "Rose_1"}

for _, name in ipairs(items) do
    local folder = dt:FindFirstChild(name)
    if folder then
        root.CFrame = folder:GetPivot() * CFrame.new(0, 2, 0)
        task.wait(0.5)
        for _, p in pairs(folder:GetDescendants()) do
            if p:IsA("ProximityPrompt") then
                p.Enabled, p.HoldDuration = true, 0
                if typeof(fireproximityprompt) == "function" then fireproximityprompt(p)
                else p:InputHoldBegin() task.wait(0.1) p:InputHoldEnd() end
                task.wait(0.2)
            end
        end
    end
end
