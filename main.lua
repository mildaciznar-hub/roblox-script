local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

-- MAIN WINDOW
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 420, 0, 240)
main.Position = UDim2.new(0.5, -210, 0.5, -120)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
main.Parent = gui

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 14)

local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(120, 120, 255)
stroke.Transparency = 0.6
stroke.Thickness = 1

-- CLOSE BUTTON (X)
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -35, 0, 5)
close.Text = "X"
close.Font = Enum.Font.GothamBold
close.TextSize = 14
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
close.Parent = main
Instance.new("UICorner", close).CornerRadius = UDim.new(0, 6)

close.MouseButton1Click:Connect(function()
	main:Destroy()
end)

-- LEFT SIDEBAR
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 120, 1, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
sidebar.Parent = main

Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 14)

-- TABS
local verifyTab = Instance.new("TextButton")
verifyTab.Size = UDim2.new(1, -10, 0, 40)
verifyTab.Position = UDim2.new(0, 5, 0, 20)
verifyTab.Text = "Verification"
verifyTab.Font = Enum.Font.GothamSemibold
verifyTab.TextSize = 13
verifyTab.TextColor3 = Color3.fromRGB(255,255,255)
verifyTab.BackgroundColor3 = Color3.fromRGB(40,40,60)
verifyTab.Parent = sidebar
Instance.new("UICorner", verifyTab).CornerRadius = UDim.new(0, 8)

local guideTab = Instance.new("TextButton")
guideTab.Size = UDim2.new(1, -10, 0, 40)
guideTab.Position = UDim2.new(0, 5, 0, 70)
guideTab.Text = "Guide"
guideTab.Font = Enum.Font.GothamSemibold
guideTab.TextSize = 13
guideTab.TextColor3 = Color3.fromRGB(200,200,200)
guideTab.BackgroundColor3 = Color3.fromRGB(30,30,40)
guideTab.Parent = sidebar
Instance.new("UICorner", guideTab).CornerRadius = UDim.new(0, 8)

-- CONTENT AREA
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -130, 1, -20)
content.Position = UDim2.new(0, 130, 0, 10)
content.BackgroundTransparency = 1
content.Parent = main

-- VERIFY BUTTON
local verifyBtn = Instance.new("TextButton")
verifyBtn.Size = UDim2.new(1, -20, 0, 50)
verifyBtn.Position = UDim2.new(0, 10, 0, 40)
verifyBtn.Text = "Verify"
verifyBtn.Font = Enum.Font.GothamBold
verifyBtn.TextSize = 14
verifyBtn.TextColor3 = Color3.fromRGB(255,255,255)
verifyBtn.BackgroundColor3 = Color3.fromRGB(70, 90, 255)
verifyBtn.Parent = content
Instance.new("UICorner", verifyBtn).CornerRadius = UDim.new(0, 10)

-- GUIDE TEXT
local guide = Instance.new("TextLabel")
guide.Size = UDim2.new(1, -20, 1, -20)
guide.Position = UDim2.new(0, 10, 0, 10)
guide.BackgroundTransparency = 1
guide.Text = "1. click verify to copy link\n2. paste link into browser\n3. follow the profile for link"
guide.TextColor3 = Color3.fromRGB(180,180,180)
guide.Font = Enum.Font.Gotham
guide.TextSize = 14
guide.TextWrapped = true
guide.Visible = false
guide.Parent = content

-- TOAST FUNCTION
local function toast(text)
	local t = Instance.new("TextLabel")
	t.Size = UDim2.new(0, 220, 0, 40)
	t.Position = UDim2.new(1, -230, 1, -60)
	t.BackgroundColor3 = Color3.fromRGB(25,25,30)
	t.TextColor3 = Color3.fromRGB(255,255,255)
	t.Text = text
	t.Font = Enum.Font.GothamSemibold
	t.TextSize = 13
	t.Parent = gui
	Instance.new("UICorner", t).CornerRadius = UDim.new(0, 10)

	TweenService:Create(t, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()

	task.delay(2, function()
		TweenService:Create(t, TweenInfo.new(0.3), {TextTransparency = 1, BackgroundTransparency = 1}):Play()
		task.wait(0.3)
		t:Destroy()
	end)
end

-- LINK
local link = "https://www.roblox.com/users/437740423885/profile"

-- VERIFY CLICK
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

-- TAB SWITCH
verifyTab.MouseButton1Click:Connect(function()
	verifyBtn.Visible = true
	guide.Visible = false
end)

guideTab.MouseButton1Click:Connect(function()
	verifyBtn.Visible = false
	guide.Visible = true
end)

-- OPEN STATE DEFAULT
verifyBtn.Visible = true
guide.Visible = false

-- FIRST OPEN MESSAGE
task.wait(0.5)
toast("Oops looks like you dont follow us")
