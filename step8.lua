local Players = game:GetService("Players")
local root = (Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
local note = workspace:WaitForChild("SceneHolder"):WaitForChild("Ballet_Scene_3"):WaitForChild("Note")

root.CFrame = note:GetPivot() * CFrame.new(0, 2, 0)
task.wait(0.5)

local p = note:FindFirstChildWhichIsA("ProximityPrompt", true)
if p then
    p.Enabled, p.HoldDuration, p.RequiresLineOfSight = true, 0, false
    if typeof(fireproximityprompt) == "function" then fireproximityprompt(p)
    else p:InputHoldBegin() task.wait(0.1) p:InputHoldEnd() end
end
