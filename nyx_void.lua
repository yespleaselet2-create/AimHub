-- NYX VOID - Premium Universal Roblox Script (Fixed & Stable)
-- Works on Xeno, Delta, Wave, Solara, etc.
-- Loadstring: loadstring(game:HttpGet('https://raw.githubusercontent.com/yespleaselet2-create/AimHub/main/nyx_void.lua'))()

local Services = setmetatable({}, {__index = function(_, k) return game:GetService(k) end})
local Players = Services.Players
local TweenService = Services.TweenService
local RunService = Services.RunService
local UserInputService = Services.UserInputService

local player = Players.LocalPlayer

if getgenv().NyxVoidLoaded then
    print('NYX VOID already loaded')
    return
end
getgenv().NyxVoidLoaded = true

-- Safe GUI Creation
local screenGui = Instance.new('ScreenGui')
screenGui.Name = 'NyxVoid'
screenGui.ResetOnSpawn = false
screenGui.Parent = (player:FindFirstChild('PlayerGui') or game:GetService('CoreGui'))

local mainFrame = Instance.new('Frame')
mainFrame.Size = UDim2.new(0, 820, 0, 560)
mainFrame.Position = UDim2.new(0.5, -410, 0.5, -280)
mainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local corner = Instance.new('UICorner')
corner.CornerRadius = UDim.new(0, 18)
corner.Parent = mainFrame

-- Title Bar
local titleBar = Instance.new('Frame')
titleBar.Size = UDim2.new(1, 0, 0, 55)
titleBar.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
titleBar.Parent = mainFrame

local titleCorner = Instance.new('UICorner')
titleCorner.CornerRadius = UDim.new(0, 18)
titleCorner.Parent = titleBar

local logo = Instance.new('ImageLabel')
logo.Size = UDim2.new(0, 42, 0, 42)
logo.Position = UDim2.new(0, 16, 0.5, -21)
logo.BackgroundTransparency = 1
logo.Image = 'rbxassetid://136267735357834'
logo.Parent = titleBar

local title = Instance.new('TextLabel')
title.Text = 'NYX VOID'
title.Size = UDim2.new(1, -100, 1, 0)
title.Position = UDim2.new(0, 75, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 90, 190)
title.Font = Enum.Font.GothamBlack
title.TextSize = 28
title.Parent = titleBar

-- Safe Draggable
local dragging = false
titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        local dragStart = input.Position
        local startPos = mainFrame.Position
        local conn
        conn = RunService.RenderStepped:Connect(function()
            if dragging then
                local delta = input.Position - dragStart
                mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            else
                conn:Disconnect()
            end
        end)
    end
end)

titleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

print('✅ NYX VOID Loaded Successfully - Stable Version')

-- Unload Button
local unload = Instance.new('TextButton')
unload.Size = UDim2.new(0, 90, 0, 32)
unload.Position = UDim2.new(1, -100, 0, 12)
unload.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
unload.Text = 'UNLOAD'
unload.TextColor3 = Color3.new(1,1,1)
unload.Font = Enum.Font.GothamBold
unload.Parent = titleBar

unload.MouseButton1Click:Connect(function()
    screenGui:Destroy()
    getgenv().NyxVoidLoaded = false
    print('NYX VOID Unloaded')
end)
