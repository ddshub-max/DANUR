local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local LeftPanel = Instance.new("Frame")
local RightPanel = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ButtonContainer = Instance.new("ScrollingFrame")
local UIGridLayout = Instance.new("UIGridLayout")
local StatusFrame = Instance.new("Frame")
local CurrentStatus = Instance.new("TextLabel")
local NextStatus = Instance.new("TextLabel")
local MinimizeBtn = Instance.new("TextButton")
local OpenBtn = Instance.new("TextButton")

-- [ SETUP SCREEN GUI ] --
ScreenGui.Name = "DanurLoader_Final_V4"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- [ TOMBOL OPEN (Kiri Layar) ] --
OpenBtn.Name = "OpenBtn"
OpenBtn.Parent = ScreenGui
OpenBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
OpenBtn.Position = UDim2.new(0, 0, 0.45, 0)
OpenBtn.Size = UDim2.new(0.025, 0, 0.1, 0)
OpenBtn.Text = ">"
OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.Visible = false
local UICornerOpen = Instance.new("UICorner")
UICornerOpen.CornerRadius = UDim.new(0, 4)
UICornerOpen.Parent = OpenBtn

-- [ MAIN FRAME ] --
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Position = UDim2.new(0.02, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0, 0.5)
MainFrame.Size = UDim2.new(0.35, 0, 0.5, 0)
MainFrame.BorderSizePixel = 0

local UICornerMain = Instance.new("UICorner")
UICornerMain.Parent = MainFrame

-- [ SIDEBAR / CHAPTER SELECT ] --
LeftPanel.Name = "LeftPanel"
LeftPanel.Parent = MainFrame
LeftPanel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
LeftPanel.Size = UDim2.new(0.25, 0, 1, 0)

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = LeftPanel
UIListLayout.Padding = UDim.new(0.02, 0)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- [[ NEW: TIMER SETUP ]] --
local TimerLabel = Instance.new("TextLabel")
TimerLabel.Name = "RealTimeTimer"
TimerLabel.Parent = LeftPanel
TimerLabel.Size = UDim2.new(0.9, 0, 0.1, 0)
TimerLabel.BackgroundTransparency = 1
TimerLabel.Text = "00:00"
TimerLabel.TextColor3 = Color3.fromRGB(255, 255, 100) -- Warna kuning cerah agar kontras
TimerLabel.TextScaled = true
TimerLabel.Font = Enum.Font.Code -- Font bergaya digital/kode
TimerLabel.LayoutOrder = -1 -- Memastikan dia selalu paling atas sebelum Cap 1

-- [ CONTENT AREA ] --
RightPanel.Name = "RightPanel"
RightPanel.Parent = MainFrame
RightPanel.BackgroundTransparency = 1
RightPanel.Position = UDim2.new(0.25, 0, 0, 0)
RightPanel.Size = UDim2.new(0.75, 0, 1, 0)

Title.Parent = RightPanel
Title.Size = UDim2.new(1, 0, 0.12, 0)
Title.Text = "CHAPTER 1"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.Font = Enum.Font.SourceSansBold
Title.BackgroundTransparency = 1

-- [ BUTTON CONTAINER ] --
ButtonContainer.Parent = RightPanel
ButtonContainer.Position = UDim2.new(0.05, 0, 0.15, 0)
ButtonContainer.Size = UDim2.new(0.9, 0, 0.65, 0)
ButtonContainer.BackgroundTransparency = 1
ButtonContainer.ScrollBarThickness = 3

UIGridLayout.Parent = ButtonContainer
UIGridLayout.CellSize = UDim2.new(0.18, 0, 0.12, 0)
UIGridLayout.CellPadding = UDim2.new(0.02, 0, 0.03, 0)

-- [ STATUS BAR ] --
StatusFrame.Parent = RightPanel
StatusFrame.Position = UDim2.new(0, 0, 0.82, 0)
StatusFrame.Size = UDim2.new(1, 0, 0.18, 0)
StatusFrame.BackgroundTransparency = 1

CurrentStatus.Parent = StatusFrame
CurrentStatus.Size = UDim2.new(1, 0, 0.5, 0)
CurrentStatus.Text = "In Step: None"
CurrentStatus.TextColor3 = Color3.fromRGB(0, 255, 150)
CurrentStatus.TextScaled = true

NextStatus.Parent = StatusFrame
NextStatus.Position = UDim2.new(0, 0, 0.5, 0)
NextStatus.Size = UDim2.new(1, 0, 0.5, 0)
NextStatus.Text = "Next Step: Choose Step"
NextStatus.TextColor3 = Color3.fromRGB(200, 200, 200)
NextStatus.TextScaled = true

