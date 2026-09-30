local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- Fix para telefono / Delta
local playerGui = gethui and gethui() or game.CoreGui

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FloatingMenuGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Bola flotante
local imageButton = Instance.new("ImageButton")
imageButton.Name = "FloatingBall"
imageButton.Size = UDim2.new(0, 70, 0, 70)
imageButton.Position = UDim2.new(0.85, 0, 0.5, 0)
imageButton.Image = "rbxassetid://6031091002" -- Icono AH arreglado
imageButton.BackgroundColor3 = Color3.fromRGB(0,0,0)
imageButton.Parent = screenGui
Instance.new("UICorner", imageButton).CornerRadius = UDim.new(1, 0)

-- Hacerla arrastrable
imageButton.Active = true
imageButton.Draggable = true

-- Menu
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 180, 0, 120)
menuFrame.Position = UDim2.new(0.85, -190, 0.5, 0)
menuFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
menuFrame.Visible = false
menuFrame.Parent = screenGui
Instance.new("UICorner", menuFrame).CornerRadius = UDim.new(0, 8)

local isInvisible = false
local highJumpEnabled = false

local invButton = Instance.new("TextButton")
invButton.Size = UDim2.new(0.9, 0, 0.4, 0)
invButton.Position = UDim2.new(0.05, 0, 0.1, 0)
invButton.Text = "Invisibilidad: OFF"
invButton.Parent = menuFrame

local jumpButton = Instance.new("TextButton")
jumpButton.Size = UDim2.new(0.9, 0, 0.4, 0)
jumpButton.Position = UDim2.new(0.05, 0, 0.55, 0)
jumpButton.Text = "Super Salto: OFF"
jumpButton.Parent = menuFrame

imageButton.MouseButton1Click:Connect(function()
	menuFrame.Visible = not menuFrame.Visible
end)

invButton.MouseButton1Click:Connect(function()
	local character = player.Character
	if not character then return end
	isInvisible = not isInvisible
	invButton.Text = "Invisibilidad: " .. (isInvisible and "ON" or "OFF")
	for _, part in ipairs(character:GetDescendants()) do
		if part:IsA("BasePart") or part:IsA("Decal") then
			part.Transparency = isInvisible and 1 or 0
		end
	end
end)

jumpButton.MouseButton1Click:Connect(function()
	local character = player.Character
	if not character then return end
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return end
	highJumpEnabled = not highJumpEnabled
	jumpButton.Text = "Super Salto: " .. (highJumpEnabled and "ON" or "OFF")
	humanoid.UseJumpPower = true
	humanoid.JumpPower = highJumpEnabled and 120 or 50
end)

game.StarterGui:SetCore("SendNotification", {
    Title = "Alejandro Hub",
    Text = "Hub Cargado!",
    Duration = 3
})
