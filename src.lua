--[[

███████  ██████  ██       █████  ██████      ██      ██ ██████
██      ██    ██ ██      ██   ██ ██   ██     ██      ██ ██   ██
███████ ██    ██ ██      ███████ ██████      ██      ██ ██████
     ██ ██    ██ ██      ██   ██ ██   ██     ██      ██ ██   ██
███████  ██████  ███████ ██   ██ ██   ██     ███████ ██ ██████

Made by xurel, UI library for Solar Hub (discord.gg/solarhub)
Version: v1.0.0
Contains Assets (Not Code) from Rayfields UI Library: https://github.com/shlexware/Rayfield
Ignore shitty code, this was my first UI libary ive ever attempted, and I already know that there are some bad methods/pointless code in here.
]]

repeat task.wait() until game:IsLoaded() -- autoexec

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Par = game:GetService("CoreGui")

local Library = {}
local SelectedPage = nil
local LocalPlayer = Players.LocalPlayer

if RunService:IsStudio() then
	Par = LocalPlayer:WaitForChild("PlayerGui")
end

function MakeFolder(name)
	name = tostring(name)
	if RunService:IsStudio() or not makefolder or not isfolder then return end
	if isfolder(name) ~= true then
		makefolder(name)
	end
	return name
end

function MakeFile(name)
	name = tostring(name)
	if RunService:IsStudio() or not writefile or not isfile then return end
	if isfile(name) ~= true then
		writefile(name,"")
	end
	return name
end

function GetInfo(name)
	name = tostring(name)
	if RunService:IsStudio() or not readfile or not isfile then return end
	if isfile(name) ~= "true" and isfile(name) ~= true then return end
	local info = readfile(name)
	if info ~= nil then
		return info
	end
	return
end

function UpdateFile(name,info)
	name = tostring(name)
	if RunService:IsStudio() or not writefile then return end
	writefile(name,info)
end

local function AddRipple(parent, color, pos)
	parent.ClipsDescendants = true
	local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
	local G = Instance.new("Frame")
	G.BackgroundColor3 = color
	local B = Instance.new("UICorner")
	B.CornerRadius = UDim.new(1,0)
	B.Parent = G
	G.AnchorPoint = Vector2.new(0.5,0.5)
	if pos then
		G.Position = UDim2.new(0.5,0,0.5,0)
	else
		G.Position = UDim2.new(0,Mouse.X-parent.AbsolutePosition.X,0,Mouse.Y-parent.AbsolutePosition.Y)
	end
	G.Parent = parent
	local tween = TweenService:Create(G, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0,40,0,40), BackgroundTransparency = 1}):Play()
end


function Library:Validate(defaults, options)
	for i, v in pairs(defaults) do
		if options[i] == nil then
			options[i] = v
		end
	end
	return options
end

