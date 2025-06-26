local Env_ = getgenv()
Env_.Count = 1

if not game:IsLoaded() then 
	game.Loaded:Wait(3)
	print('not game.Loaded:Wait(3)')
end

if Env_.Fetching then
	task.spawn(function()
		error("Compiler Failed:(" .. Env_.FetchCount .. ")")
	end)
	Env_.FetchCount += 1
	if Env_.FetchCount > 4 then
		game.Players.LocalPlayer:Kick("This is Protection Caller:\nรันซ้ำทำเหี้ยไรหลายรอบ\nStop Spaming Execute Trash.")
	elseif Env_.FetchCount > 1 then
		if workspace:FindFirstChild('Waring Fetching') then
			workspace:FindFirstChild('Waring Fetching'):Destroy()
		end
		local notLoaded = Instance.new("Message")
		notLoaded.Parent = workspace
		local maxAttempts = 5
		notLoaded.Name = "Waring Fetching"
		local remaining = maxAttempts - (Env_.FetchCount or 1)
		notLoaded.Text = "Warning:\nถ้ารันซ้ำอีก " .. tostring(remaining) .. " ครั้งคุณจะถูกเตะออกจากเกม"
		task.wait(5)
		notLoaded:Destroy()
	end
	return
end

repeat 
	task.wait(.3)
	warn("Waiting for Player: " .. Env_.Count .. "/" .. 9e9)
	Env_.Count += 1
until game:IsLoaded() and game:GetService("Players") and game:GetService("Players").LocalPlayer

Env_.Fetching = true
Env_.FetchCount = 1
Env_.Configs = {}

if game:GetService("CoreGui"):FindFirstChild("Fetching") then
	game:GetService("CoreGui"):FindFirstChild("Fetching"):Destroy()
end;

local TweenService: TweenService = game:GetService("TweenService");
local UserInputService: UserInputService = game:GetService("UserInputService");

function tw(info)
	return TweenService:Create(info.v, TweenInfo.new(info.t, info.s, info.d), info.g)
end;

function lak(a)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
		local Tween = TweenService:Create(a, TweenInfo.new(0.3), {Position = pos})
		Tween:Play()
	end

	a.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			Dragging = true
			DragStart = input.Position
			StartPosition = a.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					Dragging = false
				end
			end)
		end
	end)

	a.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			DragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == DragInput and Dragging then
			Update(input)
		end
	end)
end;

function click(p)
	local Click = Instance.new("TextButton")
	Click.Name = "Click"
	Click.Parent = p
	Click.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Click.BackgroundTransparency = 1.000
	Click.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Click.BorderSizePixel = 0
	Click.Size = UDim2.new(1, 0, 1, 0)
	Click.Font = Enum.Font.SourceSans
	Click.Text = ""
	Click.TextColor3 = Color3.fromRGB(0, 0, 0)
	Click.TextSize = 14.000
	return Click
end;

function EffectUtils(c, p)
	local Mouse = game.Players.LocalPlayer:GetMouse()

	local relativeX = Mouse.X - c.AbsolutePosition.X
	local relativeY = Mouse.Y - c.AbsolutePosition.Y

	if relativeX < 0 or relativeY < 0 or relativeX > c.AbsoluteSize.X or relativeY > c.AbsoluteSize.Y then
		return
	end

	local ClickButtonCircle = Instance.new("Frame")
	ClickButtonCircle.Parent = p
	ClickButtonCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ClickButtonCircle.BackgroundTransparency = 0.7
	ClickButtonCircle.BorderSizePixel = 0
	ClickButtonCircle.AnchorPoint = Vector2.new(0.5, 0.5)
	ClickButtonCircle.Position = UDim2.new(0, relativeX, 0, relativeY)
	ClickButtonCircle.Size = UDim2.new(0, 0, 0, 0)
	ClickButtonCircle.ZIndex = 10

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = ClickButtonCircle

	local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

	local goal = {
		Size = UDim2.new(0, c.AbsoluteSize.X * 1.5, 0, c.AbsoluteSize.X * 1.5),
		BackgroundTransparency = 1
	}

	local expandTween = TweenService:Create(ClickButtonCircle, tweenInfo, goal)

	expandTween.Completed:Connect(function()
		ClickButtonCircle:Destroy()
	end)

	expandTween:Play()
end;

