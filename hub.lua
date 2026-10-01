local p=game.Players.LocalPlayer
local g=gethui and gethui() or p.PlayerGui
for _,v in pairs(g:GetChildren())do if v.Name=="A"then v:Destroy()end end
local sg=Instance.new("ScreenGui",g)sg.Name="A"sg.ResetOnSpawn=false
local b=Instance.new("TextButton",sg)b.Size=UDim2.new(0,60,0,60)b.Position=UDim2.new(0.05,0,0.5,0)b.Text="A"b.BackgroundColor3=Color3.fromRGB(255,0,0)b.TextSize=28 b.Active=true b.Draggable=true Instance.new("UICorner",b).CornerRadius=UDim.new(1,0)
local m=Instance.new("Frame",sg)m.Size=UDim2.new(0,200,0,320)m.Position=UDim2.new(0.5,-100,0.5,-160)m.BackgroundColor3=Color3.fromRGB(18,18,18)Instance.new("UICorner",m).CornerRadius=UDim.new(0,10)
local function mk(t,y,c,f)local x=Instance.new("TextButton",m)x.Size=UDim2.new(0.9,0,0,28)x.Position=UDim2.new(0.05,0,0,y)x.Text=t x.BackgroundColor3=c x.TextColor3=Color3.new(1,1,1)x.Font=Enum.Font.GothamBold x.TextSize=11 Instance.new("UICorner",x).CornerRadius=UDim.new(0,6)x.Activated:Connect(function()f(x)end)return x end