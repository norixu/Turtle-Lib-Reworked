local EternalUI = {}

-- services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- config
local Config = {}
local FileName = "EternalUI_Config.json"

-- load config
if readfile and isfile and isfile(FileName) then
Config = HttpService:JSONDecode(readfile(FileName))
end

local function Save()
if writefile then
writefile(FileName,HttpService:JSONEncode(Config))
end
end

-- theme
local Theme = {
BG = Color3.fromRGB(15,15,15),
Light = Color3.fromRGB(25,25,25),
Text = Color3.fromRGB(255,255,255),
Accent = Color3.fromRGB(255,255,255)
}

-- corner
local function Corner(obj)
local c = Instance.new("UICorner",obj)
c.CornerRadius = UDim.new(0,8)
end

-- tween
local function Tween(obj,props)
TweenService:Create(obj,TweenInfo.new(.15),props):Play()
end

-- notify
function EternalUI:Notify(text)

local n = Instance.new("TextLabel")
n.Size = UDim2.new(0,200,0,30)
n.Position = UDim2.new(1,-210,1,-40)
n.BackgroundColor3 = Theme.Light
n.TextColor3 = Theme.Text
n.Text = text
n.Parent = PlayerGui
Corner(n)

n.BackgroundTransparency = 1
Tween(n,{BackgroundTransparency=0})

task.wait(3)

Tween(n,{BackgroundTransparency=1})
task.wait(.2)
n:Destroy()

end

-- draggable
local function Drag(frame)

local drag,start,pos

frame.InputBegan:Connect(function(i)
if i.UserInputType == Enum.UserInputType.MouseButton1 then
drag=true
start=i.Position
pos=frame.Position
end
end)

frame.InputEnded:Connect(function(i)
if i.UserInputType == Enum.UserInputType.MouseButton1 then
drag=false
end
end)

UIS.InputChanged:Connect(function(i)
if drag and i.UserInputType == Enum.UserInputType.MouseMovement then
local delta=i.Position-start
frame.Position=UDim2.new(
pos.X.Scale,
pos.X.Offset+delta.X,
pos.Y.Scale,
pos.Y.Offset+delta.Y
)
end
end)

end

-- window
function EternalUI:CreateWindow(cfg)

local gui=Instance.new("ScreenGui",PlayerGui)

local main=Instance.new("Frame",gui)
main.Size=UDim2.new(0,500,0,400)
main.Position=UDim2.new(.5,-250,.5,-200)
main.BackgroundColor3=Theme.BG
Corner(main)
Drag(main)

local tabs=Instance.new("Frame",main)
tabs.Size=UDim2.new(0,120,1,0)

local pages=Instance.new("Frame",main)
pages.Size=UDim2.new(1,-120,1,0)
pages.Position=UDim2.new(0,120,0,0)

local Window={}

function Window:CreateTab(name)

local tabbtn=Instance.new("TextButton",tabs)
tabbtn.Size=UDim2.new(1,0,0,30)
tabbtn.BackgroundColor3=Theme.Light
tabbtn.Text=name
tabbtn.TextColor3=Theme.Text
Corner(tabbtn)

local page=Instance.new("Frame",pages)
page.Size=UDim2.new(1,0,1,0)
page.Visible=false

local layout=Instance.new("UIListLayout",page)
layout.Padding=UDim.new(0,6)

tabbtn.MouseButton1Click:Connect(function()

for _,v in pairs(pages:GetChildren()) do
if v:IsA("Frame") then
v.Visible=false
end
end

page.Visible=true

end)

local Tab={}

-- button
function Tab:Button(text,callback)

local b=tabbtn:Clone()
b.Parent=page
b.Text=text

b.MouseButton1Click:Connect(function()

Tween(b,{BackgroundColor3=Theme.Accent})
task.wait(.1)
Tween(b,{BackgroundColor3=Theme.Light})

callback()

end)

end

-- toggle
function Tab:Toggle(text,callback)

local state=Config[text] or false

local t=tabbtn:Clone()
t.Parent=page

local function refresh()
t.Text=text.." : "..(state and "ON" or "OFF")
end

refresh()

t.MouseButton1Click:Connect(function()

state=not state
Config[text]=state
Save()

refresh()

callback(state)

end)

end

-- slider
function Tab:Slider(text,min,max,callback)

local val=Config[text] or min

local frame=Instance.new("Frame",page)
frame.Size=UDim2.new(1,0,0,40)
frame.BackgroundColor3=Theme.Light
Corner(frame)

local label=Instance.new("TextLabel",frame)
label.Size=UDim2.new(1,0,.5,0)
label.Text=text.." : "..val
label.TextColor3=Theme.Text
label.BackgroundTransparency=1

local bar=Instance.new("Frame",frame)
bar.Size=UDim2.new(1,-10,0,6)
bar.Position=UDim2.new(0,5,1,-10)
bar.BackgroundColor3=Theme.BG
Corner(bar)

local fill=Instance.new("Frame",bar)
fill.Size=UDim2.new((val-min)/(max-min),0,1,0)
fill.BackgroundColor3=Theme.Accent
Corner(fill)

bar.InputBegan:Connect(function(i)

if i.UserInputType==Enum.UserInputType.MouseButton1 then

local pos=(i.Position.X-bar.AbsolutePosition.X)/bar.AbsoluteSize.X

val=math.floor(min+(max-min)*pos)

fill.Size=UDim2.new(pos,0,1,0)

label.Text=text.." : "..val

Config[text]=val
Save()

callback(val)

end

end)

end

-- dropdown
function Tab:Dropdown(text,list,callback)

local current=Config[text] or list[1]

local d=tabbtn:Clone()
d.Parent=page

local function refresh()
d.Text=text.." : "..current
end

refresh()

d.MouseButton1Click:Connect(function()

local index=table.find(list,current)+1

if index>#list then index=1 end

current=list[index]

Config[text]=current
Save()

refresh()

callback(current)

end)

end

-- key picker
function Tab:KeyPicker(text,default,callback)

local key=Enum.KeyCode[Config[text]] or default

local k=tabbtn:Clone()
k.Parent=page

local function refresh()
k.Text=text.." : "..key.Name
end

refresh()

k.MouseButton1Click:Connect(function()

k.Text="Press key..."

local input=UIS.InputBegan:Wait()

key=input.KeyCode

Config[text]=key.Name
Save()

refresh()

end)

UIS.InputBegan:Connect(function(i)

if i.KeyCode==key then
callback()
end

end)

end

return Tab

end

return Window

end

return EternalUI
