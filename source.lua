local colorSettings = {
	["Main"] = {
		["HeaderColor"] = Color3.fromRGB(25, 25, 25),
		["HeaderShadingColor"] = Color3.fromRGB(18, 18, 18),
		["HeaderTextColor"] = Color3.fromRGB(255, 255, 255),
		["MainBackgroundColor"] = Color3.fromRGB(18, 18, 18),
		["InfoScrollingFrameBgColor"] = Color3.fromRGB(18, 18, 18),
		["ScrollBarImageColor"] = Color3.fromRGB(255, 255, 255)
	},
	["RemoteButtons"] = {
		["BorderColor"] = Color3.fromRGB(50, 50, 50),
		["BackgroundColor"] = Color3.fromRGB(30, 30, 30),
		["TextColor"] = Color3.fromRGB(220, 220, 220),
		["NumberTextColor"] = Color3.fromRGB(200, 200, 200)
	},
	["MainButtons"] = {
		["BorderColor"] = Color3.fromRGB(50, 50, 50),
		["BackgroundColor"] = Color3.fromRGB(30, 30, 30),
		["TextColor"] = Color3.fromRGB(220, 220, 220)
	},
	['Code'] = {
		['BackgroundColor'] = Color3.fromRGB(22, 22, 22),
		['TextColor'] = Color3.fromRGB(220, 220, 220),
		['CreditsColor'] = Color3.fromRGB(120, 120, 120)
	},
}
local settings = {
	["Keybind"] = "F4"
}
function Parent(GUI)
	if syn and syn.protect_gui then
		syn.protect_gui(GUI)
		GUI.Parent = game:GetService("CoreGui")
	elseif PROTOSMASHER_LOADED then
		GUI.Parent = get_hidden_gui()
	else
		GUI.Parent = game:GetService("CoreGui")
	end
end
local TweenService = game:GetService("TweenService")
local TextService = game:GetService("TextService")
game.StarterGui.ResetPlayerGuiOnSpawn = false
local mouse = game.Players.LocalPlayer:GetMouse()
if game.CoreGui:FindFirstChild("TurtleSpyGUI") then
	game.CoreGui.TurtleSpyGUI:Destroy()