-- [ DATA LINK LENGKAP ] --
local Data = {
    ["Cap 1"] = {
        "https://raw.githubusercontent.com/ddshub-max/DANUR/refs/heads/main/step1.lua",
        "https://raw.githubusercontent.com/ddshub-max/DANUR/refs/heads/main/Step2.lua",
        "https://raw.githubusercontent.com/ddshub-max/DANUR/refs/heads/main/step3.lua",
        "https://raw.githubusercontent.com/ddshub-max/DANUR/refs/heads/main/step4.lua",
        "https://raw.githubusercontent.com/ddshub-max/DANUR/refs/heads/main/step5.lua",
        "https://raw.githubusercontent.com/ddshub-max/DANUR/refs/heads/main/step6.lua",
        "https://raw.githubusercontent.com/ddshub-max/DANUR/refs/heads/main/step7.lua",
        "https://raw.githubusercontent.com/ddshub-max/DANUR/refs/heads/main/step8.lua"
    },
    ["Cap 2"] = {
        "https://raw.githubusercontent.com/ddshub-max/DANUR/refs/heads/main/A1.lua",
        "https://raw.githubusercontent.com/ddshub-max/DANUR/refs/heads/main/A2.lua",
        "https://raw.githubusercontent.com/ddshub-max/DANUR/refs/heads/main/A3.lua",
        "https://raw.githubusercontent.com/ddshub-max/DANUR/refs/heads/main/A4.lua",
        "https://raw.githubusercontent.com/ddshub-max/DANUR/refs/heads/main/A5.lua",
        "https://raw.githubusercontent.com/ddshub-max/DANUR/refs/heads/main/A5.1.lua",
        "https://raw.githubusercontent.com/ddshub-max/DANUR/refs/heads/main/A6.lua"
    },
    ["Cap 3"] = {
        "https://raw.githubusercontent.com/ddshub-max/DANUR/refs/heads/main/A7.lua",
        "https://raw.githubusercontent.com/ddshub-max/DANUR/refs/heads/main/A8.lua",
        "https://raw.githubusercontent.com/ddshub-max/DANUR/refs/heads/main/last.lua"
    }
}

-- [ LOGIC FUNCTIONS ] --
local function clearButtons()
    for _, child in pairs(ButtonContainer:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
end

local function createStepButtons(chapterKey)
    clearButtons()
    
    if chapterKey == "Cap 1" then
        Title.Text = "CHAPTER 1"
    elseif chapterKey == "Cap 2" then
        Title.Text = "CHAPTER 2"
    elseif chapterKey == "Cap 3" then
        Title.Text = "STEP FINISH"
    end

    local links = Data[chapterKey]
    for i, url in ipairs(links) do
        local btn = Instance.new("TextButton")
        btn.Text = tostring(i)
        btn.Parent = ButtonContainer
        btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextScaled = true
        btn.Font = Enum.Font.SourceSansBold
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0.2, 0)
        corner.Parent = btn

        btn.MouseButton1Click:Connect(function()
            CurrentStatus.Text = "In: " .. Title.Text .. " - Step " .. i
            if i < #links then
                NextStatus.Text = "Next: Step " .. (i + 1)
            else
                NextStatus.Text = "Next: End of Project"
            end
            
            task.spawn(function()
                loadstring(game:HttpGet(url))()
            end)
        end)
    end
end

-- [ TABS CREATION ] --
local chapterOrder = {"Cap 1", "Cap 2", "Cap 3"}
for _, name in ipairs(chapterOrder) do
    local tab = Instance.new("TextButton")
    tab.Name = name
    tab.Parent = LeftPanel
    tab.Size = UDim2.new(0.9, 0, 0.12, 0)
    tab.Text = name
    tab.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    tab.TextColor3 = Color3.fromRGB(255, 255, 255)
    tab.TextScaled = true
    tab.Font = Enum.Font.SourceSansBold
    
    local corner = Instance.new("UICorner")
    corner.Parent = tab

    tab.MouseButton1Click:Connect(function()
        createStepButtons(name)
    end)
end

-- [ MINIMIZE LOGIC ] --
MinimizeBtn.Parent = MainFrame
MinimizeBtn.Size = UDim2.new(0.08, 0, 0.08, 0)
MinimizeBtn.Position = UDim2.new(0.91, 0, 0.01, 0)
MinimizeBtn.Text = "_"
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.BorderSizePixel = 0

MinimizeBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    OpenBtn.Visible = true
end)

OpenBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    OpenBtn.Visible = false
end)

-- [[ NEW: TIMER LOGIC ]] --
task.spawn(function()
    local startTime = os.time()
    while task.wait(1) do
        local diff = os.time() - startTime
        local minutes = math.floor(diff / 60)
        local seconds = diff % 60
        TimerLabel.Text = string.format("%02d:%02d", minutes, seconds)
    end
end)

-- Default Start
createStepButtons("Cap 1")
