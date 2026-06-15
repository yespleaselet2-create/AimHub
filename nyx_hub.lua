-- NYX AIMHUB PREMIUM - Encrypted + Discord Force Join
local Services = setmetatable({}, {__index = function(_, k) return game:GetService(k) end})
local Players = Services.Players
local HttpService = Services.HttpService

local player = Players.LocalPlayer

local screenGui = Instance.new('ScreenGui')
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild('PlayerGui')

local mainFrame = Instance.new('Frame')
mainFrame.Size = UDim2.new(0, 780, 0, 520)
mainFrame.Position = UDim2.new(0.5, -390, 0.5, -260)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
mainFrame.Parent = screenGui

local corner = Instance.new('UICorner', mainFrame)
corner.CornerRadius = UDim.new(0, 16)

local logo = Instance.new('ImageLabel')
logo.Size = UDim2.new(0, 40, 0, 40)
logo.Position = UDim2.new(0, 15, 0.5, -20)
logo.Image = 'rbxassetid://136267735357834'
logo.BackgroundTransparency = 1
logo.Parent = mainFrame

local title = Instance.new('TextLabel')
title.Text = 'NYX AIMHUB'
title.Size = UDim2.new(1, -80, 1, 0)
title.Position = UDim2.new(0, 70, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 80, 180)
title.Font = Enum.Font.GothamBlack
title.TextSize = 26
title.Parent = mainFrame

print('✅ NYX AimHub Loaded')

-- Force Join Discord Button (in script)
local function joinDiscord()
    setclipboard('https://discord.gg/2qS46kVNdj')
    -- Can't force open Discord app reliably, but this copies invite
    print('Discord invite copied - paste in browser or Discord')
end

joinDiscord()
