local Players = game:GetService("Players")
local root = (Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
local kitchen = workspace:WaitForChild("Kitchen")
local sequence = {"Frying Pan", "Part", "telor", "Part"}

local function safeFire(obj)
    local p = obj:FindFirstChildWhichIsA("ProximityPrompt", true)
    if p then
        p.Enabled, p.HoldDuration, p.RequiresLineOfSight = true, 0, false
        if typeof(fireproximityprompt) == "function" then fireproximityprompt(p)
        else p:InputHoldBegin() task.wait(0.1) p:InputHoldEnd() end
        return true
    end
    return false
end

for _, name in ipairs(sequence) do
    local target = kitchen:FindFirstChild(name)
    if target then
        root.CFrame = target:GetPivot() * CFrame.new(0, 3, 0)
        task.wait(0.3)
        safeFire(target)
        task.wait(0.3)
    end
end
