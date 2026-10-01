local p=game.Players.LocalPlayer
local g=gethui and gethui() or p.PlayerGui
for _,v in pairs(g:GetChildren())do if v.Name=="A"then v:Destroy()end end
local sg=Instance.new("ScreenGui",g)sg.Name="A"sg.ResetOnSpawn=false
local b=Instance.new("TextButton",sg)b.Size=UDim2.new(0,60,0,60)b.Position=UDim2.new(0.05,0,0.5,0)b.Text="A"b.BackgroundColor3=Color3.fromRGB(255,0,0)b.TextSize=28 b.Active=true b.Draggable=true Instance.new("UICorner",b).CornerRadius=UDim.new(1,0)
local m=Instance.new("Frame",sg)m.Size=UDim2.new(0,200,0,200)m.Position=UDim2.new(0.5,-100,0.5,-100)m.BackgroundColor3=Color3.fromRGB(18,18,18)Instance.new("UICorner",m).CornerRadius=UDim.new(0,10)
local base=nil
local function mk(t,y,c,f)local x=Instance.new("TextButton",m)x.Size=UDim2.new(0.9,0,0,28)x.Position=UDim2.new(0.05,0,0,y)x.Text=t x.BackgroundColor3=c x.TextColor3=Color3.new(1,1,1) x.Font=Enum.Font.GothamBold x.TextSize=12 Instance.new("UICorner",x).CornerRadius=UDim.new(0,6)x.Activated:Connect(f)return x end
mk("SPEED 2000",5,Color3.fromRGB(255,0,0),function()p.Character.Humanoid.WalkSpeed=2000 end)
mk("GUARDAR BASE",37,Color3.fromRGB(255,165,0),function()base=p.Character.HumanoidRootPart.CFrame end)
mk("TP BASE",69,Color3.fromRGB(0,200,100),function()if base then p.Character.HumanoidRootPart.CFrame=base+Vector3.new(0,5,0)end end)
local a=false mk("AUTO ROBAR OFF",101,Color3.fromRGB(150,0,150),function(aBtn) a=not a aBtn.Text="AUTO ROBAR "..(a and"ON"or"OFF") end)
local k=false mk("AUTO BATE OFF",133,Color3.fromRGB(255,100,0),function(aBtn) k=not k aBtn.Text="AUTO BATE "..(k and"ON"or"OFF") end)
mk("CERRAR",165,Color3.fromRGB(80,0,0),function()sg:Destroy()end)
b.Activated:Connect(function()m.Visible=not m.Visible end)
task.spawn(function()while task.wait(0.2)do if a and base then for _,v in pairs(workspace:GetDescendants())do if v:IsA("ProximityPrompt")and(p.Character.HumanoidRootPart.Position-v.Parent.Position).Magnitude<15 then fireproximityprompt(v)task.wait(0.2)p.Character.Humanoid.WalkSpeed=2000 p.Character.HumanoidRootPart.CFrame=base+Vector3.new(0,5,0)end end end end end)
task.spawn(function()while task.wait(0.1)do if k then for _,pl in pairs(game.Players:GetPlayers())do if pl~=p and pl.Character and(p.Character.HumanoidRootPart.Position-pl.Character.HumanoidRootPart.Position).Magnitude<15 then for _,t in pairs(p.Character:GetChildren())do if t:IsA("Tool")then t:Activate()end end end end end end end)local p=game.Players.LocalPlayer
local g=gethui and gethui() or p.PlayerGui
for _,v in pairs(g:GetChildren())do if v.Name=="A"then v:Destroy()end end
local sg=Instance.new("ScreenGui",g)sg.Name="A"sg.ResetOnSpawn=false
local b=Instance.new("TextButton",sg)b.Size=UDim2.new(0,60,0,60)b.Position=UDim2.new(0.05,0,0.5,0)b.Text="A"b.BackgroundColor3=Color3.fromRGB(255,0,0)b.TextSize=28 b.Active=true b.Draggable=true Instance.new("UICorner",b).CornerRadius=UDim.new(1,0)
local m=Instance.new("Frame",sg)m.Size=UDim2.new(0,200,0,220)m.Position=UDim2.new(0.5,-100,0.5,-110)m.BackgroundColor3=Color3.fromRGB(18,18,18)Instance.new("UICorner",m).CornerRadius=UDim.new(0,10)
local base=nil
local function mk(t,y,c,f)local x=Instance.new("TextButton",m)x.Size=UDim2.new(0.9,0,0,28)x.Position=UDim2.new(0.05,0,0,y)x.Text=t x.BackgroundColor3=c x.TextColor3=Color3.new(1,1,1)x.Font=Enum.Font.GothamBold x.TextSize=11 Instance.new("UICorner",x).CornerRadius=UDim.new(0,6)x.Activated:Connect(function()f(x)end)return x end
mk("SPEED 2000",5,Color3.fromRGB(255,0,0),function()p.Character.Humanoid.WalkSpeed=2000 end)
mk("GUARDAR BASE",37,Color3.fromRGB(255,165,0),function(x)base=p.Character.HumanoidRootPart.CFrame x.Text="GUARDADA!" task.wait(1) x.Text="GUARDAR BASE" end)
mk("TP BASE",69,Color3.fromRGB(0,200,100),function()if base then p.Character.HumanoidRootPart.CFrame=base+Vector3.new(0,5,0)end end)
local a=false mk("AUTO ROBAR OFF",101,Color3.fromRGB(150,0,150),function(x)a=not a x.Text=a and"AUTO ROBAR ON"or"AUTO ROBAR OFF" x.BackgroundColor3=a and Color3.fromRGB(0,200,0) or Color3.fromRGB(150,0,150) end)
local k=false mk("AUTO BATE OFF",133,Color3.fromRGB(255,100,0),function(x)k=not k x.Text=k and"AUTO BATE ON"or"AUTO BATE OFF" x.BackgroundColor3=k and Color3.fromRGB(0,200,0) or Color3.fromRGB(255,100,0) end)
mk("CERRAR",165,Color3.fromRGB(80,0,0),function()sg:Destroy()end)
b.Activated:Connect(function()m.Visible=not m.Visible end)
task.spawn(function()while task.wait(0.2)do if a and base then for _,v in pairs(workspace:GetDescendants())do if v:IsA("ProximityPrompt")and(p.Character.HumanoidRootPart.Position-v.Parent.Position).Magnitude<15 then fireproximityprompt(v)task.wait(0.3)p.Character.Humanoid.WalkSpeed=2000 p.Character.HumanoidRootPart.CFrame=base+Vector3.new(0,5,0)end end end end end)
task.spawn(function()while task.wait(0.1)do if k then for _,pl in pairs(game.Players:GetPlayers())do if pl~=p and pl.Character and pl.Character:FindFirstChild("HumanoidRootPart")and(p.Character.HumanoidRootPart.Position-pl.Character.HumanoidRootPart.Position).Magnitude<12 then for _,t in pairs(p.Character:GetChildren())do if t:IsA("Tool")then t:Activate()end end end end end end end)