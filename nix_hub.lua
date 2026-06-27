-- NIX HUB - Real Key System with Private API
print('🔐 NIX HUB Loading...')

if getgenv().NixHubLoaded then
    print('Already loaded')
    return
end
getgenv().NixHubLoaded = true

if not game:IsLoaded() then game.Loaded:Wait() end

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild('PlayerGui', 10)
local HttpService = game:GetService('HttpService')
local UserInputService = game:GetService('UserInputService')

local API_URL = 'http://51.91.165.211:5000/checkkey'
local API_SECRET = 'NyxSecretAPI2026'

local function isValidKey(inputKey)
    local success, result = pcall(function()
        return HttpService:PostAsync(API_URL, HttpService:JSONEncode({
            secret = API_SECRET,
            key = inputKey
        }), Enum.HttpContentType.ApplicationJson)
    end)
    if not success then return false end
    local ok, data = pcall(function() return HttpService:JSONDecode(result) end)
    if not ok then return false end
    return data.valid == true
end

local keyGui = Instance.new('ScreenGui')
keyGui.Name = 'NixKeySystem'
keyGui.ResetOnSpawn = false
keyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
pcall(function() keyGui.Parent = game:GetService('CoreGui') end)
if not keyGui.Parent or keyGui.Parent ~= game:GetService('CoreGui') then
    keyGui.Parent = playerGui
end

local keyFrame = Instance.new('Frame')
keyFrame.Size = UDim2.new(0, 400, 0, 220)
keyFrame.Position = UDim2.new(0.5, -200, 0.5, -110)
keyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
keyFrame.BorderSizePixel = 0
keyFrame.Parent = keyGui
Instance.new('UICorner', keyFrame).CornerRadius = UDim.new(0, 12)

local stroke = Instance.new('UIStroke')
stroke.Color = Color3.fromRGB(255, 100, 200)
stroke.Thickness = 2
stroke.Parent = keyFrame

local title = Instance.new('TextLabel')
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = '🔐 NIX HUB'
title.TextColor3 = Color3.fromRGB(255, 100, 200)
title.TextSize = 24
title.Font = Enum.Font.GothamBold
title.Parent = keyFrame

