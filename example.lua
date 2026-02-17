local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/norixu/eternal-ui/refs/heads/main/source.lua))()

local Window = UI:CreateWindow({
Title = "Eternal UI LIB"
})

local Main = Window:CreateTab("Main")

Main:CreateLabel("Welcome")

Main:CreateButton("Click", function()
print("Clicked")
end)

Main:CreateToggle("Toggle", function(state)
print(state)
end)

local Misc = Window:CreateTab("Misc")

Misc:CreateButton("Test", function()
print("Test")
end)
