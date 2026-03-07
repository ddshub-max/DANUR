local Players = game:GetService("Players")
local root = (Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
local doorPart = workspace:WaitForChild("RKDKCW_DrawerTemplate"):WaitForChild("WilliamDoor3"):WaitForChild("Part")

root.CFrame = doorPart:GetPivot() * CFrame.new(0, 0, 3)
task.wait(0.5)

local p = doorPart:FindFirstChildWhichIsA("ProximityPrompt", true)
if p then
    p.Enabled, p.HoldDuration = true, 0
    if typeof(fireproximityprompt) == "function" then fireproximityprompt(p) end
end