local Language = Instance.new("ScreenGui")
local Background_1 = Instance.new("Frame")
local UICorner_1 = Instance.new("UICorner")
local Topbar_1 = Instance.new("Frame")
local Func_1 = Instance.new("Frame")
local UIPadding_1 = Instance.new("UIPadding")
local Frame_1 = Instance.new("Frame")
local TextLabel_1 = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local Frame_2 = Instance.new("Frame")
local ImageLabel_1 = Instance.new("ImageLabel")
local UIListLayout_1 = Instance.new("UIListLayout")
local ImageLabel_2 = Instance.new("ImageLabel")
local ImageLabel_3 = Instance.new("ImageLabel")
local Page_1 = Instance.new("Frame")
local Inpage_1 = Instance.new("Frame")
local Image_1 = Instance.new("Frame")
local Frame_3 = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local ImageLabel_4 = Instance.new("ImageLabel")
local UICorner_3 = Instance.new("UICorner")
local UIGradient_1 = Instance.new("UIGradient")
local Frame_4 = Instance.new("Frame")
local TextLabel_3 = Instance.new("TextLabel")
local TextLabel_4 = Instance.new("TextLabel")
local UIPadding_2 = Instance.new("UIPadding")
local Select_1 = Instance.new("Frame")
local TH_1 = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local UIGradient_2 = Instance.new("UIGradient")
local Frame_5 = Instance.new("Frame")
local TextLabel_5 = Instance.new("TextLabel")
local UIPadding_3 = Instance.new("UIPadding")
local UIListLayout_2 = Instance.new("UIListLayout")
local UIPadding_4 = Instance.new("UIPadding")
local EN_1 = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local UIGradient_3 = Instance.new("UIGradient")
local Frame_6 = Instance.new("Frame")
local TextLabel_6 = Instance.new("TextLabel")
local UIPadding_5 = Instance.new("UIPadding")
local UIPadding_6 = Instance.new("UIPadding")

Language.Name = "Language"
Language.Parent = not game:GetService("RunService"):IsStudio() and game:GetService("CoreGui") or game:GetService("Players").LocalPlayer.PlayerGui
Language.ZIndexBehavior = Enum.ZIndexBehavior.Global

Background_1.Name = "Background"
Background_1.Parent = Language
Background_1.AnchorPoint = Vector2.new(0.5, 0.5)
Background_1.BackgroundColor3 = Color3.fromRGB(0,0,0)
Background_1.BackgroundTransparency = 0.20000000298023224
Background_1.BorderColor3 = Color3.fromRGB(0,0,0)
Background_1.BorderSizePixel = 0
Background_1.Position = UDim2.new(0.5, 0,0.5, 0)
Background_1.Size = UDim2.new(0, 480,0, 400)

lak(Background_1)

local Shadow = Instance.new("ImageLabel")
Shadow.Parent = Background_1
Shadow.Name = "DropShadow"
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.BackgroundColor3 = Color3.fromRGB(28,28,30)
Shadow.BackgroundTransparency = 1
Shadow.BorderColor3 = Color3.fromRGB(0,0,0)
Shadow.BorderSizePixel = 0
Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
Shadow.Size = UDim2.new(1, 120, 1, 120)
Shadow.ZIndex = 0
Shadow.Image = "rbxassetid://8992230677"
Shadow.ImageColor3 = Color3.new(0, 0, 0)
Shadow.ImageTransparency = 0.35
Shadow.ResampleMode = Enum.ResamplerMode.Default
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceScale = 1
Shadow.TileSize = UDim2.new(1, 0, 1, 0)
Shadow.SliceCenter = Rect.new(99, 99, 99, 99)

UICorner_1.Parent = Background_1

Topbar_1.Name = "Topbar"
Topbar_1.Parent = Background_1
Topbar_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
Topbar_1.BackgroundTransparency = 1
Topbar_1.BorderColor3 = Color3.fromRGB(0,0,0)
Topbar_1.BorderSizePixel = 0
Topbar_1.Size = UDim2.new(1, 0,0, 60)

Func_1.Name = "Func"
Func_1.Parent = Topbar_1
Func_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
Func_1.BackgroundTransparency = 1
Func_1.BorderColor3 = Color3.fromRGB(0,0,0)
Func_1.BorderSizePixel = 0
Func_1.Size = UDim2.new(1, 0,1, 0)

UIPadding_1.Parent = Func_1
UIPadding_1.PaddingBottom = UDim.new(0,5)
UIPadding_1.PaddingLeft = UDim.new(0,20)
UIPadding_1.PaddingRight = UDim.new(0,5)
UIPadding_1.PaddingTop = UDim.new(0,5)

