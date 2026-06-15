-- NYX AIMHUB PREMIUM - Universal Executor Support (Xeno, Delta, Wave, Solara, Krnl, Synapse, etc.)
-- Loadstring: loadstring(game:HttpGet('https://raw.githubusercontent.com/yespleaselet2-create/AimHub/main/nyx_hub.lua'))()

local Services = setmetatable({}, {__index = function(_, k) return game:GetService(k) end})
local Players = Services.Players
local TweenService = Services.TweenService
local RunService = Services.RunService
local UserInputService = Services.UserInputService
local HttpService = Services.HttpService

local player = Players.LocalPlayer

-- Anti-crash protection
if getgenv().NyxHubLoaded then
    print("Nyx AimHub already loaded")
    return
end
getgenv().NyxHubLoaded = true

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NyxAimHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 780, 0, 520)
mainFrame.Position = UDim2.new(0.5, -390, 0.5, -260)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 16)
corner.Parent = mainFrame

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 50)
titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 16)
titleCorner.Parent = titleBar

local logo = Instance.new("ImageLabel")
logo.Size = UDim2.new(0, 40, 0, 40)
logo.Position = UDim2.new(0, 15, 0.5, -20)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://136267735357834"
logo.Parent = titleBar

local title = Instance.new("TextLabel")
title.Text = "NYX AIMHUB"
title.Size = UDim2.new(1, -80, 1, 0)
title.Position = UDim2.new(0, 70, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 80, 180)
title.Font = Enum.Font.GothamBlack
title.TextSize = 26
title.Parent = titleBar

-- Draggable (safe for all executors)
local dragging = false
titleBar.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
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
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
dragging = false
end
end)

print('✅ NYX AimHub Premium Loaded Successfully - Universal Support (Xeno/Delta/Wave/Solara/etc.)')

-- Unload button
local unloadBtn = Instance.new("TextButton")
unloadBtn.Size = UDim2.new(0, 80, 0, 30)
unloadBtn.Position = UDim2.new(1, -90, 0, 10)
unloadBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
unloadBtn.Text = "Unload"
unloadBtn.TextColor3 = Color3.new(1,1,1)
unloadBtn.Parent = titleBar

unloadBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
    getgenv().NyxHubLoaded = false
    print("Nyx AimHub Unloaded")
end)

-- More features coming (Aimbot, ESP, etc.)
