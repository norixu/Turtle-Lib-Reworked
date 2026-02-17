local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/norixu/eternal-ui/refs/heads/main/source.lua"))()

local Window = UI:CreateWindow()

local Tab = Window:CreateTab("Main")

Tab:Button("Notification",function()
UI:Notify("Working")
end)

Tab:Toggle("Auto Farm",function(v)
print(v)
end)

Tab:Slider("WalkSpeed",0,100,function(v)
print(v)
end)

Tab:Dropdown("Weapon",{"Sword","Gun","Bow"},function(v)
print(v)
end)

Tab:KeyPicker("Kill Aura",Enum.KeyCode.E,function()
print("Pressed")
end)
