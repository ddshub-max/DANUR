local Players = game:GetService("Players")
local root = (Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
local violin = workspace:WaitForChild("SceneHolder"):WaitForChild("ViolinJumpscare")

root.CFrame = violin:GetPivot() * CFrame.new(0, 2, 0)
task.wait(0.5)

local p = violin:FindFirstChildWhichIsA("ProximityPrompt", true)
if p then
    p.Enabled, p.HoldDuration = true, 0
    if typeof(fireproximityprompt) == "function" then fireproximityprompt(p)
    else p:InputHoldBegin() task.wait(0.2) p:InputHoldEnd() end
end
