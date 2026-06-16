-- NYX VOID - MINIMAL SAFE VERSION (No crashes)
loadstring(game:HttpGet('https://raw.githubusercontent.com/yespleaselet2-create/AimHub/main/nyx_void.lua'))()

local player = game.Players.LocalPlayer
if getgenv().NyxVoid then return end
getgenv().NyxVoid = true

local sg = Instance.new('ScreenGui')
sg.ResetOnSpawn = false
sg.Parent = player:FindFirstChild('PlayerGui') or game:GetService('CoreGui')

local frame = Instance.new('Frame')
frame.Size = UDim2.new(0, 400, 0, 300)
frame.Position = UDim2.new(0.5, -200, 0.5, -150)
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
title.TextSize = 24
title.Font = Enum.Font.GothamBold
title.Parent = frame

local text = Instance.new('TextLabel')
text.Size = UDim2.new(1, 0, 1, -50)
text.Position = UDim2.new(0, 0, 0, 50)
text.BackgroundTransparency = 1
text.Text = 'Loaded Successfully\\nMinimal Stable Version'
text.TextColor3 = Color3.new(1,1,1)
text.TextSize = 18
text.Parent = frame

print('✅ NYX VOID Minimal Loaded - No Crashes')

local unload = Instance.new('TextButton')
unload.Size = UDim2.new(0, 100, 0, 40)
unload.Position = UDim2.new(0.5, -50, 1, -50)
unload.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
unload.Text = 'UNLOAD'
unload.TextColor3 = Color3.new(1,1,1)
unload.Parent = frame

unload.MouseButton1Click:Connect(function()
    sg:Destroy()
    getgenv().NyxVoid = nil
end)
