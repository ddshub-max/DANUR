local Players = game:GetService("Players")
local root = (Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
local dt = workspace:WaitForChild("RKDKCW_DrawerTemplate")

local function fastFire(obj, forceEnable)
    local p = obj:FindFirstChildWhichIsA("ProximityPrompt", true)
    if p then
        if forceEnable then p.Enabled = true end
        p.HoldDuration, p.RequiresLineOfSight = 0, false
        if typeof(fireproximityprompt) == "function" then fireproximityprompt(p)
        else p:InputHoldBegin() task.wait(0.1) p:InputHoldEnd() end
    end
end

local tasks = {"Weapon_Loc_1", "Rose_Loc_1", "Tie_Loc_1"}
for _, n in ipairs(tasks) do
    local obj = dt:WaitForChild(n, 5)
    if obj then
        root.CFrame = obj:GetPivot() * CFrame.new(0, 2, 0)
        task.wait(0.5)
        fastFire(obj, n == "Tie_Loc_1")
        task.wait(0.3)
    end
end