Frame_1.Parent = Func_1
Frame_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame_1.BackgroundTransparency = 1
Frame_1.BorderColor3 = Color3.fromRGB(0,0,0)
Frame_1.BorderSizePixel = 0
Frame_1.Position = UDim2.new(-0.0043956046, 0,0, 0)
Frame_1.Size = UDim2.new(0.0043956046, 100,1.20000005, 0)

TextLabel_1.Parent = Frame_1
TextLabel_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
TextLabel_1.BackgroundTransparency = 1
TextLabel_1.BorderColor3 = Color3.fromRGB(0,0,0)
TextLabel_1.BorderSizePixel = 0
TextLabel_1.Size = UDim2.new(1, 0,0.5, 0)
TextLabel_1.Font = Enum.Font.GothamBold
TextLabel_1.Text = "Select Language"
TextLabel_1.TextColor3 = Color3.fromRGB(255,255,255)
TextLabel_1.TextSize = 16
TextLabel_1.TextXAlignment = Enum.TextXAlignment.Left

TextLabel_2.Parent = Frame_1
TextLabel_2.AnchorPoint = Vector2.new(0, 1)
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
TextLabel_2.BackgroundTransparency = 1
TextLabel_2.BorderColor3 = Color3.fromRGB(0,0,0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0, 0,0.78333354, 0)
TextLabel_2.Size = UDim2.new(1, 0,0.400000215, 0)
TextLabel_2.Font = Enum.Font.GothamBold
TextLabel_2.Text = "เลือกภาษา"
TextLabel_2.TextColor3 = Color3.fromRGB(255,255,255)
TextLabel_2.TextSize = 16
TextLabel_2.TextTransparency = 0.5
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
TextLabel_2.TextYAlignment = Enum.TextYAlignment.Top

Frame_2.Parent = Func_1
Frame_2.AnchorPoint = Vector2.new(1, 0)
Frame_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame_2.BackgroundTransparency = 1
Frame_2.BorderColor3 = Color3.fromRGB(0,0,0)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(1, 0,0, 0)
Frame_2.Size = UDim2.new(0, 100,1, 0)

ImageLabel_1.Parent = Frame_2
ImageLabel_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
ImageLabel_1.BackgroundTransparency = 1
ImageLabel_1.BorderColor3 = Color3.fromRGB(0,0,0)
ImageLabel_1.BorderSizePixel = 0
ImageLabel_1.Size = UDim2.new(0, 17,0, 17)
ImageLabel_1.Image = "rbxassetid://74645956038696"
ImageLabel_1.ImageColor3 = Color3.fromRGB(255,0,0)

UIListLayout_1.Parent = Frame_2
UIListLayout_1.Padding = UDim.new(0,2)
UIListLayout_1.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_1.HorizontalAlignment = Enum.HorizontalAlignment.Right
UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder

ImageLabel_2.Parent = Frame_2
ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
ImageLabel_2.BackgroundTransparency = 1
ImageLabel_2.BorderColor3 = Color3.fromRGB(0,0,0)
ImageLabel_2.BorderSizePixel = 0
ImageLabel_2.LayoutOrder = 1
ImageLabel_2.Size = UDim2.new(0, 17,0, 17)
ImageLabel_2.Image = "rbxassetid://74645956038696"
ImageLabel_2.ImageColor3 = Color3.fromRGB(0,255,132)

ImageLabel_3.Parent = Frame_2
ImageLabel_3.BackgroundColor3 = Color3.fromRGB(255,255,255)
ImageLabel_3.BackgroundTransparency = 1
ImageLabel_3.BorderColor3 = Color3.fromRGB(0,0,0)
ImageLabel_3.BorderSizePixel = 0
ImageLabel_3.LayoutOrder = 2
ImageLabel_3.Size = UDim2.new(0, 17,0, 17)
ImageLabel_3.Image = "rbxassetid://74645956038696"
ImageLabel_3.ImageColor3 = Color3.fromRGB(255,232,0)

Page_1.Name = "Page"
Page_1.Parent = Background_1
Page_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
Page_1.BackgroundTransparency = 1
Page_1.BorderColor3 = Color3.fromRGB(0,0,0)
Page_1.BorderSizePixel = 0
Page_1.Size = UDim2.new(1, 0,1, 0)

Inpage_1.Name = "Inpage"
Inpage_1.Parent = Page_1
Inpage_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
Inpage_1.BackgroundTransparency = 1
Inpage_1.BorderColor3 = Color3.fromRGB(0,0,0)
Inpage_1.BorderSizePixel = 0
Inpage_1.Size = UDim2.new(1, 0,1, 0)

