 local Players = game:G
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
imageButton.Position =