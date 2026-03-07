local Players = game:GetService("Players")
local root = (Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")

-- 1. Ke Lives Part
local lives = workspace:WaitForChild("Lives"):WaitForChild("Part")
root.CFrame = lives:GetPivot() * CFrame.new(0, 2, 0)
task.wait(0.5)

-- 2. Ke Collected Keys & Fire
local keys = workspace:WaitForChild("SceneHolder"):WaitForChild("WilliamScene"):WaitForChild("CollectedKeys")
root.CFrame = keys:GetPivot() * CFrame.new(0, 2, 0)
task.wait(0.5)

local p = keys:FindFirstChildWhichIsA("ProximityPrompt", true)
if p then
    p.Enabled, p.HoldDuration = true, 0
    if typeof(fireproximityprompt) == "function" then fireproximityprompt(p) end
end