Image_1.Name = "Image"
Image_1.Parent = Inpage_1
Image_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
Image_1.BackgroundTransparency = 1
Image_1.BorderColor3 = Color3.fromRGB(0,0,0)
Image_1.BorderSizePixel = 0
Image_1.Position = UDim2.new(0, 0,-0.0399998128, 0)
Image_1.Size = UDim2.new(1, 0,1.18461502, 0)

Frame_3.Parent = Image_1
Frame_3.BackgroundColor3 = Color3.fromRGB(42,43,43)
Frame_3.BackgroundTransparency = 0.5
Frame_3.BorderColor3 = Color3.fromRGB(0,0,0)
Frame_3.BorderSizePixel = 0
Frame_3.Size = UDim2.new(1, 0,0.754805028, 0)

UICorner_2.Parent = Frame_3

ImageLabel_4.Parent = Frame_3
ImageLabel_4.BackgroundColor3 = Color3.fromRGB(255,255,255)
ImageLabel_4.BackgroundTransparency = 1
ImageLabel_4.BorderColor3 = Color3.fromRGB(0,0,0)
ImageLabel_4.BorderSizePixel = 0
ImageLabel_4.Size = UDim2.new(1, 0,1, 0)
ImageLabel_4.Image = "rbxassetid://138127867432976"
ImageLabel_4.ImageTransparency = 0.30000001192092896
ImageLabel_4.ScaleType = Enum.ScaleType.Crop

UICorner_3.Parent = ImageLabel_4

UIGradient_1.Parent = ImageLabel_4
UIGradient_1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}
UIGradient_1.Rotation = 90

Frame_4.Parent = ImageLabel_4
Frame_4.AnchorPoint = Vector2.new(0.5, 0.5)
Frame_4.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame_4.BackgroundTransparency = 1
Frame_4.BorderColor3 = Color3.fromRGB(0,0,0)
Frame_4.BorderSizePixel = 0
Frame_4.Position = UDim2.new(0.5, 0,0.5, 0)
Frame_4.Size = UDim2.new(0, 100,0, 100)

TextLabel_3.Parent = Frame_4
TextLabel_3.AnchorPoint = Vector2.new(0.5, 0)
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255,255,255)
TextLabel_3.BackgroundTransparency = 1
TextLabel_3.BorderColor3 = Color3.fromRGB(0,0,0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0.5, 0,0, 0)
TextLabel_3.Size = UDim2.new(0, 200,0.49000001, 0)
TextLabel_3.Font = Enum.Font.GothamBold
TextLabel_3.Text = "Language Service"
TextLabel_3.TextColor3 = Color3.fromRGB(255,255,255)
TextLabel_3.TextSize = 30
TextLabel_3.TextYAlignment = Enum.TextYAlignment.Bottom

TextLabel_4.Parent = Frame_4
TextLabel_4.AnchorPoint = Vector2.new(0.5, 1)
TextLabel_4.BackgroundColor3 = Color3.fromRGB(255,255,255)
TextLabel_4.BackgroundTransparency = 1
TextLabel_4.BorderColor3 = Color3.fromRGB(0,0,0)
TextLabel_4.BorderSizePixel = 0
TextLabel_4.Position = UDim2.new(0.5, 0,1, 0)
TextLabel_4.Size = UDim2.new(0, 200,0.49000001, 0)
TextLabel_4.Font = Enum.Font.Gotham
TextLabel_4.Text = "https://discord.gg/YzeS4gEd9h"
TextLabel_4.TextColor3 = Color3.fromRGB(255,255,255)
TextLabel_4.TextSize = 16
TextLabel_4.TextYAlignment = Enum.TextYAlignment.Top

UIPadding_2.Parent = Frame_3
UIPadding_2.PaddingBottom = UDim.new(0,8)
UIPadding_2.PaddingLeft = UDim.new(0,8)
UIPadding_2.PaddingRight = UDim.new(0,8)
UIPadding_2.PaddingTop = UDim.new(0,8)

Select_1.Name = "Select"
Select_1.Parent = Inpage_1
Select_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
Select_1.BackgroundTransparency = 1
Select_1.BorderColor3 = Color3.fromRGB(0,0,0)
Select_1.BorderSizePixel = 0
Select_1.Position = UDim2.new(0, 0,0.876923084, 0)
Select_1.Size = UDim2.new(1, 0,0.132307649, 0)

local Click1 = click(TH_1)

