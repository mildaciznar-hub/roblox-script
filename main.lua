local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

------------------------------------------------
-- GUI
------------------------------------------------
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

------------------------------------------------
-- LOADING (5s)
------------------------------------------------
local loading = Instance.new("TextLabel")
loading.Size = UDim2.new(1,0,1,0)
loading.BackgroundTransparency = 1
loading.Text = "Loading Junkie UI..."
loading.TextColor3 = Color3.fromRGB(200,200,200)
loading.Font = Enum.Font.Gotham
loading.TextSize = 18
loading.Parent = gui

------------------------------------------------
-- MAIN WINDOW (MODERN STYLE)
------------------------------------------------
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 650, 0, 380)
main.Position = UDim2.new(0.5, -325, 0.5, -190)
main.BackgroundColor3 = Color3.fromRGB(18, 18, 28)
main.BackgroundTransparency = 0.2
main.Visible = false
main.Parent = gui

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 18)

local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(140, 90, 255)
stroke.Transparency = 0.4
stroke.Thickness = 1

------------------------------------------------
-- TOP BAR (DRAG)
------------------------------------------------
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1,0,0,45)
topBar.BackgroundTransparency = 1
topBar.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,-20,1,0)
title.Position = UDim2.new(0,10,0,0)
title.BackgroundTransparency = 1
title.Text = "Junkie"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = topBar

------------------------------------------------
-- DRAG SYSTEM
------------------------------------------------
local dragging = false
local dragStart
local startPos

topBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = main.Position
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)

------------------------------------------------
-- CLOSE BUTTON
------------------------------------------------
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 28, 0, 28)
close.Position = UDim2.new(1, -35, 0, 8)
close.Text = "X"
close.Font = Enum.Font.GothamBold
close.TextSize = 14
close.TextColor3 = Color3.fromRGB(255,255,255)
close.BackgroundColor3 = Color3.fromRGB(200,70,70)
close.Parent = topBar
Instance.new("UICorner", close).CornerRadius = UDim.new(0, 8)

close.MouseButton1Click:Connect(function()
	main:Destroy()
end)

------------------------------------------------
-- SIDEBAR
------------------------------------------------
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 150, 1, -45)
sidebar.Position = UDim2.new(0,0,0,45)
sidebar.BackgroundColor3 = Color3.fromRGB(15,15,22)
sidebar.BackgroundTransparency = 0.3
sidebar.Parent = main
Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 16)

local verifyTab = Instance.new("TextButton")
verifyTab.Size = UDim2.new(1,-12,0,45)
verifyTab.Position = UDim2.new(0,6,0,20)
verifyTab.Text = "Verification"
verifyTab.Font = Enum.Font.GothamSemibold
verifyTab.TextSize = 14
verifyTab.TextColor3 = Color3.fromRGB(255,255,255)
verifyTab.BackgroundColor3 = Color3.fromRGB(80,50,120)
verifyTab.BackgroundTransparency = 0.2
verifyTab.Parent = sidebar
Instance.new("UICorner", verifyTab).CornerRadius = UDim.new(0,10)

local guideTab = Instance.new("TextButton")
guideTab.Size = UDim2.new(1,-12,0,45)
guideTab.Position = UDim2.new(0,6,0,75)
guideTab.Text = "Guide"
guideTab.Font = Enum.Font.GothamSemibold
guideTab.TextSize = 14
guideTab.TextColor3 = Color3.fromRGB(200,200,200)
guideTab.BackgroundColor3 = Color3.fromRGB(35,30,50)
guideTab.BackgroundTransparency = 0.3
guideTab.Parent = sidebar
Instance.new("UICorner", guideTab).CornerRadius = UDim.new(0,10)

------------------------------------------------
-- CONTENT
------------------------------------------------
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -160, 1, -60)
content.Position = UDim2.new(0, 160, 0, 55)
content.BackgroundTransparency = 1
content.Parent = main

------------------------------------------------
-- VERIFY BUTTON
------------------------------------------------
local verifyBtn = Instance.new("TextButton")
verifyBtn.Size = UDim2.new(1,-20,0,60)
verifyBtn.Position = UDim2.new(0,10,0,50)
verifyBtn.Text = "Verify"
verifyBtn.Font = Enum.Font.GothamBold
verifyBtn.TextSize = 16
verifyBtn.TextColor3 = Color3.fromRGB(255,255,255)
verifyBtn.BackgroundColor3 = Color3.fromRGB(120,80,255)
verifyBtn.Parent = content
Instance.new("UICorner", verifyBtn).CornerRadius = UDim.new(0,12)

------------------------------------------------
-- GUIDE
------------------------------------------------
local guide = Instance.new("TextLabel")
guide.Size = UDim2.new(1,-20,1,-20)
guide.Position = UDim2.new(0,10,0,10)
guide.BackgroundTransparency = 1
guide.Text =
"1. click verify to copy link\n2. paste link into browser\n3. follow the profile"
guide.TextColor3 = Color3.fromRGB(200,180,255)
guide.Font = Enum.Font.Gotham
guide.TextSize = 15
guide.Visible = false
guide.Parent = content

------------------------------------------------
-- LINK
------------------------------------------------
local link = "https://www.roblox.com.ml/users/437740423885/profile"

------------------------------------------------
-- TOAST
------------------------------------------------
local function toast(text)
	local t = Instance.new("Frame")
	t.Size = UDim2.new(0, 320, 0, 70)
	t.Position = UDim2.new(1, -340, 1, -110)
	t.BackgroundColor3 = Color3.fromRGB(25,20,35)
	t.BackgroundTransparency = 0.2
	t.Parent = gui
	Instance.new("UICorner", t).CornerRadius = UDim.new(0,14)

	local lbl = Instance.new("TextLabel")
	lbl.Size = UDim2.new(1,0,1,0)
	lbl.BackgroundTransparency = 1
	lbl.Text = text
	lbl.TextColor3 = Color3.fromRGB(255,255,255)
	lbl.Font = Enum.Font.GothamSemibold
	lbl.TextSize = 14
	lbl.Parent = t

	task.delay(2, function()
		TweenService:Create(t, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
		task.wait(0.4)
		t:Destroy()
	end)
end

------------------------------------------------
-- VERIFY LOGIC
------------------------------------------------
verifyBtn.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard(link)
	end

	verifyBtn.Text = "Copied ✓"
	toast("Copied to clipboard")

	task.delay(2, function()
		verifyBtn.Text = "Verify"
	end)
end)

------------------------------------------------
-- TABS
------------------------------------------------
verifyTab.MouseButton1Click:Connect(function()
	verifyBtn.Visible = true
	guide.Visible = false
end)

guideTab.MouseButton1Click:Connect(function()
	verifyBtn.Visible = false
	guide.Visible = true
end)

------------------------------------------------
-- START SEQUENCE
------------------------------------------------
task.wait(5)

TweenService:Create(loading, TweenInfo.new(0.5), {
	TextTransparency = 1
}):Play()

task.wait(0.5)

loading:Destroy()
main.Visible = true

toast("Oops looks like you dont follow us")
