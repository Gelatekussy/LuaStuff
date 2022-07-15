local Library = {}

function Library:Create(Name,LowerName)
	local UI_Library = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local MainUICorner = Instance.new("UICorner")
	local SideBar = Instance.new("Frame")
	local SideBarUICorner = Instance.new("UICorner")
	local Title = Instance.new("TextLabel")
	local Version = Instance.new("TextLabel")
	local TabList = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local Shadow = Instance.new("ImageLabel")
	local Tabs = Instance.new("Folder")

	UI_Library.Name = "UI_Library"
	UI_Library.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

	Main.Name = "Main"
	Main.Parent = UI_Library
	Main.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.5, 0, -0.25, 0) -- -0.5 0.285189718
	Main.Size = UDim2.new(0, 421, 0, 290)
	Main.AnchorPoint = Vector2.new(0.5,0.5)
	
	MainUICorner.CornerRadius = UDim.new(0, 4)
	MainUICorner.Name = "MainUICorner"
	MainUICorner.Parent = Main

	SideBar.Name = "SideBar"
	SideBar.Parent = Main
	SideBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	SideBar.Size = UDim2.new(0, 129, 0, 290)

	SideBarUICorner.CornerRadius = UDim.new(0, 4)
	SideBarUICorner.Name = "SideBarUICorner"
	SideBarUICorner.Parent = SideBar

	Title.Name = "Title"
	Title.Parent = SideBar
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.0827485323, 0, 0.0279571842, 0)
	Title.Size = UDim2.new(0, 99, 0, 21)
	Title.Font = Enum.Font.GothamBold
	Title.Text = Name or "Name"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 14.000
	Title.TextXAlignment = Enum.TextXAlignment.Left

	Version.Name = "Version"
	Version.Parent = Title
	Version.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Version.BackgroundTransparency = 1.000
	Version.Position = UDim2.new(0, 0, 0.980337977, 0)
	Version.Size = UDim2.new(0, 83, 0, 9)
	Version.Font = Enum.Font.Gotham
	Version.Text = LowerName or "LowerName"
	Version.TextColor3 = Color3.fromRGB(255, 255, 255)
	Version.TextSize = 14.000
	Version.TextTransparency = 0.200
	Version.TextXAlignment = Enum.TextXAlignment.Left
	
	TabList.Name = "TabList"
	TabList.Parent = SideBar
	TabList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabList.BackgroundTransparency = 1.000
	TabList.Position = UDim2.new(0, 0, 0.16835022, 0)
	TabList.Size = UDim2.new(0, 129, 0, 241)

	UIListLayout.Parent = TabList
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder


	Shadow.Parent = Main
	Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Shadow.BackgroundTransparency = 1.000
	Shadow.Position = UDim2.new(-0.0546318293, 0, -0.0551724136, 0)
	Shadow.Size = UDim2.new(0, 467, 0, 322)
	Shadow.ZIndex = -1
	Shadow.Image = "rbxassetid://5554236805"
	Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)

	Tabs.Name = "Tabs"
	Tabs.Parent = Main
	task.spawn(function()
		task.wait(0.25)
		Main:TweenPosition(UDim2.new(0.5,0,0.5,0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quart, 1.2)
	end)
	local Library2 = {}
	
	function Library2:MakeTab(Name, ImageId)
		-- Tween For Transparency
		local function SmoothTransparency(Part,Table)
			local Tween = game:GetService("TweenService"):Create(Part, TweenInfo.new(Table["Time"]), {Transparency = Table["Transparency"]}):Play()
			return Tween
		end

		-- Tab Button
		local TabOpener = Instance.new("TextButton")
		local Text = Instance.new("TextLabel")
		local Image = Instance.new("ImageLabel")

		
		local ImageSource = ImageId or 6031097225
		TabOpener.Name = "TabOpener"
		TabOpener.Parent = TabList
		TabOpener.BackgroundColor3 = Color3.fromRGB(117, 126, 255)
		TabOpener.BackgroundTransparency = 1.000
		TabOpener.BorderSizePixel = 0
		TabOpener.Position = UDim2.new(0.0465116277, 0, -0.0931174085, 0)
		TabOpener.Size = UDim2.new(0, 129, 0, 30)
		TabOpener.Font = Enum.Font.SourceSans
		TabOpener.Text = " "
		TabOpener.TextColor3 = Color3.fromRGB(0, 0, 0)
		TabOpener.TextSize = 14.000

		Text.Name = "Text"
		Text.Parent = TabOpener
		Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Text.BackgroundTransparency = 1.000
		Text.Position = UDim2.new(0.25329116, 0, 0.233333334, 0)
		Text.Size = UDim2.new(0, 96, 0, 17)
		Text.Font = Enum.Font.Gotham
		Text.TextColor3 = Color3.fromRGB(255, 255, 255)
		Text.TextSize = 14.000
		Text.Text = Name or "Tab"
		Text.TextXAlignment = Enum.TextXAlignment.Left

		Image.Name = "Image"
		Image.Parent = TabOpener
		Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Image.BackgroundTransparency = 1.000
		Image.Position = UDim2.new(0.0500000007, 0, 0.166999996, 0)
		Image.Size = UDim2.new(0, 20, 0, 20)
		Image.Image = "http://www.roblox.com/asset/?id="..tostring(ImageSource)

		-- Tab
		local Tab = Instance.new("ScrollingFrame")
		local TabLayout = Instance.new("UIListLayout")
		Tab.Name = "Tab"
		Tab.Parent = Tabs
		Tab.Active = true
		Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Tab.BackgroundTransparency = 1.000
		Tab.BorderSizePixel = 0
		Tab.Position = UDim2.new(0.320665091, 0, 0.0279572587, 0)
		Tab.Size = UDim2.new(0, 280, 0, 274)
		Tab.Visible = false
		Tab.ScrollBarThickness = 4

		TabLayout.Name = "TabLayout"
		TabLayout.Parent = Tab
		TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
		TabLayout.Padding = UDim.new(0, 3)

		TabOpener.MouseButton1Down:Connect(function()
			for Index, Tabs in pairs(Tabs:GetChildren()) do
				if Tabs:IsA("ScrollingFrame") then
					Tabs.Visible = false
				end
			end
			Tab.Visible = true
			for Index, TabOpeners in pairs(TabList:GetChildren()) do
				if TabOpeners:IsA("TextButton") then
					if TabOpeners ~= TabOpener then
						SmoothTransparency(TabOpeners, {["Time"] = 0.15, ["Transparency"] = 1})
					end
				end
			end
			SmoothTransparency(TabOpener, {["Time"] = 0.15, ["Transparency"] = 0})
		end)	
		local Library3 = {}
		
		function Library3:MakeLabel(Text)
			local Label = Instance.new("Frame")
			local LabelCorner = Instance.new("UICorner")
			local LabelImage = Instance.new("ImageLabel")
			local LabelText = Instance.new("TextLabel")

			Label.Name = "Label"
			Label.Parent = Tab
			Label.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
			Label.BorderSizePixel = 0
			Label.Size = UDim2.new(0, 270, 0, 29)

			LabelCorner.CornerRadius = UDim.new(0, 3)
			LabelCorner.Name = "LabelCorner"
			LabelCorner.Parent = Label

			LabelImage.Name = "LabelImage"
			LabelImage.Parent = Label
			LabelImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			LabelImage.BackgroundTransparency = 1.000
			LabelImage.Position = UDim2.new(0.911000013, 0, 0.137999997, 0)
			LabelImage.Size = UDim2.new(0, 20, 0, 20)
			LabelImage.Image = "http://www.roblox.com/asset/?id=6026568210"

			LabelText.Name = "LabelText"
			LabelText.Parent = Label
			LabelText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			LabelText.BackgroundTransparency = 1.000
			LabelText.Position = UDim2.new(0.0270858202, 0, 0.198850438, 0)
			LabelText.Size = UDim2.new(0, 230, 0, 17)
			LabelText.Font = Enum.Font.Gotham
			LabelText.TextColor3 = Color3.fromRGB(255, 255, 255)
			LabelText.TextSize = 14.000
			LabelText.Text = Text or "Label"
			LabelText.TextXAlignment = Enum.TextXAlignment.Left
			local Extra = {}
			function Extra:UpdateText(NewText)
				LabelText.Text = NewText or "Label"
			end
			return Extra
		end
		function Library3:MakeButton(Name, Callback)
			local Button = Instance.new("TextButton")
			local ButtonCorner = Instance.new("UICorner")
			local ButtonText = Instance.new("TextLabel")
			local ButtonImage = Instance.new("ImageLabel")
			
			Button.Name = "Button"
			Button.Parent = Tab
			Button.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
			Button.BorderSizePixel = 0
			Button.Size = UDim2.new(0, 270, 0, 29)
			Button.Font = Enum.Font.SourceSans
			Button.Text = " "
			Button.TextColor3 = Color3.fromRGB(0, 0, 0)
			Button.TextSize = 14.000

			ButtonCorner.CornerRadius = UDim.new(0, 3)
			ButtonCorner.Name = "ButtonCorner"
			ButtonCorner.Parent = Button

			ButtonText.Name = "ButtonText"
			ButtonText.Parent = Button
			ButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonText.BackgroundTransparency = 1.000
			ButtonText.Position = UDim2.new(0.0270858202, 0, 0.198850438, 0)
			ButtonText.Size = UDim2.new(0, 230, 0, 17)
			ButtonText.Font = Enum.Font.Gotham
			ButtonText.Text = Name or "Button"
			ButtonText.TextColor3 = Color3.fromRGB(255, 255, 255)
			ButtonText.TextSize = 14.000
			ButtonText.TextXAlignment = Enum.TextXAlignment.Left

			ButtonImage.Name = "ButtonImage"
			ButtonImage.Parent = Button
			ButtonImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonImage.BackgroundTransparency = 1.000
			ButtonImage.Position = UDim2.new(0.911000013, 0, 0.137999997, 0)
			ButtonImage.Size = UDim2.new(0, 20, 0, 20)
			ButtonImage.Image = "http://www.roblox.com/asset/?id=6031229361"
			
			Button.MouseButton1Down:Connect(Callback)
		end
		function Library3:MakeToggle(Name, Callback)
			-- Image Transparency
			local function SmoothImageTransparency(Part,Table)
				local Tween = game:GetService("TweenService"):Create(Part, TweenInfo.new(Table["Time"]), {ImageTransparency = Table["ImageTransparency"]}):Play()
				return Tween
			end
			-- Toggle
			local Toggle = Instance.new("TextButton")
			local ToggleCorner = Instance.new("UICorner")
			local ToggleText = Instance.new("TextLabel")
			local ToggleImage = Instance.new("ImageLabel")
			local ToggleImage2 = Instance.new("ImageLabel")
			Toggle.Name = "Toggle"
			Toggle.Parent = Tab
			Toggle.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
			Toggle.BorderSizePixel = 0
			Toggle.Size = UDim2.new(0, 270, 0, 29)
			Toggle.Font = Enum.Font.SourceSans
			Toggle.Text = " "
			Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
			Toggle.TextSize = 14.000

			ToggleCorner.CornerRadius = UDim.new(0, 3)
			ToggleCorner.Name = "ToggleCorner"
			ToggleCorner.Parent = Toggle

			ToggleText.Name = "ToggleText"
			ToggleText.Parent = Toggle
			ToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleText.BackgroundTransparency = 1.000
			ToggleText.Position = UDim2.new(0.0270858202, 0, 0.198850438, 0)
			ToggleText.Size = UDim2.new(0, 230, 0, 17)
			ToggleText.Font = Enum.Font.Gotham
			ToggleText.Text = Name or "Toggle"
			ToggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
			ToggleText.TextSize = 14.000
			ToggleText.TextXAlignment = Enum.TextXAlignment.Left

			ToggleImage.Name = "ToggleImage"
			ToggleImage.Parent = Toggle
			ToggleImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleImage.BackgroundTransparency = 1.000
			ToggleImage.Position = UDim2.new(0.911000013, 0, 0.137999997, 0)
			ToggleImage.Size = UDim2.new(0, 20, 0, 20)
			ToggleImage.Image = "http://www.roblox.com/asset/?id=6031068433"
		
			ToggleImage2.Name = "ToggleImage2"
			ToggleImage2.Parent = Toggle
			ToggleImage2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleImage2.BackgroundTransparency = 1.000
			ToggleImage2.ImageTransparency = 1
			ToggleImage2.Position = UDim2.new(0.911000013, 0, 0.137999997, 0)
			ToggleImage2.Size = UDim2.new(0, 20, 0, 20)
			ToggleImage2.Image = "http://www.roblox.com/asset/?id=6031068426"
			
			local State;
			Toggle.MouseButton1Down:Connect(function()
				State = not State
				Callback(State)
				if State then
					SmoothImageTransparency(ToggleImage2, {["Time"] = 0.15, ["ImageTransparency"] = 0})
				else
					SmoothImageTransparency(ToggleImage2, {["Time"] = 0.15, ["ImageTransparency"] = 1})
				end
			end)
		end
		function Library3:MakeTextBox(Name, Callback)
			local TextBox = Instance.new("TextButton")
			local TextBoxCorner = Instance.new("UICorner")
			local TextBoxText = Instance.new("TextLabel")
			local TextBoxImage = Instance.new("ImageLabel")
			local MainTextBox = Instance.new("TextBox")
			local MainTextBoxCorner = Instance.new("UICorner")
			
			TextBox.Name = "TextBox"
			TextBox.Parent = Tab
			TextBox.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
			TextBox.BorderSizePixel = 0
			TextBox.Size = UDim2.new(0, 270, 0, 29)
			TextBox.Font = Enum.Font.SourceSans
			TextBox.Text = " "
			TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
			TextBox.TextSize = 14.000

			TextBoxCorner.CornerRadius = UDim.new(0, 3)
			TextBoxCorner.Name = "TextBoxCorner"
			TextBoxCorner.Parent = TextBox

			TextBoxText.Name = "TextBoxText"
			TextBoxText.Parent = TextBox
			TextBoxText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextBoxText.BackgroundTransparency = 1.000
			TextBoxText.Position = UDim2.new(0.0270858202, 0, 0.198850438, 0)
			TextBoxText.Size = UDim2.new(0, 145, 0, 17)
			TextBoxText.Font = Enum.Font.Gotham
			TextBoxText.Text = Name or "Textbox"
			TextBoxText.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBoxText.TextSize = 14.000
			TextBoxText.TextXAlignment = Enum.TextXAlignment.Left

			TextBoxImage.Name = "TextBoxImage"
			TextBoxImage.Parent = TextBox
			TextBoxImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextBoxImage.BackgroundTransparency = 1.000
			TextBoxImage.Position = UDim2.new(0.911000013, 0, 0.137999997, 0)
			TextBoxImage.Size = UDim2.new(0, 20, 0, 20)
			TextBoxImage.Image = "http://www.roblox.com/asset/?id=6034818370"

			MainTextBox.Name = "MainTextBox"
			MainTextBox.Parent = TextBox
			MainTextBox.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
			MainTextBox.Position = UDim2.new(0.592629671, 0, 0.138000488, 0)
			MainTextBox.Size = UDim2.new(0, 80, 0, 20)
			MainTextBox.Font = Enum.Font.Gotham
			MainTextBox.PlaceholderText = "Input Here"
			MainTextBox.Text = ""
			MainTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
			MainTextBox.TextSize = 12.000

			MainTextBoxCorner.CornerRadius = UDim.new(0, 3)
			MainTextBoxCorner.Name = "MainTextBoxCorner"
			MainTextBoxCorner.Parent = MainTextBox
			
			MainTextBox.FocusLost:Connect(function(enterPressed)
				if enterPressed then
					if Callback then
						Callback(MainTextBox.Text)
					end
					MainTextBox.Text = ""
				end
			end)
		end
		return Library3
	end
	return Library2
end
return Library