end
local Turtle = {}
function Turtle:Window(Text)
	local LEFT_PANEL_WIDTH = 207
	local RIGHT_PANEL_WIDTH = 357
	local EXPANDED_WIDTH = LEFT_PANEL_WIDTH + RIGHT_PANEL_WIDTH
	local HEADER_HEIGHT = 35
	local CONTENT_HEIGHT = 287
	local buttonOffset = -25
	local TurtleSpyGUI = Instance.new("ScreenGui")
	local mainFrame = Instance.new("Frame")
	local Header = Instance.new("Frame")
	local HeaderShading = Instance.new("Frame")
	local HeaderTextLabel = Instance.new("TextLabel")
	local RemoteScrollFrame = Instance.new("ScrollingFrame")
	local RemoteButton = Instance.new("TextButton")
	local Number = Instance.new("TextLabel")
	local RemoteName = Instance.new("TextLabel")
	local InfoFrame = Instance.new("Frame")
	local InfoFrameHeader = Instance.new("Frame")
	local InfoTitleShading = Instance.new("Frame")
	local InfoHeaderText = Instance.new("TextLabel")
	local CloseInfoFrame = Instance.new("TextButton")
	local OpenInfoFrame = Instance.new("TextButton")
	local Minimize = Instance.new("TextButton")
	TurtleSpyGUI.Name = "TurtleSpyGUI"
	Parent(TurtleSpyGUI)
	mainFrame.Name = "mainFrame"
	mainFrame.Parent = TurtleSpyGUI
	mainFrame.BackgroundColor3 = colorSettings["Main"]["MainBackgroundColor"]
	mainFrame.BorderColor3 = colorSettings["Main"]["MainBackgroundColor"]
	mainFrame.BorderSizePixel = 0
	mainFrame.Position = UDim2.new(0.100000001, 0, 0.239999995, 0)
	mainFrame.Size = UDim2.new(0, LEFT_PANEL_WIDTH, 0, HEADER_HEIGHT)
	mainFrame.ZIndex = 8
	mainFrame.Active = true
	mainFrame.Draggable = true
	local mainCorner = Instance.new("UICorner")
	mainCorner.CornerRadius = UDim.new(0, 12)
	mainCorner.Parent = mainFrame
	mouse.KeyDown:Connect(function(key)
		if key:lower() == settings["Keybind"]:lower() then
			TurtleSpyGUI.Enabled = not TurtleSpyGUI.Enabled
		end
	end)
	Header.Name = "Header"
	Header.Parent = mainFrame
	Header.BackgroundColor3 = colorSettings["Main"]["HeaderColor"]
	Header.BorderColor3 = colorSettings["Main"]["HeaderColor"]
	Header.BorderSizePixel = 0
	Header.Size = UDim2.new(1, 0, 0, 26)
	Header.ZIndex = 9
	local headerCorner = Instance.new("UICorner")
	headerCorner.CornerRadius = UDim.new(0, 12)
	headerCorner.Parent = Header
	HeaderShading.Name = "HeaderShading"
	HeaderShading.Parent = Header
	HeaderShading.BackgroundColor3 = colorSettings["Main"]["HeaderShadingColor"]
	HeaderShading.BorderColor3 = colorSettings["Main"]["HeaderShadingColor"]
	HeaderShading.BorderSizePixel = 0
	HeaderShading.Position = UDim2.new(0, 0, 0.285714358, 0)
	HeaderShading.Size = UDim2.new(1, 0, 0, 27)
	HeaderShading.ZIndex = 8
	local shadingCorner = Instance.new("UICorner")
	shadingCorner.CornerRadius = UDim.new(0, 12)
	shadingCorner.Parent = HeaderShading
	HeaderTextLabel.Name = "HeaderTextLabel"
	HeaderTextLabel.Parent = HeaderShading
	HeaderTextLabel.BackgroundTransparency = 1.000
	HeaderTextLabel.Position = UDim2.new(-0.00507604145, 0, -0.202857122, 0)
	HeaderTextLabel.Size = UDim2.new(0, 215, 0, 29)
	HeaderTextLabel.ZIndex = 10
	HeaderTextLabel.Font = Enum.Font.GothamBold
	HeaderTextLabel.Text = Text
	HeaderTextLabel.TextColor3 = colorSettings["Main"]["HeaderTextColor"]
	HeaderTextLabel.TextSize = 17.000
	RemoteScrollFrame.Name = "RemoteScrollFrame"
	RemoteScrollFrame.Parent = mainFrame
	RemoteScrollFrame.Active = true
	RemoteScrollFrame.BackgroundColor3 = colorSettings["Main"]["MainBackgroundColor"]
	RemoteScrollFrame.BorderColor3 = colorSettings["Main"]["MainBackgroundColor"]
	RemoteScrollFrame.BorderSizePixel = 0
	RemoteScrollFrame.Position = UDim2.new(0, 0, 1.02292562, 0)
	RemoteScrollFrame.Size = UDim2.new(0, LEFT_PANEL_WIDTH, 0, CONTENT_HEIGHT)
	RemoteScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 287)
	RemoteScrollFrame.ScrollBarThickness = 4
	RemoteScrollFrame.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
	RemoteScrollFrame.ScrollBarImageColor3 = colorSettings["Main"]["ScrollBarImageColor"]
	RemoteScrollFrame.ScrollBarImageTransparency = 0.3
	local scrollCorner = Instance.new("UICorner")
	scrollCorner.CornerRadius = UDim.new(0, 12)
	scrollCorner.Parent = RemoteScrollFrame
	RemoteButton.Name = "RemoteButton"
	RemoteButton.Parent = RemoteScrollFrame
	RemoteButton.BackgroundColor3 = colorSettings["RemoteButtons"]["BackgroundColor"]
	RemoteButton.BorderColor3 = colorSettings["RemoteButtons"]["BorderColor"]
	RemoteButton.BorderSizePixel = 0
	RemoteButton.Position = UDim2.new(0, 17, 0, 10)
	RemoteButton.Size = UDim2.new(0, 182, 0, 26)
	RemoteButton.Selected = true
	RemoteButton.Font = Enum.Font.Gotham
	RemoteButton.Text = ""
	RemoteButton.TextColor3 = Color3.fromRGB(220, 221, 225)
	RemoteButton.TextSize = 18.000
	RemoteButton.TextStrokeTransparency = 123.000
	RemoteButton.TextWrapped = true
	RemoteButton.TextXAlignment = Enum.TextXAlignment.Left
	RemoteButton.Visible = false
	local remoteCorner = Instance.new("UICorner")
	remoteCorner.CornerRadius = UDim.new(0, 8)
	remoteCorner.Parent = RemoteButton
	RemoteName.Name = "RemoteName"
	RemoteName.Parent = RemoteButton
	RemoteName.BackgroundTransparency = 1.000
	RemoteName.Position = UDim2.new(0, 20, 0, 0)
	RemoteName.Size = UDim2.new(0, 134, 0, 26)
	RemoteName.Font = Enum.Font.Gotham
	RemoteName.Text = "RemoteEvent"
	RemoteName.TextColor3 = colorSettings["RemoteButtons"]["TextColor"]
	RemoteName.TextSize = 16.000
	RemoteName.TextXAlignment = Enum.TextXAlignment.Left
	RemoteName.TextTruncate = 1
	InfoFrame.Name = "InfoFrame"
	InfoFrame.Parent = mainFrame
	InfoFrame.BackgroundColor3 = colorSettings["Main"]["MainBackgroundColor"]
	InfoFrame.BorderColor3 = colorSettings["Main"]["MainBackgroundColor"]
	InfoFrame.BorderSizePixel = 0
	InfoFrame.Position = UDim2.new(0, LEFT_PANEL_WIDTH, 0, 0)
	InfoFrame.Size = UDim2.new(0, RIGHT_PANEL_WIDTH, 0, HEADER_HEIGHT + CONTENT_HEIGHT)
	InfoFrame.Visible = false
	InfoFrame.ZIndex = 6
	local infoCorner = Instance.new("UICorner")
	infoCorner.CornerRadius = UDim.new(0, 12)
	infoCorner.Parent = InfoFrame
	InfoFrameHeader.Name = "InfoFrameHeader"
	InfoFrameHeader.Parent = InfoFrame
	InfoFrameHeader.BackgroundColor3 = colorSettings["Main"]["HeaderColor"]
	InfoFrameHeader.BorderColor3 = colorSettings["Main"]["HeaderColor"]
	InfoFrameHeader.BorderSizePixel = 0
	InfoFrameHeader.Size = UDim2.new(1, 0, 0, 26)
	InfoFrameHeader.ZIndex = 14
	local infoHeaderCorner = Instance.new("UICorner")
	infoHeaderCorner.CornerRadius = UDim.new(0, 12)
	infoHeaderCorner.Parent = InfoFrameHeader
	InfoTitleShading.Name = "InfoTitleShading"
	InfoTitleShading.Parent = InfoFrame
	InfoTitleShading.BackgroundColor3 = colorSettings["Main"]["HeaderShadingColor"]
	InfoTitleShading.BorderColor3 = colorSettings["Main"]["HeaderShadingColor"]
	InfoTitleShading.BorderSizePixel = 0
	InfoTitleShading.Position = UDim2.new(0, 0, 0, 0)
	InfoTitleShading.Size = UDim2.new(1, 0, 0, 34)
	InfoTitleShading.ZIndex = 13
	local titleShadingCorner = Instance.new("UICorner")
	titleShadingCorner.CornerRadius = UDim.new(0, 12)
	titleShadingCorner.Parent = InfoTitleShading
	InfoHeaderText.Name = "InfoHeaderText"
	InfoHeaderText.Parent = InfoFrame
	InfoHeaderText.BackgroundTransparency = 1.000
	InfoHeaderText.Position = UDim2.new(0.0391303934, 0, -0.00206972216, 0)
	InfoHeaderText.Size = UDim2.new(0, 342, 0, 35)
	InfoHeaderText.ZIndex = 18
	InfoHeaderText.Font = Enum.Font.GothamBold
	InfoHeaderText.Text = "Tab Name"
	InfoHeaderText.TextColor3 = colorSettings["Main"]["HeaderTextColor"]
	InfoHeaderText.TextSize = 17.000
	local InfoFrameOpen = false
	CloseInfoFrame.Name = "CloseInfoFrame"
	CloseInfoFrame.Parent = InfoFrame
	CloseInfoFrame.BackgroundColor3 = colorSettings["Main"]["HeaderColor"]
	CloseInfoFrame.BorderColor3 = colorSettings["Main"]["HeaderColor"]
	CloseInfoFrame.BorderSizePixel = 0
	CloseInfoFrame.Position = UDim2.new(0, 333, 0, 2)
	CloseInfoFrame.Size = UDim2.new(0, 22, 0, 22)
	CloseInfoFrame.ZIndex = 18
	CloseInfoFrame.Font = Enum.Font.Gotham
	CloseInfoFrame.Text = "X"
	CloseInfoFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
	CloseInfoFrame.TextSize = 20.000
	local closeCorner = Instance.new("UICorner")
	closeCorner.CornerRadius = UDim.new(0, 8)
	closeCorner.Parent = CloseInfoFrame
	CloseInfoFrame.MouseButton1Click:Connect(function()
		InfoFrame.Visible = false
		InfoFrameOpen = false
		local tween = TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, LEFT_PANEL_WIDTH, 0, HEADER_HEIGHT)})
		tween:Play()
	end)
	OpenInfoFrame.Name = "OpenInfoFrame"
	OpenInfoFrame.Parent = mainFrame
	OpenInfoFrame.BackgroundColor3 = colorSettings["Main"]["HeaderColor"]
	OpenInfoFrame.BorderColor3 = colorSettings["Main"]["HeaderColor"]
	OpenInfoFrame.BorderSizePixel = 0
	OpenInfoFrame.Position = UDim2.new(0, 185, 0, 2)
	OpenInfoFrame.Size = UDim2.new(0, 22, 0, 22)
	OpenInfoFrame.ZIndex = 18
	OpenInfoFrame.Font = Enum.Font.Gotham
	OpenInfoFrame.Text = ">"
	OpenInfoFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
	OpenInfoFrame.TextSize = 16.000
	local openCorner = Instance.new("UICorner")
	openCorner.CornerRadius = UDim.new(0, 8)
	openCorner.Parent = OpenInfoFrame
	OpenInfoFrame.MouseButton1Click:Connect(function()
		if not InfoFrame.Visible then
			local targetSize = UDim2.new(0, EXPANDED_WIDTH, 0, HEADER_HEIGHT + CONTENT_HEIGHT)
			local tween = TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = targetSize})
			tween:Play()
			OpenInfoFrame.Text = "<"
		else
			local targetSize = UDim2.new(0, LEFT_PANEL_WIDTH, 0, HEADER_HEIGHT + CONTENT_HEIGHT)
			local tween = TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = targetSize})
			tween:Play()
			OpenInfoFrame.Text = ">"
		end
		InfoFrame.Visible = not InfoFrame.Visible
		InfoFrameOpen = not InfoFrameOpen
	end)
	Minimize.Name = "Minimize"
	Minimize.Parent = mainFrame
	Minimize.BackgroundColor3 = colorSettings["Main"]["HeaderColor"]
	Minimize.BorderColor3 = colorSettings["Main"]["HeaderColor"]
	Minimize.BorderSizePixel = 0
	Minimize.Position = UDim2.new(0, 164, 0, 2)
	Minimize.Size = UDim2.new(0, 22, 0, 22)
	Minimize.ZIndex = 18
	Minimize.Font = Enum.Font.Gotham
	Minimize.Text = "_"
	Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
	Minimize.TextSize = 16.000
	local minCorner = Instance.new("UICorner")
	minCorner.CornerRadius = UDim.new(0, 8)
	minCorner.Parent = Minimize
	Minimize.MouseButton1Click:Connect(function()
		if RemoteScrollFrame.Visible then
			local tween = TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, LEFT_PANEL_WIDTH, 0, HEADER_HEIGHT)})
			tween:Play()
			OpenInfoFrame.Text = "<"
			InfoFrame.Visible = false
			tween.Completed:Connect(function()
				RemoteScrollFrame.Visible = false
			end)
		else
			RemoteScrollFrame.Visible = true
			if InfoFrameOpen then
				local tween = TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, EXPANDED_WIDTH, 0, HEADER_HEIGHT + CONTENT_HEIGHT)})
				tween:Play()
				OpenInfoFrame.Text = "<"
				InfoFrame.Visible = true
			else
				local tween = TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, LEFT_PANEL_WIDTH, 0, HEADER_HEIGHT + CONTENT_HEIGHT)})
				tween:Play()
				OpenInfoFrame.Text = ">"
				InfoFrame.Visible = false
			end
		end
	end)
	local function addHoverEffect(button, normalColor, hoverColor)
		button.MouseEnter:Connect(function()
			TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = hoverColor}):Play()
		end)
		button.MouseLeave:Connect(function()
			TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = normalColor}):Play()
		end)
	end
	addHoverEffect(CloseInfoFrame, colorSettings["Main"]["HeaderColor"], Color3.fromRGB(40, 40, 40))
	addHoverEffect(OpenInfoFrame, colorSettings["Main"]["HeaderColor"], Color3.fromRGB(40, 40, 40))
	addHoverEffect(Minimize, colorSettings["Main"]["HeaderColor"], Color3.fromRGB(40, 40, 40))
	local activeContent = nil
	local Window = {}
	function Window:Tab(name)
		local rButton = RemoteButton:Clone()
		rButton.Parent = RemoteScrollFrame
		rButton.Visible = true
		rButton.RemoteName.Text = tostring(name) or "New Tab"
		buttonOffset = buttonOffset + 35
		rButton.Position = UDim2.new(0.091, 0, 0, buttonOffset)
		if buttonOffset > RemoteScrollFrame.AbsoluteSize.Y then
			RemoteScrollFrame.CanvasSize = UDim2.new(0, 0, 0, buttonOffset + 10)
		end
		local tabButtonsScroll = Instance.new("ScrollingFrame")
		tabButtonsScroll.Name = "TabButtonsScroll_" .. name
		tabButtonsScroll.Parent = InfoFrame
		tabButtonsScroll.Active = true
		tabButtonsScroll.BackgroundColor3 = colorSettings["Main"]["MainBackgroundColor"]
		tabButtonsScroll.BorderColor3 = colorSettings["Main"]["MainBackgroundColor"]
		tabButtonsScroll.BorderSizePixel = 0
		tabButtonsScroll.Position = UDim2.new(0.0391303748, 0, 0.12, 0)
		tabButtonsScroll.Size = UDim2.new(0, 329, 0, 250)
		tabButtonsScroll.ZIndex = 11
		tabButtonsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
		tabButtonsScroll.ScrollBarThickness = 4
		tabButtonsScroll.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
		tabButtonsScroll.ScrollBarImageColor3 = colorSettings["Main"]["ScrollBarImageColor"]
		tabButtonsScroll.ScrollBarImageTransparency = 0.3
		tabButtonsScroll.Visible = false
		local tabScrollCorner = Instance.new("UICorner")
		tabScrollCorner.CornerRadius = UDim.new(0, 12)
		tabScrollCorner.Parent = tabButtonsScroll
		rButton.MouseButton1Click:Connect(function()
			if activeContent then
				activeContent.Visible = false
			end
			tabButtonsScroll.Visible = true
			activeContent = tabButtonsScroll
			InfoHeaderText.Text = rButton.RemoteName.Text
			tabButtonsScroll.CanvasPosition = Vector2.new(0, 0)
		end)
		if not activeContent then
			tabButtonsScroll.Visible = true
			activeContent = tabButtonsScroll
			rButton.BackgroundTransparency = 0
		end
		local Tab = {}
		local tabButtonOffset = 0
		function Tab:Box(text, callback)
			local callback = callback or function() end
			local TextBox = Instance.new("TextBox")
			local BoxDescription = Instance.new("TextLabel")
			TextBox.Name = "TextBox"
			TextBox.Parent = tabButtonsScroll
			TextBox.BackgroundColor3 = colorSettings["RemoteButtons"]["BackgroundColor"]
			TextBox.BorderColor3 = colorSettings["RemoteButtons"]["BorderColor"]
			TextBox.BorderSizePixel = 0
			TextBox.Position = UDim2.new(0.0645, 0, 0, tabButtonOffset + 10)
			TextBox.Size = UDim2.new(0, 294, 0, 26)
			TextBox.Font = Enum.Font.Gotham
			TextBox.PlaceholderColor3 = Color3.fromRGB(180, 180, 180)
			TextBox.PlaceholderText = "..."
			TextBox.Text = ""
			TextBox.TextColor3 = Color3.fromRGB(245, 246, 250)
			TextBox.TextSize = 16.000
			TextBox.TextStrokeColor3 = Color3.fromRGB(245, 246, 250)
			TextBox.ZIndex = 15
			local boxCorner = Instance.new("UICorner")
			boxCorner.CornerRadius = UDim.new(0, 8)
			boxCorner.Parent = TextBox
			TextBox:GetPropertyChangedSignal('Text'):Connect(function()
				callback(TextBox.Text, false)
			end)
			TextBox.FocusLost:Connect(function()
				callback(TextBox.Text, true)
			end)
			BoxDescription.Name = "BoxDescription"
			BoxDescription.Parent = TextBox
			BoxDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			BoxDescription.BackgroundTransparency = 1.000
			BoxDescription.Position = UDim2.new(-0.894736826, 0, 0, 0)
			BoxDescription.Size = UDim2.new(0, 75, 0, 26)
			BoxDescription.Font = Enum.Font.Gotham
			BoxDescription.Text = text or "Box"
			BoxDescription.TextColor3 = Color3.fromRGB(245, 246, 250)
			BoxDescription.TextSize = 16.000
			BoxDescription.TextXAlignment = Enum.TextXAlignment.Left
			BoxDescription.ZIndex = 15
			tabButtonOffset = tabButtonOffset + 35
			if tabButtonOffset > tabButtonsScroll.AbsoluteSize.Y then
				tabButtonsScroll.CanvasSize = UDim2.new(0, 0, 0, tabButtonOffset + 20)
			end
			addHoverEffect(TextBox, colorSettings["RemoteButtons"]["BackgroundColor"], Color3.fromRGB(40, 40, 40))
			return TextBox
		end
		function Tab:Label(text, color)
			local color = color or Color3.fromRGB(220, 221, 225)
			local Label = Instance.new("TextLabel")
			Label.Name = "Label"
			Label.Parent = tabButtonsScroll
			Label.BackgroundColor3 = Color3.fromRGB(220, 221, 225)
			Label.BackgroundTransparency = 1.000
			Label.BorderColor3 = Color3.fromRGB(27, 42, 53)
			Label.BorderSizePixel = 0
			Label.Position = UDim2.new(0.0645, 0, 0, tabButtonOffset + 10)
			Label.Size = UDim2.new(0, 294, 0, 26)
			Label.Font = Enum.Font.Gotham
			Label.Text = text or "Label"
			Label.TextSize = 16.000
			Label.ZIndex = 15
			if type(color) == "boolean" and color then
				spawn(function()
					while wait() do
						local hue = tick() % 5 / 5
						Label.TextColor3 = Color3.fromHSV(hue, 1, 1)
					end
				end)
			else
				Label.TextColor3 = color
			end
			tabButtonOffset = tabButtonOffset + 35
			if tabButtonOffset > tabButtonsScroll.AbsoluteSize.Y then
				tabButtonsScroll.CanvasSize = UDim2.new(0, 0, 0, tabButtonOffset + 20)
			end
			local api = {}
			function api:Text(newText)
				Label.Text = newText
			end
			function api:Color(newColor)
				Label.TextColor3 = newColor
			end
			return api
		end
		function Tab:Dropdown(text, buttons, callback, selective)
			local text = text or "Dropdown"
			local buttons = buttons or {}
			local callback = callback or function() end
			local Dropdown = Instance.new("TextButton")
			local DownSign = Instance.new("TextLabel")
			local DropdownFrame = Instance.new("ScrollingFrame")
			Dropdown.Name = "Dropdown"
			Dropdown.Parent = tabButtonsScroll
			Dropdown.BackgroundColor3 = colorSettings["RemoteButtons"]["BackgroundColor"]
			Dropdown.BorderColor3 = colorSettings["RemoteButtons"]["BorderColor"]
			Dropdown.BorderSizePixel = 0
			Dropdown.Position = UDim2.new(0.0645, 0, 0, tabButtonOffset + 10)
			Dropdown.Size = UDim2.new(0, 294, 0, 26)
			Dropdown.Selected = true
			Dropdown.Font = Enum.Font.Gotham
			Dropdown.Text = tostring(text)
			Dropdown.TextColor3 = Color3.fromRGB(245, 246, 250)
			Dropdown.TextSize = 16.000
			Dropdown.TextStrokeTransparency = 123.000
			Dropdown.TextWrapped = true
			Dropdown.ZIndex = 15
			local dropdownCorner = Instance.new("UICorner")
			dropdownCorner.CornerRadius = UDim.new(0, 8)
			dropdownCorner.Parent = Dropdown
			DownSign.Name = "DownSign"
			DownSign.Parent = Dropdown
			DownSign.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DownSign.BackgroundTransparency = 1.000
			DownSign.Position = UDim2.new(0, 260, 0, 2)
			DownSign.Size = UDim2.new(0, 27, 0, 22)
			DownSign.Font = Enum.Font.Gotham
			DownSign.Text = "^"
			DownSign.TextColor3 = Color3.fromRGB(220, 221, 225)
			DownSign.TextSize = 20.000
			DownSign.ZIndex = 16
			DownSign.TextYAlignment = Enum.TextYAlignment.Bottom
			DropdownFrame.Name = "DropdownFrame"
			DropdownFrame.Parent = Dropdown
			DropdownFrame.Active = true
			DropdownFrame.BackgroundColor3 = colorSettings["RemoteButtons"]["BackgroundColor"]
			DropdownFrame.BorderColor3 = colorSettings["RemoteButtons"]["BorderColor"]
			DropdownFrame.BorderSizePixel = 0
			DropdownFrame.Position = UDim2.new(0, 0, 0, 28)
			DropdownFrame.Size = UDim2.new(0, 294, 0, 0)
			DropdownFrame.Visible = false
			DropdownFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
			DropdownFrame.ScrollBarThickness = 4
			DropdownFrame.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
			DropdownFrame.ZIndex = 17
			DropdownFrame.ScrollingDirection = Enum.ScrollingDirection.Y
			DropdownFrame.ScrollBarImageColor3 = colorSettings["Main"]["ScrollBarImageColor"]
			DropdownFrame.ScrollBarImageTransparency = 0.3
			local dropFrameCorner = Instance.new("UICorner")
			dropFrameCorner.CornerRadius = UDim.new(0, 8)
			dropFrameCorner.Parent = DropdownFrame
			Dropdown.MouseButton1Click:Connect(function()
				if DropdownFrame.Visible then
					DownSign.Rotation = 0
					local tween = TweenService:Create(DropdownFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 294, 0, 0)})
					tween:Play()
					tween.Completed:Connect(function()
						DropdownFrame.Visible = false
					end)
				else
					DownSign.Rotation = 180
					DropdownFrame.Visible = true
					local targetHeight = 0
					for _, child in pairs(DropdownFrame:GetChildren()) do
						if child:IsA("TextButton") then
							targetHeight = targetHeight + child.Size.Y.Offset + 1
						end
					end
					local tween = TweenService:Create(DropdownFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 294, 0, targetHeight)})
					tween:Play()
				end
			end)
			local dropFunctions = {}
			local canvasSize = 0
			function dropFunctions:Button(name)
				local name = name or ""
				local Button_2 = Instance.new("TextButton")
				Button_2.Name = "Button"
				Button_2.Parent = DropdownFrame
				Button_2.BackgroundColor3 = colorSettings["RemoteButtons"]["BackgroundColor"]
				Button_2.BorderColor3 = colorSettings["RemoteButtons"]["BorderColor"]
				Button_2.BorderSizePixel = 0
				Button_2.Position = UDim2.new(0, 6, 0, canvasSize + 1)
				Button_2.Size = UDim2.new(0, 282, 0, 26)
				Button_2.Selected = true
				Button_2.Font = Enum.Font.Gotham
				Button_2.TextColor3 = Color3.fromRGB(245, 246, 250)
				Button_2.TextSize = 16.000
				Button_2.TextStrokeTransparency = 123.000
				Button_2.ZIndex = 18
				Button_2.Text = name
				Button_2.TextWrapped = true
				local btnCorner = Instance.new("UICorner")
				btnCorner.CornerRadius = UDim.new(0, 8)
				btnCorner.Parent = Button_2
				canvasSize = canvasSize + 27
				DropdownFrame.CanvasSize = UDim2.new(0, 294, 0, canvasSize + 1)
				if #DropdownFrame:GetChildren() < 8 then
					DropdownFrame.Size = UDim2.new(0, 294, 0, DropdownFrame.Size.Y.Offset + 27)
				end
				Button_2.MouseButton1Click:Connect(function()
					callback(name)
					DropdownFrame.Visible = false
					DownSign.Rotation = 0
					if selective then
						Dropdown.Text = name
					end
				end)
				addHoverEffect(Button_2, colorSettings["RemoteButtons"]["BackgroundColor"], Color3.fromRGB(40, 40, 40))
			end
			function dropFunctions:Remove(name)
				local foundIt
				for i, v in pairs(DropdownFrame:GetChildren()) do
					if foundIt then
						canvasSize = canvasSize - 27
						v.Position = UDim2.new(0, 6, 0, v.Position.Y.Offset - 27)
						DropdownFrame.CanvasSize = UDim2.new(0, 294, 0, canvasSize + 1)
					end
					if v.Text == name then
						foundIt = true
						v:Destroy()
						if #DropdownFrame:GetChildren() < 8 then
							DropdownFrame.Size = UDim2.new(0, 294, 0, DropdownFrame.Size.Y.Offset - 27)
						end
					end
				end
				if not foundIt then
					warn("The button you tried to remove didn't exist!")
				end
			end
			for i, v in pairs(buttons) do
				dropFunctions:Button(v)
			end
			tabButtonOffset = tabButtonOffset + 35
			if tabButtonOffset > tabButtonsScroll.AbsoluteSize.Y then
				tabButtonsScroll.CanvasSize = UDim2.new(0, 0, 0, tabButtonOffset + 20)
			end
			addHoverEffect(Dropdown, colorSettings["RemoteButtons"]["BackgroundColor"], Color3.fromRGB(40, 40, 40))
			return dropFunctions
		end
		function Tab:Toggle(text, on, callback)
			local callback = callback or function() end
			local ToggleDescription = Instance.new("TextLabel")
			local ToggleButton = Instance.new("TextButton")
			local ToggleFiller = Instance.new("Frame")
			ToggleDescription.Name = "ToggleDescription"
			ToggleDescription.Parent = tabButtonsScroll
			ToggleDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleDescription.BackgroundTransparency = 1.000
			ToggleDescription.Position = UDim2.new(0.0645, 0, 0, tabButtonOffset + 10)
			ToggleDescription.Size = UDim2.new(0, 220, 0, 26)
			ToggleDescription.Font = Enum.Font.Gotham
			ToggleDescription.Text = text or "Toggle"
			ToggleDescription.TextColor3 = Color3.fromRGB(245, 246, 250)
			ToggleDescription.TextSize = 16.000
			ToggleDescription.TextWrapped = true
			ToggleDescription.TextXAlignment = Enum.TextXAlignment.Left
			ToggleDescription.ZIndex = 15
			ToggleButton.Name = "ToggleButton"
			ToggleButton.Parent = ToggleDescription
			ToggleButton.BackgroundColor3 = colorSettings["RemoteButtons"]["BackgroundColor"]
			ToggleButton.BorderColor3 = colorSettings["RemoteButtons"]["BorderColor"]
			ToggleButton.BorderSizePixel = 0
			ToggleButton.Position = UDim2.new(1.2061069, 0, 0.0769230798, 0)
			ToggleButton.Size = UDim2.new(0, 22, 0, 22)
			ToggleButton.Font = Enum.Font.Gotham
			ToggleButton.Text = ""
			ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			ToggleButton.TextSize = 14.000
			ToggleButton.ZIndex = 15
			local toggleBtnCorner = Instance.new("UICorner")
			toggleBtnCorner.CornerRadius = UDim.new(0, 11)
			toggleBtnCorner.Parent = ToggleButton
			ToggleFiller.Name = "ToggleFiller"
			ToggleFiller.Parent = ToggleButton
			ToggleFiller.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
			ToggleFiller.BorderColor3 = colorSettings["RemoteButtons"]["BorderColor"]
			ToggleFiller.BorderSizePixel = 0
			ToggleFiller.Position = UDim2.new(0, 5, 0, 5)
			ToggleFiller.Size = UDim2.new(0, 12, 0, 12)
			ToggleFiller.Visible = on
			ToggleFiller.ZIndex = 15
			local fillerCorner = Instance.new("UICorner")
			fillerCorner.CornerRadius = UDim.new(0, 6)
			fillerCorner.Parent = ToggleFiller
			ToggleButton.MouseButton1Click:Connect(function()
				ToggleFiller.Visible = not ToggleFiller.Visible
				if ToggleFiller.Visible then
					TweenService:Create(ToggleFiller, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(200, 200, 200)}):Play()
				else
					TweenService:Create(ToggleFiller, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(80, 80, 80)}):Play()
				end
				callback(ToggleFiller.Visible)
			end)
			tabButtonOffset = tabButtonOffset + 35
			if tabButtonOffset > tabButtonsScroll.AbsoluteSize.Y then
				tabButtonsScroll.CanvasSize = UDim2.new(0, 0, 0, tabButtonOffset + 20)
			end
			return ToggleDescription
		end
		function Tab:Slider(text, min, max, default, callback)
			local text = text or "Slider"
			local min = min or 1
			local max = max or 100
			local default = default or max/2
			local callback = callback or function() end
			if default > max then default = max elseif default < min then default = min end
			local Slider = Instance.new("Frame")
			local SliderButton = Instance.new("Frame")
			local Description = Instance.new("TextLabel")
			local SilderFiller = Instance.new("Frame")
			local Current = Instance.new("TextLabel")
			local Min = Instance.new("TextLabel")
			local Max = Instance.new("TextLabel")
			local mouse = game.Players.LocalPlayer:GetMouse()
			local stepped = game:GetService("RunService").Heartbeat
			local isdragging = false
			function Lerp(a, b, t)
				return a + (b - a) * t
			end
			function SliderMovement(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					isdragging = true
					mainFrame.Active = false
					local minitial = input.Position.X
					local initial = SliderButton.Position.X.Offset
					local delta1 = SliderButton.AbsolutePosition.X - initial
					local con
					con = stepped:Connect(function()
						if isdragging then
							local xOffset = mouse.X - delta1 - 3
							if xOffset > 284 then xOffset = 284 elseif xOffset < 0 then xOffset = 0 end
							SliderButton.Position = UDim2.new(0, xOffset, -1.33333337, 0)
							SilderFiller.Size = UDim2.new(0, xOffset, 0, 6)
							local value = Lerp(min, max, SliderButton.Position.X.Offset/(Slider.Size.X.Offset-5))
							Current.Text = tostring(math.round(value))
						else
							con:Disconnect()
						end
					end)
					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							isdragging = false
							mainFrame.Active = true
						end
					end)
				end
			end
			function SliderEnd(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					local value = Lerp(min, max, SliderButton.Position.X.Offset/(Slider.Size.X.Offset-5))
					callback(math.round(value))
				end
			end
			Slider.Name = "Slider"
			Slider.Parent = tabButtonsScroll
			Slider.BackgroundColor3 = colorSettings["Main"]["MainBackgroundColor"]
			Slider.BorderColor3 = colorSettings["RemoteButtons"]["BorderColor"]
			Slider.BorderSizePixel = 0
			Slider.Position = UDim2.new(0.0645, 0, 0, tabButtonOffset + 45)
			Slider.Size = UDim2.new(0, 289, 0, 6)
			Slider.ZIndex = 15
			local sliderCorner = Instance.new("UICorner")
			sliderCorner.CornerRadius = UDim.new(0, 3)
			sliderCorner.Parent = Slider
			Slider.InputBegan:Connect(SliderMovement)
			Slider.InputEnded:Connect(SliderEnd)
			SliderButton.Position = UDim2.new(0, (Slider.Size.X.Offset - 5) * ((default - min)/(max-min)), -1.333337, 0)
			SliderButton.Name = "SliderButton"
			SliderButton.Parent = Slider
			SliderButton.BackgroundColor3 = colorSettings["RemoteButtons"]["BackgroundColor"]
			SliderButton.BorderColor3 = colorSettings["RemoteButtons"]["BorderColor"]
			SliderButton.BorderSizePixel = 0
			SliderButton.Size = UDim2.new(0, 6, 0, 22)
			SliderButton.ZIndex = 16
			local sliderBtnCorner = Instance.new("UICorner")
			sliderBtnCorner.CornerRadius = UDim.new(0, 3)
			sliderBtnCorner.Parent = SliderButton
			SliderButton.InputBegan:Connect(SliderMovement)
			SliderButton.InputEnded:Connect(SliderEnd)
			Current.Name = "Current"
			Current.Parent = SliderButton
			Current.BackgroundTransparency = 1.000
			Current.Position = UDim2.new(0, 3, 0, 22)
			Current.Size = UDim2.new(0, 0, 0, 18)
			Current.Font = Enum.Font.Gotham
			Current.Text = tostring(default)
			Current.TextColor3 = Color3.fromRGB(220, 221, 225)
			Current.TextSize = 14.000
			Current.ZIndex = 15
			Description.Name = "Description"
			Description.Parent = Slider
			Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Description.BackgroundTransparency = 1.000
			Description.Position = UDim2.new(0, -5, 0, -35)
			Description.Size = UDim2.new(0, 294, 0, 21)
			Description.Font = Enum.Font.Gotham
			Description.Text = text
			Description.TextColor3 = Color3.fromRGB(245, 246, 250)
			Description.TextSize = 16.000
			Description.ZIndex = 15
			SilderFiller.Name = "SilderFiller"
			SilderFiller.Parent = Slider
			SilderFiller.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
			SilderFiller.BorderColor3 = colorSettings["RemoteButtons"]["BorderColor"]
			SilderFiller.BorderSizePixel = 0
			SilderFiller.Size = UDim2.new(0, (Slider.Size.X.Offset - 5) * ((default - min)/(max-min)), 0, 6)
			SilderFiller.ZIndex = 15
			SilderFiller.BorderMode = Enum.BorderMode.Inset
			local fillerSliderCorner = Instance.new("UICorner")
			fillerSliderCorner.CornerRadius = UDim.new(0, 3)
			fillerSliderCorner.Parent = SilderFiller
			Min.Name = "Min"
			Min.Parent = Slider
			Min.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Min.BackgroundTransparency = 1.000
			Min.Position = UDim2.new(0, 0, 0, -44)
			Min.Size = UDim2.new(0, 77, 0, 50)
			Min.Font = Enum.Font.Gotham
			Min.Text = tostring(min)
			Min.TextColor3 = Color3.fromRGB(220, 221, 225)
			Min.TextSize = 14.000
			Min.TextXAlignment = Enum.TextXAlignment.Left
			Min.ZIndex = 15
			Max.Name = "Max"
			Max.Parent = Slider
			Max.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Max.BackgroundTransparency = 1.000
			Max.Position = UDim2.new(0, 212, 0, -44)
			Max.Size = UDim2.new(0, 77, 0, 50)
			Max.Font = Enum.Font.Gotham
			Max.Text = tostring(max)
			Max.TextColor3 = Color3.fromRGB(220, 221, 225)
			Max.TextSize = 14.000
			Max.TextXAlignment = Enum.TextXAlignment.Right
			Max.ZIndex = 15
			tabButtonOffset = tabButtonOffset + 70
			if tabButtonOffset > tabButtonsScroll.AbsoluteSize.Y then
				tabButtonsScroll.CanvasSize = UDim2.new(0, 0, 0, tabButtonOffset + 20)
			end
			local slider = {}
			function slider:SetValue(value)
				value = math.clamp(value, min, max)
				local xOffset = (value-min)/(max-min) * (Slider.Size.X.Offset - 5)
				SliderButton.Position = UDim2.new(0, xOffset, -1.33333337, 0)
				SilderFiller.Size = UDim2.new(0, xOffset, 0, 6)
				Current.Text = tostring(math.round(value))
			end
			return slider
		end
		function Tab:Button(buttonName, callback)
			local btn = Instance.new("TextButton")
			btn.Name = buttonName
			btn.Parent = tabButtonsScroll
			btn.BackgroundColor3 = colorSettings["MainButtons"]["BackgroundColor"]
			btn.BorderColor3 = colorSettings["MainButtons"]["BorderColor"]
			btn.BorderSizePixel = 0
			btn.Position = UDim2.new(0.0645, 0, 0, tabButtonOffset + 10)
			btn.Size = UDim2.new(0, 294, 0, 26)
			btn.ZIndex = 15
			btn.Font = Enum.Font.Gotham
			btn.Text = buttonName
			btn.TextColor3 = Color3.fromRGB(250, 251, 255)
			btn.TextSize = 16.000
			local btnCorner = Instance.new("UICorner")
			btnCorner.CornerRadius = UDim.new(0, 8)
			btnCorner.Parent = btn
			btn.MouseButton1Click:Connect(function()
				if callback then
					callback()
				end
			end)
			addHoverEffect(btn, colorSettings["MainButtons"]["BackgroundColor"], Color3.fromRGB(45, 45, 45))
			tabButtonOffset = tabButtonOffset + 35
			if tabButtonOffset > tabButtonsScroll.AbsoluteSize.Y then
				tabButtonsScroll.CanvasSize = UDim2.new(0, 0, 0, tabButtonOffset + 20)
			end
			return btn
		end
		return Tab
	end
	local mobileGui = Instance.new("ScreenGui")
	Parent(mobileGui)
	local mobileButton = Instance.new("TextButton")
	mobileButton.Name = "MobileToggle"
	mobileButton.Parent = mobileGui
	mobileButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	mobileButton.BackgroundTransparency = 0.9
	mobileButton.Size = UDim2.new(0, 30, 0, 30)
	mobileButton.Position = UDim2.new(1, -45, 1, -45)
	mobileButton.Text = "T"
	mobileButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	mobileButton.Font = Enum.Font.GothamBold
	mobileButton.TextSize = 18
	mobileButton.ZIndex = 100
	local mbCorner = Instance.new("UICorner")
	mbCorner.CornerRadius = UDim.new(0, 8)
	mbCorner.Parent = mobileButton
	local mbStroke = Instance.new("UIStroke")
	mbStroke.Color = Color3.fromRGB(255, 255, 255)
	mbStroke.Thickness = 1.5
	mbStroke.Transparency = 0.7
	mbStroke.Parent = mobileButton
	mobileButton.MouseButton1Click:Connect(function()
		TurtleSpyGUI.Enabled = not TurtleSpyGUI.Enabled
	end)
	return Window
end
return Turtle
