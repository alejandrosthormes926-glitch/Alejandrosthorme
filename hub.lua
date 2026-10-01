local p=game.Players.LocalPlayer
local g=gethui and gethui() or p.PlayerGui
for _,v in pairs(g:GetChildren())do if v.Name=="A"then v:Destroy()end end
local sg=Instance.new("ScreenGui",g)sg.Name="A"sg.ResetOnSpawn=false
local b=Instance.new("TextButton",sg)b.Size=UDim2.new(0,60,0,60)b.Position=UDim2.new(0.05,0,0.5,0)b.Text="A"b.BackgroundColor3=Color3.fromRGB(255,0,0)b.TextSize=28 b.Active=true b.Draggable=true Instance.new("UICorner",b).CornerRadius=UDim.new(1,0)
local m=Instance.new("Frame",sg)m.Size=UDim2.new(0,200,0,320)m.Position=UDim2.new(0.5,-100,0.5,-160)m.BackgroundColor3=Color3.fromRGB(18,18,18)Instance.new("UICorner",m).CornerRadius=UDim.new(0,10)
local function mk(t,y,c,f)local x=Instance.new("TextButton",m)x.Size=UDim2.new(0.9,0,0,28)x.Position=UDim2.new(0.05,0,0,y)x.Text=t x.BackgroundColor3=c x.TextColor3=Color3.new(1,1,1)x.Font=Enum.Font.GothamBold x.TextSize=11 Instance.new("UICorner",x).CornerRadius=UDim.new(0,6)x.Activated:Connect(function()f(x)end)return x end
local speedOn=false mk("SPEED 2000 OFF",5,Color3.fromRGB(255,0,0),function(x)speedOn=not speedOn if speedOn then p.Character.Humanoid.UseJumpPower=false p.Character.Humanoid.JumpHeight=100 p.Character.Humanoid.WalkSpeed=2000 x.Text="SPEED 2000 ON" x.BackgroundColor3=Color3.fromRGB(0,200,0) else p.Character.Humanoid.WalkSpeed=16 p.Character.Humanoid.JumpHeight=7.2 x.Text="SPEED 2000 OFF" x.BackgroundColor3=Color3.fromRGB(255,0,0) end end)
local antiOn=false mk("ANTI JEFE OFF",37,Color3.fromRGB(0,100,200),function(x)antiOn=not antiOn x.Text=antiOn and"ANTI JEFE ON"or"ANTI JEFE OFF" x.BackgroundColor3=antiOn and Color3.fromRGB(0,200,0) or Color3.fromRGB(0,100,200) end)
local a=false mk("AUTO ROBAR OFF",69,Color3.fromRGB(150,0,150),function(x)a=not a x.Text=a and"AUTO ROBAR ON"or"AUTO ROBAR OFF" x.BackgroundColor3=a and Color3.fromRGB(0,200,0) or Color3.fromRGB(150,0,150) end)
local k=false mk("AUTO BATE OFF",101,Color3.fromRGB(255,100,0),function(x)k=not k x.Text=k and"AUTO BATE ON"or"AUTO BATE OFF" x.BackgroundColor3=k and Color3.fromRGB(0,200,0) or Color3.fromRGB(255,100,0) end)
local flyOn=false local bv,bg
mk("FLY OFF",133,Color3.fromRGB(0,150,150),function(x)flyOn=not flyOn x.Text=flyOn and"FLY ON"or"FLY OFF" x.BackgroundColor3=flyOn and Color3.fromRGB(0,200,0) or Color3.fromRGB(0,150,150)
if flyOn then bv=Instance.new("BodyVelocity",p.Character.HumanoidRootPart)bv.Velocity=Vector3.new(0,0,0)bv.MaxForce=Vector3.new(9e9,9e9,9e9) bg=Instance.new("BodyGyro",p.Character.H