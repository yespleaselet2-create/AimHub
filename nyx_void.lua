-- NYX VOID - ABSOLUTE MINIMAL SAFE (No services that crash)
print('NYX VOID Starting...')

if getgenv().NyxVoidLoaded then return end
getgenv().NyxVoidLoaded = true

local player = game.Players.LocalPlayer
local guiParent = player.PlayerGui

local sg = Instance.new('ScreenGui')
sg.Name = 'NyxVoid'
sg.ResetOnSpawn = false
sg.Parent = guiParent

local frame = Instance.new('Frame')
frame.Size = UDim2.new(0, 400, 0, 200)
frame.Position = UDim2.new(0.5, -200, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
frame.Parent = sg

local corner = Instance.new('UICorner')
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local title = Instance.new('TextLabel')
title.Size = UDim2.new(1,0,0,50)
title.BackgroundTransparency = 1
title.Text = 'NYX VOID'
title.TextColor3 = Color3.fromRGB(255, 100, 200)
title.TextSize = 24
title.Font = Enum.Font.GothamBold
title.Parent = frame

local status = Instance.new('TextLabel')
status.Size = UDim2.new(1,0,1,-60)
status.Position = UDim2.new(0,0,0,50)
status.BackgroundTransparency = 1
status.Text = 'MINIMAL SAFE VERSION\nLoaded Without Crashing'
status.TextColor3 = Color3.new(1,1,1)
status.TextSize = 16
status.Parent = frame

print('✅ NYX VOID Minimal Safe Loaded')

local unload = Instance.new('TextButton')
unload.Size = UDim2.new(0,100,0,40)
unload.Position = UDim2.new(0.5,-50,1,-50)
unload.BackgroundColor3 = Color3.fromRGB(180,40,40)
unload.Text = 'UNLOAD'
unload.TextColor3 = Color3.new(1,1,1)
unload.Parent = frame

unload.MouseButton1Click:Connect(function()
    sg:Destroy()
    getgenv().NyxVoidLoaded = nil
end)
