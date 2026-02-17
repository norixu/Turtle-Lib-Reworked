local UI =
loadstring(game:HttpGet("https://raw.githubusercontent.com/norixu/eternal-ui/refs/heads/main/source.lua"))()

local Window =
UI:CreateWindow()

local Tab =
Window:CreateTab("Main")

Tab:Button("Notify",function()

UI:Notify("Hello")

end)

Tab:Toggle("Auto Farm",function(v)

print(v)

end)

Tab:Slider("Speed",0,100,function(v)

print(v)

end)

Tab:Dropdown("Weapon",{

"Sword",
"Gun",
"Bow"

},function(v)

print(v)

end)

Tab:Keybind("Kill Aura",Enum.KeyCode.E,function()

print("Pressed")

end)
