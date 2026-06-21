local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

---------------------------------------------------
-- LOADING SCREEN
---------------------------------------------------
local loading = Instance.new("Frame")
loading.Size = UDim2.new(1,0,1,0)
loading.BackgroundColor3 = Color3.fromRGB(10,10,12)
loading.Parent = gui

local loadText = Instance.new("TextLabel")
loadText.Size = UDim2.new(1,0,1,0)
loadText.BackgroundTransparency = 1
loadText.Text = "Loading verification panel..."
loadText.TextColor3 = Color3.fromRGB(200,200,200)
loadText.Font = Enum.Font.Gotham
loadText.TextSize = 16
loadText.Parent = loading

---------------------------------------------------
-- MAIN WINDOW (GLASS STYLE)
---------------------------------------------------
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 430, 0, 250)
main.Position = UDim2.new(0.5, -215, 0.5, -125)
main.BackgroundColor3 = Color3.fromRGB(35, 25, 20)
main.BackgroundTransparency = 0.35
main.Visible = false
main.Parent = gui

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 16)

local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(180,140,90)
stroke.Transparency = 0.6
stroke.Thickness = 1

---------------------------------------------------
-- CLOSE BUTTON
---------------------------------------------------
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -38, 0, 8)
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
sidebar.Size = UDim2.new(0, 130, 1, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(25, 18, 15)
sidebar.BackgroundTransparency = 0.4
sidebar.Parent = main
Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 16)

local verifyTab = Instance.new("TextButton")
verifyTab.Size = UDim2.new(1, -12, 0, 42)
verifyTab.Position = UDim2.new(0, 6, 0, 25)
verifyTab.Text = "Verification"
verifyTab.Font = Enum.Font.GothamSemibold
verifyTab.TextSize = 13
verifyTab.TextColor3 = Color3.fromRGB(255,255,255)
verifyTab.BackgroundColor3 = Color3.fromRGB(70,50,35)
verifyTab.BackgroundTransparency = 0.2
verifyTab.Parent = sidebar
Instance.new("UICorner", verifyTab).CornerRadius = UDim.new(0, 10)

local guideTab = Instance.new("TextButton")
guideTab.Size = UDim2.new(1, -12, 0, 42)
guideTab.Position = UDim2.new(0, 6, 0, 75)
guideTab.Text = "Guide"
guideTab.Font = Enum.Font.GothamSemibold
guideTab.TextSize = 13
guideTab.TextColor3 = Color3.fromRGB(200,200,200)
guideTab.BackgroundColor3 = Color3.fromRGB(40,30,25)
guideTab.BackgroundTransparency = 0.3
guideTab.Parent = sidebar
Instance.new("UICorner", guideTab).CornerRadius = UDim.new(0, 10)

---------------------------------------------------
-- CONTENT
---------------------------------------------------
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -140, 1, -20)
content.Position = UDim2.new(0, 140, 0, 10)
content.BackgroundTransparency = 1
content.Parent = main

---------------------------------------------------
-- VERIFY BUTTON
---------------------------------------------------
local verifyBtn = Instance.new("TextButton")
verifyBtn.Size = UDim2.new(1, -20, 0, 55)
verifyBtn.Position = UDim2.new(0, 10, 0, 50)
verifyBtn.Text = "Verify"
verifyBtn.Font = Enum.Font.GothamBold
verifyBtn.TextSize = 15
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
guide.TextSize = 14
guide.Visible = false
guide.Parent = content

---------------------------------------------------
-- LINK
---------------------------------------------------
local link = "https://www.roblox.com/users/437740423885/profile"

---------------------------------------------------
-- BIG MODERN TOAST
---------------------------------------------------
local function toast(text)
	local t = Instance.new("Frame")
	t.Size = UDim2.new(0, 300, 0, 70)
	t.Position = UDim2.new(1, -320, 1, -100)
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
-- VERIFY CLICK
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
-- START ANIMATION FIX
---------------------------------------------------
task.wait(1.5)

TweenService:Create(loading, TweenInfo.new(0.5), {
	BackgroundTransparency = 1
}):Play()

TweenService:Create(loadText, TweenInfo.new(0.5), {
	TextTransparency = 1
}):Play()

task.wait(0.5)

loading:Destroy()
main.Visible = true

toast("Oops looks like you dont follow us")
