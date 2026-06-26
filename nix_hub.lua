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
    local data = HttpService:JSONDecode(result)
    return data.valid == true
end

local keyGui = Instance.new('ScreenGui')
keyGui.Name = 'NixKeySystem'
keyGui.ResetOnSpawn = false
keyGui.Parent = playerGui

local keyFrame = Instance.new('Frame')
keyFrame.Size = UDim2.new(0, 400, 0, 220)
keyFrame.Position = UDim2.new(0.5, -200, 0.5, -110)
keyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
keyFrame.Parent = keyGui
Instance.new('UICorner', keyFrame).CornerRadius = UDim.new(0, 12)

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
inputBox.Parent = keyFrame
Instance.new('UICorner', inputBox).CornerRadius = UDim.new(0, 8)

local verifyBtn = Instance.new('TextButton')
verifyBtn.Size = UDim2.new(0, 320, 0, 40)
verifyBtn.Position = UDim2.new(0.5, -160, 0.57, 0)
verifyBtn.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
verifyBtn.Text = 'VERIFY'
verifyBtn.TextColor3 = Color3.new(0, 0, 0)
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
    hubGui.Parent = playerGui

    local hubFrame = Instance.new('Frame')
    hubFrame.Size = UDim2.new(0, 500, 0, 400)
    hubFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
    hubFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    hubFrame.Parent = hubGui
    Instance.new('UICorner', hubFrame).CornerRadius = UDim.new(0, 12)

    local hubTitle = Instance.new('TextLabel')
    hubTitle.Size = UDim2.new(1, 0, 0, 50)
    hubTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    hubTitle.Text = '⚔️ NIX HUB'
    hubTitle.TextColor3 = Color3.fromRGB(255, 100, 200)
    hubTitle.TextSize = 20
    hubTitle.Font = Enum.Font.GothamBold
    hubTitle.Parent = hubFrame
    Instance.new('UICorner', hubTitle).CornerRadius = UDim.new(0, 12)

    local function makeButton(text, color, pos)
        local btn = Instance.new('TextButton')
        btn.Size = UDim2.new(0, 200, 0, 40)
        btn.Position = pos
        btn.BackgroundColor3 = color
        btn.Text = text
        btn.TextColor3 = Color3.new(1, 1, 1)
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 14
        btn.Parent = hubFrame
        Instance.new('UICorner', btn).CornerRadius = UDim.new(0, 8)
        return btn
    end

    local aimbotActive = false
    local aimbotBtn = makeButton('🎯 AIMBOT: OFF', Color3.fromRGB(100, 200, 100), UDim2.new(0.1, 0, 0.18, 0))
    aimbotBtn.MouseButton1Click:Connect(function()
        aimbotActive = not aimbotActive
        aimbotBtn.Text = aimbotActive and '🎯 AIMBOT: ON' or '🎯 AIMBOT: OFF'
        aimbotBtn.BackgroundColor3 = aimbotActive and Color3.fromRGB(200, 100, 100) or Color3.fromRGB(100, 200, 100)
    end)

    local speedActive = false
    local speedBtn = makeButton('⚡ SPEED: OFF', Color3.fromRGB(100, 150, 255), UDim2.new(0.55, 0, 0.18, 0))
    speedBtn.MouseButton1Click:Connect(function()
        speedActive = not speedActive
        speedBtn.Text = speedActive and '⚡ SPEED: ON' or '⚡ SPEED: OFF'
        if speedActive and player.Character then
            player.Character.Humanoid.WalkSpeed = 50
        elseif player.Character then
            player.Character.Humanoid.WalkSpeed = 16
        end
    end)

    local wallActive = false
    local wallBtn = makeButton('👁️ WALLHACK: OFF', Color3.fromRGB(200, 100, 200), UDim2.new(0.1, 0, 0.33, 0))
    wallBtn.MouseButton1Click:Connect(function()
        wallActive = not wallActive
        wallBtn.Text = wallActive and '👁️ WALLHACK: ON' or '👁️ WALLHACK: OFF'
    end)

    print('✅ NIX Hub loaded!')
end

print('✅ NIX KEY SYSTEM READY')
