local Players = game:GetService("Players")
local root = (Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
local target = workspace:WaitForChild("SceneHolder"):WaitForChild("Ballet_Scene_4"):WaitForChild("ZoneTrigger"):WaitForChild("Part")

root.CFrame = target:GetPivot() * CFrame.new(0, 3, 0)
task.wait(0.5)

local p = target:FindFirstChildWhichIsA("ProximityPrompt", true)
if p then
    p.Enabled, p.HoldDuration, p.RequiresLineOfSight = true, 0, false
    if typeof(fireproximityprompt) == "function" then fireproximityprompt(p)
    else p:InputHoldBegin() task.wait(0.1) p:InputHoldEnd() end
end
