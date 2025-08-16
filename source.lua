local c00lploit = {}
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local function getObjGen()
    local objGen = {}

    local function getObjects()
        local function initObj()
            local Gui = {
                UIObjects = Instance.new("Folder"),
                TabsFolder = Instance.new("Folder"),
                MainWindow = Instance.new("Frame"),
                UICorner = Instance.new("UICorner"),
                Title = Instance.new("TextLabel"),
                VersionLabel = Instance.new("TextLabel"),
                Drag = Instance.new("TextButton"),
                SideTab = Instance.new("Frame"),
                SideTabList = Instance.new("UIListLayout"),
                ContentFolder = Instance.new("Folder"),
                NotificationFolder = Instance.new("Folder"),
                ButtonTemplate = Instance.new("Frame"),
                ButtonUICorner = Instance.new("UICorner"),
                ButtonText = Instance.new("TextLabel"),
                ToggleTemplate = Instance.new("Frame"),
                ToggleUICorner = Instance.new("UICorner"),
                ToggleFrame = Instance.new("Frame"),
                ToggleUIAspect = Instance.new("UIAspectRatioConstraint"),
                SliderTemplate = Instance.new("Frame"),
                SliderUICorner = Instance.new("UICorner"),
                SliderBar = Instance.new("Frame"),
                SliderFill = Instance.new("Frame"),
                SliderValue = Instance.new("TextLabel"),
                DropdownTemplate = Instance.new("Frame"),
                DropdownUICorner = Instance.new("UICorner"),
                DropdownButton = Instance.new("TextButton"),
                DropdownList = Instance.new("Frame")
            }

            Gui.UIObjects.Name = "UIObjects"
            Gui.UIObjects.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
            Gui.TabsFolder.Name = "Tabs"
            Gui.TabsFolder.Parent = Gui.UIObjects
            Gui.NotificationFolder.Name = "Notifications"
            Gui.NotificationFolder.Parent = Gui.UIObjects
            Gui.ContentFolder.Name = "Content"
            Gui.ContentFolder.Parent = Gui.UIObjects

            Gui.MainWindow.Name = "MainWindow"
            Gui.MainWindow.Size = UDim2.new(0,550,0,400)
            Gui.MainWindow.Position = UDim2.new(0.5,-275,0.5,-200)
            Gui.MainWindow.BackgroundColor3 = Color3.fromRGB(30,30,30)
            Gui.MainWindow.Parent = Gui.UIObjects
            Gui.UICorner.CornerRadius = UDim.new(0,15)
            Gui.UICorner.Parent = Gui.MainWindow

            Gui.Title.Size = UDim2.new(1,0,0,50)
            Gui.Title.BackgroundTransparency = 1
            Gui.Title.Text = "c00lploit"
            Gui.Title.TextColor3 = Color3.fromRGB(255,255,255)
            Gui.Title.Font = Enum.Font.GothamBold
            Gui.Title.TextScaled = true
            Gui.Title.Parent = Gui.MainWindow

            Gui.VersionLabel.Size = UDim2.new(0,80,0,20)
            Gui.VersionLabel.Position = UDim2.new(1,-90,0,10)
            Gui.VersionLabel.BackgroundTransparency = 1
            Gui.VersionLabel.Text = "v1.0.1"
            Gui.VersionLabel.TextColor3 = Color3.fromRGB(255,255,255)
            Gui.VersionLabel.Font = Enum.Font.Gotham
            Gui.VersionLabel.TextScaled = true
            Gui.VersionLabel.Parent = Gui.MainWindow

            Gui.Drag.Size = UDim2.new(1,0,0,50)
            Gui.Drag.BackgroundTransparency = 1
            Gui.Drag.Text = ""
            Gui.Drag.Parent = Gui.MainWindow
            local dragging, dragInput, dragStart, startPos
            Gui.Drag.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                    dragStart = input.Position
                    startPos = Gui.MainWindow.Position
                    input.Changed:Connect(function()
                        if input.UserInputState == Enum.UserInputState.End then dragging = false end
                    end)
                end
            end)
            Gui.Drag.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    dragInput = input
                end
            end)
            RunService.RenderStepped:Connect(function()
                if dragging and dragInput then
                    local delta = dragInput.Position - dragStart
                    Gui.MainWindow.Position = UDim2.new(startPos.X.Scale,startPos.X.Offset + delta.X,startPos.Y.Scale,startPos.Y.Offset + delta.Y)
                end
            end)

            Gui.SideTab.Size = UDim2.new(0,120,1,0)
            Gui.SideTab.BackgroundColor3 = Color3.fromRGB(40,40,40)
            Gui.SideTab.Parent = Gui.MainWindow
            Gui.SideTabList.FillDirection = Enum.FillDirection.Vertical
            Gui.SideTabList.SortOrder = Enum.SortOrder.LayoutOrder
            Gui.SideTabList.Padding = UDim.new(0,5)
            Gui.SideTabList.Parent = Gui.SideTab

            Gui.ButtonTemplate.Size = UDim2.new(0,200,0,50)
            Gui.ButtonTemplate.BackgroundColor3 = Color3.fromRGB(50,50,50)
            Gui.ButtonUICorner.CornerRadius = UDim.new(0,10)
            Gui.ButtonUICorner.Parent = Gui.ButtonTemplate
            Gui.ButtonText.Size = UDim2.new(1,0,1,0)
            Gui.ButtonText.BackgroundTransparency = 1
            Gui.ButtonText.TextColor3 = Color3.fromRGB(255,255,255)
            Gui.ButtonText.TextScaled = true
            Gui.ButtonText.Text = "Button"
            Gui.ButtonText.Parent = Gui.ButtonTemplate

            Gui.ToggleTemplate.Size = UDim2.new(0,50,0,25)
            Gui.ToggleTemplate.BackgroundColor3 = Color3.fromRGB(50,50,50)
            Gui.ToggleUICorner.CornerRadius = UDim.new(0,5)
            Gui.ToggleUICorner.Parent = Gui.ToggleTemplate
            Gui.ToggleFrame.Size = UDim2.new(0.7,0,0.7,0)
            Gui.ToggleFrame.BackgroundColor3 = Color3.fromRGB(0,170,255)
            Gui.ToggleFrame.Visible = false
            Gui.ToggleFrame.Parent = Gui.ToggleTemplate
            Gui.ToggleUIAspect.AspectRatio = 2
            Gui.ToggleUIAspect.Parent = Gui.ToggleFrame

            Gui.SliderTemplate.Size = UDim2.new(0,200,0,30)
            Gui.SliderTemplate.BackgroundColor3 = Color3.fromRGB(50,50,50)
            Gui.SliderUICorner.CornerRadius = UDim.new(0,5)
            Gui.SliderUICorner.Parent = Gui.SliderTemplate
            Gui.SliderBar.Size = UDim2.new(1,0,0.3,0)
            Gui.SliderBar.Position = UDim2.new(0,0,0.35,0)
            Gui.SliderBar.BackgroundColor3 = Color3.fromRGB(100,100,100)
            Gui.SliderBar.Parent = Gui.SliderTemplate
            Gui.SliderFill.Size = UDim2.new(0.5,0,1,0)
            Gui.SliderFill.BackgroundColor3 = Color3.fromRGB(0,170,255)
            Gui.SliderFill.Parent = Gui.SliderBar
            Gui.SliderValue.Size = UDim2.new(0,50,0,20)
            Gui.SliderValue.Position = UDim2.new(1,10,0,0)
            Gui.SliderValue.BackgroundTransparency = 1
            Gui.SliderValue.TextColor3 = Color3.fromRGB(255,255,255)
            Gui.SliderValue.TextScaled = true
            Gui.SliderValue.Text = "50%"
            Gui.SliderValue.Parent = Gui.SliderTemplate

            Gui.DropdownTemplate.Size = UDim2.new(0,200,0,50)
            Gui.DropdownTemplate.BackgroundColor3 = Color3.fromRGB(50,50,50)
            Gui.DropdownUICorner.CornerRadius = UDim.new(0,10)
            Gui.DropdownUICorner.Parent = Gui.DropdownTemplate
            Gui.DropdownButton.Size = UDim2.new(1,0,1,0)
            Gui.DropdownButton.Text = "Select"
            Gui.DropdownButton.BackgroundTransparency = 1
            Gui.DropdownButton.TextColor3 = Color3.fromRGB(255,255,255)
            Gui.DropdownButton.TextScaled = true
            Gui.DropdownButton.Parent = Gui.DropdownTemplate
            Gui.DropdownList.Size = UDim2.new(1,0,0,0)
            Gui.DropdownList.ClipsDescendants = true
            Gui.DropdownList.BackgroundColor3 = Color3.fromRGB(40,40,40)
            Gui.DropdownList.Parent = Gui.DropdownTemplate

            return Gui
        end
        return initObj()
    end

    objGen.getObjects = getObjects

    function objGen:CreateTab(name,parent)
        local tabBtn = Instance.new("TextButton")
        tabBtn.Size = UDim2.new(1,0,0,40)
        tabBtn.Text = name
        tabBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
        tabBtn.TextColor3 = Color3.fromRGB(255,255,255)
        tabBtn.TextScaled = true
        tabBtn.Parent = parent.SideTab
        local content = Instance.new("Folder")
        content.Name = name
        content.Parent = parent.ContentFolder
        return content, tabBtn
    end

    function objGen:CreateSection(name,parent)
        local frame = Instance.new("ScrollingFrame")
        frame.Name = name
        frame.Size = UDim2.new(0,400,0,350)
        frame.CanvasSize = UDim2.new(0,0,0,0)
        frame.BackgroundColor3 = Color3.fromRGB(35,35,35)
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0,10)
        corner.Parent = frame
        local layout = Instance.new("UIListLayout")
        layout.Padding = UDim.new(0,5)
        layout.SortOrder = Enum.SortOrder.LayoutOrder
        layout.Parent = frame
        frame.Parent = parent
        return frame
    end

    function objGen:CreateButton(name,parent,callback)
        local button = parent.ButtonTemplate:Clone()
        button.ButtonText.Text = name
        button.Parent = parent
        button.MouseEnter:Connect(function() button.BackgroundColor3 = Color3.fromRGB(70,70,70) end)
        button.MouseLeave:Connect(function() button.BackgroundColor3 = Color3.fromRGB(50,50,50) end)
        button.MouseButton1Click:Connect(callback)
        return button
    end

    function objGen:CreateToggle(name,parent,callback)
        local toggle = parent.ToggleTemplate:Clone()
        toggle.Parent = parent
        toggle.MouseEnter:Connect(function() toggle.BackgroundColor3 = Color3.fromRGB(70,70,70) end)
        toggle.MouseLeave:Connect(function() toggle.BackgroundColor3 = Color3.fromRGB(50,50,50) end)
        toggle.MouseButton1Click:Connect(function()
            toggle.ToggleFrame.Visible = not toggle.ToggleFrame.Visible
            callback(toggle.ToggleFrame.Visible)
        end)
        return toggle
    end

    function objGen:CreateSlider(name,parent,min,max,callback)
        local slider = parent.SliderTemplate:Clone()
        slider.Parent = parent
        local dragging = false
        slider.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true end
        end)
        slider.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
            end)
        slider.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
                local mouse = input.Position
                local barPos = slider.SliderBar.AbsolutePosition.X
                local barSize = slider.SliderBar.AbsoluteSize.X
                local ratio = math.clamp((mouse.X - barPos)/barSize,0,1)
                slider.SliderFill.Size = UDim2.new(ratio,0,1,0)
                local value = min + (max-min)*ratio
                slider.SliderValue.Text = tostring(math.floor(value))
                callback(value)
            end
        end)
        return slider
    end

    function objGen:CreateDropdown(name,parent,options,callback)
        local dd = parent.DropdownTemplate:Clone()
        dd.DropdownButton.Text = name
        dd.Parent = parent
        local open = false
        dd.DropdownButton.MouseButton1Click:Connect(function()
            open = not open
            dd.DropdownList:TweenSize(UDim2.new(1,0,0,open and #options*40 or 0),"Out","Quad",0.3,true)
        end)
        for i,opt in ipairs(options) do
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1,0,0,40)
            btn.Position = UDim2.new(0,0,(i-1)*40,0)
            btn.Text = opt
            btn.BackgroundColor3 = Color3.fromRGB(60,60,60)
            btn.TextColor3 = Color3.fromRGB(255,255,255)
            btn.TextScaled = true
            btn.Parent = dd.DropdownList
            btn.MouseEnter:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(80,80,80) end)
            btn.MouseLeave:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(60,60,60) end)
            btn.MouseButton1Click:Connect(function()
                dd.DropdownButton.Text = opt
                callback(opt)
                open = false
                dd.DropdownList:TweenSize(UDim2.new(1,0,0,0),"Out","Quad",0.3,true)
            end)
        end
        return dd
    end

    function objGen:Notify(parent,text)
        local notif = Instance.new("Frame")
        notif.Size = UDim2.new(0,250,0,50)
        notif.Position = UDim2.new(1,-260,0,10 + #parent.NotificationFolder:GetChildren()*60)
        notif.BackgroundColor3 = Color3.fromRGB(40,40,40)
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0,10)
        corner.Parent = notif
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1,0,1,0)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Color3.fromRGB(255,255,255)
        label.TextScaled = true
        label.Parent = notif
        notif.Parent = parent.NotificationFolder
        task.delay(3,function() notif:Destroy() end)
        return notif
    end

    return objGen
end

c00lploit.getObjGen = getObjGen
return c00lploit
