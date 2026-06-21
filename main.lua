local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

------------------------------------------------
-- MAIN BACKGROUND
------------------------------------------------
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 700, 0, 420)
main.Position = UDim2.new(0.5, -350, 0.5, -210)
main.BackgroundColor3 = Color3.fromRGB(18, 18, 28)
main.Parent = gui

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 18)

local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(130, 80, 255)
stroke.Transparency = 0.4
stroke.Thickness = 1

------------------------------------------------
-- LEFT PANEL (USER INFO)
------------------------------------------------
local left = Instance.new("Frame")
left.Size = UDim2.new(0, 220, 1, -20)
left.Position = UDim2.new(0, 10, 0, 10)
left.BackgroundColor3 = Color3.fromRGB(12, 12, 20)
left.BackgroundTransparency = 0.2
left.Parent = main

Instance.new("UICorner", left).CornerRadius = UDim.new(0, 14)

local leftStroke = Instance.new("UIStroke", left)
leftStroke.Color = Color3.fromRGB(90, 60, 200)
leftStroke.Transparency = 0.6

local titleLeft = Instance.new("TextLabel")
titleLeft.Size = UDim2.new(1, -20, 0, 30)
titleLeft.Position = UDim2.new(0, 10, 0, 10)
titleLeft.BackgroundTransparency = 1
titleLeft.Text = "User Info"
titleLeft.TextColor3 = Color3.fromRGB(255,255,255)
titleLeft.Font = Enum.Font.GothamBold
titleLeft.TextSize = 16
titleLeft.TextXAlignment = Enum.TextXAlignment.Left
titleLeft.Parent = left

local info = Instance.new("TextLabel")
info.Size = UDim2.new(1, -20, 0, 120)
info.Position = UDim2.new(0, 10, 0, 60)
info.BackgroundTransparency = 1
info.Text = "Welcome,\n"..player.Name.."\n\nDevice: PC\nStatus: Premium"
info.TextColor3 = Color3.fromRGB(180,180,180)
info.Font = Enum.Font.Gotham
info.TextSize = 14
info.TextXAlignment = Enum.TextXAlignment.Left
info.Parent = left

------------------------------------------------
-- RIGHT PANEL (KEY SYSTEM)
------------------------------------------------
local right = Instance.new("Frame")
right.Size = UDim2.new(0, 430, 1, -20)
right.Position = UDim2.new(0, 240, 0, 10)
right.BackgroundColor3 = Color3.fromRGB(12, 12, 20)
right.BackgroundTransparency = 0.2
right.Parent = main

Instance.new("UICorner", right).CornerRadius = UDim.new(0, 14)

local rightStroke = Instance.new("UIStroke", right)
rightStroke.Color = Color3.fromRGB(140, 90, 255)
rightStroke.Transparency = 0.5

local titleRight = Instance.new("TextLabel")
titleRight.Size = UDim2.new(1, -20, 0, 40)
titleRight.Position = UDim2.new(0, 10, 0, 10)
titleRight.BackgroundTransparency = 1
titleRight.Text = "Junkie"
titleRight.TextColor3 = Color3.fromRGB(255,255,255)
titleRight.Font = Enum.Font.GothamBold
titleRight.TextSize = 22
titleRight.TextXAlignment = Enum.TextXAlignment.Left
titleRight.Parent = right

------------------------------------------------
-- INPUT BOX
------------------------------------------------
local box = Instance.new("TextBox")
box.Size = UDim2.new(1, -20, 0, 50)
box.Position = UDim2.new(0, 10, 0, 70)
box.PlaceholderText = "Enter your key..."
box.Text = ""
box.TextColor3 = Color3.fromRGB(255,255,255)
box.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
box.Font = Enum.Font.Gotham
box.TextSize = 14
box.Parent = right

Instance.new("UICorner", box).CornerRadius = UDim.new(0, 10)

------------------------------------------------
-- BUTTONS
------------------------------------------------
local getKey = Instance.new("TextButton")
getKey.Size = UDim2.new(0.48, 0, 0, 45)
getKey.Position = UDim2.new(0, 10, 0, 140)
getKey.Text = "Get Key"
getKey.BackgroundColor3 = Color3.fromRGB(40,40,70)
getKey.TextColor3 = Color3.fromRGB(255,255,255)
getKey.Font = Enum.Font.GothamSemibold
getKey.TextSize = 14
getKey.Parent = right
Instance.new("UICorner", getKey).CornerRadius = UDim.new(0, 10)

local redeem = Instance.new("TextButton")
redeem.Size = UDim2.new(0.48, 0, 0, 45)
redeem.Position = UDim2.new(0.52, 0, 0, 140)
redeem.Text = "Redeem Key"
redeem.BackgroundColor3 = Color3.fromRGB(130, 80, 255)
redeem.TextColor3 = Color3.fromRGB(255,255,255)
redeem.Font = Enum.Font.GothamBold
redeem.TextSize = 14
redeem.Parent = right
Instance.new("UICorner", redeem).CornerRadius = UDim.new(0, 10)

------------------------------------------------
-- BUTTON FX
------------------------------------------------
redeem.MouseButton1Click:Connect(function()
	if box.Text == "1234" then
		redeem.Text = "Verified ✓"
		redeem.BackgroundColor3 = Color3.fromRGB(80,200,120)
	else
		redeem.Text = "Wrong Key"
		task.wait(1)
		redeem.Text = "Redeem Key"
	end
end)
