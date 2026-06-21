local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

-- MAIN FRAME
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 380, 0, 180)
frame.Position = UDim2.new(0.5, -190, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
frame.BackgroundTransparency = 0.2
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = frame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(120, 120, 255)
stroke.Transparency = 0.6
stroke.Thickness = 1
stroke.Parent = frame

-- TITLE
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -20, 0, 40)
title.Position = UDim2.new(0, 10, 0, 10)
title.BackgroundTransparency = 1
title.Text = "Verification Panel"
title.TextColor3 = Color3.fromRGB(240, 240, 240)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = frame

-- INFO TEXT
local info = Instance.new("TextLabel")
info.Size = UDim2.new(1, -20, 0, 40)
info.Position = UDim2.new(0, 10, 0, 55)
info.BackgroundTransparency = 1
info.Text = "Follow this profile for verification"
info.TextColor3 = Color3.fromRGB(180, 180, 180)
info.Font = Enum.Font.Gotham
info.TextSize = 14
info.TextXAlignment = Enum.TextXAlignment.Left
info.Parent = frame

-- BUTTON
local button = Instance.new("TextButton")
button.Size = UDim2.new(1, -20, 0, 45)
button.Position = UDim2.new(0, 10, 0, 110)
button.BackgroundColor3 = Color3.fromRGB(60, 60, 255)
button.Text = "Copy Profile Link"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamSemibold
button.TextSize = 14
button.Parent = frame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 10)
btnCorner.Parent = button

-- HOVER EFFECT
button.MouseEnter:Connect(function()
	TweenService:Create(button, TweenInfo.new(0.15), {
		BackgroundColor3 = Color3.fromRGB(80, 80, 255)
	}):Play()
end)

button.MouseLeave:Connect(function()
	TweenService:Create(button, TweenInfo.new(0.15), {
		BackgroundColor3 = Color3.fromRGB(60, 60, 255)
	}):Play()
end)

-- LINK
local link = "https://www.roblox.com/users/437740423885/profile"

-- CLICK
button.MouseButton1Click:Connect(function()
	button.Text = "Copied ✓"

	if setclipboard then
		setclipboard(link)
	else
		game:GetService("GuiService"):OpenBrowserWindow(link)
	end

	task.wait(1.5)
	button.Text = "Copy Profile Link"
end)

-- FADE IN ANIMATION
frame.BackgroundTransparency = 1
TweenService:Create(frame, TweenInfo.new(0.4), {
	BackgroundTransparency = 0.2
}):Play()
