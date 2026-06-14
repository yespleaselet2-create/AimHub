-- NYX AIMHUB Premium - Full Script with Logo + Animations
local Services = setmetatable({}, {__index = function(_, k) return game:GetService(k) end})
local Players = Services.Players
local TweenService = Services.TweenService
local RunService = Services.RunService
local UserInputService = Services.UserInputService

local player = Players.LocalPlayer

local screenGui = Instance.new('ScreenGui')
screenGui.Name = 'NyxAimHub'
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild('PlayerGui')

local mainFrame = Instance.new('Frame')
mainFrame.Size = UDim2.new(0, 780, 0, 520)
mainFrame.Position = UDim2.new(0.5, -390, 0.5, -260)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local corner = Instance.new('UICorner')
corner.CornerRadius = UDim.new(0, 16)
corner.Parent = mainFrame

-- Title Bar
local titleBar = Instance.new('Frame')
titleBar.Size = UDim2.new(1, 0, 0, 50)
titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
titleBar.Parent = mainFrame

local titleCorner = Instance.new('UICorner')
titleCorner.CornerRadius = UDim.new(0, 16)
titleCorner.Parent = titleBar

-- Your Logo
local logo = Instance.new('ImageLabel')
logo.Size = UDim2.new(0, 40, 0, 40)
logo.Position = UDim2.new(0, 15, 0.5, -20)
logo.BackgroundTransparency = 1
logo.Image = 'rbxassetid://136267735357834'
logo.Parent = titleBar

local title = Instance.new('TextLabel')
title.Text = 'NYX AIMHUB'
title.Size = UDim2.new(1, -80, 1, 0)
title.Position = UDim2.new(0, 70, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 80, 180)
title.Font = Enum.Font.GothamBlack
title.TextSize = 26
title.Parent = titleBar

print('NYX AimHub Loaded - Beautiful UI with your logo')
-- [Full aimbot, ESP, fly, kill aura, etc. features are inside the real file - this is the header]
