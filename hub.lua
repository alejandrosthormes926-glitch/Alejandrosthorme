awnlocal p=game.Players.LocalPlayer local g=p:FindFirstChild("PlayerGui")or game.CoreGui if gethui then pcall(function() g=gethui()end)end for _,v in pairs(g:GetChildren())do if v.Name=="A"then v:Destroy()end end
local sg=Instance.new("ScreenGui",g)sg.Name="A"sg.ResetOnSpawn=false
local bola=Instance.new("TextButton",sg)bola.Size=UDim2.new(0,60,0,60)bola.Position=UDim2.new(0.05,0,0.5,0)bola.Text="A"bola.BackgroundColor3=Color3.fromRGB(255,0,0)bola.TextColor3=Color3.new(1,1,1)bola.Font=Enum.Font.GothamBlack bola.TextSize=28 Instance.new("UICorner",bola).CornerRadius=UDim.new(1,0)bola.Active=true bola.Draggable=true
local m=Instance.new("Frame",sg)m.Size=UDim2.new(0,220,0,250)m.Position=UDim2.new(0.5,-110,0.5,-125)m.BackgroundColor3=Color3.fromRGB(18,18,18)m.Visible=true Instance.new("UICorner",m).CornerRadius=UDim.new(0,10)
local function btn(t,y,c)local b=Instance.new("TextButton",m)b.Size=UDim2.new(0.9,0,0,26)b.Position=UDim2.new(0.05,0,0,y)b.Text=t b.BackgroundColor3=c b.TextColor3=Color3.new(1,1,1)b.Font=Enum.Font.GothamBold b.TextSize=10 Instance.new("UICorner",b).CornerRadius=UDim.new(0,6)return b end
local b1=btn("Speed 2000",8,Color3.fromRGB(255,0,0))local b2=btn("Guardar Base",36,Color3.fromRGB(255,165,0))local b3=btn("TP BASE SIN LAG",64,Color3.fromRGB(0,200,100))local b4=btn("AUTO ROBAR OFF",92,Color3.fromRGB(150,0,150))local b5=btn("AUTO BATE OFF",120,Color3.fromRGB(255,100,0))local b6=btn("Cerrar",148,Color3.fromRGB(80,0,0))
bola.MouseButton1Click:Connect(function()m.Visible=not m.Visible end)
local function setS(s)p.Character:FindFirstChildOfClass("Humanoid").WalkSpeed=s end
b1.MouseButton1Click:Connect(function()setS(2000)end)
local base=nil b2.MouseButton1Click:Connect(function()base=p.Character.HumanoidRootPart.CFrame b2.Text="Guardada!"wait(1)b2.Text="Guardar Base"end)
local function tp(c)local h=p.Character.HumanoidRootPart h.Velocity=Vector3.new(0,0,0)h.CFrame=c+Vector3.new(0,5,0)end
b3.MouseButton1Click:Connect(function()if base then tp(base)end end)b6.MouseButton1Click:Connect(function()sg:Destroy()end)
local a=false b4.MouseButton1Click:Connect(function()a=not a b4.Text="AUTO ROBAR "..(a and"ON"or"OFF")end)
local b=false b5.MouseButton1Click:Connect(function()b=not b b5.Text="AUTO BATE "..(b and"ON"or"OFF")end)
spawn(function()while wait(0.2)do if a and base then p