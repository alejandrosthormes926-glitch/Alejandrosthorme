-- ALEJANDRO HUB V6.4 - SPEED + TP BASE PARA ROBAR HUEVO
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local RunService = game:GetService("RunService")

local playerGui = nil
pcall(function() playerGui = player:WaitForChild("PlayerGui") end)
if not playerGui then playerGui = game:GetService("CoreGui") end
if gethui then pcall(function() playerGui = gethui() end) end

for _,v in pairs(playerGui:GetChildren()) do if v.Name=="FloatingMenuGui" then v:Destroy() end end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FloatingMenuGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local imageButton = Instance.new("ImageButton")
imageButton.Name = "FloatingBall"
imageButton.Size = UDim2.new(0, 70, 0, 70)
imageButton.Position = UDim2.new(0.85, 0, 0.5, 0)
imageButton.Image = "rbxassetid://6031091002"
imageButton.BackgroundColor3 = Color3.fromRGB(0,0,0)
imageButton.Parent = screenGui
Instance.new("UICorner", imageButton).CornerRadius = UDim.new(1,0)
imageButton.Active = true
imageButton.Draggable = true

local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 210, 0, 360)
menu.Position = UDim2.new(0.85, -220, 0.5, -80)
menu.BackgroundColor3 = Color3.fromRGB(18,18,18)
menu.Visible = true
menu.Parent = screenGui
Instance.new("UICorner", menu).CornerRadius = UDim.new(0,12)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,40)
title.Text = "ALEJANDRO HUB V6.4"
title.TextColor3 = Color3.fromRGB(0, 200, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBlack
title.TextSize = 18
title.Parent = menu

local function crearBoton(nombre, orden, color)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.9,0,0,32)
    b.Position = UDim2.new(0.05,0,0,50 + (orden*38))
    b.Text = nombre..": OFF"
    b.BackgroundColor3 = color
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 13
    b.Parent = menu
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,6)
    return b
end

local invBtn = crearBoton("Invisibilidad",0, Color3.fromRGB(60,60,60))
local jumpBtn = crearBoton("Super Salto",1, Color3.fromRGB(0,120,215))
local speedBtn = crearBoton("Speed",2, Color3.fromRGB(0,170,0))
local flyBtn = crearBoton("Fly",3, Color3.fromRGB(170,0,170))
local noclipBtn = crearBoton("Noclip",4, Color3.fromRGB(180,0,0))
local saveBaseBtn = crearBoton("Guardar Base",5, Color3.fromRGB(255,165,0))
local tpBaseBtn = crearBoton("TP A BASE",6, Color3.fromRGB(0,200,100))

imageButton.MouseButton1Click:Connect(function() menu.Visible = not menu.Visible end)

-- INVIS
local inv = false
invBtn.MouseButton1Click:Connect(function() inv = not inv invBtn.Text = "Invisibilidad: "..(inv and "ON" or "OFF") pcall(function() for _, v in pairs(player.Character:GetDescendants()) do if v:IsA("BasePart") or v:IsA("Decal") then if v.Name~="HumanoidRootPart" then v.Transparency = inv and 1 or 0 end end end end) end)

-- SALTO FIX
local hj = false
local function aplicarSalto()
    local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if hum then hum.UseJumpPower = true hum.JumpPower = hj and 85 or 50 end
end
jumpBtn.MouseButton1Click:Connect(function() hj = not hj jumpBtn.Text = "Super Salto: "..(hj and "ON" or "OFF") aplicarSalto() end)
player.CharacterAdded:Connect(function() wait(1) if hj then aplicarSalto() end end)

-- SPEED 80 / 120
local fast = 0
speedBtn.MouseButton1Click:Connect(function() 
    fast = fast + 1
    local hum = player.Character:FindFirstChildOfClass("Humanoid")
    if fast == 1 then hum.WalkSpeed = 80 speedBtn.Text = "Speed: 80 ON"
    elseif fast == 2 then hum.WalkSpeed = 120 speedBtn.Text = "Speed: 120 TURBO"
    else fast = 0 hum.WalkSpeed = 16 speedBtn.Text = "Speed: OFF" end
end)

-- FLY
local flying = false
local flyConn
local bv, bg
flyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    flyBtn.Text = "Fly: "..(flying and "ON" or "OFF")
    local char = player.Character
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if flying then
        bv = Instance.new("BodyVelocity") bv.Velocity = Vector3.new(0,0,0) bv.MaxForce = Vector3.new(9e9,9e9,9e9) bv.Parent = hrp
        bg = Instance.new("BodyGyro") bg.MaxTorque = Vector3.new(9e9,9e9,9e9) bg.P = 9e4 bg.CFrame = hrp.CFrame bg.Parent = hrp
        hum.PlatformStand = true
        flyConn = RunService.RenderStepped:Connect(function()
            if not flying then return end
            local cam = workspace.CurrentCamera
            bg.CFrame = cam.CFrame
            local move = Vector3.new(0,0,0)
            if hum.MoveDirection.Magnitude > 0 then move = cam.CFrame:VectorToWorldSpace(hum.MoveDirection * 50) end
            if hum.Jump then move = move + Vector3.new(0,50,0) end
            bv.Velocity = move
        end)
    else
        if flyConn then flyConn:Disconnect() end if bv then bv:Destroy() end if bg then bg:Destroy() end hum.PlatformStand = false
    end
end)

-- NOCLIP
local noclip = false
noclipBtn.MouseButton1Click:Connect(function() noclip = not noclip noclipBtn.Text = "Noclip: "..(noclip and "ON" or "OFF") end)
RunService.Stepped:Connect(function() if noclip then for _, v in pairs(player.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end end end)

-- TP BASE PARA ROBAR HUEVO - FUNCIONAL 100%
local basePos = nil
saveBaseBtn.MouseButton1Click:Connect(function()
    local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        basePos = hrp.CFrame
        saveBaseBtn.Text = "Base Guardada!"
        wait(1)
        saveBase