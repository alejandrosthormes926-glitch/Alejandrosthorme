-- Alejandro.v6 (Script Hub)
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer

-- Pantalla Principal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AlejandroV6Gui"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- Bolita Flotante para Abrir/Cerrar
local ToggleBubble = Instance.new("TextButton")
local BubbleCorner = Instance.new("UICorner")

ToggleBubble.Name = "ToggleBubble"
ToggleBubble.Parent = ScreenGui
ToggleBubble.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ToggleBubble.Position = UDim2.new(0.02, 0, 0.4, 0)
ToggleBubble.Size = UDim2.new(0, 50, 0, 50)
ToggleBubble.Text = "A.v6"
ToggleBubble.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBubble.TextSize = 16
ToggleBubble.Font = Enum.Font.SourceSansBold
ToggleBubble.Active = true
ToggleBubble.Draggable = true

BubbleCorner.CornerRadius = UDim.new(1, 0)
BubbleCorner.Parent = ToggleBubble

-- Ventana del Menú
local MainFrame = Instance.new("Frame")
local MainCorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Position = UDim2.new(0.3, 0, 0.25, 0)
MainFrame.Size = UDim2.new(0, 250, 0, 320)
MainFrame.Visible = true
MainFrame.Active = true
MainFrame.Draggable = true

MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "Alejandro.v6"
Title.TextColor3 = Color3.fromRGB(0, 255, 150)
Title.TextSize = 20
Title.Font = Enum.Font.SourceSansBold
Title.BackgroundTransparency = 1

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = MainFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)

Title.LayoutOrder = 0

local function CreateButton(text, callback)
    local Btn = Instance.new("TextButton")
    local Corner = Instance.new("UICorner")
    
    Btn.Parent = MainFrame
    Btn.Size = UDim2.new(0.9, 0, 0, 35)
    Btn.Position = UDim2.new(0.05, 0, 0, 0)
    Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Btn.Text = text
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Font = Enum.Font.SourceSans
    Btn.TextSize = 15
    
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Btn
    
    Btn.MouseButton1Click:Connect(callback)
    return Btn
end

ToggleBubble.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- BOTONES Y FUNCIONES
CreateButton("Velocidad 2000", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 2000
    end
end)

CreateButton("Velocidad 3000", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 3000
    end
end)

local InfJump = false
local JumpBtn = CreateButton("Infinite Jump: OFF", function()
    InfJump = not InfJump
    JumpBtn.Text = "Infinite Jump: " .. (InfJump and "ON" or "OFF")
end)

UserInputService.JumpRequest:Connect(function()
    if InfJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

CreateButton("Inmune a Todo", function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.MaxHealth = math.huge
        LocalPlayer.Character.Humanoid.Health = math.huge
    end
end)

CreateButton("Anti Lag (FPS Boost)", function()
    Lighting.GlobalShadows = false
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.Plastic
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") then
            v:Destroy()
        end
    end
end)

local AutoFarm = false
local FarmBtn = CreateButton("Auto-Recolectar: OFF", function()
    AutoFarm = not AutoFarm
    FarmBtn.Text = "Auto-Recolectar: " .. (AutoFarm and "ON" or "OFF")
    
    task.spawn(function()
        while AutoFarm do
            task.wait(0.3)
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") and (obj.Name:lower():find("coin") or obj.Name:lower():find("money") or obj.Name:lower():find("cash")) then
                        obj.CFrame = char.HumanoidRootPart.CFrame
                    end
                end
            end
        end
    end)
end)
