local Players = game:GetService("Players")
local root = (Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
local target = workspace:WaitForChild("SceneHolder"):WaitForChild("WilliamScene"):WaitForChild("ZoneTrigger2"):WaitForChild("Part")
local TweenService = game:GetService("TweenService")

local info = TweenInfo.new(3, Enum.EasingStyle.Linear) -- Durasi 3 detik (santai)
local tween = TweenService:Create(root, info, {CFrame = target:GetPivot() * CFrame.new(0, 3, 0)})
tween:Play()
tween.Completed:Wait()