local statusLabel = Instance.new('TextLabel')
statusLabel.Size = UDim2.new(1, 0, 0, 25)
statusLabel.Position = UDim2.new(0, 0, 0.75, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = 'Get your key from Discord!'
statusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
statusLabel.TextSize = 14
statusLabel.Font = Enum.Font.Gotham
statusLabel.Parent = keyFrame

local inputBox = Instance.new('TextBox')
inputBox.Size = UDim2.new(0, 320, 0, 40)
inputBox.Position = UDim2.new(0.5, -160, 0.3, 0)
inputBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
inputBox.TextColor3 = Color3.new(1, 1, 1)
inputBox.PlaceholderText = 'Paste your NYX-XXXXXXXXXXXX key'
inputBox.Font = Enum.Font.Gotham
inputBox.TextSize = 14
inputBox.ClearTextOnFocus = false
inputBox.Parent = keyFrame
Instance.new('UICorner', inputBox).CornerRadius = UDim.new(0, 8)

local verifyBtn = Instance.new('TextButton')
verifyBtn.Size = UDim2.new(0, 320, 0, 40)
verifyBtn.Position = UDim2.new(0.5, -160, 0.57, 0)
verifyBtn.BackgroundColor3 = Color3.fromRGB(150, 100, 255)
verifyBtn.Text = 'VERIFY'
verifyBtn.TextColor3 = Color3.new(1, 1, 1)
verifyBtn.Font = Enum.Font.GothamBold
verifyBtn.TextSize = 16
verifyBtn.Parent = keyFrame
Instance.new('UICorner', verifyBtn).CornerRadius = UDim.new(0, 8)

verifyBtn.MouseButton1Click:Connect(function()
    local key = inputBox.Text:match('^%s*(.-)%s*$')
    statusLabel.Text = '⏳ Checking key...'
    statusLabel.TextColor3 = Color3.fromRGB(255, 255, 100)
    verifyBtn.Active = false
    if isValidKey(key) then
        statusLabel.Text = '✅ Key accepted!'
        statusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
        task.wait(1)
        keyGui:Destroy()
        loadHub()
    else
        statusLabel.Text = '❌ Invalid key! Get one from Discord.'
        statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        verifyBtn.Active = true
    end
end)

function loadHub()
    local hubGui = Instance.new('ScreenGui')
    hubGui.Name = 'NixHub'
    hubGui.ResetOnSpawn = false
    hubGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    pcall(function() hubGui.Parent = game:GetService('CoreGui') end)
    if not hubGui.Parent or hubGui.Parent ~= game:GetService('CoreGui') then
        hubGui.Parent = playerGui
    end

    local hubFrame = Instance.new('Frame')
    hubFrame.Size = UDim2.new(0, 500, 0, 420)
    hubFrame.Position = UDim2.new(0.5, -250, 0.5, -210)
    hubFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    hubFrame.BorderSizePixel = 0
    hubFrame.Parent = hubGui
    Instance.new('UICorner', hubFrame).CornerRadius = UDim.new(0, 12)

    local hubStroke = Instance.new('UIStroke')
    hubStroke.Color = Color3.fromRGB(255, 100, 200)
    hubStroke.Thickness = 2
    hubStroke.Parent = hubFrame

    local hubTitle = Instance.new('TextLabel')
    hubTitle.Size = UDim2.new(1, 0, 0, 50)
    hubTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    hubTitle.Text = '⚔️ NIX HUB'
    hubTitle.TextColor3 = Color3.fromRGB(255, 100, 200)
    hubTitle.TextSize = 20
    hubTitle.Font = Enum.Font.GothamBold
    hubTitle.Parent = hubFrame
    Instance.new('UICorner', hubTitle).CornerRadius = UDim.new(0, 12)

    local dragging, dragStart, startPos
    hubTitle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = hubFrame.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            hubFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)

    local function makeButton(text, color, pos)
        local btn = Instance.new('TextButton')
        btn.Size = UDim2.new(0, 200, 0, 40)
        btn.Position = pos
        btn.BackgroundColor3 = color
        btn.Text = text
        btn.TextColor3 = Color3.new(1, 1, 1)
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 14
        btn.BorderSizePixel = 0
        btn.Parent = hubFrame
        Instance.new('UICorner', btn).CornerRadius = UDim.new(0, 8)
        return btn
    end

    local aimbotActive = false
    local aimbotBtn = makeButton('🎯 AIMBOT: OFF', Color3.fromRGB(80, 180, 80), UDim2.new(0.1, 0, 0.18, 0))
    aimbotBtn.MouseButton1Click:Connect(function()
        aimbotActive = not aimbotActive
        aimbotBtn.Text = aimbotActive and '🎯 AIMBOT: ON' or '🎯 AIMBOT: OFF'
        aimbotBtn.BackgroundColor3 = aimbotActive and Color3.fromRGB(200, 80, 80) or Color3.fromRGB(80, 180, 80)
    end)

    local speedActive = false
    local speedBtn = makeButton('⚡ SPEED: OFF', Color3.fromRGB(100, 150, 255), UDim2.new(0.55, 0, 0.18, 0))
    speedBtn.MouseButton1Click:Connect(function()
        speedActive = not speedActive
        speedBtn.Text = speedActive and '⚡ SPEED: ON' or '⚡ SPEED: OFF'
        speedBtn.BackgroundColor3 = speedActive and Color3.fromRGB(200, 80, 80) or Color3.fromRGB(100, 150, 255)
        if speedActive and player.Character then
            player.Character.Humanoid.WalkSpeed = 50
        elseif player.Character then
            player.Character.Humanoid.WalkSpeed = 16
        end
    end)

    local wallActive = false
    local wallBtn = makeButton('👁️ WALLHACK: OFF', Color3.fromRGB(180, 80, 180), UDim2.new(0.1, 0, 0.33, 0))
    wallBtn.MouseButton1Click:Connect(function()
        wallActive = not wallActive
        wallBtn.Text = wallActive and '👁️ WALLHACK: ON' or '👁️ WALLHACK: OFF'
        wallBtn.BackgroundColor3 = wallActive and Color3.fromRGB(200, 80, 80) or Color3.fromRGB(180, 80, 180)
        if wallActive then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA('BasePart') and not v:IsDescendantOf(player.Character) then
                    v.Material = Enum.Material.ForceField
                end
            end
        else
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA('BasePart') and not v:IsDescendantOf(player.Character) then
                    v.Material = Enum.Material.SmoothPlastic
                end
            end
        end
    end)

    local godActive = false
    local godBtn = makeButton('🛡️ GOD MODE: OFF', Color3.fromRGB(255, 150, 50), UDim2.new(0.55, 0, 0.33, 0))
    godBtn.MouseButton1Click:Connect(function()
        godActive = not godActive
        godBtn.Text = godActive and '🛡️ GOD MODE: ON' or '🛡️ GOD MODE: OFF'
        godBtn.BackgroundColor3 = godActive and Color3.fromRGB(200, 80, 80) or Color3.fromRGB(255, 150, 50)
        if godActive and player.Character then
            player.Character.Humanoid.MaxHealth = math.huge
            player.Character.Humanoid.Health = math.huge
        end
    end)

    local closeBtn = Instance.new('TextButton')
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -35, 0, 10)
    closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    closeBtn.Text = 'X'
    closeBtn.TextColor3 = Color3.new(1,1,1)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 14
    closeBtn.BorderSizePixel = 0
    closeBtn.Parent = hubFrame
    Instance.new('UICorner', closeBtn).CornerRadius = UDim.new(0, 6)
    closeBtn.MouseButton1Click:Connect(function()
        hubGui:Destroy()
        getgenv().NixHubLoaded = false
    end)

    print('✅ NIX Hub loaded!')
end

print('✅ NIX KEY SYSTEM READY')
