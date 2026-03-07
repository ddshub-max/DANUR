local Players = game:GetService("Players")
local root = (Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
local frame = workspace:WaitForChild("RKDKCW_RotatingFrame")

for _, obj in pairs(frame:GetChildren()) do
    if obj.Name:match("Bordighera") then
        root.CFrame = obj:GetPivot() * CFrame.new(0, 3, 0)
        task.wait(0.4)
        local p = obj:FindFirstChildWhichIsA("ProximityPrompt", true)
        if p then
            while p.Enabled do
                if typeof(fireproximityprompt) == "function" then fireproximityprompt(p)
                else p:InputHoldBegin() task.wait(0.1) p:InputHoldEnd() end
                task.wait(0.5)
            end
        end
    end
end
