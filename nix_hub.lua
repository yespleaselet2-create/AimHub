-- NIX HUB - UNIVERSAL AIMBOT + FEATURES
print('🔐 NIX HUB Loading...')

if getgenv().NixHubLoaded then 
    print('Already loaded')
    return 
end

getgenv().NixHubLoaded = true

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local player = game.Players.LocalPlayer
if not player then return end

local playerGui = player:WaitForChild('PlayerGui', 10)
if not playerGui then return end

local keyGui = Instance.new('ScreenGui')
keyGui.Name = 'NixKeySystem'
keyGui.ResetOnSpawn = false
keyGui.Parent = playerGui

local keyFrame = Instance.new('Frame')
keyFrame.Size = UDim2.new(0, 400, 0, 200)
keyFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
keyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
keyFrame.Parent = keyGui

local corner = Instance.new('UICorner')
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = keyFrame

local title = Instance.new('TextLabel')
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = '🔐 NIX HUB'
title.TextColor3 = Color3.fromRGB(255, 100, 200)
title.TextSize = 24
title.Font = Enum.Font.GothamBold
title.Parent = keyFrame

local inputBox = Instance.new('TextBox')
inputBox.Size = UDim2.new(0, 300, 0, 40)
inputBox.Position = UDim2.new(0.5, -150, 0.3, 0)
inputBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
inputBox.TextColor3 = Color3.new(1, 1, 1)
inputBox.PlaceholderText = 'Paste your key here'
inputBox.Parent = keyFrame

local verifyBtn = Instance.new('TextButton')
verifyBtn.Size = UDim2.new(0, 300, 0, 40)
verifyBtn.Position = UDim2.new(0.5, -150, 0.55, 0)
verifyBtn.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
verifyBtn.Text = 'VERIFY'
verifyBtn.TextColor3 = Color3.new(0, 0, 0)
verifyBtn.Parent = keyFrame

verifyBtn.MouseButton1Click:Connect(function()
    local key = inputBox.Text
    if string.len(key) == 10 then
        print('✅ Key accepted!')
        keyGui:Destroy()
        loadHub()
    else
        inputBox.PlaceholderText = 'Invalid key!'
    end
end)

function loadHub()
    local hubGui = Instance.new('ScreenGui')
    hubGui.Name = 'NixHub'
    hubGui.ResetOnSpawn = false
    hubGui.Parent = playerGui
    
    local hubFrame = Instance.new('Frame')
    hubFrame.Size = UDim2.new(0, 500, 0, 400)
    hubFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
    hubFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    hubFrame.Parent = hubGui
    
    local hubCorner = Instance.new('UICorner')
    hubCorner.CornerRadius = UDim.new(0, 12)
    hubCorner.Parent = hubFrame
    
    local hubTitle = Instance.new('TextLabel')
    hubTitle.Size = UDim2.new(1, 0, 0, 50)
    hubTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    hubTitle.Text = '⚔️ NIX HUB - UNIVERSAL AIMBOT'
    hubTitle.TextColor3 = Color3.fromRGB(255, 100, 200)
    hubTitle.TextSize = 20
    hubTitle.Font = Enum.Font.GothamBold
    hubTitle.Parent = hubFrame
    
    local aimbotBtn = Instance.new('TextButton')
    aimbotBtn.Size = UDim2.new(0, 200, 0, 40)
    aimbotBtn.Position = UDim2.new(0.1, 0, 0.15, 0)
    aimbotBtn.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
    aimbotBtn.Text = '🎯 AIMBOT: OFF'
    aimbotBtn.TextColor3 = Color3.new(0, 0, 0)
    aimbotBtn.Parent = hubFrame
    
    local aimbotActive = false
    aimbotBtn.MouseButton1Click:Connect(function()
        aimbotActive = not aimbotActive
        aimbotBtn.Text = aimbotActive and '🎯 AIMBOT: ON' or '🎯 AIMBOT: OFF'
        aimbotBtn.BackgroundColor3 = aimbotActive and Color3.fromRGB(200, 100, 100) or Color3.fromRGB(100, 200, 100)
    end)
    
    local speedBtn = Instance.new('TextButton')
    speedBtn.Size = UDim2.new(0, 200, 0, 40)
    speedBtn.Position = UDim2.new(0.55, 0, 0.15, 0)
    speedBtn.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
    speedBtn.Text = '⚡ SPEED: OFF'
    speedBtn.TextColor3 = Color3.new(1, 1, 1)
    speedBtn.Parent = hubFrame
    
    local speedActive = false
    speedBtn.MouseButton1Click:Connect(function()
        speedActive = not speedActive
        speedBtn.Text = speedActive and '⚡ SPEED: ON' or '⚡ SPEED: OFF'
        if speedActive and player.Character then
            player.Character.Humanoid.WalkSpeed = 50
        elseif player.Character then
            player.Character.Humanoid.WalkSpeed = 16
        end
    end)
    
    local godBtn = Instance.new('TextButton')
    godBtn.Size = UDim2.new(0, 200, 0, 40)
    godBtn.Position = UDim2.new(0.1, 0, 0.3, 0)
    godBtn.BackgroundColor3 = Color3.fromRGB(255, 150, 100)
    godBtn.Text = '🛡️ GOD MODE: OFF'
    godBtn.TextColor3 = Color3.new(1, 1, 1)
    godBtn.Parent = hubFrame
    
    local godActive = false
    godBtn.MouseButton1Click:Connect(function()
        godActive = not godActive
        godBtn.Text = godActive and '🛡️ GOD MODE: ON' or '🛡️ GOD MODE: OFF'
    end)
    
    local wallBtn = Instance.new('TextButton')
    wallBtn.Size = UDim2.new(0, 200, 0, 40)
    wallBtn.Position = UDim2.new(0.55, 0, 0.3, 0)
    wallBtn.BackgroundColor3 = Color3.fromRGB(200, 100, 200)
    wallBtn.Text = '👁️ WALLHACK: OFF'
    wallBtn.TextColor3 = Color3.new(1, 1, 1)
    wallBtn.Parent = hubFrame
    
    local wallActive = false
    wallBtn.MouseButton1Click:Connect(function()
        wallActive = not wallActive
        wallBtn.Text = wallActive and '👁️ WALLHACK: ON' or '👁️ WALLHACK: OFF'
    end)
    
    print('✅ Hub loaded!')
end

print('✅ NIX KEY SYSTEM READY')
