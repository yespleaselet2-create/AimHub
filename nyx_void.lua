-- NYX VOID - MAXIMUM SAFE VERSION (pcall + defensive)
-- Loadstring: loadstring(game:HttpGet('https://raw.githubusercontent.com/yespleaselet2-create/AimHub/main/nyx_void.lua'))()

print('NYX VOID Starting...')

local function safeGetService(name)
    local success, service = pcall(function() return game:GetService(name) end)
    return success and service or nil
end

local Players = safeGetService('Players')
if not Players then
    print('Failed to get Players service')
    return
end

local player = Players.LocalPlayer
if not player then
    print('No LocalPlayer')
    return
end

if getgenv().NyxVoidLoaded then
    print('Already loaded')
    return
end
getgenv().NyxVoidLoaded = true

-- Safe GUI Parent
local guiParent = player:FindFirstChild('PlayerGui')
if not guiParent then
    local success, core = pcall(function() return game:GetService('CoreGui') end)
    guiParent = success and core or player
end

local sg = Instance.new('ScreenGui')
sg.Name = 'NyxVoid'
sg.ResetOnSpawn = false
sg.Parent = guiParent

local frame = Instance.new('Frame')
frame.Size = UDim2.new(0, 420, 0, 280)
frame.Position = UDim2.new(0.5, -210, 0.5, -140)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
frame.Parent = sg

local corner = Instance.new('UICorner')
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local title = Instance.new('TextLabel')
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = 'NYX VOID'
title.TextColor3 = Color3.fromRGB(255, 100, 200)
title.TextSize = 26
title.Font = Enum.Font.GothamBold
title.Parent = frame

local status = Instance.new('TextLabel')
status.Size = UDim2.new(1, 0, 1, -100)
status.Position = UDim2.new(0, 0, 0, 50)
status.BackgroundTransparency = 1
status.Text = 'Loaded Successfully\nUltra Safe Version\nNo more crashes'
status.TextColor3 = Color3.new(1,1,1)
status.TextSize = 18
status.Parent = frame

print('✅ NYX VOID Loaded - Maximum Safe Mode')

local unload = Instance.new('TextButton')
unload.Size = UDim2.new(0, 140, 0, 40)
unload.Position = UDim2.new(0.5, -70, 1, -55)
unload.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
unload.Text = 'UNLOAD'
unload.TextColor3 = Color3.new(1,1,1)
unload.Parent = frame

unload.MouseButton1Click:Connect(function()
    pcall(function() sg:Destroy() end)
    getgenv().NyxVoidLoaded = nil
    print('NYX VOID Unloaded')
end)
