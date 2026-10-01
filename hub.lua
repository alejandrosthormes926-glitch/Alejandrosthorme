local p=game.Players.LocalPlayer
local gui=p:WaitForChild("PlayerGui")
if gui:FindFirstChild("A") then gui.A:Destroy() end
local sg=Instance.new("ScreenGui",gui)
sg.Name="A"
sg.ResetOnSpawn=false
local b=Instance.new("TextButton",sg)
b.Size=UDim2.new(0,60,0,60)
b.Position=UDim2.new(0.05,0,0.5,0)
b.Text="A"
b.BackgroundColor3=Color3.fromRGB(255,0,0)
b.TextScaled=true
b.Active=true
b.Draggable=true
Instance.new("UICorner",b)
local m=Instance.new("Frame",sg)
m.Size=UDim2.new(0,200,0,320)
m.Position=UDim2.new(0.5,-100,0.5,-160)
m.BackgroundColor3=Color3.fromRGB(18,18,18)
m.Visible=true
Instance.new("UICorner",m)
b.MouseButton1Click:Connect(function() m.Visible=not m.Visible end)
local y=5
local function mk(t,f)
local btn=Instance.new("TextButton",m)
btn.Size=UDim2.new(0.9,0,0,28)
btn.Position=UDim2.new(0.05,0,0,y)
btn.Text=t
btn.BackgroundColor3=Color3.fromRGB(50,50,50)
btn.TextColor3=Color3.new(1,1,1)
btn.TextSize=11
btn.Font=Enum.Font.GothamBold
Instance.new("UICorner",btn)
y=y+32
btn.MouseButton1Click:Connect(function() f(btn) end)
end
mk("SPEED 2000",function() p.Character.Humanoid.WalkSpeed=2000 p.Character.Humanoid.JumpPower=150 end)
mk("ANTI JEFE",function(btn) _G.aj=not _G.aj btn.BackgroundColor3=_G.aj and Color3.fromRGB(0,200,0) or Color3.fromRGB(50,50,50) task.spawn(function() while _G.aj do task.wait(0.2) if p.Character then for _,v in pairs(p.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end end end end) end)
mk("AUTO ROBAR",function(btn) _G.ar=not _G.ar btn.BackgroundColor3=_G.ar and Color3.fromRGB(0,200,0) or Color3.fromRGB(50,50,50) task.spawn(function() while _G.ar do task.wait(0.3) for _,v in pairs(workspace:GetDescendants()) do if v:IsA("ProximityPrompt") then pcall(function() fireproximityprompt(v) end) end end end end) end)
mk("AUTO BATE",function(btn) _G.ab=not _G.ab btn.BackgroundColor3=_G.ab and Color3.fromRGB(0,200,0) or Color3.fromRGB(50,50,50) task.spawn(function() while _G.ab do task.wait(0.1) for _,pl in pairs(game.Players:GetPlayers()) do if pl~=p and pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") and (p.Character.HumanoidRootPart.Position-pl.Character.HumanoidRootPart.Position).Magnitude<12 then for _,t in pairs(p.Character:GetChildren()) do if t:IsA("Tool") then t:Activate() end end end end end end) end)
mk("FLY",function(btn) local hrp=p.Character.HumanoidRootPart if hrp:FindFirstChild("FLYV") then hrp.FLYV:Destroy() hrp.FLYG:Destroy() btn.BackgroundColor3=Color3.fromRGB(50,50,50) else local bv=Instance.new("BodyVelocity",hrp) bv.Name="FLYV" bv.Velocity=Vector3.new(0,0,0) bv.MaxForce=Vector3.new(9e9,9e9,9e9) local bg=Instance.new("BodyGyro",hrp) bg.Name="FLYG" bg.MaxTorque=Vector3.new(9e9,9e9,9e9) bg.P=9e4 btn.BackgroundColor3=Color3.fromRGB(0,200,0) end end)
mk("ESP",function() for _,pl in pairs(game.Players:GetPlayers()) do if pl~=p and pl.Character and not pl.Character:FindFirstChild("ESP") then local hl=Instance.new("Highlight",pl.Character) hl.Name="ESP" hl.FillColor=Color3.fromRGB(255,0,0) end end end)
mk("NOCLIP",function(btn) _G.nc=not _G.nc btn.BackgroundColor3=_G.nc and Color3.fromRGB(0,200,0) or Color3.fromRGB(50,50,50) task.spawn(function() while _G.nc do task.wait(0.2) if p.Character then for _,v in pairs(p.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end end end end) end)
mk("CERRAR",function() m.Visible=false end)
