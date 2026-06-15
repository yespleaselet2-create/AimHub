-- NYX VOID - Ultra Stable Version (Tested Logic)
-- Loadstring: loadstring(game:HttpGet('https://raw.githubusercontent.com/yespleaselet2-create/AimHub/main/nyx_void.lua'))()

local Services = setmetatable({}, {__index = function(_, k) return game:GetService(k) end})
local Players = Services.Players
local RunService = Services.RunService

local player = Players.LocalPlayer

if getgenv().NyxVoidLoaded then return end
getgenv().NyxVoidLoaded = true

-- Safe GUI Parent
local guiParent = player:FindFirstChild("PlayerGui") or game:GetService("CoreGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NyxVoid"
screenGui.ResetOnSpawn = false
screenGui.Parent = guiParent

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 800, 0, 500)
mainFrame.Position = UDim2.new(0.5, -400, 0.5, -250)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 50)
titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = titleBar

local logo = Instance.new("ImageLabel")
logo.Size = UDim2.new(0, 40, 0, 40)
logo.Position = UDim2.new(0, 15, 0.5, -20)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://136267735357834"
logo.Parent = titleBar

local title = Instance.new("TextLabel")
title.Text = "NYX VOID"
title.Size = UDim2.new(1, -100, 1, 0)
title.Position = UDim2.new(0, 70, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 100, 200)
title.Font = Enum.Font.GothamBlack
title.TextSize = 26
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

print("✅ NYX VOID Loaded Successfully - Stable Version")

-- Unload
local unloadBtn = Instance.new("TextButton")
unloadBtn.Size = UDim2.new(0, 80, 0, 30)
unloadBtn.Position = UDim2.new(1, -90, 0, 10)
unloadBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
unloadBtn.Text = "UNLOAD"
unloadBtn.TextColor3 = Color3.new(1,1,1)
unloadBtn.Parent = titleBar

unloadBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
    getgenv().NyxVoidLoaded = nil
    print("NYX VOID Unloaded")
end)
