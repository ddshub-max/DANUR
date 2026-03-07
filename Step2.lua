local Players = game:GetService("Players")
local root = (Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
local part = workspace:WaitForChild("SceneHolder"):WaitForChild("Sleep_Scene_1"):WaitForChild("Part")

root.CFrame = part:GetPivot() * CFrame.new(0, 3, 0)
task.wait(0.5)

local p = part:FindFirstChildWhichIsA("ProximityPrompt", true)
if p then
    p.Enabled, p.HoldDuration, p.RequiresLineOfSight = true, 0, false
    if typeof(fireproximityprompt) == "function" then fireproximityprompt(p)
    else p:InputHoldBegin() task.wait(0.1) p:InputHoldEnd() end
end
