local SearchAndChangelogLibrary = {}

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TextService = game:GetService("TextService")

local SelectedTheme = {
    Background = Color3.fromRGB(30, 30, 30),
    ElementStroke = Color3.fromRGB(100, 100, 100),
    Shadow = Color3.fromRGB(0, 0, 0),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementBackground = Color3.fromRGB(40, 40, 40),
    ElementBackgroundHover = Color3.fromRGB(60, 60, 60)
}

local function protectUI(sGui)
    if not sGui then return end
    
    if get_hidden_gui or gethui then
        local hiddenUI = get_hidden_gui or gethui
        sGui.Name = "ChangelogUI_"..tostring(math.random(10000,99999))
        sGui.Parent = hiddenUI()
    elseif syn and syn.protect_gui then
        syn.protect_gui(sGui)
        sGui.Parent = CoreGui
    else
        sGui.Parent = CoreGui
    end
    return sGui
end

function SearchAndChangelogLibrary:Notify(data)
    if not self.NotifyLibrary or string.lower(self.NotifyLibrary) == "rayfield" then
        -- Rayfield style notification
        local notificationGui = Instance.new("ScreenGui")
        protectUI(notificationGui)
        
        local notification = Instance.new("Frame")
        notification.Size = UDim2.new(0, 300, 0, 60)
        notification.Position = UDim2.new(1, 10, 1, -70)
        notification.AnchorPoint = Vector2.new(1, 1)
        notification.BackgroundColor3 = SelectedTheme.Background
        notification.BackgroundTransparency = 0.5
        notification.BorderSizePixel = 0
        notification.ZIndex = 100
        notification.Parent = notificationGui
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 6)
        corner.Parent = notification
        
        local stroke = Instance.new("UIStroke")
        stroke.Color = SelectedTheme.ElementStroke
        stroke.Thickness = 1
        stroke.Parent = notification
        
        local title = Instance.new("TextLabel")
        title.Text = data.Title or "Notification"
        title.TextColor3 = SelectedTheme.TextColor
        title.TextSize = 18
        title.Font = Enum.Font.SourceSansBold
        title.Size = UDim2.new(1, -40, 0, 20)
        title.Position = UDim2.new(0, 40, 0, 10)
        title.BackgroundTransparency = 1
        title.TextXAlignment = Enum.TextXAlignment.Left
        title.ZIndex = 101
        title.Parent = notification
        
        local content = Instance.new("TextLabel")
        content.Text = data.Content or ""
        content.TextColor3 = SelectedTheme.TextColor
        content.TextTransparency = 0.35
        content.TextSize = 14
        content.Font = Enum.Font.SourceSans
        content.Size = UDim2.new(1, -40, 0, 20)
        content.Position = UDim2.new(0, 40, 0, 30)
        content.BackgroundTransparency = 1
        content.TextXAlignment = Enum.TextXAlignment.Left
        content.ZIndex = 101
        content.Parent = notification
        
        local icon = Instance.new("ImageLabel")
        icon.Image = "rbxassetid://"..tostring(data.Image or 10723346871)
        icon.Size = UDim2.new(0, 24, 0, 24)
        icon.Position = UDim2.new(0, 10, 0, 10)
        icon.BackgroundTransparency = 1
        icon.ZIndex = 102
        icon.Parent = notification
        
        notification.Position = UDim2.new(1, 310, 1, -70)
        TweenService:Create(notification, TweenInfo.new(0.3), {Position = UDim2.new(1, -10, 1, -70)}):Play()
        
        task.wait(data.Duration or 3)
        
        TweenService:Create(notification, TweenInfo.new(0.3), {Position = UDim2.new(1, 310, 1, -70)}):Play()
        task.wait(0.3)
        notificationGui:Destroy()
    else
        local notificationGui = Instance.new("ScreenGui")
        protectUI(notificationGui)
        
        local notification = Instance.new("Frame")
        notification.Size = UDim2.new(0, 300, 0, 60)
        notification.Position = UDim2.new(1, 10, 1, -70)
        notification.AnchorPoint = Vector2.new(1, 1)
        notification.BackgroundColor3 = SelectedTheme.Background
        notification.BackgroundTransparency = 0.5
        notification.BorderSizePixel = 0
        notification.ZIndex = 100
        notification.Parent = notificationGui
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 6)
        corner.Parent = notification
        
        local title = Instance.new("TextLabel")
        title.Text = data.Title or "Notification"
        title.TextColor3 = SelectedTheme.TextColor
        title.TextSize = 16
        title.Font = Enum.Font.SourceSansBold
        title.Size = UDim2.new(1, -40, 0, 20)
        title.Position = UDim2.new(0, 40, 0, 10)
        title.BackgroundTransparency = 1
        title.TextXAlignment = Enum.TextXAlignment.Left
        title.ZIndex = 101
        title.Parent = notification
        
        local content = Instance.new("TextLabel")
        content.Text = data.Content or ""
        content.TextColor3 = SelectedTheme.TextColor
        content.TextTransparency = 0.35
        content.TextSize = 14
        content.Font = Enum.Font.SourceSans
        content.Size = UDim2.new(1, -40, 0, 20)
        content.Position = UDim2.new(0, 40, 0, 30)
        content.BackgroundTransparency = 1
        content.TextXAlignment = Enum.TextXAlignment.Left
        content.ZIndex = 101
        content.Parent = notification
        
        local icon = Instance.new("ImageLabel")
        icon.Image = "rbxassetid://"..tostring(data.Image or 10723346871)
        icon.Size = UDim2.new(0, 24, 0, 24)
        icon.Position = UDim2.new(0, 10, 0, 10)
        icon.BackgroundTransparency = 1
        icon.ZIndex = 102
        icon.Parent = notification
        
        notification.Position = UDim2.new(1, 310, 1, -70)
        TweenService:Create(notification, TweenInfo.new(0.3), {Position = UDim2.new(1, -10, 1, -70)}):Play()
        
        task.wait(data.Duration or 3)
        
        TweenService:Create(notification, TweenInfo.new(0.3), {Position = UDim2.new(1, 310, 1, -70)}):Play()
        task.wait(0.3)
        notificationGui:Destroy()
    end
