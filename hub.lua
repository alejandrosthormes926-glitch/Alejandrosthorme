loadstring([=[
-- Alejandro.v6 (Script Hub Mejorado)
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local ParentGui = (gethui and gethui()) or LocalPlayer:FindFirstChildOfClass("PlayerGui") or game:GetService("CoreGui")

if ParentGui:FindFirstChild("AlejandroV6Gui") then
    ParentGui.AlejandroV6Gui:Destroy()
end

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
MainFrame.Position = UDim2.new(0.35, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 240, 0, 420)
MainFrame.Visible = true
MainFrame.Active = true
MainFrame.Draggable = true

MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 35)
Title.Text = "Alejandro.v6"
Title.TextColor3 = Color3.fromRGB(0, 255, 150)
Title.TextSize = 18
Title.Font = Enum.Font.SourceSansBold
Title.BackgroundTransparency = 1

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = MainFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 6)
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

ToggleBubble.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Variables de Estado
local GodMode = false
local GodConnection = nil

local GodBtn = CreateButton("Inmune (Tecla [E]): OFF", function() end)

local function UpdateGodState()
    GodBtn.Text = "Inmune (Tecla [E]): " .. (GodMode and "ON" or "OFF")
end

local function ApplyGodMode(character)
    if not character then return end
    local humanoid = character:WaitForChild("Humanoid", 3)
    if not humanoid then return end

    if GodConnection then GodConnection:Disconnect() end

    if GodMode then
        humanoid.MaxHealth = math.huge
        humanoid.Health = math.huge
        
        -- Si detecta pérdida de vida, la vuelve a subir inmediatamente
        GodConnection = humanoid.HealthChanged:Connect(function()
            if GodMode and humanoid.Health < math.huge then
                humanoid.MaxHealth = math.huge
                humanoid.Health = math.huge
            end
        end)
    end
end

local function ToggleGodMode()
    GodMode = not GodMode
    UpdateGodState()
    if LocalPlayer.Character then
        ApplyGodMode(LocalPlayer.Character)
    end
end

GodBtn.MouseButton1Click:Connect(ToggleGodMode)

-- Control por Teclado (Tecla E)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.E then
        ToggleGodMode()
    end
end)

-- Mantener activo al reaparecer (Respawn)
LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    task.wait(0.5)
    if GodMode then
        ApplyGodMode(newCharacter)
    end
end)

-- Resto de Funciones (Velocidad, Salto, Noclip, Fly, ESP, AntiLag)
local SpeedActive = false
local SpeedBtn = CreateButton("Velocidad Ultra: OFF", function()
    SpeedActive = not SpeedActive
    SpeedBtn.Text = "Velocidad Ultra: " .. (SpeedActive and "ON" or "OFF")
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

local Noclip = false
local NoclipBtn = CreateButton("Atravesar Paredes: OFF", function()
    Noclip = not Noclip
    NoclipBtn.Text = "Atravesar Paredes: " .. (Noclip and "ON" or "OFF")
end)

RunService.Stepped:Connect(function()
    if Noclip and LocalPlayer.Character then
        for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end
end)

local Flying = false
local FlyBtn = CreateButton("Volar (Fly): OFF", function()
    Flying = not Flying
    FlyBtn.Text = "Volar (Fly): " .. (Flying and "ON" or "OFF")
    
    local char = LocalPlayer.Character
    if char then
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            if Flying then
                local bv = Instance.new("BodyVelocity")
                bv.Name = "FlyVelocity"
                bv.Parent = hrp
                bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            else
                if hrp:FindFirstChild("FlyVelocity") then
                    hrp.FlyVelocity:Destroy()
                end
            end
        end
    end
end)

RunService.RenderStepped:Connect(function()
    if Flying and LocalPlayer.Character then
        local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local camera = workspace.CurrentCamera
        if hrp and hrp:FindFirstChild("FlyVelocity") then
            hrp.FlyVelocity.Velocity = camera.CFrame.LookVector * 100
        end
    end
end)

local ESPActive = false
local ESPBtn = CreateButton("Ver Jugadores (ESP): OFF", function()
    ESPActive = not ESPActive
    ESPBtn.Text = "Ver Jugadores (ESP): " .. (ESPActive and "ON" or "OFF")
    
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            if ESPActive then
                if not plr.Character:FindFirstChild("ESP_Box") then
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "ESP_Box"
                    highlight.Parent = plr.Character
                    highlight.FillColor = Color3.fromRGB(0, 255, 150)
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                end
            else
                if plr.Character:FindFirstChild("ESP_Box") then
                    plr.Character.ESP_Box:Destroy()
                end
            end
        end
    end
end)

local AutoFarm = false
local FarmBtn = CreateButton("Auto-Recolectar: OFF", function()
    AutoFarm = not AutoFarm
    FarmBtn.Text = "Auto-Recolectar: " .. (AutoFarm and "ON" or "OFF")
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

-- Bucle de fondo para las funciones restantes
task.spawn(function()
    while task.wait(0.1) do
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            local hrp = char:FindFirstChild("HumanoidRootPart")
            
            if hum then
                if SpeedActive then
                    hum.WalkSpeed = 2000
                elseif hum.WalkSpeed > 16 and not SpeedActive then
                    hum.WalkSpeed = 16
                end
            end
            
            if hrp and AutoFarm then
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") and (obj.Name:lower():find("coin") or obj.Name:lower():find("money") or obj.Name:lower():find("cash")) then
                        obj.CFrame = hrp.CFrame
                    end
                end
            end
        end
    end
end)
]=])()
