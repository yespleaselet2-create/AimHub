-- FULL NYX AIMHUB with Logo + Basic Aimbot/ESP placeholder
local Services = setmetatable({}, {__index = function(_, k) return game:GetService(k) end})
local Players = Services.Players
local RunService = Services.RunService

local player = Players.LocalPlayer

local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 780, 0, 520)
mainFrame.Position = UDim2.new(0.5, -390, 0.5, -260)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner", mainFrame)
corner.CornerRadius = UDim.new(0, 16)

local logo = Instance.new("ImageLabel")
logo.Size = UDim2.new(0, 40, 0, 40)
logo.Position = UDim2.new(0, 15, 0.5, -20)
logo.Image = "rbxassetid://136267735357834"
logo.BackgroundTransparency = 1
logo.Parent = mainFrame

print("✅ Full Nyx AimHub Loaded - Use /sendverifypanel in Discord")
-- More features (aimbot, esp, fly, etc.) can be added on request
