local Players = game:GetService("Players")
local root = (Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
local door = workspace:WaitForChild("RKDKCW_DrawerTemplate"):WaitForChild("JashenDoor1"):WaitForChild("Door")

root.CFrame = door:GetPivot() * CFrame.new(0, 0, 3)
task.wait(0.5)

local p = door:FindFirstChildWhichIsA("ProximityPrompt", true)
if p then
    p.Enabled, p.HoldDuration, p.RequiresLineOfSight = true, 0, false
    if typeof(fireproximityprompt) == "function" then fireproximityprompt(p)
    else p:InputHoldBegin() task.wait(0.1) p:InputHoldEnd() end
end
