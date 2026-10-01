local p=game.Players.LocalPlayer
local g=p:FindFirstChild("PlayerGui") or game:GetService("CoreGui")
if gethui then pcall(function() g=gethui() end) end
for _,v in pairs(g:GetChildren()) do if v.Name=="A" then v:Destroy() end end
local sg=Instance.new("ScreenGui",g) sg.Name="A" sg.ResetOnSpawn=false

local bola=Instance.new("TextButton",sg)
bola.Size=UDim2.new(0,60,0,60)
bola.Position=UDim2.new(0.05,0,0.5,0)
bola.Text="A"
bola.TextColor3=Color3.new(1,1,1)
bola.BackgroundColor3=Color3.fromRGB(255,0,0)
bola.Font=Enum.Font.GothamBlack
bola.TextSize=28
Instance.new("UICorner",bola).CornerRadius=UDim.new(1,0)
bola.Active=true
bola.Draggable=true

local m=Instance.new("Frame",sg) m.Size=UDim2.new(0,200,0,220) m.Position=UDim2.new(0.5,-100,0.5,-110) m.BackgroundColor3=Color3.fromRGB(18,18,18) m.Visible=true
Instance.new("UICorner",m).CornerRadius=UDim.new(0,10)
local function btn(t,y,c) local b=Instance.new("TextButton",m) b.Size=UDim2.new(0.9,0,0,30) b.Position=UDim2.new(0.05,0,0,y) b.Text=t b.BackgroundColor3=c b.TextColor3=Color3.new(1,1,1) b.Font=Enum.Font.GothamBold b.TextSize=12 Instance.new("UICorner",b).CornerRadius=UDim.new(0,6) return b end
local b1=btn("Speed 80/120 OFF",10,Color3.fromRGB(0,170,0))
local b2=btn("Guardar Base",50,Color3.fromRGB(255,165,0))
local b3=btn("TP A BASE",90,Color3.fromRGB(0,200,100))
local b4=btn("Reset Speed",130,Color3.fromRGB(60,60,60))
local b5=btn("Cerrar Hub",170,Color3.fromRGB(180,0,0))

bola.MouseButton1Click:Connect(function() m.Visible=not m.Visible end)

local fast=0
b1.MouseButton1Click:Connect(function() fast=fast+1 local h=p.Character:FindFirstChildOfClass("Humanoid") if fast==1 then h.WalkSpeed=80 b1.Text="Speed 80 ON" elseif fast==2 then h.WalkSpeed=120 b1.Text="Speed 120 TURBO" else fast=0 h.WalkSpeed=16 b1.Text="Speed OFF" end end)
local base=nil
b2.MouseButton1Click:Connect(function() base=p.Character.HumanoidRootPart.CFrame b2.Text="Base Guardada!" wait(1) b2.Text="Guardar Base" end)
b3.MouseButton1Click:Connect(function() if base then p.Character.HumanoidRootPart.CFrame=base+Vector3.new(0,3,0) end end)
b4.MouseButton1Click:Connect(function() p.Character:FindFirstChildOfClass("Humanoid").WalkSpeed=16 b1.Text="Speed OFF" end)
b5.MouseButton1Click:Connect(function() sg:Destroy() end)