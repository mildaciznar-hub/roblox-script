local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 360, 0, 160)
frame.Position = UDim2.new(0.5, -180, 0.5, -80)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
frame.Parent = gui

local button = Instance.new("TextButton")
button.Size = UDim2.new(1, -20, 0, 50)
button.Position = UDim2.new(0, 10, 0, 10)
button.Text = "Verify"
button.Parent = frame

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, -20, 0, 50)
label.Position = UDim2.new(0, 10, 0, 70)
label.Text = "Follow this profile for verification"
label.BackgroundTransparency = 1
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.Parent = frame

local link = "https://www.roblox.com/users/437740423885/profile"

button.MouseButton1Click:Connect(function()
	print("Verify clicked")

	setclipboard = setclipboard or nil
	if setclipboard then
		setclipboard(link)
	else
		game:GetService("GuiService"):OpenBrowserWindow(link)
	end
end)
