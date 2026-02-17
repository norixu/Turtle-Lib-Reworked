local EternalUI = {}

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- theme
local Theme = {
    Background = Color3.fromRGB(15,15,15),
    Secondary = Color3.fromRGB(25,25,25),
    Accent = Color3.fromRGB(255,255,255),
    Text = Color3.fromRGB(255,255,255),
    SubText = Color3.fromRGB(180,180,180)
}

-- corner
local function Corner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius or 8)
    c.Parent = parent
end

-- stroke
local function Stroke(parent)
    local s = Instance.new("UIStroke")
    s.Color = Theme.Secondary
    s.Thickness = 1
    s.Parent = parent
end

-- padding
local function Padding(parent, pad)
    local p = Instance.new("UIPadding")
    p.PaddingTop = UDim.new(0,pad)
    p.PaddingBottom = UDim.new(0,pad)
    p.PaddingLeft = UDim.new(0,pad)
    p.PaddingRight = UDim.new(0,pad)
    p.Parent = parent
end

-- layout
local function List(parent, space)
    local l = Instance.new("UIListLayout")
    l.Padding = UDim.new(0,space)
    l.SortOrder = Enum.SortOrder.LayoutOrder
    l.Parent = parent
end

-- window
function EternalUI:CreateWindow(config)

    local Title = config.Title or "Eternal UI LIB"

    local Gui = Instance.new("ScreenGui")
    Gui.Name = "EternalUI"
    Gui.ResetOnSpawn = false
    Gui.Parent = PlayerGui

    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0,500,0,400)
    Main.Position = UDim2.new(.5,-250,.5,-200)
    Main.BackgroundColor3 = Theme.Background
    Main.Parent = Gui
    Corner(Main,12)
    Stroke(Main)

    local Top = Instance.new("Frame")
    Top.Size = UDim2.new(1,0,0,40)
    Top.BackgroundTransparency = 1
    Top.Parent = Main

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Text = Title
    TitleLabel.Size = UDim2.new(1,0,1,0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextColor3 = Theme.Text
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextSize = 14
    TitleLabel.Parent = Top

    local Tabs = Instance.new("Frame")
    Tabs.Size = UDim2.new(0,120,1,-40)
    Tabs.Position = UDim2.new(0,0,0,40)
    Tabs.BackgroundTransparency = 1
    Tabs.Parent = Main
    List(Tabs,6)
    Padding(Tabs,6)

    local Pages = Instance.new("Frame")
    Pages.Size = UDim2.new(1,-120,1,-40)
    Pages.Position = UDim2.new(0,120,0,40)
    Pages.BackgroundTransparency = 1
    Pages.Parent = Main

    local Window = {}

    function Window:CreateTab(name)

        local TabButton = Instance.new("TextButton")
        TabButton.Size = UDim2.new(1,0,0,30)
        TabButton.BackgroundColor3 = Theme.Secondary
        TabButton.Text = name
        TabButton.TextColor3 = Theme.Text
        TabButton.Font = Enum.Font.Gotham
        TabButton.TextSize = 13
        TabButton.Parent = Tabs
        Corner(TabButton,8)

        local Page = Instance.new("Frame")
        Page.Size = UDim2.new(1,0,1,0)
        Page.BackgroundTransparency = 1
        Page.Visible = false
        Page.Parent = Pages
        List(Page,6)
        Padding(Page,6)

        TabButton.MouseButton1Click:Connect(function()

            for _,v in pairs(Pages:GetChildren()) do
                if v:IsA("Frame") then
                    v.Visible = false
                end
            end

            Page.Visible = true

        end)

        local Tab = {}

        function Tab:CreateButton(text, callback)

            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(1,0,0,32)
            Button.BackgroundColor3 = Theme.Secondary
            Button.Text = text
            Button.TextColor3 = Theme.Text
            Button.Font = Enum.Font.Gotham
            Button.TextSize = 13
            Button.Parent = Page
            Corner(Button,8)

            Button.MouseButton1Click:Connect(function()
                callback()
            end)

        end

        function Tab:CreateLabel(text)

            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(1,0,0,30)
            Label.BackgroundColor3 = Theme.Secondary
            Label.Text = text
            Label.TextColor3 = Theme.SubText
            Label.Font = Enum.Font.Gotham
            Label.TextSize = 13
            Label.Parent = Page
            Corner(Label,8)

        end

        function Tab:CreateToggle(text, callback)

            local Toggle = Instance.new("TextButton")
            Toggle.Size = UDim2.new(1,0,0,32)
            Toggle.BackgroundColor3 = Theme.Secondary
            Toggle.Text = text.." : OFF"
            Toggle.TextColor3 = Theme.Text
            Toggle.Font = Enum.Font.Gotham
            Toggle.TextSize = 13
            Toggle.Parent = Page
            Corner(Toggle,8)

            local State = false

            Toggle.MouseButton1Click:Connect(function()

                State = not State

                Toggle.Text = text.." : "..(State and "ON" or "OFF")

                callback(State)

            end)

        end

        return Tab

    end

    return Window

end

return EternalUI