function Library:Create(options)
	if not options then options = {} end
	Library:Validate({
		Name = "Solar Library",
		GameName = game.PlaceId,
		SaveData = true
	}, options or {})

	local SaveFolder
	local UIName
	pcall(function()
		if options["SaveData"] == true then
			local SolarUiLibFolder = MakeFolder("Solar UI Library")
			if SolarUiLibFolder then
				local format = SolarUiLibFolder.."/"..options["Name"]
				local NameFolder = MakeFolder(format)
				if NameFolder then
					local format = NameFolder.."/"..options["GameName"]
					local ConfigFolder = MakeFolder(format)
					if ConfigFolder then SaveFolder = ConfigFolder end
				end
			end
		end
	end)

	local UI = {}

	-- StarterGui.Solar Library
	UI["1"] = Instance.new("ScreenGui", Par);
	UI["1"]["IgnoreGuiInset"] = true;
	UI["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
	UI["1"]["Name"] = [[Solar Library]];
	UI["1"]["ResetOnSpawn"] = false;

	-- StarterGui.Solar Library.Main
	UI["2"] = Instance.new("Frame", UI["1"]);
	UI["2"]["BorderSizePixel"] = 0;
	UI["2"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26);
	UI["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	UI["2"]["Size"] = UDim2.new(0, 575, 0, 375);
	UI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	UI["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
	UI["2"]["Name"] = [[Main]];

	-- StarterGui.Solar Library.Main.UICorner
	UI["3"] = Instance.new("UICorner", UI["2"]);
	UI["3"]["CornerRadius"] = UDim.new(0, 9);

	-- StarterGui.Solar Library.Main.OuterShadow
	UI["4"] = Instance.new("Frame", UI["2"]);
	UI["4"]["ZIndex"] = 0;
	UI["4"]["BorderSizePixel"] = 0;
	UI["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	UI["4"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	UI["4"]["BackgroundTransparency"] = 1;
	UI["4"]["Size"] = UDim2.new(1, 35, 1, 35);
	UI["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	UI["4"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
	UI["4"]["Name"] = [[OuterShadow]];

	-- StarterGui.Solar Library.Main.OuterShadow.ImageLabel
	UI["5"] = Instance.new("ImageLabel", UI["4"]);
	UI["5"]["ZIndex"] = -100;
	UI["5"]["BorderSizePixel"] = 0;
	UI["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	UI["5"]["ImageColor3"] = Color3.fromRGB(21, 21, 21);
	UI["5"]["ImageTransparency"] = 0.4000000059604645;
	UI["5"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	UI["5"]["Image"] = [[rbxassetid://5587865193]];
	UI["5"]["Size"] = UDim2.new(1.600000023841858, 0, 1.2999999523162842, 0);
	UI["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	UI["5"]["BackgroundTransparency"] = 1;
	UI["5"]["Position"] = UDim2.new(0.5074766278266907, 0, 0.5098039507865906, 0);

	-- StarterGui.Solar Library.Main.TopBar
	UI["6"] = Instance.new("Frame", UI["2"]);
	UI["6"]["BorderSizePixel"] = 0;
	UI["6"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
	UI["6"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	UI["6"]["Size"] = UDim2.new(1, 0, 0, 45);
	UI["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	UI["6"]["Position"] = UDim2.new(0.5, 0, 0.03999999910593033, 0);
	UI["6"]["Name"] = [[TopBar]];

	-- StarterGui.Solar Library.Main.TopBar.UICorner
	UI["7"] = Instance.new("UICorner", UI["6"]);
	UI["7"]["CornerRadius"] = UDim.new(0, 9);

	-- StarterGui.Solar Library.Main.TopBar.CornerRepair
	UI["8"] = Instance.new("Frame", UI["6"]);
	UI["8"]["BorderSizePixel"] = 0;
	UI["8"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
	UI["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	UI["8"]["Size"] = UDim2.new(1, 0, 0, 10);
	UI["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	UI["8"]["Position"] = UDim2.new(0.5, 0, 0.8899999856948853, 0);
	UI["8"]["Name"] = [[CornerRepair]];

	-- StarterGui.Solar Library.Main.TopBar.Divider
	UI["9"] = Instance.new("Frame", UI["6"]);
	UI["9"]["BorderSizePixel"] = 0;
	UI["9"]["BackgroundColor3"] = Color3.fromRGB(66, 66, 66);
	UI["9"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	UI["9"]["Size"] = UDim2.new(1, 0, 0, 1);
	UI["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	UI["9"]["Position"] = UDim2.new(0.5, 0, 1, 0);
	UI["9"]["Name"] = [[Divider]];

	-- StarterGui.Solar Library.Main.TopBar.Close
	UI["a"] = Instance.new("ImageButton", UI["6"]);
	UI["a"]["BorderSizePixel"] = 0;
	UI["a"]["ImageTransparency"] = 0.800000011920929;
	UI["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	UI["a"]["ImageColor3"] = Color3.fromRGB(241, 241, 241);
	UI["a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	UI["a"]["Image"] = [[http://www.roblox.com/asset/?id=10137832201]];
	UI["a"]["Size"] = UDim2.new(0, 24, 0, 24);
	UI["a"]["Name"] = [[Close]];
	UI["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	UI["a"]["Position"] = UDim2.new(0.9580000042915344, 0, 0.5, 0);
	UI["a"]["BackgroundTransparency"] = 1;

	-- StarterGui.Solar Library.Main.TopBar.Hide
	UI["b"] = Instance.new("ImageButton", UI["6"]);
	UI["b"]["BorderSizePixel"] = 0;
	UI["b"]["ImageTransparency"] = 0.800000011920929;
	UI["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	UI["b"]["ImageColor3"] = Color3.fromRGB(241, 241, 241);
	UI["b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	UI["b"]["Image"] = [[rbxassetid://10137941941]];
	UI["b"]["Size"] = UDim2.new(0, 24, 0, 24);
	UI["b"]["Name"] = [[Hide]];
	UI["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	UI["b"]["Position"] = UDim2.new(0.9079999923706055, 0, 0.5, 0);
	UI["b"]["BackgroundTransparency"] = 1;

	-- StarterGui.Solar Library.Main.TopBar.Title
	UI["c"] = Instance.new("TextLabel", UI["6"]);
	UI["c"]["TextWrapped"] = true;
	UI["c"]["BorderSizePixel"] = 0;
	UI["c"]["TextScaled"] = true;
	UI["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	UI["c"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	UI["c"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
	UI["c"]["TextSize"] = 14;
	UI["c"]["TextColor3"] = Color3.fromRGB(241, 241, 241);
	UI["c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	UI["c"]["Size"] = UDim2.new(0, 450, 0, 18);
	UI["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	UI["c"]["Text"] = [[Script Name]];
	UI["c"]["Name"] = [[Title]];
	UI["c"]["BackgroundTransparency"] = 1;
	UI["c"]["Position"] = UDim2.new(0.4300000071525574, 0, 0.5, 0);

	-- StarterGui.Solar Library.Main.TabBar
	UI["d"] = Instance.new("Frame", UI["2"]);
	UI["d"]["BorderSizePixel"] = 0;
	UI["d"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26);
	UI["d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	UI["d"]["Size"] = UDim2.new(0, 126, 0, 322);
	UI["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	UI["d"]["Position"] = UDim2.new(0.12099999934434891, 0, 0.550000011920929, 0);
	UI["d"]["Name"] = [[TabBar]];

	-- StarterGui.Solar Library.Main.TabBar.UICorner
	UI["e"] = Instance.new("UICorner", UI["d"]);

	-- StarterGui.Solar Library.Main.TabBar.UIStroke
	UI["f"] = Instance.new("UIStroke", UI["d"]);
	UI["f"]["Color"] = Color3.fromRGB(41, 41, 41);


	-- StarterGui.Solar Library.Main.TabBar.ScrollingFrame
	UI["10"] = Instance.new("ScrollingFrame", UI["d"]);
	UI["10"]["Active"] = true;
	UI["10"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
	UI["10"]["BorderSizePixel"] = 0;
	UI["10"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
	UI["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	UI["10"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	UI["10"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
	UI["10"]["BackgroundTransparency"] = 1;
	UI["10"]["Size"] = UDim2.new(1, -15, 0.9199596047401428, 0);
	UI["10"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
	UI["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	UI["10"]["ScrollBarThickness"] = 0;
	UI["10"]["Position"] = UDim2.new(0.5, 7, 0.5400202870368958, 0);

	-- StarterGui.Solar Library.Main.TabBar.ScrollingFrame.UIListLayout
	UI["11"] = Instance.new("UIListLayout", UI["10"]);
	UI["11"]["Padding"] = UDim.new(0, 1);
	UI["11"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

	-- StarterGui.Solar Library.Main.TabBar.Pages
	UI["17"] = Instance.new("TextLabel", UI["d"]);
	UI["17"]["BorderSizePixel"] = 0;
	UI["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	UI["17"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	UI["17"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
	UI["17"]["TextSize"] = 14;
	UI["17"]["TextColor3"] = Color3.fromRGB(221, 221, 221);
	UI["17"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	UI["17"]["Size"] = UDim2.new(0, 115, 0, 23);
	UI["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	UI["17"]["Text"] = [[Pages]];
	UI["17"]["Name"] = [[Pages]];
	UI["17"]["BackgroundTransparency"] = 1;
	UI["17"]["Position"] = UDim2.new(0.5419999957084656, 0, 0.054999999701976776, 0);


	-- StarterGui.Solar Library.Main.Tabs
	UI["18"] = Instance.new("Frame", UI["2"]);
	UI["18"]["BorderSizePixel"] = 0;
	UI["18"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26);
	UI["18"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	UI["18"]["Size"] = UDim2.new(0, 422, 0, 322);
	UI["18"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	UI["18"]["Position"] = UDim2.new(0.6179999709129333, 0, 0.550000011920929, 0);
	UI["18"]["Name"] = [[Tabs]];

	-- StarterGui.Solar Library.Main.Tabs.UICorner
	UI["19"] = Instance.new("UICorner", UI["18"]);

	-- StarterGui.Solar Library.Main.Tabs.UIStroke
	UI["1a"] = Instance.new("UIStroke", UI["18"]);
	UI["1a"]["Color"] = Color3.fromRGB(41, 41, 41);

	-- StarterGui.Solar Library.Main.Tabs.Fader
	UI["1b"] = Instance.new("Frame", UI["18"]);
	UI["1b"]["ZIndex"] = 2;
	UI["1b"]["BorderSizePixel"] = 0;
	UI["1b"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26);
	UI["1b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	UI["1b"]["BackgroundTransparency"] = 1;
	UI["1b"]["Size"] = UDim2.new(1, 0, 1, 0);
	UI["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	UI["1b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
	UI["1b"]["Name"] = [[Fader]];

	-- StarterGui.Solar Library.Main.Tabs.Fader.UICorner
	UI["1c"] = Instance.new("UICorner", UI["1b"]);

	-- StarterGui.Solar Library.Main.UIShadow
	UI["48"] = Instance.new("ImageLabel", UI["2"]);
	UI["48"]["BorderSizePixel"] = 0;
	UI["48"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	UI["48"]["ImageColor3"] = Color3.fromRGB(21, 21, 21);
	UI["48"]["ImageTransparency"] = 0.8500000238418579;
	UI["48"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	UI["48"]["Image"] = [[rbxassetid://3602733521]];
	UI["48"]["Size"] = UDim2.new(1, 2, 1, 2);
	UI["48"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	UI["48"]["Name"] = [[UIShadow]];
	UI["48"]["BackgroundTransparency"] = 1;
	UI["48"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

	-- StarterGui.Solar Library.Main.UIShadow.UICorner
	UI["49"] = Instance.new("UICorner", UI["48"]);
	UI["49"]["CornerRadius"] = UDim.new(0, 4);

	--// functionality and variables

	local frame = UI["2"]
	local Title = UI["c"]
	local Hide = UI["b"]
	local Close = UI["a"]
	local A = UI["1"]
	UIName = A

	if Par:FindFirstChild(options["Name"]) then
		if Par[options["Name"]] ~= A then
			Par[options["Name"]]:Destroy()
		end
	end

	Title.Text = options["Name"]
	A.Name = options["Name"]

	local dragToggle = nil
	local dragSpeed = 0.1
	local dragStart = nil
	local startPos = nil

	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end

	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)

	Hide.MouseEnter:Connect(function()
		TweenService:Create(Hide,TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
	end)

	Hide.MouseLeave:Connect(function()
		TweenService:Create(Hide,TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 0.8}):Play()
	end)
	Close.MouseEnter:Connect(function()
		TweenService:Create(Close,TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
	end)

	Close.MouseLeave:Connect(function()
		TweenService:Create(Close,TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 0.8}):Play()
	end)
	Hide.MouseButton1Down:Connect(function()
		UI["1"].Enabled = false
	end)
	Close.MouseButton1Down:Connect(function()
		UI["1"]:Destroy()
	end)

	function UI:CreatePage(options)
		if not options then options = {} end
		Library:Validate({
			Name = "A Page"
		}, options or {})

		local Page = {}

		Page["13"] = Instance.new("TextButton", UI["10"]);
		Page["13"]["TextWrapped"] = true;
		Page["13"]["BorderSizePixel"] = 0;
		Page["13"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		Page["13"]["TextTransparency"] = 0.6000000238418579;
		Page["13"]["TextScaled"] = true;
		Page["13"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Page["13"]["TextSize"] = 14;
		Page["13"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
		Page["13"]["TextColor3"] = Color3.fromRGB(221, 221, 221);
		Page["13"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		Page["13"]["Size"] = UDim2.new(1, 0, 0, 13);
		Page["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Page["13"]["Text"] = options["Name"];
		Page["13"]["BackgroundTransparency"] = 1;
		Page["13"]["Name"] = options["Name"]

		-- StarterGui.Solar Library.Main.Tabs.Tab Example
		Page["1d"] = Instance.new("Frame", UI["18"]);
		Page["1d"]["BorderSizePixel"] = 0;
		Page["1d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Page["1d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		Page["1d"]["BackgroundTransparency"] = 1;
		Page["1d"]["Size"] = UDim2.new(1, 0, 1, 0);
		Page["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Page["1d"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
		Page["1d"]["Name"] = options["Name"];

		-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame
		Page["1e"] = Instance.new("ScrollingFrame", Page["1d"]);
		Page["1e"]["Active"] = true;
		Page["1e"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
		Page["1e"]["BorderSizePixel"] = 0;
		Page["1e"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
		Page["1e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Page["1e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		Page["1e"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
		Page["1e"]["BackgroundTransparency"] = 1;
		Page["1e"]["Size"] = UDim2.new(1, 0, 1, 0);
		Page["1e"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
		Page["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Page["1e"]["ScrollBarThickness"] = 0;
		Page["1e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

		-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.UIListLayout
		Page["1f"] = Instance.new("UIListLayout", Page["1e"]);
		Page["1f"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
		Page["1f"]["Padding"] = UDim.new(0, 5);
		Page["1f"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

		-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.Placeholder
		Page["20"] = Instance.new("Frame", Page["1e"]);
		Page["20"]["BorderSizePixel"] = 0;
		Page["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Page["20"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		Page["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Page["20"]["Name"] = [[Placeholder]];

		--// functionality + variables
		local Button = Page["13"]
		local RealPage = Page["1d"]
		local Pages = UI["18"]
		local Fader = UI["1b"]

		if not SelectedPage or SelectedPage == nil then -- if there isnt a selected page then it will select the first one created
			SelectedPage = Button
			RealPage.Visible = true
			Button.TextTransparency = 0
		end

		for i, v in ipairs(Pages:GetChildren()) do -- further check to ensure that the page selected is the same one as the button selected as there isnt a wait
			if not v:IsA("Frame") or v.Name == "Fader" then continue end
			if SelectedPage and SelectedPage ~= nil then
				if v.Name ~= SelectedPage.Name then v.Visible = false end
			end
		end

		Button.MouseEnter:Connect(function()
			if SelectedPage == Button then return end
			TweenService:Create(Button, TweenInfo.new(0.6,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
		end)

		Button.MouseLeave:Connect(function()
			if SelectedPage == Button then return end
			TweenService:Create(Button, TweenInfo.new(0.6,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency = 0.6000000238418579}):Play()
		end)

		Button.MouseButton1Down:Connect(function()
			if SelectedPage == Button then return end
			if SelectedPage and SelectedPage ~= nil then
				TweenService:Create(SelectedPage, TweenInfo.new(0.6,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency = 0.6000000238418579}):Play()
			end
			SelectedPage = Button
			TweenService:Create(Button, TweenInfo.new(0.6,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
			local Tween = TweenService:Create(Fader, TweenInfo.new(0.6,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency = 0})
			Tween:Play()
			Tween.Completed:Wait()
			--task.wait(0.05)
			for i, v in ipairs(Pages:GetChildren()) do
				if not v:IsA("Frame") or v.Name == "Fader" then continue end
				v.Visible = false
			end
			repeat task.wait() until RealPage.Visible == false
			RealPage.Visible = true
			TweenService:Create(Fader, TweenInfo.new(0.6,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
		end)

		function Page:CreateButton(options)
			if not options then options = {} end
			Library:Validate({
				Name = 'A Button',
				Callback = function()

				end,
			},options or {})

			local Button = {}

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton
			Button["21"] = Instance.new("TextButton", Page["1e"]);
			Button["21"]["BorderSizePixel"] = 0;
			Button["21"]["AutoButtonColor"] = false;
			Button["21"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
			Button["21"]["TextSize"] = 14;
			Button["21"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			Button["21"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
			Button["21"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			Button["21"]["Size"] = UDim2.new(1, -10, 0, 35);
			Button["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Button["21"]["Text"] = [[]];
			Button["21"]["Name"] = options["Name"]

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.UICorner
			Button["22"] = Instance.new("UICorner", Button["21"]);
			Button["22"]["CornerRadius"] = UDim.new(0, 4);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.UIStroke
			Button["23"] = Instance.new("UIStroke", Button["21"]);
			Button["23"]["Color"] = Color3.fromRGB(50,50,50);
			Button["23"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Title
			Button["24"] = Instance.new("TextLabel", Button["21"]);
			Button["24"]["TextWrapped"] = true;
			Button["24"]["BorderSizePixel"] = 0;
			Button["24"]["TextScaled"] = true;
			Button["24"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Button["24"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Button["24"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			Button["24"]["TextSize"] = 14;
			Button["24"]["TextColor3"] = Color3.fromRGB(241, 241, 241);
			Button["24"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			Button["24"]["Size"] = UDim2.new(0, 315, 0, 14);
			Button["24"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Button["24"]["Text"] = options["Name"];
			Button["24"]["Name"] = [[Title]];
			Button["24"]["BackgroundTransparency"] = 1;
			Button["24"]["Position"] = UDim2.new(0.5, -33, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.ElementIndicator
			Button["25"] = Instance.new("TextLabel", Button["21"]);
			Button["25"]["TextWrapped"] = true;
			Button["25"]["BorderSizePixel"] = 0;
			Button["25"]["TextScaled"] = true;
			Button["25"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Button["25"]["TextXAlignment"] = Enum.TextXAlignment.Right;
			Button["25"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			Button["25"]["TextTransparency"] = 0.8999999761581421;
			Button["25"]["TextSize"] = 14;
			Button["25"]["TextColor3"] = Color3.fromRGB(241, 241, 241);
			Button["25"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			Button["25"]["Size"] = UDim2.new(0, 108, 0, 13);
			Button["25"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Button["25"]["Text"] = [[Button]];
			Button["25"]["Name"] = [[ElementIndicator]];
			Button["25"]["BackgroundTransparency"] = 1;
			Button["25"]["Position"] = UDim2.new(0.5, 140, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Shadow
			Button["26"] = Instance.new("ImageLabel", Button["21"]);
			Button["26"]["BorderSizePixel"] = 0;
			Button["26"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Button["26"]["ImageColor3"] = Color3.fromRGB(21, 21, 21);
			Button["26"]["ImageTransparency"] = 0.800000011920929;
			Button["26"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			Button["26"]["Image"] = [[rbxassetid://3602733521]];
			Button["26"]["Size"] = UDim2.new(1, 2, 1, 2);
			Button["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Button["26"]["Name"] = [[Shadow]];
			Button["26"]["BackgroundTransparency"] = 1;
			Button["26"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Shadow.UICorner
			Button["27"] = Instance.new("UICorner", Button["26"]);
			Button["27"]["CornerRadius"] = UDim.new(0, 4);

			--// functionality + variables

			local RealButton = Button["21"]
			local ElementIndicator = Button["25"]

			RealButton.MouseEnter:Connect(function()
				TweenService:Create(RealButton, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(40,40,40)}):Play()
				TweenService:Create(ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 0.7}):Play()
			end)

			RealButton.MouseLeave:Connect(function()
				TweenService:Create(RealButton, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(35,35,35)}):Play()
				TweenService:Create(ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 0.9}):Play()
			end)

			RealButton.MouseButton1Down:Connect(function()
				AddRipple(RealButton,Color3.fromRGB(255,255,255))
				coroutine.wrap(function()
					local succ, err = pcall(options["Callback"])
					if err then
						print("(SOLAR LIBRARY) CAUGHT ERROR: "..err)
					end
				end)()

			end)
		end

		function Page:CreateToggle(options)
			if not options then options = {} end
			Library:Validate({
				Name = 'A Toggle',
				Callback = function()

				end,
				CallbackEnd = function()

				end,
				Flag = nil
			},options or {})

			local ToggleParts = {}

			ToggleParts["28"] = Instance.new("TextButton", Page["1e"]);
			ToggleParts["28"]["BorderSizePixel"] = 0;
			ToggleParts["28"]["AutoButtonColor"] = false;
			ToggleParts["28"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
			ToggleParts["28"]["TextSize"] = 14;
			ToggleParts["28"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			ToggleParts["28"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
			ToggleParts["28"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			ToggleParts["28"]["Size"] = UDim2.new(1, -10, 0, 40);
			ToggleParts["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			ToggleParts["28"]["Text"] = [[]];

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.UICorner
			ToggleParts["29"] = Instance.new("UICorner", ToggleParts["28"]);
			ToggleParts["29"]["CornerRadius"] = UDim.new(0, 4);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.UIStroke
			ToggleParts["2a"] = Instance.new("UIStroke", ToggleParts["28"]);
			ToggleParts["2a"]["Color"] = Color3.fromRGB(51, 51, 51);
			ToggleParts["2a"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Title
			ToggleParts["2b"] = Instance.new("TextLabel", ToggleParts["28"]);
			ToggleParts["2b"]["TextWrapped"] = true;
			ToggleParts["2b"]["BorderSizePixel"] = 0;
			ToggleParts["2b"]["TextScaled"] = true;
			ToggleParts["2b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			ToggleParts["2b"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			ToggleParts["2b"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			ToggleParts["2b"]["TextSize"] = 14;
			ToggleParts["2b"]["TextColor3"] = Color3.fromRGB(241, 241, 241);
			ToggleParts["2b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			ToggleParts["2b"]["Size"] = UDim2.new(0, 315, 0, 14);
			ToggleParts["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			ToggleParts["2b"]["Text"] = [[A Toggle]];
			ToggleParts["2b"]["Name"] = [[Title]];
			ToggleParts["2b"]["BackgroundTransparency"] = 1;
			ToggleParts["2b"]["Position"] = UDim2.new(0.5, -33, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Frame
			ToggleParts["2c"] = Instance.new("Frame", ToggleParts["28"]);
			ToggleParts["2c"]["BorderSizePixel"] = 0;
			ToggleParts["2c"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
			ToggleParts["2c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			ToggleParts["2c"]["Size"] = UDim2.new(0, 44, 0, 21);
			ToggleParts["2c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			ToggleParts["2c"]["Position"] = UDim2.new(0.5019999742507935, 172, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Frame.UICorner
			ToggleParts["2d"] = Instance.new("UICorner", ToggleParts["2c"]);
			ToggleParts["2d"]["CornerRadius"] = UDim.new(0, 15);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Frame.UIStroke
			ToggleParts["2e"] = Instance.new("UIStroke", ToggleParts["2c"]);
			ToggleParts["2e"]["Color"] = Color3.fromRGB(66, 66, 66);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Frame.Frame
			ToggleParts["2f"] = Instance.new("Frame", ToggleParts["2c"]);
			ToggleParts["2f"]["BorderSizePixel"] = 0;
			ToggleParts["2f"]["BackgroundColor3"] = Color3.fromRGB(101, 101, 101);
			ToggleParts["2f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			ToggleParts["2f"]["Size"] = UDim2.new(0, 17, 0, 17);
			ToggleParts["2f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			ToggleParts["2f"]["Position"] = UDim2.new(0.5, -11, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Frame.Frame.UIStroke
			ToggleParts["30"] = Instance.new("UIStroke", ToggleParts["2f"]);
			ToggleParts["30"]["Color"] = Color3.fromRGB(126, 126, 126);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Frame.Frame.UICorner
			ToggleParts["31"] = Instance.new("UICorner", ToggleParts["2f"]);
			ToggleParts["31"]["CornerRadius"] = UDim.new(1, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Frame.Shadow
			ToggleParts["32"] = Instance.new("ImageLabel", ToggleParts["2c"]);
			ToggleParts["32"]["BorderSizePixel"] = 0;
			ToggleParts["32"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			ToggleParts["32"]["ImageColor3"] = Color3.fromRGB(21, 21, 21);
			ToggleParts["32"]["ImageTransparency"] = 0.6000000238418579;
			ToggleParts["32"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			ToggleParts["32"]["Image"] = [[rbxassetid://3602733521]];
			ToggleParts["32"]["Size"] = UDim2.new(1, 2, 1, 2);
			ToggleParts["32"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			ToggleParts["32"]["Name"] = [[Shadow]];
			ToggleParts["32"]["BackgroundTransparency"] = 1;
			ToggleParts["32"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Frame.Shadow.UICorner
			ToggleParts["33"] = Instance.new("UICorner", ToggleParts["32"]);
			ToggleParts["33"]["CornerRadius"] = UDim.new(0, 15);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Shadow
			ToggleParts["34"] = Instance.new("ImageLabel", ToggleParts["28"]);
			ToggleParts["34"]["BorderSizePixel"] = 0;
			ToggleParts["34"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			ToggleParts["34"]["ImageColor3"] = Color3.fromRGB(21, 21, 21);
			ToggleParts["34"]["ImageTransparency"] = 0.800000011920929;
			ToggleParts["34"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			ToggleParts["34"]["Image"] = [[rbxassetid://3602733521]];
			ToggleParts["34"]["Size"] = UDim2.new(1, 2, 1, 2);
			ToggleParts["34"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			ToggleParts["34"]["Name"] = [[Shadow]];
			ToggleParts["34"]["BackgroundTransparency"] = 1;
			ToggleParts["34"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Shadow.UICorner
			ToggleParts["35"] = Instance.new("UICorner", ToggleParts["34"]);
			ToggleParts["35"]["CornerRadius"] = UDim.new(0, 4);

			--// functionality + variables

			local ToggleButton = ToggleParts["28"]
			local ToggleCircle = ToggleParts["2f"]
			local ToggleCircleStroke = ToggleParts["30"]
			local Title = ToggleParts["2b"]

			Title.Text = options["Name"]

			local Enabled = false
			local Debounce = false
			local ScriptDebounce = false
			local WaitingForEnd = false

			local Flag
			if options["Flag"] and tostring(options["Flag"]) ~= nil then
				Flag = options["Flag"]
			else
				Flag = options["Name"]
			end

			ToggleButton.MouseEnter:Connect(function()
				TweenService:Create(ToggleButton, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(40,40,40)}):Play()
			end)

			ToggleButton.MouseLeave:Connect(function()
				TweenService:Create(ToggleButton, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(35,35,35)}):Play()
			end)

			ToggleButton.MouseButton1Down:Connect(function()
				AddRipple(ToggleButton,Color3.fromRGB(255,255,255))
				if Debounce == true then return end
				--Debounce = true
				if Enabled == false then
					Enabled = true
					pcall(function()
						UpdateFile(SaveFolder.."/"..Flag,"true")
					end)
					TweenService:Create(ToggleCircleStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),{Color = Color3.fromRGB(0, 170, 255)}):Play()
					TweenService:Create(ToggleCircle, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0, 146, 214)}):Play()
					TweenService:Create(ToggleCircle, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 12,0.5, 0)}):Play()
				else
					Enabled = false
					pcall(function()
						UpdateFile(SaveFolder.."/"..Flag,"")
					end)
					TweenService:Create(ToggleCircleStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),{Color = Color3.fromRGB(125, 125, 125)}):Play()
					TweenService:Create(ToggleCircle, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(100, 100, 100)}):Play()
					TweenService:Create(ToggleCircle, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -11,0.5, 0)}):Play()
				end
				coroutine.wrap(function()
					local Tween = TweenService:Create(ToggleCircle, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0,15,0,15)})
					Tween:Play()
					Tween.Completed:Wait()
					local Tween = TweenService:Create(ToggleCircle, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)})
					Tween:Play()
					Tween.Completed:Wait()
					Debounce = false
					if Enabled == false then
						return
					end
				end)()
				repeat RunService.RenderStepped:Wait()
					coroutine.wrap(function()
						if ScriptDebounce == true then return end
						ScriptDebounce = true
						local succ, err = pcall(options["Callback"])
						if err then
							print("(SOLAR LIBRARY) CAUGHT ERROR: "..err)
							Enabled = false
							local Tween = TweenService:Create(ToggleCircle, TweenInfo.new(0.24, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0,15,0,15)})
							Tween:Play()
							Tween.Completed:Wait()
							local Tween = TweenService:Create(ToggleCircle, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)})
							Tween:Play()
						end
						ScriptDebounce = false
					end)()
				until Enabled ~= true or not Page["1e"]:FindFirstChild(ToggleButton.Name)
				if WaitingForEnd == true then return end -- make sure its not yielding for script to end already
				WaitingForEnd = true
				if ScriptDebounce == true then
					repeat task.wait() until ScriptDebounce ~= true -- ensure that script has ended when calling the end script
				end
				coroutine.wrap(function()
					local succ, err = pcall(options["CallbackEnd"])
					if err then
						print("(SOLAR LIBRARY) CAUGHT ERROR: "..err)
					end
					WaitingForEnd = false
				end)()

			end)

			if SaveFolder ~= nil then
				coroutine.wrap(function()
					local info = GetInfo(SaveFolder.."/"..Flag)
					if info == true or info == "true" then
						Enabled = true
						TweenService:Create(ToggleCircleStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),{Color = Color3.fromRGB(0, 170, 255)}):Play()
						TweenService:Create(ToggleCircle, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0, 146, 214)}):Play()
						TweenService:Create(ToggleCircle, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 12,0.5, 0)}):Play()

						coroutine.wrap(function()
							local Tween = TweenService:Create(ToggleCircle, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0,15,0,15)})
							Tween:Play()
							Tween.Completed:Wait()
							local Tween = TweenService:Create(ToggleCircle, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)})
							Tween:Play()
							Tween.Completed:Wait()
							Debounce = false
							if Enabled == false then
								return
							end
						end)()

						repeat RunService.RenderStepped:Wait()
							coroutine.wrap(function()
								if ScriptDebounce == true then return end
								ScriptDebounce = true
								local succ, err = pcall(options["Callback"])
								if err then
									print("(SOLAR LIBRARY) CAUGHT ERROR: "..err)
									Enabled = false
									local Tween = TweenService:Create(ToggleCircle, TweenInfo.new(0.24, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0,15,0,15)})
									Tween:Play()
									Tween.Completed:Wait()
									local Tween = TweenService:Create(ToggleCircle, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)})
									Tween:Play()
								end
								ScriptDebounce = false
							end)()
						until Enabled ~= true or not Page["1e"]:FindFirstChild(ToggleButton.Name)
						if WaitingForEnd == true then return end -- make sure its not yielding for script to end already
						WaitingForEnd = true
						if ScriptDebounce == true then
							repeat task.wait() until ScriptDebounce ~= true -- ensure that script has ended when calling the end script
						end
						coroutine.wrap(function()
							local succ, err = pcall(options["CallbackEnd"])
							if err then
								print("(SOLAR LIBRARY) CAUGHT ERROR: "..err)
							end
							WaitingForEnd = false
						end)()
					end
				end)()
			end
		end

		function Page:CreateInputButton(options)
			if not options then options = {} end
			Library:Validate({
				Name = "An Input Box",
				Callback = function()

				end,
				InputType = nil,
				MaxNumber = nil,
				MinNumber = nil,
				PlaceholderText = "Input Placeholder",
				Flag = nil
			},options or {})

			local PageParts = {}

			PageParts["36"] = Instance.new("TextButton", Page["1e"]);
			PageParts["36"]["BorderSizePixel"] = 0;
			PageParts["36"]["AutoButtonColor"] = false;
			PageParts["36"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
			PageParts["36"]["TextSize"] = 14;
			PageParts["36"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			PageParts["36"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
			PageParts["36"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			PageParts["36"]["Size"] = UDim2.new(1, -10, 0, 40);
			PageParts["36"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			PageParts["36"]["Text"] = [[]];

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.UICorner
			PageParts["37"] = Instance.new("UICorner", PageParts["36"]);
			PageParts["37"]["CornerRadius"] = UDim.new(0, 4);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.UIStroke
			PageParts["38"] = Instance.new("UIStroke", PageParts["36"]);
			PageParts["38"]["Color"] = Color3.fromRGB(51, 51, 51);
			PageParts["38"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Title
			PageParts["39"] = Instance.new("TextLabel", PageParts["36"]);
			PageParts["39"]["TextWrapped"] = true;
			PageParts["39"]["BorderSizePixel"] = 0;
			PageParts["39"]["TextScaled"] = true;
			PageParts["39"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			PageParts["39"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			PageParts["39"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			PageParts["39"]["TextSize"] = 14;
			PageParts["39"]["TextColor3"] = Color3.fromRGB(241, 241, 241);
			PageParts["39"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			PageParts["39"]["Size"] = UDim2.new(0, 240,0, 14);
			PageParts["39"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			PageParts["39"]["Text"] = [[A Input Button]];
			PageParts["39"]["Name"] = [[Title]];
			PageParts["39"]["BackgroundTransparency"] = 1;
			PageParts["39"]["Position"] = UDim2.new(0.58, -103,0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Shadow
			PageParts["3a"] = Instance.new("ImageLabel", PageParts["36"]);
			PageParts["3a"]["BorderSizePixel"] = 0;
			PageParts["3a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			PageParts["3a"]["ImageColor3"] = Color3.fromRGB(21, 21, 21);
			PageParts["3a"]["ImageTransparency"] = 0.800000011920929;
			PageParts["3a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			PageParts["3a"]["Image"] = [[rbxassetid://3602733521]];
			PageParts["3a"]["Size"] = UDim2.new(1, 2, 1, 2);
			PageParts["3a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			PageParts["3a"]["Name"] = [[Shadow]];
			PageParts["3a"]["BackgroundTransparency"] = 1;
			PageParts["3a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Shadow.UICorner
			PageParts["3b"] = Instance.new("UICorner", PageParts["3a"]);
			PageParts["3b"]["CornerRadius"] = UDim.new(0, 4);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.TextBox
			PageParts["3c"] = Instance.new("TextBox", PageParts["36"]);
			PageParts["3c"]["CursorPosition"] = -1;
			PageParts["3c"]["PlaceholderColor3"] = Color3.fromRGB(179, 179, 179);
			PageParts["3c"]["BorderSizePixel"] = 0;
			PageParts["3c"]["TextSize"] = 14;
			PageParts["3c"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
			PageParts["3c"]["TextColor3"] = Color3.fromRGB(241, 241, 241);
			PageParts["3c"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			PageParts["3c"]["AnchorPoint"] = Vector2.new(1, 0.5);
			PageParts["3c"]["PlaceholderText"] = [[Input Placeholder]];
			PageParts["3c"]["Size"] = UDim2.new(0, 141, 0, 30);
			PageParts["3c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			PageParts["3c"]["Text"] = [[]];
			PageParts["3c"]["Position"] = UDim2.new(1, -7, 0, 20);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.TextBox.UICorner
			PageParts["3d"] = Instance.new("UICorner", PageParts["3c"]);
			PageParts["3d"]["CornerRadius"] = UDim.new(0, 5);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.TextBox.UIStroke
			PageParts["3e"] = Instance.new("UIStroke", PageParts["3c"]);
			PageParts["3e"]["Color"] = Color3.fromRGB(66, 66, 66);
			PageParts["3e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.TextBox.Shadow
			PageParts["3f"] = Instance.new("ImageLabel", PageParts["3c"]);
			PageParts["3f"]["BorderSizePixel"] = 0;
			PageParts["3f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			PageParts["3f"]["ImageColor3"] = Color3.fromRGB(21, 21, 21);
			PageParts["3f"]["ImageTransparency"] = 0.800000011920929;
			PageParts["3f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			PageParts["3f"]["Image"] = [[rbxassetid://3602733521]];
			PageParts["3f"]["Size"] = UDim2.new(1, 2, 1, 2);
			PageParts["3f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			PageParts["3f"]["Name"] = [[Shadow]];
			PageParts["3f"]["BackgroundTransparency"] = 1;
			PageParts["3f"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.TextBox.Shadow.UICorner
			PageParts["40"] = Instance.new("UICorner", PageParts["3f"]);
			PageParts["40"]["CornerRadius"] = UDim.new(0, 5);

			--// functionality + variables

			local Flag
			if options["Flag"] and tostring(options["Flag"]) ~= nil then
				Flag = options["Flag"]
			else
				Flag = options["Name"]
			end

			local InputButton = PageParts["36"]
			local Title = PageParts["39"]
			local InputBox = PageParts["3c"]

			Title.Text = options["Name"]
			InputBox.PlaceholderText = options["PlaceholderText"]
			InputBox.Size = UDim2.new(0, InputBox.TextBounds.X + 24, 0, 30)

			if SaveFolder ~= nil then
				local info = GetInfo(SaveFolder.."/"..Flag)
				if info then
					InputBox.Text = info
					InputBox.Size = UDim2.new(0, InputBox.TextBounds.X + 24, 0, 30)
				end
			end

			InputButton.MouseEnter:Connect(function()
				TweenService:Create(InputButton, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(40,40,40)}):Play()
			end)

			InputButton.MouseLeave:Connect(function()
				TweenService:Create(InputButton, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(35,35,35)}):Play()
			end)

			InputBox:GetPropertyChangedSignal("Text"):Connect(function()
				TweenService:Create(InputBox, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, InputBox.TextBounds.X + 24, 0, 30)}):Play()
				pcall(function()
					UpdateFile(SaveFolder.."/"..Flag,InputBox.Text)
				end)
			end)



			InputButton.MouseButton1Down:Connect(function()
				AddRipple(InputButton,Color3.fromRGB(255,255,255))
				coroutine.wrap(function()
					local succ, err = pcall(options["Callback"])
					if err then
						print("(SOLAR LIBRARY) CAUGHT ERROR: "..err)
					end
				end)()

			end)


			function PageParts:GetInput()
				if InputBox.Text == nil or not InputBox.Text or InputBox.Text == "" then
					return
				end
				if options["InputType"] and options["InputType"] ~= nil then
					local Type = options["InputType"]:lower()
					if string.find(Type, "number") then
						local NumberToReturn

						local a = InputBox.Text:gsub("%D","")
						if string.find(InputBox.Text:sub(1,1),"-") then
							a = -a
						end
						local Num = tonumber(a)

						if options["MaxNumber"] and options["MaxNumber"] ~= nil and tonumber(options["MaxNumber"]) ~= nil then
							if Num >= options["MaxNumber"] then
								Num = tonumber(options["MaxNumber"])
							end
						end
						if options["MinNumber"] and options["MinNumber"] ~= nil and tonumber(options["MinNumber"]) ~= nil then
							if Num <= options["MinNumber"] then
								Num = tonumber(options["MinNumber"])
							end
						end
						if options["MinNumber"] and options["MinNumber"] ~= nil and tonumber(options["MinNumber"]) ~= nil and options["MaxNumber"] and options["MaxNumber"] ~= nil and tonumber(options["MaxNumber"]) ~= nil then
							if options["MinNumber"] >= options["MaxNumber"] then
								NumberToReturn = tonumber(a)
							end
						end

						NumberToReturn = Num
						return NumberToReturn
					end
				end
				return InputBox.Text
			end

			return PageParts
		end

		function Page:CreateLabel(options)
			if not options then options = {} end
			Library:Validate({
				Text = "A Label"
			}, options or {})



			local LabelParts = {}

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.Label
			LabelParts["5f"] = Instance.new("Frame", Page["1e"]);
			LabelParts["5f"]["BorderSizePixel"] = 0;
			LabelParts["5f"]["BackgroundColor3"] = Color3.fromRGB(44, 106, 160);
			LabelParts["5f"]["Size"] = UDim2.new(1, -10, 0, 35);
			LabelParts["5f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			LabelParts["5f"]["Name"] = [[Label]];

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.Label.UIStroke
			LabelParts["60"] = Instance.new("UIStroke", LabelParts["5f"]);
			LabelParts["60"]["Color"] = Color3.fromRGB(63, 159, 232);
			LabelParts["60"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.Label.UICorner
			LabelParts["61"] = Instance.new("UICorner", LabelParts["5f"]);
			LabelParts["61"]["CornerRadius"] = UDim.new(0, 4);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.Label.Title
			LabelParts["62"] = Instance.new("TextLabel", LabelParts["5f"]);
			LabelParts["62"]["TextWrapped"] = true;
			LabelParts["62"]["BorderSizePixel"] = 0;
			LabelParts["62"]["TextScaled"] = true;
			LabelParts["62"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			LabelParts["62"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			LabelParts["62"]["TextSize"] = 14;
			LabelParts["62"]["TextColor3"] = Color3.fromRGB(241, 241, 241);
			LabelParts["62"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			LabelParts["62"]["Size"] = UDim2.new(1, 0, 0, 16);
			LabelParts["62"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			LabelParts["62"]["Text"] = [[A Title]];
			LabelParts["62"]["Name"] = [[Title]];
			LabelParts["62"]["BackgroundTransparency"] = 1;
			LabelParts["62"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.Label.Shadow
			LabelParts["63"] = Instance.new("ImageLabel", LabelParts["5f"]);
			LabelParts["63"]["BorderSizePixel"] = 0;
			LabelParts["63"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			LabelParts["63"]["ImageColor3"] = Color3.fromRGB(21, 21, 21);
			LabelParts["63"]["ImageTransparency"] = 0.800000011920929;
			LabelParts["63"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			LabelParts["63"]["Image"] = [[rbxassetid://3602733521]];
			LabelParts["63"]["Size"] = UDim2.new(1, 2, 1, 2);
			LabelParts["63"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			LabelParts["63"]["Name"] = [[Shadow]];
			LabelParts["63"]["BackgroundTransparency"] = 1;
			LabelParts["63"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.Label.Shadow.UICorner
			LabelParts["64"] = Instance.new("UICorner", LabelParts["63"]);
			LabelParts["64"]["CornerRadius"] = UDim.new(0, 4);

			--// functionality + variables

			local Label = LabelParts["5f"]
			local Title = LabelParts["62"]

			Title.Text = options["Text"]

			Label.MouseEnter:Connect(function()
				TweenService:Create(Label, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(53,115,169)}):Play()
			end)

			Label.MouseLeave:Connect(function()
				TweenService:Create(Label, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(43,105,159)}):Play()
			end)
		end

		function Page:CreateHeader(options)
			if not options then options = {} end
			Library:Validate({
				Text = "A Header"
			}, options or {})

			local HeaderParts = {}

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.Header
			HeaderParts["65"] = Instance.new("Frame", Page["1e"]);
			HeaderParts["65"]["BorderSizePixel"] = 0;
			HeaderParts["65"]["BackgroundColor3"] = Color3.fromRGB(44, 106, 160);
			HeaderParts["65"]["Size"] = UDim2.new(1, -10, 0, 35);
			HeaderParts["65"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			HeaderParts["65"]["Name"] = [[Header]];

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.Header.UIStroke
			HeaderParts["66"] = Instance.new("UIStroke", HeaderParts["65"]);
			HeaderParts["66"]["Color"] = Color3.fromRGB(63, 159, 232);
			HeaderParts["66"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.Header.UICorner
			HeaderParts["67"] = Instance.new("UICorner", HeaderParts["65"]);
			HeaderParts["67"]["CornerRadius"] = UDim.new(0, 4);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.Header.Shadow
			HeaderParts["68"] = Instance.new("ImageLabel", HeaderParts["65"]);
			HeaderParts["68"]["BorderSizePixel"] = 0;
			HeaderParts["68"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			HeaderParts["68"]["ImageColor3"] = Color3.fromRGB(21, 21, 21);
			HeaderParts["68"]["ImageTransparency"] = 0.800000011920929;
			HeaderParts["68"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			HeaderParts["68"]["Image"] = [[rbxassetid://3602733521]];
			HeaderParts["68"]["Size"] = UDim2.new(1, 2, 1, 2);
			HeaderParts["68"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			HeaderParts["68"]["Name"] = [[Shadow]];
			HeaderParts["68"]["BackgroundTransparency"] = 1;
			HeaderParts["68"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.Header.Shadow.UICorner
			HeaderParts["69"] = Instance.new("UICorner", HeaderParts["68"]);
			HeaderParts["69"]["CornerRadius"] = UDim.new(0, 4);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.Header.Title
			HeaderParts["6a"] = Instance.new("TextLabel", HeaderParts["65"]);
			HeaderParts["6a"]["TextWrapped"] = true;
			HeaderParts["6a"]["BorderSizePixel"] = 0;
			HeaderParts["6a"]["TextScaled"] = true;
			HeaderParts["6a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			HeaderParts["6a"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			HeaderParts["6a"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			HeaderParts["6a"]["TextSize"] = 14;
			HeaderParts["6a"]["TextColor3"] = Color3.fromRGB(241, 241, 241);
			HeaderParts["6a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			HeaderParts["6a"]["Size"] = UDim2.new(0, 396, 0, 16);
			HeaderParts["6a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			HeaderParts["6a"]["Text"] = [[A Header]];
			HeaderParts["6a"]["Name"] = [[Title]];
			HeaderParts["6a"]["BackgroundTransparency"] = 1;
			HeaderParts["6a"]["Position"] = UDim2.new(0.5989077687263489, -33, 0.5, 0);

			--// functionality + variables

			local Header = HeaderParts["65"]
			local Title = HeaderParts["6a"]

			Title.Text = options["Text"]

			Header.MouseEnter:Connect(function()
				TweenService:Create(Header, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(53,115,169)}):Play()
			end)

			Header.MouseLeave:Connect(function()
				TweenService:Create(Header, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(43,105,159)}):Play()
			end)
		end

		function Page:CreateInputToggle(options)
			if not options then options = {} end
			Library:Validate({
				Name = "An Input Toggle",
				Callback = function()

				end,
				CallbackEnd = function()

				end,
				InputType = nil,
				MaxNumber = nil,
				MinNumber = nil,
				PlaceholderText = "Input Placeholder",
				Flag = nil
			}, options or {})

			local InputToggleParts = {}

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton
			InputToggleParts["4c"] = Instance.new("TextButton", Page["1e"]);
			InputToggleParts["4c"]["BorderSizePixel"] = 0;
			InputToggleParts["4c"]["AutoButtonColor"] = false;
			InputToggleParts["4c"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
			InputToggleParts["4c"]["TextSize"] = 14;
			InputToggleParts["4c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			InputToggleParts["4c"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
			InputToggleParts["4c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			InputToggleParts["4c"]["Size"] = UDim2.new(1, -10, 0, 40);
			InputToggleParts["4c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			InputToggleParts["4c"]["Text"] = [[]];

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.UICorner
			InputToggleParts["4d"] = Instance.new("UICorner", InputToggleParts["4c"]);
			InputToggleParts["4d"]["CornerRadius"] = UDim.new(0, 4);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.UIStroke
			InputToggleParts["4e"] = Instance.new("UIStroke", InputToggleParts["4c"]);
			InputToggleParts["4e"]["Color"] = Color3.fromRGB(51, 51, 51);
			InputToggleParts["4e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Title
			InputToggleParts["4f"] = Instance.new("TextLabel", InputToggleParts["4c"]);
			InputToggleParts["4f"]["TextWrapped"] = true;
			InputToggleParts["4f"]["BorderSizePixel"] = 0;
			InputToggleParts["4f"]["TextScaled"] = true;
			InputToggleParts["4f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			InputToggleParts["4f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			InputToggleParts["4f"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			InputToggleParts["4f"]["TextSize"] = 14;
			InputToggleParts["4f"]["TextColor3"] = Color3.fromRGB(241, 241, 241);
			InputToggleParts["4f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			InputToggleParts["4f"]["Size"] = UDim2.new(0, 180, 0, 14);
			InputToggleParts["4f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			InputToggleParts["4f"]["Text"] = [[A Input Toggle]];
			InputToggleParts["4f"]["Name"] = [[Title]];
			InputToggleParts["4f"]["BackgroundTransparency"] = 1;
			InputToggleParts["4f"]["Position"] = UDim2.new(0.5072815418243408, -103, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Frame
			InputToggleParts["50"] = Instance.new("Frame", InputToggleParts["4c"]);
			InputToggleParts["50"]["BorderSizePixel"] = 0;
			InputToggleParts["50"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
			InputToggleParts["50"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			InputToggleParts["50"]["Size"] = UDim2.new(0, 44, 0, 21);
			InputToggleParts["50"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			InputToggleParts["50"]["Position"] = UDim2.new(0.5019999742507935, 172, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Frame.UICorner
			InputToggleParts["51"] = Instance.new("UICorner", InputToggleParts["50"]);
			InputToggleParts["51"]["CornerRadius"] = UDim.new(0, 15);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Frame.UIStroke
			InputToggleParts["52"] = Instance.new("UIStroke", InputToggleParts["50"]);
			InputToggleParts["52"]["Color"] = Color3.fromRGB(66, 66, 66);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Frame.Frame
			InputToggleParts["53"] = Instance.new("Frame", InputToggleParts["50"]);
			InputToggleParts["53"]["BorderSizePixel"] = 0;
			InputToggleParts["53"]["BackgroundColor3"] = Color3.fromRGB(101, 101, 101);
			InputToggleParts["53"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			InputToggleParts["53"]["Size"] = UDim2.new(0, 17, 0, 17);
			InputToggleParts["53"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			InputToggleParts["53"]["Position"] = UDim2.new(0.5, -11, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Frame.Frame.UIStroke
			InputToggleParts["54"] = Instance.new("UIStroke", InputToggleParts["53"]);
			InputToggleParts["54"]["Color"] = Color3.fromRGB(126, 126, 126);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Frame.Frame.UICorner
			InputToggleParts["55"] = Instance.new("UICorner", InputToggleParts["53"]);
			InputToggleParts["55"]["CornerRadius"] = UDim.new(1, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Frame.Shadow
			InputToggleParts["56"] = Instance.new("ImageLabel", InputToggleParts["50"]);
			InputToggleParts["56"]["BorderSizePixel"] = 0;
			InputToggleParts["56"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			InputToggleParts["56"]["ImageColor3"] = Color3.fromRGB(21, 21, 21);
			InputToggleParts["56"]["ImageTransparency"] = 0.6000000238418579;
			InputToggleParts["56"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			InputToggleParts["56"]["Image"] = [[rbxassetid://3602733521]];
			InputToggleParts["56"]["Size"] = UDim2.new(1, 2, 1, 2);
			InputToggleParts["56"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			InputToggleParts["56"]["Name"] = [[Shadow]];
			InputToggleParts["56"]["BackgroundTransparency"] = 1;
			InputToggleParts["56"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Frame.Shadow.UICorner
			InputToggleParts["57"] = Instance.new("UICorner", InputToggleParts["56"]);
			InputToggleParts["57"]["CornerRadius"] = UDim.new(0, 15);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Shadow
			InputToggleParts["58"] = Instance.new("ImageLabel", InputToggleParts["4c"]);
			InputToggleParts["58"]["BorderSizePixel"] = 0;
			InputToggleParts["58"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			InputToggleParts["58"]["ImageColor3"] = Color3.fromRGB(21, 21, 21);
			InputToggleParts["58"]["ImageTransparency"] = 0.800000011920929;
			InputToggleParts["58"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			InputToggleParts["58"]["Image"] = [[rbxassetid://3602733521]];
			InputToggleParts["58"]["Size"] = UDim2.new(1, 2, 1, 2);
			InputToggleParts["58"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			InputToggleParts["58"]["Name"] = [[Shadow]];
			InputToggleParts["58"]["BackgroundTransparency"] = 1;
			InputToggleParts["58"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Shadow.UICorner
			InputToggleParts["59"] = Instance.new("UICorner", InputToggleParts["58"]);
			InputToggleParts["59"]["CornerRadius"] = UDim.new(0, 4);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.TextBox
			InputToggleParts["5a"] = Instance.new("TextBox", InputToggleParts["4c"]);
			InputToggleParts["5a"]["PlaceholderColor3"] = Color3.fromRGB(179, 179, 179);
			InputToggleParts["5a"]["BorderSizePixel"] = 0;
			InputToggleParts["5a"]["TextSize"] = 14;
			InputToggleParts["5a"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
			InputToggleParts["5a"]["TextColor3"] = Color3.fromRGB(241, 241, 241);
			InputToggleParts["5a"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			InputToggleParts["5a"]["AnchorPoint"] = Vector2.new(1, 0.5);
			InputToggleParts["5a"]["PlaceholderText"] = [[Input Placeholder]];
			InputToggleParts["5a"]["Size"] = UDim2.new(0, 141, 0, 30);
			InputToggleParts["5a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			InputToggleParts["5a"]["Text"] = [[]];
			InputToggleParts["5a"]["Position"] = UDim2.new(1, -67, 0, 20);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.TextBox.UICorner
			InputToggleParts["5b"] = Instance.new("UICorner", InputToggleParts["5a"]);
			InputToggleParts["5b"]["CornerRadius"] = UDim.new(0, 5);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.TextBox.UIStroke
			InputToggleParts["5c"] = Instance.new("UIStroke", InputToggleParts["5a"]);
			InputToggleParts["5c"]["Color"] = Color3.fromRGB(66, 66, 66);
			InputToggleParts["5c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.TextBox.Shadow
			InputToggleParts["5d"] = Instance.new("ImageLabel", InputToggleParts["5a"]);
			InputToggleParts["5d"]["BorderSizePixel"] = 0;
			InputToggleParts["5d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			InputToggleParts["5d"]["ImageColor3"] = Color3.fromRGB(21, 21, 21);
			InputToggleParts["5d"]["ImageTransparency"] = 0.800000011920929;
			InputToggleParts["5d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			InputToggleParts["5d"]["Image"] = [[rbxassetid://3602733521]];
			InputToggleParts["5d"]["Size"] = UDim2.new(1, 2, 1, 2);
			InputToggleParts["5d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			InputToggleParts["5d"]["Name"] = [[Shadow]];
			InputToggleParts["5d"]["BackgroundTransparency"] = 1;
			InputToggleParts["5d"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.TextBox.Shadow.UICorner
			InputToggleParts["5e"] = Instance.new("UICorner", InputToggleParts["5d"]);
			InputToggleParts["5e"]["CornerRadius"] = UDim.new(0, 5);

			--// functionality + variables
			local Flag
			if options["Flag"] and tostring(options["Flag"]) ~= nil then
				Flag = options["Flag"]
			else
				Flag = options["Name"]
			end

			local InputToggleButton = InputToggleParts["4c"]
			local Title = InputToggleParts["4f"]
			local TogglePart = InputToggleParts["53"]
			local TogglePartStroke = InputToggleParts["54"]
			local InputTextBox = InputToggleParts["5a"]

			local Enabled = false
			local ScriptDebounce = false
			local WaitingForEnd = false

			Title.Text = options["Name"]
			InputTextBox.PlaceholderText = options["PlaceholderText"]
			InputTextBox.Size = UDim2.new(0, InputTextBox.TextBounds.X + 24, 0, 30)

			InputToggleButton.MouseEnter:Connect(function()
				TweenService:Create(InputToggleButton, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(40,40,40)}):Play()
			end)

			InputToggleButton.MouseLeave:Connect(function()
				TweenService:Create(InputToggleButton, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(35,35,35)}):Play()
			end)

			InputToggleButton.MouseButton1Down:Connect(function()
				AddRipple(InputToggleButton,Color3.fromRGB(255,255,255))
				if Enabled == false then
					Enabled = true
					pcall(function()
						local pack
						local a
						if Enabled == true then
							a = "true"
						else
							a = ""
						end
						local pack = a.."⎧⎨"..InputTextBox.Text
						UpdateFile(SaveFolder.."/"..Flag, pack)
					end)
					TweenService:Create(TogglePartStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),{Color = Color3.fromRGB(0, 170, 255)}):Play()
					TweenService:Create(TogglePart, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0, 146, 214)}):Play()
					TweenService:Create(TogglePart, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 12,0.5, 0)}):Play()
				else
					Enabled = false
					pcall(function()
						local pack
						local a
						if Enabled == true then
							a = "true"
						else
							a = ""
						end
						local pack = a.."⎧⎨"..InputTextBox.Text
						UpdateFile(SaveFolder.."/"..Flag, pack)
					end)
					TweenService:Create(TogglePartStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),{Color = Color3.fromRGB(125, 125, 125)}):Play()
					TweenService:Create(TogglePart, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(100, 100, 100)}):Play()
					TweenService:Create(TogglePart, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -11,0.5, 0)}):Play()

				end
				coroutine.wrap(function()
					local Tween = TweenService:Create(TogglePart, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0,15,0,15)})
					Tween:Play()
					Tween.Completed:Wait()
					local Tween = TweenService:Create(TogglePart, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)})
					Tween:Play()
					Tween.Completed:Wait()
					if Enabled == false then
						return
					end
				end)()
				repeat RunService.RenderStepped:Wait()
					coroutine.wrap(function()
						if ScriptDebounce == true then return end
						ScriptDebounce = true
						local succ, err = pcall(options["Callback"])
						if err then
							print("(SOLAR LIBRARY) CAUGHT ERROR: "..err)
							Enabled = false
							local Tween = TweenService:Create(TogglePart, TweenInfo.new(0.24, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0,15,0,15)})
							Tween:Play()
							Tween.Completed:Wait()
							local Tween = TweenService:Create(TogglePart, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)})
							Tween:Play()
						end
						ScriptDebounce = false
					end)()
				until Enabled ~= true or not Page["1e"]:FindFirstChild(InputToggleButton.Name)
				if WaitingForEnd == true then return end -- make sure its not yielding for script to end already
				WaitingForEnd = true
				if ScriptDebounce == true then
					repeat task.wait() until ScriptDebounce ~= true -- ensure that script has ended when calling the end script
				end
				coroutine.wrap(function()
					local succ, err = pcall(options["CallbackEnd"])
					if err then
						print("(SOLAR LIBRARY) CAUGHT ERROR: "..err)
					end
					WaitingForEnd = false
				end)()

			end)


			InputTextBox:GetPropertyChangedSignal("Text"):Connect(function()
				TweenService:Create(InputTextBox, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, InputTextBox.TextBounds.X + 24, 0, 30)}):Play()
				pcall(function()
					local pack
					local a
					if Enabled == true then
						a = "true"
					else
						a = ""
					end
					local pack = a.."⎧⎨"..InputTextBox.Text
					UpdateFile(SaveFolder.."/"..Flag, pack)
				end)
			end)

			function InputToggleParts:GetInput()
				if InputTextBox.Text == nil or not InputTextBox.Text or InputTextBox.Text == "" then
					return
				end
				if options["InputType"] and options["InputType"] ~= nil then
					local Type = options["InputType"]:lower()
					if string.find(Type, "number") then
						local NumberToReturn

						local a = InputTextBox.Text:gsub("%D","")
						if string.find(InputTextBox.Text:sub(1,1),"-") then
							a = -a
						end
						local Num = tonumber(a)

						if options["MaxNumber"] and options["MaxNumber"] ~= nil and tonumber(options["MaxNumber"]) ~= nil then
							if Num >= options["MaxNumber"] then
								Num = tonumber(options["MaxNumber"])
							end
						end
						if options["MinNumber"] and options["MinNumber"] ~= nil and tonumber(options["MinNumber"]) ~= nil then
							if Num <= options["MinNumber"] then
								Num = tonumber(options["MinNumber"])
							end
						end
						if options["MinNumber"] and options["MinNumber"] ~= nil and tonumber(options["MinNumber"]) ~= nil and options["MaxNumber"] and options["MaxNumber"] ~= nil and tonumber(options["MaxNumber"]) ~= nil then
							if options["MinNumber"] >= options["MaxNumber"] then
								NumberToReturn = tonumber(a)
							end
						end

						NumberToReturn = Num
						return NumberToReturn
					end
				end
				return InputTextBox.Text
			end

			if SaveFolder ~= nil then
				local info = GetInfo(SaveFolder.."/"..Flag)
				if not info then return end
				local spl = string.split(info, "⎧⎨")
				local toggleVal = spl[1]
				local inputVal = spl[2]
				if not toggleVal and not inputVal then return end
				coroutine.wrap(function()
				if toggleVal == "true" or toggleVal == true then

						Enabled = true
						TweenService:Create(TogglePartStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),{Color = Color3.fromRGB(0, 170, 255)}):Play()
						TweenService:Create(TogglePart, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0, 146, 214)}):Play()
						TweenService:Create(TogglePart, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 12,0.5, 0)}):Play()

						coroutine.wrap(function()
							local Tween = TweenService:Create(TogglePart, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0,15,0,15)})
							Tween:Play()
							Tween.Completed:Wait()
							local Tween = TweenService:Create(TogglePart, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)})
							Tween:Play()
							Tween.Completed:Wait()
							if Enabled == false then
								return
							end
						end)()
						repeat RunService.RenderStepped:Wait()
							coroutine.wrap(function()
								if ScriptDebounce == true then return end
								ScriptDebounce = true
								local succ, err = pcall(options["Callback"])
								if err then
									print("(SOLAR LIBRARY) CAUGHT ERROR: "..err)
									Enabled = false
									local Tween = TweenService:Create(TogglePart, TweenInfo.new(0.24, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0,15,0,15)})
									Tween:Play()
									Tween.Completed:Wait()
									local Tween = TweenService:Create(TogglePart, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)})
									Tween:Play()
								end
								ScriptDebounce = false
							end)()
						until Enabled ~= true or not Page["1e"]:FindFirstChild(InputToggleButton.Name)
						if WaitingForEnd == true then return end -- make sure its not yielding for script to end already
						WaitingForEnd = true
						if ScriptDebounce == true then
							repeat task.wait() until ScriptDebounce ~= true -- ensure that script has ended when calling the end script
						end
						coroutine.wrap(function()
							local succ, err = pcall(options["CallbackEnd"])
							if err then
								print("(SOLAR LIBRARY) CAUGHT ERROR: "..err)
							end
							WaitingForEnd = false
						end)()

					end
				end)()
				InputTextBox.Text = inputVal
				InputTextBox.Size = UDim2.new(0, InputTextBox.TextBounds.X + 24, 0, 30)
			end

			return InputToggleParts
		end


		function Page:CreateKeybindButton(options)
			if not options then options = {} end
			Library:Validate({
				Name = "A Keybind Button",
				Callback = function()

				end,
				Flag = nil
			}, options or {})

			local KeybindParts = {}

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton
			KeybindParts["41"] = Instance.new("TextButton", Page["1e"]);
			KeybindParts["41"]["BorderSizePixel"] = 0;
			KeybindParts["41"]["AutoButtonColor"] = false;
			KeybindParts["41"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
			KeybindParts["41"]["TextSize"] = 14;
			KeybindParts["41"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			KeybindParts["41"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
			KeybindParts["41"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			KeybindParts["41"]["Size"] = UDim2.new(1, -10, 0, 40);
			KeybindParts["41"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			KeybindParts["41"]["Text"] = [[]];

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.UICorner
			KeybindParts["42"] = Instance.new("UICorner", KeybindParts["41"]);
			KeybindParts["42"]["CornerRadius"] = UDim.new(0, 4);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.UIStroke
			KeybindParts["43"] = Instance.new("UIStroke", KeybindParts["41"]);
			KeybindParts["43"]["Color"] = Color3.fromRGB(51, 51, 51);
			KeybindParts["43"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Title
			KeybindParts["44"] = Instance.new("TextLabel", KeybindParts["41"]);
			KeybindParts["44"]["TextWrapped"] = true;
			KeybindParts["44"]["BorderSizePixel"] = 0;
			KeybindParts["44"]["TextScaled"] = true;
			KeybindParts["44"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			KeybindParts["44"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			KeybindParts["44"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			KeybindParts["44"]["TextSize"] = 14;
			KeybindParts["44"]["TextColor3"] = Color3.fromRGB(241, 241, 241);
			KeybindParts["44"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			KeybindParts["44"]["Size"] = UDim2.new(0, 300, 0, 14);
			KeybindParts["44"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			KeybindParts["44"]["Text"] = [[A Keybind Button]];
			KeybindParts["44"]["Name"] = [[Title]];
			KeybindParts["44"]["BackgroundTransparency"] = 1;
			KeybindParts["44"]["Position"] = UDim2.new(0.5, -33, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Shadow
			KeybindParts["45"] = Instance.new("ImageLabel", KeybindParts["41"]);
			KeybindParts["45"]["BorderSizePixel"] = 0;
			KeybindParts["45"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			KeybindParts["45"]["ImageColor3"] = Color3.fromRGB(21, 21, 21);
			KeybindParts["45"]["ImageTransparency"] = 0.800000011920929;
			KeybindParts["45"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			KeybindParts["45"]["Image"] = [[rbxassetid://3602733521]];
			KeybindParts["45"]["Size"] = UDim2.new(1, 2, 1, 2);
			KeybindParts["45"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			KeybindParts["45"]["Name"] = [[Shadow]];
			KeybindParts["45"]["BackgroundTransparency"] = 1;
			KeybindParts["45"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Shadow.UICorner
			KeybindParts["46"] = Instance.new("UICorner", KeybindParts["45"]);
			KeybindParts["46"]["CornerRadius"] = UDim.new(0, 4);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Keybind
			KeybindParts["47"] = Instance.new("TextButton", KeybindParts["41"]);
			KeybindParts["47"]["BorderSizePixel"] = 0;
			KeybindParts["47"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
			KeybindParts["47"]["TextSize"] = 14;
			KeybindParts["47"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			KeybindParts["47"]["TextColor3"] = Color3.fromRGB(179, 179, 179);
			KeybindParts["47"]["AnchorPoint"] = Vector2.new(1, 0.5);
			KeybindParts["47"]["Size"] = UDim2.new(0, 79, 0, 30);
			KeybindParts["47"]["Name"] = [[Keybind]];
			KeybindParts["47"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			KeybindParts["47"]["Text"] = [[Keybind]];
			KeybindParts["47"]["Position"] = UDim2.new(1, -7, 0, 20);
			KeybindParts["47"]["AutoButtonColor"] = false

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Keybind.UICorner
			KeybindParts["48"] = Instance.new("UICorner", KeybindParts["47"]);
			KeybindParts["48"]["CornerRadius"] = UDim.new(0, 5);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Keybind.UIStroke
			KeybindParts["49"] = Instance.new("UIStroke", KeybindParts["47"]);
			KeybindParts["49"]["Color"] = Color3.fromRGB(66, 66, 66);
			KeybindParts["49"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Keybind.Shadow
			KeybindParts["4a"] = Instance.new("ImageLabel", KeybindParts["47"]);
			KeybindParts["4a"]["BorderSizePixel"] = 0;
			KeybindParts["4a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			KeybindParts["4a"]["ImageColor3"] = Color3.fromRGB(21, 21, 21);
			KeybindParts["4a"]["ImageTransparency"] = 0.800000011920929;
			KeybindParts["4a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			KeybindParts["4a"]["Image"] = [[rbxassetid://3602733521]];
			KeybindParts["4a"]["Size"] = UDim2.new(1, 2, 1, 2);
			KeybindParts["4a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			KeybindParts["4a"]["Name"] = [[Shadow]];
			KeybindParts["4a"]["BackgroundTransparency"] = 1;
			KeybindParts["4a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Keybind.Shadow.UICorner
			KeybindParts["4b"] = Instance.new("UICorner", KeybindParts["4a"]);
			KeybindParts["4b"]["CornerRadius"] = UDim.new(0, 5);

			--// functionality + variables
			
			local Flag
			if options["Flag"] and tostring(options["Flag"]) ~= nil then
				Flag = options["Flag"]
			else
				Flag = options["Name"]
			end

			local KeybindButton = KeybindParts["41"]
			local Title = KeybindParts["44"]
			local KeybindChangeButton = KeybindParts["47"]

			local isChangingKeybind = false
			local Keybind
			local Debounce = false

			Title.Text = options["Name"]

			KeybindButton.MouseEnter:Connect(function()
				TweenService:Create(KeybindButton, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(40,40,40)}):Play()
			end)

			KeybindButton.MouseLeave:Connect(function()
				TweenService:Create(KeybindButton, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(35,35,35)}):Play()
			end)

			KeybindChangeButton:GetPropertyChangedSignal("Text"):Connect(function()
				if KeybindChangeButton.Text == "..." or KeybindChangeButton.Text == "Keybind" then
					KeybindChangeButton.TextColor3 = Color3.fromRGB(178,178,178)
				else
					if KeybindChangeButton.TextColor3 ~= Color3.fromRGB(240,240,240) then
						KeybindChangeButton.TextColor3 = Color3.fromRGB(240,240,240)
					end
				end
				TweenService:Create(KeybindChangeButton, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, KeybindChangeButton.TextBounds.X + 24, 0, 30)}):Play()
			end)

			KeybindChangeButton.MouseButton1Down:Connect(function()
				if Debounce == true then return end
				Debounce = true
				KeybindChangeButton.Text = "..."
				Keybind = nil
				isChangingKeybind = true
				repeat task.wait() until Keybind ~= nil
				local split = string.split(tostring(Keybind),".")
				local KeyCode = split[3]
				if KeyCode == "Unknown" then
					KeybindChangeButton.Text = "Keybind"
					Keybind = nil
					isChangingKeybind = false
					Debounce = false
					pcall(function()
						UpdateFile(SaveFolder.."/"..Flag, "")
					end)
					return
				end
				KeybindChangeButton.Text = KeyCode
				pcall(function()
					UpdateFile(SaveFolder.."/"..Flag, KeyCode)
				end)
				Debounce = false
				isChangingKeybind = false
			end)

			UserInputService.InputBegan:Connect(function(input,gpe)
				if gpe then return end
				if Keybind and Keybind ~= nil then
					if input.KeyCode == Keybind then
						AddRipple(KeybindButton,Color3.fromRGB(255,255,255),true)
						coroutine.wrap(function()
							local succ, err = pcall(options["Callback"])
							if err then
								print("(SOLAR LIBRARY) CAUGHT ERROR: "..err)
							end
						end)()
					end
				end
				if isChangingKeybind == true then
					isChangingKeybind = false
					Keybind = input.KeyCode
				end
			end)
			
			if SaveFolder ~= nil then
				local info = GetInfo(SaveFolder.."/"..Flag)
				if info ~= nil and info ~= "" then
					Keybind = Enum.KeyCode[info]
					KeybindChangeButton.Text = info
					KeybindChangeButton.Size = UDim2.new(0, KeybindChangeButton.TextBounds.X + 24, 0, 30)
				end
			end
		end

		function Page:CreateKeybindToggle(options)
			if not options then options = {} end
			Library:Validate({
				Name = "A Keybind Toggle",
				Callback = function()

				end,
				CallbackEnd = function()

				end,
				Flag = nil
			}, options or {})

			local KeybindToggleParts = {}

			KeybindToggleParts["6b"] = Instance.new("TextButton", Page["1e"]);
			KeybindToggleParts["6b"]["BorderSizePixel"] = 0;
			KeybindToggleParts["6b"]["AutoButtonColor"] = false;
			KeybindToggleParts["6b"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
			KeybindToggleParts["6b"]["TextSize"] = 14;
			KeybindToggleParts["6b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			KeybindToggleParts["6b"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
			KeybindToggleParts["6b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			KeybindToggleParts["6b"]["Size"] = UDim2.new(1, -10, 0, 40);
			KeybindToggleParts["6b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			KeybindToggleParts["6b"]["Text"] = [[]];

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.UICorner
			KeybindToggleParts["6c"] = Instance.new("UICorner", KeybindToggleParts["6b"]);
			KeybindToggleParts["6c"]["CornerRadius"] = UDim.new(0, 4);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.UIStroke
			KeybindToggleParts["6d"] = Instance.new("UIStroke", KeybindToggleParts["6b"]);
			KeybindToggleParts["6d"]["Color"] = Color3.fromRGB(51, 51, 51);
			KeybindToggleParts["6d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Title
			KeybindToggleParts["6e"] = Instance.new("TextLabel", KeybindToggleParts["6b"]);
			KeybindToggleParts["6e"]["TextWrapped"] = true;
			KeybindToggleParts["6e"]["BorderSizePixel"] = 0;
			KeybindToggleParts["6e"]["TextScaled"] = true;
			KeybindToggleParts["6e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			KeybindToggleParts["6e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			KeybindToggleParts["6e"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			KeybindToggleParts["6e"]["TextSize"] = 14;
			KeybindToggleParts["6e"]["TextColor3"] = Color3.fromRGB(241, 241, 241);
			KeybindToggleParts["6e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			KeybindToggleParts["6e"]["Size"] = UDim2.new(0, 239, 0, 14);
			KeybindToggleParts["6e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			KeybindToggleParts["6e"]["Text"] = [[A Keybind Toggle]];
			KeybindToggleParts["6e"]["Name"] = [[Title]];
			KeybindToggleParts["6e"]["BackgroundTransparency"] = 1;
			KeybindToggleParts["6e"]["Position"] = UDim2.new(0.5799563527107239, -103, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Frame
			KeybindToggleParts["6f"] = Instance.new("Frame", KeybindToggleParts["6b"]);
			KeybindToggleParts["6f"]["BorderSizePixel"] = 0;
			KeybindToggleParts["6f"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
			KeybindToggleParts["6f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			KeybindToggleParts["6f"]["Size"] = UDim2.new(0, 44, 0, 21);
			KeybindToggleParts["6f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			KeybindToggleParts["6f"]["Position"] = UDim2.new(0.5019999742507935, 172, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Frame.UICorner
			KeybindToggleParts["70"] = Instance.new("UICorner", KeybindToggleParts["6f"]);
			KeybindToggleParts["70"]["CornerRadius"] = UDim.new(0, 15);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Frame.UIStroke
			KeybindToggleParts["71"] = Instance.new("UIStroke", KeybindToggleParts["6f"]);
			KeybindToggleParts["71"]["Color"] = Color3.fromRGB(66, 66, 66);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Frame.Frame
			KeybindToggleParts["72"] = Instance.new("Frame", KeybindToggleParts["6f"]);
			KeybindToggleParts["72"]["BorderSizePixel"] = 0;
			KeybindToggleParts["72"]["BackgroundColor3"] = Color3.fromRGB(101, 101, 101);
			KeybindToggleParts["72"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			KeybindToggleParts["72"]["Size"] = UDim2.new(0, 17, 0, 17);
			KeybindToggleParts["72"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			KeybindToggleParts["72"]["Position"] = UDim2.new(0.5, -11, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Frame.Frame.UIStroke
			KeybindToggleParts["73"] = Instance.new("UIStroke", KeybindToggleParts["72"]);
			KeybindToggleParts["73"]["Color"] = Color3.fromRGB(126, 126, 126);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Frame.Frame.UICorner
			KeybindToggleParts["74"] = Instance.new("UICorner", KeybindToggleParts["72"]);
			KeybindToggleParts["74"]["CornerRadius"] = UDim.new(1, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Frame.Shadow
			KeybindToggleParts["75"] = Instance.new("ImageLabel", KeybindToggleParts["6f"]);
			KeybindToggleParts["75"]["BorderSizePixel"] = 0;
			KeybindToggleParts["75"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			KeybindToggleParts["75"]["ImageColor3"] = Color3.fromRGB(21, 21, 21);
			KeybindToggleParts["75"]["ImageTransparency"] = 0.6000000238418579;
			KeybindToggleParts["75"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			KeybindToggleParts["75"]["Image"] = [[rbxassetid://3602733521]];
			KeybindToggleParts["75"]["Size"] = UDim2.new(1, 2, 1, 2);
			KeybindToggleParts["75"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			KeybindToggleParts["75"]["Name"] = [[Shadow]];
			KeybindToggleParts["75"]["BackgroundTransparency"] = 1;
			KeybindToggleParts["75"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Frame.Shadow.UICorner
			KeybindToggleParts["76"] = Instance.new("UICorner", KeybindToggleParts["75"]);
			KeybindToggleParts["76"]["CornerRadius"] = UDim.new(0, 15);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Shadow
			KeybindToggleParts["77"] = Instance.new("ImageLabel", KeybindToggleParts["6b"]);
			KeybindToggleParts["77"]["BorderSizePixel"] = 0;
			KeybindToggleParts["77"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			KeybindToggleParts["77"]["ImageColor3"] = Color3.fromRGB(21, 21, 21);
			KeybindToggleParts["77"]["ImageTransparency"] = 0.800000011920929;
			KeybindToggleParts["77"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			KeybindToggleParts["77"]["Image"] = [[rbxassetid://3602733521]];
			KeybindToggleParts["77"]["Size"] = UDim2.new(1, 2, 1, 2);
			KeybindToggleParts["77"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			KeybindToggleParts["77"]["Name"] = [[Shadow]];
			KeybindToggleParts["77"]["BackgroundTransparency"] = 1;
			KeybindToggleParts["77"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Shadow.UICorner
			KeybindToggleParts["78"] = Instance.new("UICorner", KeybindToggleParts["77"]);
			KeybindToggleParts["78"]["CornerRadius"] = UDim.new(0, 4);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Keybind
			KeybindToggleParts["79"] = Instance.new("TextButton", KeybindToggleParts["6b"]);
			KeybindToggleParts["79"]["BorderSizePixel"] = 0;
			KeybindToggleParts["79"]["AutoButtonColor"] = false;
			KeybindToggleParts["79"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
			KeybindToggleParts["79"]["TextSize"] = 14;
			KeybindToggleParts["79"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			KeybindToggleParts["79"]["TextColor3"] = Color3.fromRGB(179, 179, 179);
			KeybindToggleParts["79"]["AnchorPoint"] = Vector2.new(1, 0.5);
			KeybindToggleParts["79"]["Size"] = UDim2.new(0, 79, 0, 30);
			KeybindToggleParts["79"]["Name"] = [[Keybind]];
			KeybindToggleParts["79"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			KeybindToggleParts["79"]["Text"] = [[Keybind]];
			KeybindToggleParts["79"]["Position"] = UDim2.new(1, -67, 0, 20);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Keybind.UICorner
			KeybindToggleParts["7a"] = Instance.new("UICorner", KeybindToggleParts["79"]);
			KeybindToggleParts["7a"]["CornerRadius"] = UDim.new(0, 5);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Keybind.UIStroke
			KeybindToggleParts["7b"] = Instance.new("UIStroke", KeybindToggleParts["79"]);
			KeybindToggleParts["7b"]["Color"] = Color3.fromRGB(66, 66, 66);
			KeybindToggleParts["7b"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Keybind.Shadow
			KeybindToggleParts["7c"] = Instance.new("ImageLabel", KeybindToggleParts["79"]);
			KeybindToggleParts["7c"]["BorderSizePixel"] = 0;
			KeybindToggleParts["7c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			KeybindToggleParts["7c"]["ImageColor3"] = Color3.fromRGB(21, 21, 21);
			KeybindToggleParts["7c"]["ImageTransparency"] = 0.800000011920929;
			KeybindToggleParts["7c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			KeybindToggleParts["7c"]["Image"] = [[rbxassetid://3602733521]];
			KeybindToggleParts["7c"]["Size"] = UDim2.new(1, 2, 1, 2);
			KeybindToggleParts["7c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			KeybindToggleParts["7c"]["Name"] = [[Shadow]];
			KeybindToggleParts["7c"]["BackgroundTransparency"] = 1;
			KeybindToggleParts["7c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

			-- StarterGui.Solar Library.Main.Tabs.Tab Example.ScrollingFrame.TextButton.Keybind.Shadow.UICorner
			KeybindToggleParts["7d"] = Instance.new("UICorner", KeybindToggleParts["7c"]);
			KeybindToggleParts["7d"]["CornerRadius"] = UDim.new(0, 5);

			--// functionality + variables
			
			local Flag
			if options["Flag"] and tostring(options["Flag"]) ~= nil then
				Flag = options["Flag"]
			else
				Flag = options["Name"]
			end

			local isChangingKeybind = false
			local Keybind
			local Debounce = false

			local Enabled = false
			local ScriptDebounce = false
			local WaitingForEnd = false
			local b

			local KeybindToggleButton = KeybindToggleParts["6b"]
			local Title = KeybindToggleParts["6e"]
			local ToggleCircleStroke = KeybindToggleParts["73"]
			local ToggleCircle = KeybindToggleParts["72"]
			local KeybindChangeButton = KeybindToggleParts["79"]

			Title.Text = options["Name"]

			KeybindToggleButton.MouseEnter:Connect(function()
				TweenService:Create(KeybindToggleButton, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(40,40,40)}):Play()
			end)

			KeybindToggleButton.MouseLeave:Connect(function()
				TweenService:Create(KeybindToggleButton, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(35,35,35)}):Play()
			end)

			KeybindChangeButton:GetPropertyChangedSignal("Text"):Connect(function()
				if KeybindChangeButton.Text == "..." or KeybindChangeButton.Text == "Keybind" then
					KeybindChangeButton.TextColor3 = Color3.fromRGB(178,178,178)
				else
					if KeybindChangeButton.TextColor3 ~= Color3.fromRGB(240,240,240) then
						KeybindChangeButton.TextColor3 = Color3.fromRGB(240,240,240)
					end
				end
				TweenService:Create(KeybindChangeButton, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, KeybindChangeButton.TextBounds.X + 24, 0, 30)}):Play()
			end)

			KeybindChangeButton.MouseButton1Down:Connect(function()
				if Debounce == true then return end
				Debounce = true
				KeybindChangeButton.Text = "..."
				Keybind = nil
				isChangingKeybind = true
				repeat task.wait() until Keybind ~= nil
				local split = string.split(tostring(Keybind),".")
				local KeyCode = split[3]
				if KeyCode == "Unknown" then
					KeybindChangeButton.Text = "Keybind"
					Keybind = nil
					isChangingKeybind = false
					Debounce = false
					b = ""
					pcall(function()
						local pack
						local a
						if Enabled == true then
							a = "true"
						else
							a = ""
						end
						local pack = a.."⎧⎨"..b
						UpdateFile(SaveFolder.."/"..Flag, pack)
					end)
					return
				end
				KeybindChangeButton.Text = KeyCode
				b = KeyCode
				pcall(function()
					local pack
					local a
					if Enabled == true then
						a = "true"
					else
						a = ""
					end
					local pack = a.."⎧⎨"..b
					UpdateFile(SaveFolder.."/"..Flag, pack)
				end)
				Debounce = false
				isChangingKeybind = false
			end)

			UserInputService.InputBegan:Connect(function(input,gpe)
				if gpe or not Page["1e"]:FindFirstChild(KeybindToggleButton.Name) then return end
				if Keybind and Keybind ~= nil then
					if input.KeyCode == Keybind then
						AddRipple(KeybindToggleButton,Color3.fromRGB(255,255,255),true)
						if Enabled == false then
							Enabled = true
							pcall(function()
								local pack
								local a = "true"
								local pack = a.."⎧⎨"..b
								UpdateFile(SaveFolder.."/"..Flag, pack)
							end)
							TweenService:Create(ToggleCircleStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),{Color = Color3.fromRGB(0, 170, 255)}):Play()
							TweenService:Create(ToggleCircle, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0, 146, 214)}):Play()
							TweenService:Create(ToggleCircle, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 12,0.5, 0)}):Play()
						else
							Enabled = false
							pcall(function()
								local pack
								local a = ""
								local pack = a.."⎧⎨"..b
								UpdateFile(SaveFolder.."/"..Flag, pack)
							end)
							TweenService:Create(ToggleCircleStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),{Color = Color3.fromRGB(125, 125, 125)}):Play()
							TweenService:Create(ToggleCircle, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(100, 100, 100)}):Play()
							TweenService:Create(ToggleCircle, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -11,0.5, 0)}):Play()
						end
						coroutine.wrap(function()
							local Tween = TweenService:Create(ToggleCircle, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0,15,0,15)})
							Tween:Play()
							Tween.Completed:Wait()
							local Tween = TweenService:Create(ToggleCircle, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)})
							Tween:Play()
							Tween.Completed:Wait()
							Debounce = false
						end)()
						repeat RunService.RenderStepped:Wait()
							coroutine.wrap(function()
								if ScriptDebounce == true then return end
								ScriptDebounce = true
								local succ, err = pcall(options["Callback"])
								if err then
									print("(SOLAR LIBRARY) CAUGHT ERROR: "..err)
									Enabled = false
									local Tween = TweenService:Create(ToggleCircle, TweenInfo.new(0.24, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0,15,0,15)})
									Tween:Play()
									Tween.Completed:Wait()
									local Tween = TweenService:Create(ToggleCircle, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)})
									Tween:Play()
								end
								ScriptDebounce = false
							end)()
						until Enabled ~= true or not Page["1e"]:FindFirstChild(KeybindToggleButton.Name)
						if WaitingForEnd == true then return end -- make sure its not yielding for script to end already
						WaitingForEnd = true
						if ScriptDebounce == true then
							repeat task.wait() until ScriptDebounce ~= true -- ensure that script has ended when calling the end script
						end
						coroutine.wrap(function()
							local succ, err = pcall(options["CallbackEnd"])
							if err then
								print("(SOLAR LIBRARY) CAUGHT ERROR: "..err)
							end
							WaitingForEnd = false
						end)()
					end
				end
				if isChangingKeybind == true then
					isChangingKeybind = false
					Keybind = input.KeyCode
				end
			end)
			
			if SaveFolder ~= nil then
				local info = GetInfo(SaveFolder.."/"..Flag)
				if not info then return end
				local spl = string.split(info, "⎧⎨")
				local toggleVal = spl[1]
				local inputVal = spl[2]
				if not toggleVal and not inputVal then return end
				coroutine.wrap(function()
					if toggleVal == "true" or toggleVal == true then
						Enabled = true
						TweenService:Create(ToggleCircleStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),{Color = Color3.fromRGB(0, 170, 255)}):Play()
						TweenService:Create(ToggleCircle, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0, 146, 214)}):Play()
						TweenService:Create(ToggleCircle, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 12,0.5, 0)}):Play()

						coroutine.wrap(function()
							local Tween = TweenService:Create(ToggleCircle, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0,15,0,15)})
							Tween:Play()
							Tween.Completed:Wait()
							local Tween = TweenService:Create(ToggleCircle, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)})
							Tween:Play()
							Tween.Completed:Wait()
							if Enabled == false then
								return
							end
						end)()
						repeat RunService.RenderStepped:Wait()
							coroutine.wrap(function()
								if ScriptDebounce == true then return end
								ScriptDebounce = true
								local succ, err = pcall(options["Callback"])
								if err then
									print("(SOLAR LIBRARY) CAUGHT ERROR: "..err)
									Enabled = false
									local Tween = TweenService:Create(ToggleCircle, TweenInfo.new(0.24, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0,15,0,15)})
									Tween:Play()
									Tween.Completed:Wait()
									local Tween = TweenService:Create(ToggleCircle, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)})
									Tween:Play()
								end
								ScriptDebounce = false
							end)()
						until Enabled ~= true or not Page["1e"]:FindFirstChild(KeybindToggleButton.Name)
						if WaitingForEnd == true then return end -- make sure its not yielding for script to end already
						WaitingForEnd = true
						if ScriptDebounce == true then
							repeat task.wait() until ScriptDebounce ~= true -- ensure that script has ended when calling the end script
						end
						coroutine.wrap(function()
							local succ, err = pcall(options["CallbackEnd"])
							if err then
								print("(SOLAR LIBRARY) CAUGHT ERROR: "..err)
							end
							WaitingForEnd = false
						end)()

					end
				end)()
				if inputVal ~= nil and inputVal ~= "" then
					Keybind = Enum.KeyCode[inputVal]
					KeybindChangeButton.Text = inputVal
					KeybindChangeButton.Size = UDim2.new(0, KeybindChangeButton.TextBounds.X + 24, 0, 30)
				end
			end
		end

		return Page
	end

	return UI
end

return Library