Click1.MouseButton1Click:Connect(function()
	_G.Thai = true
	
	Language:Destroy()

TH_1.Name = "TH"
TH_1.Parent = Select_1
TH_1.AnchorPoint = Vector2.new(0.5, 0.5)
TH_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
TH_1.BorderColor3 = Color3.fromRGB(0,0,0)
TH_1.BorderSizePixel = 0
TH_1.Position = UDim2.new(0.245054945, 0,0.518868029, 0)
TH_1.Size = UDim2.new(0, 223,0, 42)

UICorner_4.Parent = TH_1

UIGradient_2.Parent = TH_1
UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(48, 163, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(85, 85, 255))}
UIGradient_2.Rotation = -67

Frame_5.Parent = TH_1
Frame_5.AnchorPoint = Vector2.new(0, 1)
Frame_5.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame_5.BackgroundTransparency = 1
Frame_5.BorderColor3 = Color3.fromRGB(0,0,0)
Frame_5.BorderSizePixel = 0
Frame_5.Position = UDim2.new(0, 0,1, 0)
Frame_5.Size = UDim2.new(1, 0,1, 0)

TextLabel_5.Parent = Frame_5
TextLabel_5.AnchorPoint = Vector2.new(0, 1)
TextLabel_5.BackgroundColor3 = Color3.fromRGB(255,255,255)
TextLabel_5.BackgroundTransparency = 1
TextLabel_5.BorderColor3 = Color3.fromRGB(0,0,0)
TextLabel_5.BorderSizePixel = 0
TextLabel_5.Position = UDim2.new(0, 0,1, 0)
TextLabel_5.Size = UDim2.new(1, 0,1, 0)
TextLabel_5.Font = Enum.Font.GothamBold
TextLabel_5.Text = "ไทย"
TextLabel_5.TextColor3 = Color3.fromRGB(255,255,255)
TextLabel_5.TextSize = 30

UIPadding_3.Parent = Frame_5
UIPadding_3.PaddingLeft = UDim.new(0,6)
UIPadding_3.PaddingRight = UDim.new(0,6)

UIListLayout_2.Parent = Select_1
UIListLayout_2.Padding = UDim.new(0,10)
UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

UIPadding_4.Parent = Select_1
UIPadding_4.PaddingLeft = UDim.new(0,2)

EN_1.Name = "EN"
EN_1.Parent = Select_1
EN_1.AnchorPoint = Vector2.new(0.5, 0.5)
EN_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
EN_1.BorderColor3 = Color3.fromRGB(0,0,0)
EN_1.BorderSizePixel = 0
EN_1.Position = UDim2.new(0.752183378, 0,0.548387289, 0)
EN_1.Size = UDim2.new(0, 223,0, 42)

local Click2 = click(EN_1)

Click2.MouseButton1Click:Connect(function()
	Language:Destroy()
	

UICorner_5.Parent = EN_1

UIGradient_3.Parent = EN_1
UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(48, 163, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(85, 85, 255))}

Frame_6.Parent = EN_1
Frame_6.AnchorPoint = Vector2.new(0, 1)
Frame_6.BackgroundColor3 = Color3.fromRGB(255,255,255)
Frame_6.BackgroundTransparency = 1
Frame_6.BorderColor3 = Color3.fromRGB(0,0,0)
Frame_6.BorderSizePixel = 0
Frame_6.Position = UDim2.new(0, 0,1, 0)
Frame_6.Size = UDim2.new(1, 0,1, 0)

TextLabel_6.Parent = Frame_6
TextLabel_6.AnchorPoint = Vector2.new(0, 1)
TextLabel_6.BackgroundColor3 = Color3.fromRGB(255,255,255)
TextLabel_6.BackgroundTransparency = 1
TextLabel_6.BorderColor3 = Color3.fromRGB(0,0,0)
TextLabel_6.BorderSizePixel = 0
TextLabel_6.Position = UDim2.new(0, 0,1, 0)
TextLabel_6.Size = UDim2.new(1, 0,1, 0)
TextLabel_6.Font = Enum.Font.GothamBold
TextLabel_6.Text = "English"
TextLabel_6.TextColor3 = Color3.fromRGB(255,255,255)
TextLabel_6.TextSize = 25

UIPadding_5.Parent = Frame_6
UIPadding_5.PaddingLeft = UDim.new(0,6)
UIPadding_5.PaddingRight = UDim.new(0,6)

UIPadding_6.Parent = Page_1
UIPadding_6.PaddingBottom = UDim.new(0,10)
UIPadding_6.PaddingLeft = UDim.new(0,10)
UIPadding_6.PaddingRight = UDim.new(0,10)
UIPadding_6.PaddingTop = UDim.new(0,65)
