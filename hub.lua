
loadstring([=[
-- Alejandro.v6 (Script Hub - Todo Activado por Defecto)
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

-- Borra cualquier interfaz anterior que haya quedado en pantalla
for _, name in pairs({"AlejandroV6Gui", "AlejandroV6", "AlejandroGui"}) do
    for _, gui in pairs({LocalPlayer:FindFirstChildOfClass("PlayerGui"), game:GetService("CoreGui")}) do
        if gui and gui:FindFirstChild(name) then
            gui[name]:Destroy()
        end
    end
end

local ParentGui = (gethui and gethui()) or LocalPlayer:FindFirstChildOfClass("PlayerGui") or game:GetService("CoreGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AlejandroV6Gui"
ScreenGui.Parent = ParentGui
ScreenGui.ResetOnSpawn = false

local ToggleBubble = Instance.new("TextButton")
local BubbleCorner = Instance.new("UICorner")

ToggleBubble.Name = "ToggleBubble"
ToggleBubble.Parent = ScreenGui
ToggleBubble.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ToggleBubble.Position = UDim2.new(0.02, 0, 0.4, 0)
ToggleBubble.Size = UDim2.new(0, 50, 0, 50)
ToggleBubble.Text = "A.v6"
ToggleBubble.TextColor3 = Color3.fromRGB(0, 255, 150)
ToggleBubble.TextSize = 16
ToggleBubble.Font = Enum.Font.SourceSansBold
ToggleBubble.Active = true
ToggleBubble.Draggable = true

BubbleCorner.CornerRadius = UDim.new(1, 0)
BubbleCorner.Parent = ToggleBubble

local MainFrame = Instance.new("Frame")
local MainCorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Position = UDim2.new(0.35, 0, 0.15, 0)
MainFrame.Size = UDim2.new(0, 250, 0, 450)
MainFrame.Visible = true
MainFrame.Active = true
MainFrame.Draggable = true

MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 35)
Title.Text = "Alejandro.v6 FULL"
Title.TextColor3 = Color3.fromRGB(0, 255, 150)
Title.TextSize = 18
Title.Font = Enum.Font.SourceSansBold
Title.BackgroundTransparency = 1

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = MainFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local UIPadding = Instance.new("UIPadding")
UIPadding.Parent = MainFrame
UIPadding.PaddingTop = UDim.new(0, 5)

Title.LayoutOrder = 0

local function CreateButton(text, callback)
    local Btn = Instance.new("TextButton")
    local Corner = Instance.new("UICorner")
    
    Btn.Parent = MainFrame
    Btn.Size = UDim2.new(0.9, 0, 0, 32)
    Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Btn.Text = text
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Font = Enum.Font.SourceSans
    Btn.TextSize = 14
    
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Btn
    
    Btn.MouseButton1Click:Connect(callback)
    return Btn
end

-- Función para crear un campo de entrada de texto
local function CreateTextBox(placeholder, defaultText, callback)
    local Frame = Instance.new("Frame")
 