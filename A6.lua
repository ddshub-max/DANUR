local Players = game:GetService("Players")
local root = (Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
local place = workspace:WaitForChild("SceneHolder"):WaitForChild("WilliamScene"):WaitForChild("ViolinPlacement")

root.CFrame = place:GetPivot() * CFrame.new(0, 2, 0)
task.wait(0.5)

local p = place:FindFirstChildWhichIsA("ProximityPrompt", true)
if p then
    p.Enabled, p.HoldDuration = true, 0
    if typeof(fireproximityprompt) == "function" then fireproximityprompt(p) end
end