end

function SearchAndChangelogLibrary:CreateChangelogDialog(config)
    local changelogText = type(config) == "string" and config or (type(config) == "table" and config.ChangelogText or "")
    local showSearchBar = type(config) == "table" and config.Search ~= false
    local dialogTitle = type(config) == "table" and config.Title or "Changelog"
    local notificationsEnabled = type(config) == "table" and config.Notifications ~= false
    local altButton = type(config) == "table" and config.Altbutton or { Name = "Join Discord", Clipboard = "discord.gg/rTw5M8dRXN" }
    local notification = type(config) == "table" and config.Notification or { Title = "Changelog Closed", Content = "The changelog has been closed", Duration = 2.5, Image = 10723346871 }
    local altButtonNotification = type(config) == "table" and config.AltbuttonNotification or {
        Success = { Title = "Copied", Content = "The link has been copied to your clipboard!", Duration = 6.5, Image = 10709798443 },
        Failure = { Title = "Failed", Content = "Your executor doesn't support setclipboard.", Duration = 6.5, Image = 10709799124 }
    }
    
    self.NotifyLibrary = type(config) == "table" and config.NotifyLibrary or "Rayfield"
    
    if changelogText == "" then
        changelogText = [[
        Version: Build 1.0
        Release Date: ???

        What's New
        ???

        Improvements
        ???

        Bug Fixes
        ???

        Known Issues
        ???

        Notes
        ???
        ]]
    end

    local screenGui = Instance.new("ScreenGui")
    protectUI(screenGui)

    local ChangelogDialog = Instance.new("Frame")
    ChangelogDialog.Name = "ChangelogDialog"
    local screenSize = workspace.CurrentCamera.ViewportSize
    local minSize = Vector2.new(500, 400)
    local isMobile = UserInputService.TouchEnabled or (screenSize.X < minSize.X and screenSize.Y < minSize.Y)
    local dialogWidth = isMobile and math.clamp(screenSize.X * 0.8, 250, 450) or math.clamp(screenSize.X * 0.4, 400, 550)
    local dialogHeight = isMobile and math.clamp(screenSize.Y * 0.6, 300, 550) or math.clamp(screenSize.Y * 0.6, 400, 600)
    
    ChangelogDialog.Size = UDim2.new(0, dialogWidth, 0, dialogHeight)
    ChangelogDialog.Position = UDim2.new(0.5, 0, 0, isMobile and 40 or 60)
    ChangelogDialog.AnchorPoint = Vector2.new(0.5, 0)
    ChangelogDialog.BackgroundColor3 = SelectedTheme.Background
    ChangelogDialog.BackgroundTransparency = 0
    ChangelogDialog.BorderSizePixel = 0
    ChangelogDialog.ZIndex = 100
    ChangelogDialog.Visible = false
    ChangelogDialog.Parent = screenGui

    local DialogCorner = Instance.new("UICorner")
    DialogCorner.CornerRadius = UDim.new(0, 6)
    DialogCorner.Parent = ChangelogDialog

    local DialogStroke = Instance.new("UIStroke")
    DialogStroke.Color = SelectedTheme.ElementStroke
    DialogStroke.Thickness = 1
    DialogStroke.Transparency = 0
    DialogStroke.Parent = ChangelogDialog

    local DialogShadow = Instance.new("ImageLabel")
    DialogShadow.Name = "Shadow"
    DialogShadow.Image = "rbxassetid://1316045217"
    DialogShadow.Size = UDim2.new(1, 26, 1, 26)
    DialogShadow.Position = UDim2.new(0, -13, 0, -13)
    DialogShadow.BackgroundTransparency = 1
    DialogShadow.ImageTransparency = 0.5
    DialogShadow.ImageColor3 = SelectedTheme.Shadow
    DialogShadow.ScaleType = Enum.ScaleType.Slice
    DialogShadow.SliceCenter = Rect.new(10, 10, 118, 118)
    DialogShadow.ZIndex = 99
    DialogShadow.Parent = ChangelogDialog

    local DialogTitle = Instance.new("TextLabel")
    DialogTitle.Name = "Title"
    DialogTitle.Size = UDim2.new(1, -20, 0, 30)
    DialogTitle.Position = UDim2.new(0, 10, 0, 10)
    DialogTitle.BackgroundTransparency = 1
    DialogTitle.Text = dialogTitle
    DialogTitle.TextColor3 = SelectedTheme.TextColor
    DialogTitle.TextSize = isMobile and 20 or 24
    DialogTitle.Font = Enum.Font.SourceSansBold
    DialogTitle.TextXAlignment = Enum.TextXAlignment.Left
    DialogTitle.ZIndex = 101
    DialogTitle.Parent = ChangelogDialog

    local SearchBar, SearchStroke, SearchIcon, SearchInput
    if showSearchBar then
        SearchBar = Instance.new("Frame")
        SearchBar.Name = "Search"
        SearchBar.Size = UDim2.new(1, -20, 0, isMobile and 30 or 35)
        SearchBar.Position = UDim2.new(0, 10, 0, 45)
        SearchBar.BackgroundColor3 = SelectedTheme.TextColor
        SearchBar.BackgroundTransparency = 0.9
        SearchBar.ZIndex = 101
        SearchBar.Parent = ChangelogDialog

        local SearchCorner = Instance.new("UICorner")
        SearchCorner.CornerRadius = UDim.new(0, 4)
        SearchCorner.Parent = SearchBar

        SearchStroke = Instance.new("UIStroke")
        SearchStroke.Color = SelectedTheme.ElementStroke
        SearchStroke.Thickness = 1
        SearchStroke.Transparency = 0.8
        SearchStroke.Parent = SearchBar

        SearchIcon = Instance.new("ImageLabel")
        SearchIcon.Name = "SearchIcon"
        SearchIcon.Image = "rbxassetid://10734943674"
        SearchIcon.ImageColor3 = SelectedTheme.TextColor
        SearchIcon.ImageTransparency = 0.5
        SearchIcon.BackgroundTransparency = 1
        SearchIcon.Size = UDim2.new(0, isMobile and 18 or 20, 0, isMobile and 18 or 20)
        SearchIcon.Position = UDim2.new(0, 10, 0.5, isMobile and -9 or -10)
        SearchIcon.ZIndex = 102
        SearchIcon.Parent = SearchBar

        SearchInput = Instance.new("TextBox")
        SearchInput.Name = "Input"
        SearchInput.Text = ""
        SearchInput.PlaceholderText = "Search..."
        SearchInput.PlaceholderColor3 = (SelectedTheme.TextColor):Lerp(Color3.new(0, 0, 0), 0.5)
        SearchInput.TextColor3 = SelectedTheme.TextColor
        SearchInput.TextTransparency = 0.2
        SearchInput.TextSize = isMobile and 14 or 16
        SearchInput.Font = Enum.Font.SourceSans
        SearchInput.BackgroundTransparency = 1
        SearchInput.Size = UDim2.new(1, -40, 1, 0)
        SearchInput.Position = UDim2.new(0, 35, 0, 0)
        SearchInput.TextXAlignment = Enum.TextXAlignment.Left
        SearchInput.ZIndex = 102
        SearchInput.Parent = SearchBar
    end

    local ChangelogScroll = Instance.new("ScrollingFrame")
    ChangelogScroll.Name = "ChangelogScroll"
    ChangelogScroll.Size = UDim2.new(1, -20, 1, isMobile and (showSearchBar and -125 or -90) or (showSearchBar and -150 or -110))
    ChangelogScroll.Position = UDim2.new(0, 10, 0, isMobile and (showSearchBar and 85 or 50) or (showSearchBar and 90 or 50))
    ChangelogScroll.BackgroundTransparency = 1
    ChangelogScroll.ScrollBarThickness = isMobile and 3 or 4
    ChangelogScroll.ScrollBarImageColor3 = SelectedTheme.ElementStroke
    ChangelogScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    ChangelogScroll.ZIndex = 101
    ChangelogScroll.Parent = ChangelogDialog

    local ScrollListLayout = Instance.new("UIListLayout")
    ScrollListLayout.Padding = UDim.new(0, 5)
    ScrollListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ScrollListLayout.Parent = ChangelogScroll

    local function addTextLabel(text, isHeader, layoutOrder)
        local TextLabel = Instance.new("TextLabel")
        TextLabel.Size = UDim2.new(1, -10, 0, 0)
        TextLabel.AutomaticSize = Enum.AutomaticSize.Y
        TextLabel.BackgroundTransparency = 1
        TextLabel.Text = text
        TextLabel.TextColor3 = SelectedTheme.TextColor
        TextLabel.TextTransparency = 0
        TextLabel.TextSize = isMobile and (isHeader and 18 or 16) or (isHeader and 22 or 18)
        TextLabel.Font = isHeader and Enum.Font.SourceSansBold or Enum.Font.SourceSans
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel.TextWrapped = true
        TextLabel.LayoutOrder = layoutOrder
        TextLabel.ZIndex = 102
        
        if isHeader and (text:match("%[%+%]") or text:match("%[%-%]") or text:match("%[%*%]") or text:match("%[!%]") or text:match("%[%?%]")) then
            TextLabel.BackgroundTransparency = 0
            TextLabel.BackgroundColor3 = SelectedTheme.ElementBackgroundHover
            local HighlightCorner = Instance.new("UICorner")
            HighlightCorner.CornerRadius = UDim.new(0, 4)
            HighlightCorner.Parent = TextLabel
        end
        
        TextLabel.Parent = ChangelogScroll
        return TextLabel
    end

    local originalLabels = {}
    local layoutOrder = 0
    for line in changelogText:gmatch("[^\r\n]+") do
        line = line:match("^%s*(.-)%s*$")
        local isHeader = line:match("^%[%+%]") or line:match("^%[%-%]") or line:match("^%[%*%]") or line:match("^%[!%]") or line:match("^%[%?%]") or line:match("^Version:") or line:match("^Release Date:") or line:match("^What's New") or line:match("^Improvements") or line:match("^Bug Fixes") or line:match("^Known Issues") or line:match("^Notes")
        local label = addTextLabel(line, isHeader, layoutOrder)
        table.insert(originalLabels, {text = line, isHeader = isHeader, layoutOrder = layoutOrder})
        layoutOrder = layoutOrder + 1
    end

    ScrollListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ChangelogScroll.CanvasSize = UDim2.new(0, 0, 0, ScrollListLayout.AbsoluteContentSize.Y)
    end)

    if showSearchBar then
        SearchInput:GetPropertyChangedSignal("Text"):Connect(function()
            local query = SearchInput.Text:lower()
            for _, label in ipairs(ChangelogScroll:GetChildren()) do
                if label:IsA("TextLabel") then
                    label:Destroy()
                end
            end
            local newLayoutOrder = 0
            if query == "" then
                for _, entry in ipairs(originalLabels) do
                    addTextLabel(entry.text, entry.isHeader, newLayoutOrder)
                    newLayoutOrder = newLayoutOrder + 1
                end
            else
                for _, entry in ipairs(originalLabels) do
                    if entry.text:lower():find(query, 1, true) then
                        addTextLabel(entry.text, entry.isHeader, newLayoutOrder)
                        newLayoutOrder = newLayoutOrder + 1
                    end
                end
            end
        end)
    end

    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Size = UDim2.new(0, isMobile and 60 or 80, 0, isMobile and 25 or 30)
    CloseButton.Position = UDim2.new(1, isMobile and -70 or -90, 1, isMobile and -35 or -40)
    CloseButton.BackgroundColor3 = SelectedTheme.ElementBackground
    CloseButton.BackgroundTransparency = 0
    CloseButton.Text = "Close"
    CloseButton.TextColor3 = SelectedTheme.TextColor
    CloseButton.TextSize = isMobile and 16 or 18
    CloseButton.Font = Enum.Font.SourceSansBold
    CloseButton.ZIndex = 101
    CloseButton.Parent = ChangelogDialog

    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 4)
    CloseCorner.Parent = CloseButton

    local CloseStroke = Instance.new("UIStroke")
    CloseStroke.Color = SelectedTheme.ElementStroke
    CloseStroke.Thickness = 1
    CloseStroke.Parent = CloseButton

    CloseButton.MouseEnter:Connect(function()
        TweenService:Create(CloseButton, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
    end)
    CloseButton.MouseLeave:Connect(function()
        TweenService:Create(CloseButton, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    end)

    local AltButton = Instance.new("TextButton")
    AltButton.Name = "AltButton"
    AltButton.Size = UDim2.new(0, isMobile and 100 or 120, 0, isMobile and 25 or 30)
    AltButton.Position = UDim2.new(0, 10, 1, isMobile and -35 or -40)
    AltButton.BackgroundColor3 = SelectedTheme.ElementBackground
    AltButton.BackgroundTransparency = 0
    AltButton.Text = altButton.Name
    AltButton.TextColor3 = SelectedTheme.TextColor
    AltButton.TextSize = isMobile and 16 or 18
    AltButton.Font = Enum.Font.SourceSansBold
    AltButton.ZIndex = 101
    AltButton.Parent = ChangelogDialog

    local AltCorner = Instance.new("UICorner")
    AltCorner.CornerRadius = UDim.new(0, 4)
    AltCorner.Parent = AltButton

    local AltStroke = Instance.new("UIStroke")
    AltStroke.Color = SelectedTheme.ElementStroke
    AltStroke.Thickness = 1
    AltStroke.Parent = AltButton

    AltButton.MouseEnter:Connect(function()
        TweenService:Create(AltButton, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
    end)
    AltButton.MouseLeave:Connect(function()
        TweenService:Create(AltButton, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    end)

    AltButton.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(altButton.Clipboard)
            if notificationsEnabled then
                self:Notify(altButtonNotification.Success)
            end
        else
            if notificationsEnabled then
                self:Notify(altButtonNotification.Failure)
            end
        end
    end)

    local function showDialog()
        ChangelogDialog.Visible = true
        ChangelogDialog.Size = UDim2.new(0, 0, 0, 0)
        DialogShadow.ImageTransparency = 1
        DialogTitle.TextTransparency = 1
        CloseButton.TextTransparency = 1
        CloseButton.BackgroundTransparency = 0
        CloseStroke.Transparency = 1
        AltButton.TextTransparency = 1
        AltButton.BackgroundTransparency = 0
        AltStroke.Transparency = 1
        
        if showSearchBar then
            SearchBar.BackgroundTransparency = 1
            SearchStroke.Transparency = 1
            SearchIcon.ImageTransparency = 1
            SearchInput.TextTransparency = 1
        end
        
        TweenService:Create(ChangelogDialog, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, dialogWidth, 0, dialogHeight)}):Play()
        TweenService:Create(DialogShadow, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {ImageTransparency = 0.5}):Play()
        TweenService:Create(DialogTitle, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
        TweenService:Create(CloseButton, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 0, BackgroundTransparency = 0}):Play()
        TweenService:Create(CloseStroke, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
        TweenService:Create(AltButton, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 0, BackgroundTransparency = 0}):Play()
        TweenService:Create(AltStroke, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
        
        if showSearchBar then
            TweenService:Create(SearchBar, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.9}):Play()
            TweenService:Create(SearchStroke, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Transparency = 0.8}):Play()
            TweenService:Create(SearchIcon, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {ImageTransparency = 0.5}):Play()
            TweenService:Create(SearchInput, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 0.2}):Play()
        end
        
        for _, label in ipairs(ChangelogScroll:GetChildren()) do
            if label:IsA("TextLabel") then
                label.TextTransparency = 1
                local tween = TweenService:Create(label, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 0})
                tween:Play()
                task.wait(0.02)
            end
        end
    end

    local function hideDialog()
        TweenService:Create(ChangelogDialog, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {
            Size = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1
        }):Play()
        
        TweenService:Create(DialogShadow, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
        TweenService:Create(DialogTitle, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
        TweenService:Create(CloseButton, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1, BackgroundTransparency = 1}):Play()
        TweenService:Create(CloseStroke, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
        TweenService:Create(AltButton, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1, BackgroundTransparency = 1}):Play()
        TweenService:Create(AltStroke, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
        
        if showSearchBar then
            TweenService:Create(SearchBar, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
            TweenService:Create(SearchStroke, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
            TweenService:Create(SearchIcon, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
            TweenService:Create(SearchInput, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
        end
        
        for _, label in ipairs(ChangelogScroll:GetChildren()) do
            if label:IsA("TextLabel") then
                TweenService:Create(label, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
            end
        end

        task.wait(0.5)
        screenGui:Destroy()

        if notificationsEnabled then
            self:Notify(notification)
        end
    end

    CloseButton.MouseButton1Click:Connect(hideDialog)

    local dragging
    local dragInput
    local dragStart
    local startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        local newPosition = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        ChangelogDialog.Position = newPosition
    end

    ChangelogDialog.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = ChangelogDialog.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    ChangelogDialog.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)

    showDialog()
    
    return {
        Hide = hideDialog,
        Show = showDialog
    }
end

return SearchAndChangelogLibrary
