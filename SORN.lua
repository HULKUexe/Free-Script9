
local RadientPaid = {}
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local HttpService = game:GetService("HttpService")
local pfp
local user
local tag
local userinfo = {}
pcall(function()
   userinfo = HttpService:JSONDecode(readfile("Radient.txt"));
end)

pfp = userinfo["pfp"] or "https://www.roblox.com/headshot-thumbnail/image?userId=".. game.Players.LocalPlayer.UserId .."&width=420&height=420&format=png"
user =  userinfo["user"] or game.Players.LocalPlayer.Name
tag = userinfo["tag"] or tostring(math.random(1,10))

local function SaveInfo()
   userinfo["pfp"] = pfp
   userinfo["user"] = user
   userinfo["tag"] = tag
   writefile("Radient.txt", HttpService:JSONEncode(userinfo));
end

local function MakeDraggable(topbarobject, object)
   local Dragging = nil
   local DragInput = nil
   local DragStart = nil
   local StartPosition = nil

   local function Update(input)
      local Delta = input.Position - DragStart
      local pos =
         UDim2.new(StartPosition.X.Scale,StartPosition.X.Offset + Delta.X,StartPosition.Y.Scale,StartPosition.Y.Offset + Delta.Y)
      local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
      Tween:Play()
   end

   topbarobject.InputBegan:Connect(
      function(input)
         if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = true
            DragStart = input.Position
            StartPosition = object.Position

            input.Changed:Connect(function()
               if input.UserInputState == Enum.UserInputState.End then
                  Dragging = false
               end
            end)
         end
      end)

   topbarobject.InputChanged:Connect(
      function(input)
         if
            input.UserInputType == Enum.UserInputType.MouseMovement or
               input.UserInputType == Enum.UserInputType.Touch
         then
            DragInput = input
         end
      end)

   UserInputService.InputChanged:Connect(
      function(input)
         if input == DragInput and Dragging then
            Update(input)
         end
      end)
end

local RadientPaidSC = Instance.new("ScreenGui")
RadientPaidSC.Name = "FuckyouBicth"
RadientPaidSC.Parent = game.CoreGui
RadientPaidSC.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

game:GetService("UserInputService").InputBegan:connect(function(inputObject, gameProcessedEvent)
   if inputObject.KeyCode == Enum.KeyCode.RightControl then
      wait()
      RadientPaidSC.Enabled = not RadientPaidSC.Enabled
   end
end)

function RadientPaid:Window(text,maincolor)

   local currentservertoggled = ""
   local minimized = false
   local fs = false
   local settingsopened = false
   local MainFrame = Instance.new("Frame")
   local TopFrame = Instance.new("Frame")
   local Title = Instance.new("TextLabel")
   local CloseBtn = Instance.new("TextButton")
   local CloseIcon = Instance.new("ImageLabel")
   local MinimizeBtn = Instance.new("TextButton")
   local MinimizeIcon = Instance.new("ImageLabel")
   local ServersHolder = Instance.new("Folder")
   local Userpad = Instance.new("Frame")
   local UserIcon = Instance.new("Frame")
   local UserIconCorner = Instance.new("UICorner")
   local Corner_1 = Instance.new("UICorner")
   local UserImage = Instance.new("ImageLabel")
   local UserCircleImage = Instance.new("ImageLabel")
   local UserName = Instance.new("TextLabel")
   local UserTag = Instance.new("TextLabel")
   local ServersHoldFrame = Instance.new("Frame")
   local ServersHold = Instance.new("ScrollingFrame")
   local ServersHoldLayout = Instance.new("UIListLayout")
   local ServersHoldPadding = Instance.new("UIPadding")
   local TopFrameHolder = Instance.new("Frame")
   local TopFramess = Instance.new("Frame")

   MainFrame.Name = "MainFrame"
   MainFrame.Parent = RadientPaidSC
   MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
   MainFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
   MainFrame.BackgroundTransparency = 1
   MainFrame.BorderSizePixel = 0
   MainFrame.ClipsDescendants = true
   MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
   MainFrame.Size = UDim2.new(0, 611, 0, 396)

   Corner_1.CornerRadius = UDim.new(0, 7)
   Corner_1.Name = "UserIconCorner"
   Corner_1.Parent = MainFrame

   TopFrame.Name = "TopFrame"
   TopFrame.Parent = MainFrame
   TopFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)
   TopFrame.BackgroundTransparency = 1
   TopFrame.BorderSizePixel = 0
   TopFrame.Position = UDim2.new(-0.000658480625, 0, 0, 0)
   TopFrame.Size = UDim2.new(0, 681, 0, 22)

   TopFramess.Name = "TopFramess"
   TopFramess.Parent = TopFrame
   TopFramess.BackgroundColor3 = Color3.fromRGB(0,0,0)
   TopFramess.BackgroundTransparency = 1
   TopFramess.BorderSizePixel = 0
   TopFramess.ZIndex = 99
   TopFramess.Position = UDim2.new(-0.2, 0, 1.3, 0)
   TopFramess.Size = UDim2.new(0, 681, 0, 22)

   TopFrameHolder.Name = "TopFrameHolder"
   TopFrameHolder.Parent = TopFrame
   TopFrameHolder.BackgroundColor3 = Color3.fromRGB(20,20,20)
   TopFrameHolder.BackgroundTransparency = 1.000
   TopFrameHolder.BorderSizePixel = 0
   TopFrameHolder.Position = UDim2.new(-0.000658480625, 0, 0, 0)
   TopFrameHolder.Size = UDim2.new(0, 20, 0, 22)


   Title.Name = "Title"
   Title.Parent = TopFrame
   Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   Title.BackgroundTransparency = 1.000
   Title.Position = UDim2.new(0.0102790017, 0, 0, 0)
   Title.Size = UDim2.new(0, 192, 0, 23)
   Title.Font = Enum.Font.GothamBold
   Title.Text = text
   Title.TextTransparency = 0
   Title.TextColor3 = Color3.fromRGB(255,255,255)
   Title.TextSize = 13.000
   Title.TextXAlignment = Enum.TextXAlignment.Left

   CloseBtn.Name = "CloseBtn"
   CloseBtn.Parent = TopFrame
   CloseBtn.BackgroundColor3 = Color3.fromRGB(15,15,15)
   CloseBtn.BackgroundTransparency = 1
   CloseBtn.Position = UDim2.new(0.85, 0, 1.3, 0)
   CloseBtn.Size = UDim2.new(0, 28, 0, 22)
   CloseBtn.Font = Enum.Font.Gotham
   CloseBtn.Text = ""
   CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
   CloseBtn.TextSize = 14.000
   CloseBtn.BorderSizePixel = 0
   CloseBtn.AutoButtonColor = false

   CloseIcon.Name = "CloseIcon"
   CloseIcon.Parent = CloseBtn
   CloseIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   CloseIcon.BackgroundTransparency = 1.000
   CloseIcon.Position = UDim2.new(0.2, 0, 0.128935531, 0)
   CloseIcon.Size = UDim2.new(0, 17, 0, 17)
   CloseIcon.Image = "http://www.roblox.com/asset/?id=6035047409"
   CloseIcon.ImageColor3 = Color3.fromRGB(220, 221, 222)

   MinimizeBtn.Name = "MinimizeButton"
   MinimizeBtn.Parent = TopFrame
   MinimizeBtn.BackgroundColor3 = Color3.fromRGB(15,15,15)
   MinimizeBtn.BackgroundTransparency = 1
   MinimizeBtn.Position = UDim2.new(0.8, 0, 1.3, 0)
   MinimizeBtn.Size = UDim2.new(0, 28, 0, 22)
   MinimizeBtn.Font = Enum.Font.Gotham
   MinimizeBtn.Text = ""
   MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
   MinimizeBtn.TextSize = 14.000
   MinimizeBtn.BorderSizePixel = 0
   MinimizeBtn.AutoButtonColor = false

   MinimizeIcon.Name = "MinimizeLabel"
   MinimizeIcon.Parent = MinimizeBtn
   MinimizeIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   MinimizeIcon.BackgroundTransparency = 1.000
   MinimizeIcon.Position = UDim2.new(0.2, 0, 0.128935531, 0)
   MinimizeIcon.Size = UDim2.new(0, 17, 0, 17)
   MinimizeIcon.Image = "http://www.roblox.com/asset/?id=6035067836"
   MinimizeIcon.ImageColor3 = Color3.fromRGB(220, 221, 222)

   ServersHolder.Name = "ServersHolder"
   ServersHolder.Parent = TopFrameHolder

   Userpad.Name = "Userpad"
   Userpad.Parent = TopFrameHolder
   Userpad.BackgroundColor3 = Color3.fromRGB(20,20,20)
   Userpad.BorderSizePixel = 0
   Userpad.Position = UDim2.new(0.106243297, 0, 15.9807148, 0)
   Userpad.Size = UDim2.new(0, 179, 0, 43)

   UserIcon.Name = "UserIcon"
   UserIcon.Parent = Userpad
   UserIcon.BackgroundColor3 = Color3.fromRGB(20,20,20)
   UserIcon.BorderSizePixel = 0
   UserIcon.Position = UDim2.new(0.0340000018, 0, 0.123999998, 0)
   UserIcon.Size = UDim2.new(0, 32, 0, 32)

   UserIconCorner.CornerRadius = UDim.new(1, 8)
   UserIconCorner.Name = "UserIconCorner"
   UserIconCorner.Parent = UserIcon

   UserImage.Name = "UserImage"
   UserImage.Parent = UserIcon
   UserImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   UserImage.BackgroundTransparency = 1.000
   UserImage.Size = UDim2.new(0, 32, 0, 32)
   UserImage.Image = " "

   UserCircleImage.Name = "UserImage"
   UserCircleImage.Parent = UserImage
   UserCircleImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   UserCircleImage.BackgroundTransparency = 1.000
   UserCircleImage.Size = UDim2.new(0, 32, 0, 32)
   UserCircleImage.Image = "rbxassetid://4031889928"
   UserCircleImage.ImageColor3 = Color3.fromRGB(20,20,20)

   UserName.Name = "UserName"
   UserName.Parent = Userpad
   UserName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   UserName.BackgroundTransparency = 1.000
   UserName.BorderSizePixel = 0
   UserName.Position = UDim2.new(0.230000004, 0, 0.115999997, 0)
   UserName.Size = UDim2.new(0, 98, 0, 17)
   UserName.Font = Enum.Font.GothamSemibold
   UserName.TextSize = 13.000
   UserName.TextTransparency = 1
   UserName.TextXAlignment = Enum.TextXAlignment.Left
   UserName.ClipsDescendants = true

   UserTag.Name = "UserTag"
   UserTag.Parent = Userpad
   UserTag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   UserTag.BackgroundTransparency = 1.000
   UserTag.BorderSizePixel = 0
   UserTag.Position = UDim2.new(0.230000004, 0, 0.275000013, 0)
   UserTag.Size = UDim2.new(0, 95, 0, 17)
   UserTag.Font = Enum.Font.GothamBold
   UserTag.TextColor3 = Color3.fromRGB(0, 255, 0)
   UserTag.TextSize = 14.000
   UserTag.TextTransparency = 0
   UserTag.TextXAlignment = Enum.TextXAlignment.Left

   UserName.Text = "HULK U HUB"
   UserTag.Text = "" .. "Version • 2.0"

   ServersHoldFrame.Name = "ServersHoldFrame"
   ServersHoldFrame.Parent = MainFrame
   ServersHoldFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   ServersHoldFrame.BackgroundTransparency = 1.000
   ServersHoldFrame.BorderColor3 = Color3.fromRGB(20,20,20)
   ServersHoldFrame.Size = UDim2.new(0, 71, 0, 396)

   ServersHold.Name = "ServersHold"
   ServersHold.Parent = ServersHoldFrame
   ServersHold.Active = true
   ServersHold.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   ServersHold.BackgroundTransparency = 1.000
   ServersHold.BorderSizePixel = 0
   ServersHold.Position = UDim2.new(-0.000359333731, 0, 0.0580808073, 0)
   ServersHold.Size = UDim2.new(0, 71, 0, 373)
   ServersHold.ScrollBarThickness = 1
   ServersHold.ScrollBarImageTransparency = 1
   ServersHold.CanvasSize = UDim2.new(0, 0, 0, 0)

   ServersHoldLayout.Name = "ServersHoldLayout"
   ServersHoldLayout.Parent = ServersHold
   ServersHoldLayout.SortOrder = Enum.SortOrder.LayoutOrder
   ServersHoldLayout.Padding = UDim.new(0, 7)

   ServersHoldPadding.Name = "ServersHoldPadding"
   ServersHoldPadding.Parent = ServersHold

   CloseBtn.MouseButton1Click:Connect(
      function()
         MainFrame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .5, true)
      end
   )

   CloseBtn.MouseEnter:Connect(
      function()
         CloseBtn.BackgroundColor3 = Color3.fromRGB(15,15,15)
      end
   )

   CloseBtn.MouseLeave:Connect(
      function()
         CloseBtn.BackgroundColor3 = Color3.fromRGB(15,15,15)
      end
   )

   MinimizeBtn.MouseEnter:Connect(
      function()
         MinimizeBtn.BackgroundColor3 = Color3.fromRGB(15,15,15)
      end
   )

   MinimizeBtn.MouseLeave:Connect(
      function()
         MinimizeBtn.BackgroundColor3 = Color3.fromRGB(15,15,15)
      end
   )

   MinimizeBtn.MouseButton1Click:Connect(
      function()
         if minimized == false then
            MainFrame:TweenSize(
               UDim2.new(0, 611, 0, 64),
               Enum.EasingDirection.Out,
               Enum.EasingStyle.Quart,
               .3,
               true
            )
         else
            MainFrame:TweenSize(
               UDim2.new(0, 611, 0, 396),
               Enum.EasingDirection.Out,
               Enum.EasingStyle.Quart,
               .3,
               true
            )
         end
         minimized = not minimized
      end
   )

   local SettingsOpenBtn = Instance.new("TextButton")
   local SettingsOpenBtnIco = Instance.new("ImageLabel")

   SettingsOpenBtn.Name = "SettingsOpenBtn"
   SettingsOpenBtn.Parent = Userpad
   SettingsOpenBtn.BackgroundColor3 = Color3.fromRGB(53, 56, 62)
   SettingsOpenBtn.BackgroundTransparency = 1.000
   SettingsOpenBtn.Position = UDim2.new(0.849161983, 0, 0.279069781, 0)
   SettingsOpenBtn.Size = UDim2.new(0, 0, 0, 0)
   SettingsOpenBtn.Font = Enum.Font.SourceSans
   SettingsOpenBtn.Text = ""
   SettingsOpenBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
   SettingsOpenBtn.TextSize = 14.000

   SettingsOpenBtnIco.Name = "SettingsOpenBtnIco"
   SettingsOpenBtnIco.Parent = SettingsOpenBtn
   SettingsOpenBtnIco.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
   SettingsOpenBtnIco.BackgroundTransparency = 1.000
   SettingsOpenBtnIco.Size = UDim2.new(0, 0, 0, 0)
   SettingsOpenBtnIco.ImageTransparency = 1
   SettingsOpenBtnIco.Image = "http://www.roblox.com/asset/?id=6031280882"
   SettingsOpenBtnIco.ImageColor3 = Color3.fromRGB(220, 220, 220)
   local SettingsFrame = Instance.new("Frame")
   local Settings = Instance.new("Frame")
   local SettingsHolder = Instance.new("Frame")
   local CloseSettingsBtn = Instance.new("TextButton")
   local CloseSettingsBtnCorner = Instance.new("UICorner")
   local CloseSettingsBtnCircle = Instance.new("Frame")
   local CloseSettingsBtnCircleCorner = Instance.new("UICorner")
   local CloseSettingsBtnIcon = Instance.new("ImageLabel")
   local TextLabel = Instance.new("TextLabel")
   local UserPanel = Instance.new("Frame")
   local UserSettingsPad = Instance.new("Frame")
   local UserSettingsPadCorner = Instance.new("UICorner")
   local UsernameText = Instance.new("TextLabel")
   local UserSettingsPadUserTag = Instance.new("Frame")
   local UserSettingsPadUser = Instance.new("TextLabel")
   local UserSettingsPadUserTagLayout = Instance.new("UIListLayout")
   local UserSettingsPadTag = Instance.new("TextLabel")
   local EditBtn = Instance.new("TextButton")
   local EditBtnCorner = Instance.new("UICorner")
   local UserPanelUserIcon = Instance.new("TextButton")
   local UserPanelUserImage = Instance.new("ImageLabel")
   local UserPanelUserCircle = Instance.new("ImageLabel")
   local BlackFrame = Instance.new("Frame")
   local BlackFrameCorner = Instance.new("UICorner")
   local ChangeAvatarText = Instance.new("TextLabel")
   local SearchIcoFrame = Instance.new("Frame")
   local SearchIcoFrameCorner = Instance.new("UICorner")
   local SearchIco = Instance.new("ImageLabel")
   local UserPanelUserTag = Instance.new("Frame")
   local UserPanelUser = Instance.new("TextLabel")
   local UserPanelUserTagLayout = Instance.new("UIListLayout")
   local UserPanelTag = Instance.new("TextLabel")
   local UserPanelCorner = Instance.new("UICorner")
   local LeftFrame = Instance.new("Frame")
   local MyAccountBtn = Instance.new("TextButton")
   local MyAccountBtnCorner = Instance.new("UICorner")
   local MyAccountBtnTitle = Instance.new("TextLabel")
   local SettingsTitle = Instance.new("TextLabel")
   local DiscordInfo = Instance.new("TextLabel")
   local CurrentSettingOpen = Instance.new("TextLabel")

   SettingsFrame.Name = "SettingsFrame"
   SettingsFrame.Parent = MainFrame
   SettingsFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
   SettingsFrame.BackgroundTransparency = 1.000
   SettingsFrame.Size = UDim2.new(0, 681, 0, 396)
   SettingsFrame.Visible = false

   Settings.Name = "Settings"
   Settings.Parent = SettingsFrame
   Settings.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
   Settings.BorderSizePixel = 0
   Settings.Position = UDim2.new(0, 0, 0.0530303046, 0)
   Settings.Size = UDim2.new(0, 681, 0, 375)

   SettingsHolder.Name = "SettingsHolder"
   SettingsHolder.Parent = Settings
   SettingsHolder.AnchorPoint = Vector2.new(0.5, 0.5)
   SettingsHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   SettingsHolder.BackgroundTransparency = 1.000
   SettingsHolder.ClipsDescendants = true
   SettingsHolder.Position = UDim2.new(0.49926579, 0, 0.498666674, 0)
   SettingsHolder.Size = UDim2.new(0, 0, 0, 0)

   CloseSettingsBtn.Name = "CloseSettingsBtn"
   CloseSettingsBtn.Parent = SettingsHolder
   CloseSettingsBtn.AnchorPoint = Vector2.new(0.5, 0.5)
   CloseSettingsBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
   CloseSettingsBtn.Position = UDim2.new(0.952967286, 0, 0.0853333324, 0)
   CloseSettingsBtn.Selectable = false
   CloseSettingsBtn.Size = UDim2.new(0, 30, 0, 30)
   CloseSettingsBtn.AutoButtonColor = false
   CloseSettingsBtn.Font = Enum.Font.SourceSans
   CloseSettingsBtn.Text = ""
   CloseSettingsBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
   CloseSettingsBtn.TextSize = 14.000

   CloseSettingsBtnCorner.CornerRadius = UDim.new(1, 0)
   CloseSettingsBtnCorner.Name = "CloseSettingsBtnCorner"
   CloseSettingsBtnCorner.Parent = CloseSettingsBtn

   CloseSettingsBtnCircle.Name = "CloseSettingsBtnCircle"
   CloseSettingsBtnCircle.Parent = CloseSettingsBtn
   CloseSettingsBtnCircle.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
   CloseSettingsBtnCircle.Position = UDim2.new(0.0879999995, 0, 0.118000001, 0)
   CloseSettingsBtnCircle.Size = UDim2.new(0, 24, 0, 24)

   CloseSettingsBtnCircleCorner.CornerRadius = UDim.new(1, 0)
   CloseSettingsBtnCircleCorner.Name = "CloseSettingsBtnCircleCorner"
   CloseSettingsBtnCircleCorner.Parent = CloseSettingsBtnCircle

   CloseSettingsBtnIcon.Name = "CloseSettingsBtnIcon"
   CloseSettingsBtnIcon.Parent = CloseSettingsBtnCircle
   CloseSettingsBtnIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   CloseSettingsBtnIcon.BackgroundTransparency = 1.000
   CloseSettingsBtnIcon.Position = UDim2.new(0, 2, 0, 2)
   CloseSettingsBtnIcon.Size = UDim2.new(0, 19, 0, 19)
   CloseSettingsBtnIcon.Image = "http://www.roblox.com/asset/?id=6035047409"
   CloseSettingsBtnIcon.ImageColor3 = Color3.fromRGB(222, 222, 222)

   CloseSettingsBtn.MouseButton1Click:Connect(function()
      settingsopened = false
      TopFrameHolder.Visible = true
      ServersHoldFrame.Visible = true
      SettingsHolder:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
      TweenService:Create(
         Settings,
         TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
         {BackgroundTransparency = 1}
      ):Play()
      for i,v in next, SettingsHolder:GetChildren() do
         TweenService:Create(
            v,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 1}
         ):Play()
      end
      wait(.3)
      SettingsFrame.Visible = false
   end)

   CloseSettingsBtn.MouseEnter:Connect(function()
      CloseSettingsBtnCircle.BackgroundColor3 = Color3.fromRGB(72,76,82)
   end)

   CloseSettingsBtn.MouseLeave:Connect(function()
      CloseSettingsBtnCircle.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
   end)

   UserInputService.InputBegan:Connect(
      function(io, p)
         if io.KeyCode == Enum.KeyCode.RightControl then
            if settingsopened == true then
               settingsopened = false
               TopFrameHolder.Visible = true
               ServersHoldFrame.Visible = true
               SettingsHolder:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
               TweenService:Create(
                  Settings,
                  TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                  {BackgroundTransparency = 1}
               ):Play()
               for i,v in next, SettingsHolder:GetChildren() do
                  TweenService:Create(
                     v,
                     TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                     {BackgroundTransparency = 1}
                  ):Play()
               end
               wait(.3)
               SettingsFrame.Visible = false
            end
         end
      end
   )

   TextLabel.Parent = CloseSettingsBtn
   TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   TextLabel.BackgroundTransparency = 1.000
   TextLabel.Position = UDim2.new(-0.0666666701, 0, 1.06666672, 0)
   TextLabel.Size = UDim2.new(0, 34, 0, 22)
   TextLabel.Font = Enum.Font.GothamSemibold
   TextLabel.Text = "rightctrl"
   TextLabel.TextColor3 = Color3.fromRGB(113, 117, 123)
   TextLabel.TextSize = 11.000

   UserPanel.Name = "UserPanel"
   UserPanel.Parent = SettingsHolder
   UserPanel.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
   UserPanel.Position = UDim2.new(0.365638763, 0, 0.130666673, 0)
   UserPanel.Size = UDim2.new(0, 362, 0, 164)

   UserSettingsPad.Name = "UserSettingsPad"
   UserSettingsPad.Parent = UserPanel
   UserSettingsPad.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
   UserSettingsPad.Position = UDim2.new(0.0331491716, 0, 0.568140388, 0)
   UserSettingsPad.Size = UDim2.new(0, 337, 0, 56)

   UserSettingsPadCorner.Name = "UserSettingsPadCorner"
   UserSettingsPadCorner.Parent = UserSettingsPad

   UsernameText.Name = "UsernameText"
   UsernameText.Parent = UserSettingsPad
   UsernameText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   UsernameText.BackgroundTransparency = 1.000
   UsernameText.Position = UDim2.new(0.0419999994, 0, 0.154714286, 0)
   UsernameText.Size = UDim2.new(0, 65, 0, 19)
   UsernameText.Font = Enum.Font.GothamBold
   UsernameText.Text = "USERNAME"
   UsernameText.TextColor3 = Color3.fromRGB(126, 130, 136)
   UsernameText.TextSize = 11.000
   UsernameText.TextXAlignment = Enum.TextXAlignment.Left

   UserSettingsPadUserTag.Name = "UserSettingsPadUserTag"
   UserSettingsPadUserTag.Parent = UserSettingsPad
   UserSettingsPadUserTag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   UserSettingsPadUserTag.BackgroundTransparency = 1.000
   UserSettingsPadUserTag.Position = UDim2.new(0.0419999994, 0, 0.493999988, 0)
   UserSettingsPadUserTag.Size = UDim2.new(0, 65, 0, 19)

   UserSettingsPadUser.Name = "UserSettingsPadUser"
   UserSettingsPadUser.Parent = UserSettingsPadUserTag
   UserSettingsPadUser.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   UserSettingsPadUser.BackgroundTransparency = 1.000
   UserSettingsPadUser.Font = Enum.Font.Gotham
   UserSettingsPadUser.TextColor3 = Color3.fromRGB(255, 255, 255)
   UserSettingsPadUser.TextSize = 13.000
   UserSettingsPadUser.TextXAlignment = Enum.TextXAlignment.Left
   UserSettingsPadUser.Text = user
   UserSettingsPadUser.Size = UDim2.new(0, UserSettingsPadUser.TextBounds.X + 2, 0, 19)

   UserSettingsPadUserTagLayout.Name = "UserSettingsPadUserTagLayout"
   UserSettingsPadUserTagLayout.Parent = UserSettingsPadUserTag
   UserSettingsPadUserTagLayout.FillDirection = Enum.FillDirection.Horizontal
   UserSettingsPadUserTagLayout.SortOrder = Enum.SortOrder.LayoutOrder

   UserSettingsPadTag.Name = "UserSettingsPadTag"
   UserSettingsPadTag.Parent = UserSettingsPadUserTag
   UserSettingsPadTag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   UserSettingsPadTag.BackgroundTransparency = 1.000
   UserSettingsPadTag.Position = UDim2.new(0.0419999994, 0, 0.493999988, 0)
   UserSettingsPadTag.Size = UDim2.new(0, 65, 0, 19)
   UserSettingsPadTag.Font = Enum.Font.Gotham
   UserSettingsPadTag.Text = "#" .. tag
   UserSettingsPadTag.TextColor3 = Color3.fromRGB(184, 186, 189)
   UserSettingsPadTag.TextSize = 13.000
   UserSettingsPadTag.TextXAlignment = Enum.TextXAlignment.Left

   EditBtn.Name = "EditBtn"
   EditBtn.Parent = UserSettingsPad
   EditBtn.BackgroundColor3 = Color3.fromRGB(116, 127, 141)
   EditBtn.Position = UDim2.new(0.797671914, 0, 0.232142866, 0)
   EditBtn.Size = UDim2.new(0, 55, 0, 30)
   EditBtn.Font = Enum.Font.Gotham
   EditBtn.Text = "Edit"
   EditBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
   EditBtn.TextSize = 14.000
   EditBtn.AutoButtonColor = false

   EditBtn.MouseEnter:Connect(function()
      TweenService:Create(
         EditBtn,
         TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
         {BackgroundColor3 = Color3.fromRGB(104,114,127)}
      ):Play()
   end)

   EditBtn.MouseLeave:Connect(function()
      TweenService:Create(
         EditBtn,
         TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
         {BackgroundColor3 = Color3.fromRGB(116, 127, 141)}
      ):Play()
   end)

   EditBtnCorner.CornerRadius = UDim.new(0, 3)
   EditBtnCorner.Name = "EditBtnCorner"
   EditBtnCorner.Parent = EditBtn

   UserPanelUserIcon.Name = "UserPanelUserIcon"
   UserPanelUserIcon.Parent = UserPanel
   UserPanelUserIcon.BackgroundColor3 = Color3.fromRGB(31, 33, 36)
   UserPanelUserIcon.BorderSizePixel = 0
   UserPanelUserIcon.Position = UDim2.new(0.0340000018, 0, 0.074000001, 0)
   UserPanelUserIcon.Size = UDim2.new(0, 71, 0, 71)
   UserPanelUserIcon.AutoButtonColor = false
   UserPanelUserIcon.Text = ""

   UserPanelUserImage.Name = "UserPanelUserImage"
   UserPanelUserImage.Parent = UserPanelUserIcon
   UserPanelUserImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   UserPanelUserImage.BackgroundTransparency = 1.000
   UserPanelUserImage.Size = UDim2.new(0, 71, 0, 71)
   UserPanelUserImage.Image = pfp

   UserPanelUserCircle.Name = "UserPanelUserCircle"
   UserPanelUserCircle.Parent = UserPanelUserImage
   UserPanelUserCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   UserPanelUserCircle.BackgroundTransparency = 1.000
   UserPanelUserCircle.Size = UDim2.new(0, 71, 0, 71)
   UserPanelUserCircle.Image = "rbxassetid://4031889928"
   UserPanelUserCircle.ImageColor3 = Color3.fromRGB(47, 49, 54)

   BlackFrame.Name = "BlackFrame"
   BlackFrame.Parent = UserPanelUserIcon
   BlackFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
   BlackFrame.BackgroundTransparency = 0.400
   BlackFrame.BorderSizePixel = 0
   BlackFrame.Size = UDim2.new(0, 71, 0, 71)
   BlackFrame.Visible = false

   BlackFrameCorner.CornerRadius = UDim.new(1, 8)
   BlackFrameCorner.Name = "BlackFrameCorner"
   BlackFrameCorner.Parent = BlackFrame

   ChangeAvatarText.Name = "ChangeAvatarText"
   ChangeAvatarText.Parent = BlackFrame
   ChangeAvatarText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   ChangeAvatarText.BackgroundTransparency = 1.000
   ChangeAvatarText.Size = UDim2.new(0, 71, 0, 71)
   ChangeAvatarText.Font = Enum.Font.GothamBold
   ChangeAvatarText.Text = "CHAGNE    AVATAR"
   ChangeAvatarText.TextColor3 = Color3.fromRGB(255, 255, 255)
   ChangeAvatarText.TextSize = 11.000
   ChangeAvatarText.TextWrapped = true

   SearchIcoFrame.Name = "SearchIcoFrame"
   SearchIcoFrame.Parent = UserPanelUserIcon
   SearchIcoFrame.BackgroundColor3 = Color3.fromRGB(222, 222, 222)
   SearchIcoFrame.Position = UDim2.new(0.657999992, 0, 0, 0)
   SearchIcoFrame.Size = UDim2.new(0, 20, 0, 20)

   SearchIcoFrameCorner.CornerRadius = UDim.new(1, 8)
   SearchIcoFrameCorner.Name = "SearchIcoFrameCorner"
   SearchIcoFrameCorner.Parent = SearchIcoFrame

   SearchIco.Name = "SearchIco"
   SearchIco.Parent = SearchIcoFrame
   SearchIco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   SearchIco.BackgroundTransparency = 1.000
   SearchIco.Position = UDim2.new(0.150000006, 0, 0.100000001, 0)
   SearchIco.Size = UDim2.new(0, 15, 0, 15)
   SearchIco.Image = "http://www.roblox.com/asset/?id=6034407084"
   SearchIco.ImageColor3 = Color3.fromRGB(114, 118, 125)

   UserPanelUserIcon.MouseEnter:Connect(function()
      BlackFrame.Visible = true
   end)

   UserPanelUserIcon.MouseLeave:Connect(function()
      BlackFrame.Visible = false
   end)

   UserPanelUserIcon.MouseButton1Click:Connect(function()
      local NotificationHolder = Instance.new("TextButton")
      NotificationHolder.Name = "NotificationHolder"
      NotificationHolder.Parent = SettingsHolder
      NotificationHolder.BackgroundColor3 = Color3.fromRGB(22,22,22)
      NotificationHolder.Position = UDim2.new(-0.00881057233, 0, -0.00266666664, 0)
      NotificationHolder.Size = UDim2.new(0, 687, 0, 375)
      NotificationHolder.AutoButtonColor = false
      NotificationHolder.Font = Enum.Font.SourceSans
      NotificationHolder.Text = ""
      NotificationHolder.TextColor3 = Color3.fromRGB(0, 0, 0)
      NotificationHolder.TextSize = 14.000
      NotificationHolder.BackgroundTransparency = 1
      NotificationHolder.Visible = true
      TweenService:Create(
         NotificationHolder,
         TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
         {BackgroundTransparency = 0.2}
      ):Play()



      local AvatarChange = Instance.new("Frame")
      local UserChangeCorner = Instance.new("UICorner")
      local UnderBar = Instance.new("Frame")
      local UnderBarCorner = Instance.new("UICorner")
      local UnderBarFrame = Instance.new("Frame")
      local Text1 = Instance.new("TextLabel")
      local Text2 = Instance.new("TextLabel")
      local TextBoxFrame = Instance.new("Frame")
      local TextBoxFrameCorner = Instance.new("UICorner")
      local TextBoxFrame1 = Instance.new("Frame")
      local TextBoxFrame1Corner = Instance.new("UICorner")
      local AvatarTextbox = Instance.new("TextBox")
      local ChangeBtn = Instance.new("TextButton")
      local ChangeCorner = Instance.new("UICorner")
      local CloseBtn2 = Instance.new("TextButton")
      local Close2Icon = Instance.new("ImageLabel")
      local CloseBtn1 = Instance.new("TextButton")
      local CloseBtn1Corner = Instance.new("UICorner")
      local ResetBtn = Instance.new("TextButton")
      local ResetCorner = Instance.new("UICorner")


      AvatarChange.Name = "AvatarChange"
      AvatarChange.Parent = NotificationHolder
      AvatarChange.AnchorPoint = Vector2.new(0.5, 0.5)
      AvatarChange.BackgroundColor3 = Color3.fromRGB(20,20,20)
      AvatarChange.ClipsDescendants = true
      AvatarChange.Position = UDim2.new(0.513071597, 0, 0.4746176, 0)
      AvatarChange.Size = UDim2.new(0, 0, 0, 0)
      AvatarChange.BackgroundTransparency = 1

      AvatarChange:TweenSize(UDim2.new(0, 346, 0, 198), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
      TweenService:Create(
         AvatarChange,
         TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
         {BackgroundTransparency = 0}
      ):Play()


      UserChangeCorner.CornerRadius = UDim.new(0, 5)
      UserChangeCorner.Name = "UserChangeCorner"
      UserChangeCorner.Parent = AvatarChange

      UnderBar.Name = "UnderBar"
      UnderBar.Parent = AvatarChange
      UnderBar.BackgroundColor3 = Color3.fromRGB(25,25,25)
      UnderBar.Position = UDim2.new(-0.000297061284, 0, 0.945048928, 0)
      UnderBar.Size = UDim2.new(0, 346, 0, 13)

      UnderBarCorner.CornerRadius = UDim.new(0, 5)
      UnderBarCorner.Name = "UnderBarCorner"
      UnderBarCorner.Parent = UnderBar

      UnderBarFrame.Name = "UnderBarFrame"
      UnderBarFrame.Parent = UnderBar
      UnderBarFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
      UnderBarFrame.BorderSizePixel = 0
      UnderBarFrame.Position = UDim2.new(-0.000297061284, 0, -2.53846145, 0)
      UnderBarFrame.Size = UDim2.new(0, 346, 0, 39)

      Text1.Name = "Text1"
      Text1.Parent = AvatarChange
      Text1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      Text1.BackgroundTransparency = 1.000
      Text1.Position = UDim2.new(-0.000594122568, 0, 0.0202020202, 0)
      Text1.Size = UDim2.new(0, 346, 0, 68)
      Text1.Font = Enum.Font.GothamSemibold
      Text1.Text = "Change your avatar"
      Text1.TextColor3 = Color3.fromRGB(255, 255, 255)
      Text1.TextSize = 20.000

      Text2.Name = "Text2"
      Text2.Parent = AvatarChange
      Text2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      Text2.BackgroundTransparency = 1.000
      Text2.Position = UDim2.new(-0.000594122568, 0, 0.141587839, 0)
      Text2.Size = UDim2.new(0, 346, 0, 63)
      Text2.Font = Enum.Font.Gotham
      Text2.Text = "Enter your new profile in a Roblox decal link."
      Text2.TextColor3 = Color3.fromRGB(171, 172, 176)
      Text2.TextSize = 14.000

      TextBoxFrame.Name = "TextBoxFrame"
      TextBoxFrame.Parent = AvatarChange
      TextBoxFrame.AnchorPoint = Vector2.new(0.5, 0.5)
      TextBoxFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
      TextBoxFrame.Position = UDim2.new(0.49710983, 0, 0.560606062, 0)
      TextBoxFrame.Size = UDim2.new(0, 319, 0, 38)

      TextBoxFrameCorner.CornerRadius = UDim.new(0, 3)
      TextBoxFrameCorner.Name = "TextBoxFrameCorner"
      TextBoxFrameCorner.Parent = TextBoxFrame

      TextBoxFrame1.Name = "TextBoxFrame1"
      TextBoxFrame1.Parent = TextBoxFrame
      TextBoxFrame1.AnchorPoint = Vector2.new(0.5, 0.5)
      TextBoxFrame1.BackgroundColor3 = Color3.fromRGB(48, 51, 57)
      TextBoxFrame1.ClipsDescendants = true
      TextBoxFrame1.Position = UDim2.new(0.5, 0, 0.5, 0)
      TextBoxFrame1.Size = UDim2.new(0, 317, 0, 36)

      TextBoxFrame1Corner.CornerRadius = UDim.new(0, 3)
      TextBoxFrame1Corner.Name = "TextBoxFrame1Corner"
      TextBoxFrame1Corner.Parent = TextBoxFrame1

      AvatarTextbox.Name = "AvatarTextbox"
      AvatarTextbox.Parent = TextBoxFrame1
      AvatarTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      AvatarTextbox.BackgroundTransparency = 1.000
      AvatarTextbox.Position = UDim2.new(0.0378548913, 0, 0, 0)
      AvatarTextbox.Size = UDim2.new(0, 293, 0, 37)
      AvatarTextbox.Font = Enum.Font.Gotham
      AvatarTextbox.Text = ""
      AvatarTextbox.TextColor3 = Color3.fromRGB(193, 195, 197)
      AvatarTextbox.TextSize = 14.000
      AvatarTextbox.TextXAlignment = Enum.TextXAlignment.Left

      ChangeBtn.Name = "ChangeBtn"
      ChangeBtn.Parent = AvatarChange
      ChangeBtn.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
      ChangeBtn.Position = UDim2.new(0.749670506, 0, 0.823232353, 0)
      ChangeBtn.Size = UDim2.new(0, 76, 0, 27)
      ChangeBtn.Font = Enum.Font.Gotham
      ChangeBtn.Text = "Change"
      ChangeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
      ChangeBtn.TextSize = 13.000
      ChangeBtn.AutoButtonColor = false

      ChangeBtn.MouseEnter:Connect(function()
         TweenService:Create(
            ChangeBtn,
            TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(103,123,196)}
         ):Play()
      end)

      ChangeBtn.MouseLeave:Connect(function()
         TweenService:Create(
            ChangeBtn,
            TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
         ):Play()
      end)

      ChangeBtn.MouseButton1Click:Connect(function()
         pfp = tostring(AvatarTextbox.Text)
         UserImage.Image = pfp
         UserPanelUserImage.Image = pfp
         SaveInfo()

         AvatarChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
         TweenService:Create(
            AvatarChange,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 1}
         ):Play()
         TweenService:Create(
            NotificationHolder,
            TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 1}
         ):Play()
         wait(.2)
         NotificationHolder:Destroy()
      end)



      ChangeCorner.CornerRadius = UDim.new(0, 4)
      ChangeCorner.Name = "ChangeCorner"
      ChangeCorner.Parent = ChangeBtn

      CloseBtn2.Name = "CloseBtn2"
      CloseBtn2.Parent = AvatarChange
      CloseBtn2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      CloseBtn2.BackgroundTransparency = 1.000
      CloseBtn2.Position = UDim2.new(0.898000002, 0, 0, 0)
      CloseBtn2.Size = UDim2.new(0, 26, 0, 26)
      CloseBtn2.Font = Enum.Font.Gotham
      CloseBtn2.Text = ""
      CloseBtn2.TextColor3 = Color3.fromRGB(255, 255, 255)
      CloseBtn2.TextSize = 14.000

      Close2Icon.Name = "Close2Icon"
      Close2Icon.Parent = CloseBtn2
      Close2Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      Close2Icon.BackgroundTransparency = 1.000
      Close2Icon.Position = UDim2.new(-0.0384615399, 0, 0.312910825, 0)
      Close2Icon.Size = UDim2.new(0, 25, 0, 25)
      Close2Icon.Image = "http://www.roblox.com/asset/?id=6035047409"
      Close2Icon.ImageColor3 = Color3.fromRGB(119, 122, 127)

      CloseBtn1.Name = "CloseBtn1"
      CloseBtn1.Parent = AvatarChange
      CloseBtn1.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
      CloseBtn1.BackgroundTransparency = 1.000
      CloseBtn1.Position = UDim2.new(0.495000005, 0, 0.823000014, 0)
      CloseBtn1.Size = UDim2.new(0, 76, 0, 27)
      CloseBtn1.Font = Enum.Font.Gotham
      CloseBtn1.Text = "Close"
      CloseBtn1.TextColor3 = Color3.fromRGB(255, 255, 255)
      CloseBtn1.TextSize = 13.000

      CloseBtn1Corner.CornerRadius = UDim.new(0, 4)
      CloseBtn1Corner.Name = "CloseBtn1Corner"
      CloseBtn1Corner.Parent = CloseBtn1

      ResetBtn.Name = "ResetBtn"
      ResetBtn.Parent = AvatarChange
      ResetBtn.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
      ResetBtn.BackgroundTransparency = 1.000
      ResetBtn.Position = UDim2.new(0.260895967, 0, 0.823000014, 0)
      ResetBtn.Size = UDim2.new(0, 76, 0, 27)
      ResetBtn.Font = Enum.Font.Gotham
      ResetBtn.Text = "Reset"
      ResetBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
      ResetBtn.TextSize = 13.000

      ResetBtn.MouseButton1Click:Connect(function()
         pfp = "https://www.roblox.com/headshot-thumbnail/image?userId=".. game.Players.LocalPlayer.UserId .."&width=420&height=420&format=png"
         UserImage.Image = pfp
         UserPanelUserImage.Image = pfp
         SaveInfo()

         AvatarChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
         TweenService:Create(
            AvatarChange,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 1}
         ):Play()
         TweenService:Create(
            NotificationHolder,
            TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 1}
         ):Play()
         wait(.2)
         NotificationHolder:Destroy()
      end)

      ResetCorner.CornerRadius = UDim.new(0, 4)
      ResetCorner.Name = "ResetCorner"
      ResetCorner.Parent = ResetBtn

      CloseBtn1.MouseButton1Click:Connect(function()
         AvatarChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
         TweenService:Create(
            AvatarChange,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 1}
         ):Play()
         TweenService:Create(
            NotificationHolder,
            TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 1}
         ):Play()
         wait(.2)
         NotificationHolder:Destroy()
      end)

      CloseBtn2.MouseButton1Click:Connect(function()
         AvatarChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
         TweenService:Create(
            AvatarChange,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 1}
         ):Play()
         TweenService:Create(
            NotificationHolder,
            TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 1}
         ):Play()
         wait(.2)
         NotificationHolder:Destroy()
      end)

      CloseBtn2.MouseEnter:Connect(function()
         TweenService:Create(
            Close2Icon,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {ImageColor3 = Color3.fromRGB(210,210,210)}
         ):Play()
      end)

      CloseBtn2.MouseLeave:Connect(function()
         TweenService:Create(
            Close2Icon,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {ImageColor3 = Color3.fromRGB(119, 122, 127)}
         ):Play()
      end)


      AvatarTextbox.Focused:Connect(function()
         TweenService:Create(
            TextBoxFrame,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
         ):Play()
      end)

      AvatarTextbox.FocusLost:Connect(function()
         TweenService:Create(
            TextBoxFrame,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(37, 40, 43)}
         ):Play()
      end)


   end)

   UserPanelUserTag.Name = "UserPanelUserTag"
   UserPanelUserTag.Parent = UserPanel
   UserPanelUserTag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   UserPanelUserTag.BackgroundTransparency = 1.000
   UserPanelUserTag.Position = UDim2.new(0.271143615, 0, 0.231804818, 0)
   UserPanelUserTag.Size = UDim2.new(0, 113, 0, 19)

   UserPanelUser.Name = "UserPanelUser"
   UserPanelUser.Parent = UserPanelUserTag
   UserPanelUser.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   UserPanelUser.BackgroundTransparency = 1.000
   UserPanelUser.Font = Enum.Font.GothamSemibold
   UserPanelUser.TextColor3 = Color3.fromRGB(255, 255, 255)
   UserPanelUser.TextSize = 17.000
   UserPanelUser.TextXAlignment = Enum.TextXAlignment.Left
   UserPanelUser.Text = user
   UserPanelUser.Size = UDim2.new(0, UserPanelUser.TextBounds.X + 2, 0, 19)


   UserPanelUserTagLayout.Name = "UserPanelUserTagLayout"
   UserPanelUserTagLayout.Parent = UserPanelUserTag
   UserPanelUserTagLayout.FillDirection = Enum.FillDirection.Horizontal
   UserPanelUserTagLayout.SortOrder = Enum.SortOrder.LayoutOrder

   UserPanelTag.Name = "UserPanelTag"
   UserPanelTag.Parent = UserPanelUserTag
   UserPanelTag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   UserPanelTag.BackgroundTransparency = 1.000
   UserPanelTag.Position = UDim2.new(0.0419999994, 0, 0.493999988, 0)
   UserPanelTag.Size = UDim2.new(0, 65, 0, 19)
   UserPanelTag.Font = Enum.Font.Gotham
   UserPanelTag.Text = "#" .. tag
   UserPanelTag.TextColor3 = Color3.fromRGB(184, 186, 189)
   UserPanelTag.TextSize = 17.000
   UserPanelTag.TextXAlignment = Enum.TextXAlignment.Left

   UserPanelCorner.Name = "UserPanelCorner"
   UserPanelCorner.Parent = UserPanel

   LeftFrame.Name = "LeftFrame"
   LeftFrame.Parent = SettingsHolder
   LeftFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
   LeftFrame.BorderSizePixel = 0
   LeftFrame.Position = UDim2.new(0, 0, -0.000303059904, 0)
   LeftFrame.Size = UDim2.new(0, 233, 0, 375)

   MyAccountBtn.Name = "MyAccountBtn"
   MyAccountBtn.Parent = LeftFrame
   MyAccountBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
   MyAccountBtn.BorderSizePixel = 0
   MyAccountBtn.Position = UDim2.new(0.271232396, 0, 0.101614028, 0)
   MyAccountBtn.Size = UDim2.new(0, 160, 0, 30)
   MyAccountBtn.AutoButtonColor = false
   MyAccountBtn.Font = Enum.Font.SourceSans
   MyAccountBtn.Text = ""
   MyAccountBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
   MyAccountBtn.TextSize = 14.000

   MyAccountBtnCorner.CornerRadius = UDim.new(0, 6)
   MyAccountBtnCorner.Name = "MyAccountBtnCorner"
   MyAccountBtnCorner.Parent = MyAccountBtn

   MyAccountBtnTitle.Name = "MyAccountBtnTitle"
   MyAccountBtnTitle.Parent = MyAccountBtn
   MyAccountBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   MyAccountBtnTitle.BackgroundTransparency = 1.000
   MyAccountBtnTitle.BorderSizePixel = 0
   MyAccountBtnTitle.Position = UDim2.new(0.0759999976, 0, -0.166999996, 0)
   MyAccountBtnTitle.Size = UDim2.new(0, 95, 0, 39)
   MyAccountBtnTitle.Font = Enum.Font.GothamSemibold
   MyAccountBtnTitle.Text = "My Account"
   MyAccountBtnTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
   MyAccountBtnTitle.TextSize = 14.000
   MyAccountBtnTitle.TextXAlignment = Enum.TextXAlignment.Left

   SettingsTitle.Name = "SettingsTitle"
   SettingsTitle.Parent = LeftFrame
   SettingsTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   SettingsTitle.BackgroundTransparency = 1.000
   SettingsTitle.Position = UDim2.new(0.308999985, 0, 0.0450000018, 0)
   SettingsTitle.Size = UDim2.new(0, 65, 0, 19)
   SettingsTitle.Font = Enum.Font.GothamBlack
   SettingsTitle.Text = "SETTINGS"
   SettingsTitle.TextColor3 = Color3.fromRGB(142, 146, 152)
   SettingsTitle.TextSize = 11.000
   SettingsTitle.TextXAlignment = Enum.TextXAlignment.Left

   DiscordInfo.Name = "DiscordInfo"
   DiscordInfo.Parent = LeftFrame
   DiscordInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   DiscordInfo.BackgroundTransparency = 1.000
   DiscordInfo.Position = UDim2.new(0.304721028, 0, 0.821333349, 0)
   DiscordInfo.Size = UDim2.new(0, 133, 0, 44)
   DiscordInfo.Font = Enum.Font.Gotham
   DiscordInfo.Text = "Stable 1.0.0 (00001)  Host 0.0.0.1                Roblox Lua Engine    "
   DiscordInfo.TextColor3 = Color3.fromRGB(101, 108, 116)
   DiscordInfo.TextSize = 13.000
   DiscordInfo.TextWrapped = true
   DiscordInfo.TextXAlignment = Enum.TextXAlignment.Left
   DiscordInfo.TextYAlignment = Enum.TextYAlignment.Top

   CurrentSettingOpen.Name = "CurrentSettingOpen"
   CurrentSettingOpen.Parent = LeftFrame
   CurrentSettingOpen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   CurrentSettingOpen.BackgroundTransparency = 1.000
   CurrentSettingOpen.Position = UDim2.new(1.07294846, 0, 0.0450000018, 0)
   CurrentSettingOpen.Size = UDim2.new(0, 65, 0, 19)
   CurrentSettingOpen.Font = Enum.Font.GothamBlack
   CurrentSettingOpen.Text = "MY ACCOUNT"
   CurrentSettingOpen.TextColor3 = Color3.fromRGB(255, 255, 255)
   CurrentSettingOpen.TextSize = 14.000
   CurrentSettingOpen.TextXAlignment = Enum.TextXAlignment.Left


   SettingsOpenBtn.MouseButton1Click:Connect(function ()
      settingsopened = true
      TopFrameHolder.Visible = false
      ServersHoldFrame.Visible = false
      SettingsFrame.Visible = true
      SettingsHolder:TweenSize(UDim2.new(0, 681, 0, 375), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
      Settings.BackgroundTransparency = 1
      TweenService:Create(
         Settings,
         TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
         {BackgroundTransparency = 0}
      ):Play()
      for i,v in next, SettingsHolder:GetChildren() do
         v.BackgroundTransparency = 1
         TweenService:Create(
            v,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 0}
         ):Play()
      end
   end)

   EditBtn.MouseButton1Click:Connect(function()
      local NotificationHolder = Instance.new("TextButton")
      NotificationHolder.Name = "NotificationHolder"
      NotificationHolder.Parent = SettingsHolder
      NotificationHolder.BackgroundColor3 = Color3.fromRGB(22,22,22)
      NotificationHolder.Position = UDim2.new(-0.00881057233, 0, -0.00266666664, 0)
      NotificationHolder.Size = UDim2.new(0, 687, 0, 375)
      NotificationHolder.AutoButtonColor = false
      NotificationHolder.Font = Enum.Font.SourceSans
      NotificationHolder.Text = ""
      NotificationHolder.TextColor3 = Color3.fromRGB(0, 0, 0)
      NotificationHolder.TextSize = 14.000
      NotificationHolder.BackgroundTransparency = 1
      NotificationHolder.Visible = true
      TweenService:Create(
         NotificationHolder,
         TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
         {BackgroundTransparency = 0.2}
      ):Play()

      local UserChange = Instance.new("Frame")
      local UserChangeCorner = Instance.new("UICorner")
      local UnderBar = Instance.new("Frame")
      local UnderBarCorner = Instance.new("UICorner")
      local UnderBarFrame = Instance.new("Frame")
      local Text1 = Instance.new("TextLabel")
      local Text2 = Instance.new("TextLabel")
      local TextBoxFrame = Instance.new("Frame")
      local TextBoxFrameCorner = Instance.new("UICorner")
      local TextBoxFrame1 = Instance.new("Frame")
      local TextBoxFrame1Corner = Instance.new("UICorner")
      local UsernameTextbox = Instance.new("TextBox")
      local Seperator = Instance.new("Frame")
      local HashtagLabel = Instance.new("TextLabel")
      local TagTextbox = Instance.new("TextBox")
      local ChangeBtn = Instance.new("TextButton")
      local ChangeCorner = Instance.new("UICorner")
      local CloseBtn2 = Instance.new("TextButton")
      local Close2Icon = Instance.new("ImageLabel")
      local CloseBtn1 = Instance.new("TextButton")
      local CloseBtn1Corner = Instance.new("UICorner")

      UserChange.Name = "UserChange"
      UserChange.Parent = NotificationHolder
      UserChange.AnchorPoint = Vector2.new(0.5, 0.5)
      UserChange.BackgroundColor3 = Color3.fromRGB(25,25,25)
      UserChange.ClipsDescendants = true
      UserChange.Position = UDim2.new(0.513071597, 0, 0.4746176, 0)
      UserChange.Size = UDim2.new(0, 0, 0, 0)
      UserChange.BackgroundTransparency = 1

      UserChange:TweenSize(UDim2.new(0, 346, 0, 198), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
      TweenService:Create(
         UserChange,
         TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
         {BackgroundTransparency = 0}
      ):Play()

      UserChangeCorner.CornerRadius = UDim.new(0, 5)
      UserChangeCorner.Name = "UserChangeCorner"
      UserChangeCorner.Parent = UserChange

      UnderBar.Name = "UnderBar"
      UnderBar.Parent = UserChange
      UnderBar.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
      UnderBar.Position = UDim2.new(-0.000297061284, 0, 0.945048928, 0)
      UnderBar.Size = UDim2.new(0, 346, 0, 13)

      UnderBarCorner.CornerRadius = UDim.new(0, 5)
      UnderBarCorner.Name = "UnderBarCorner"
      UnderBarCorner.Parent = UnderBar

      UnderBarFrame.Name = "UnderBarFrame"
      UnderBarFrame.Parent = UnderBar
      UnderBarFrame.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
      UnderBarFrame.BorderSizePixel = 0
      UnderBarFrame.Position = UDim2.new(-0.000297061284, 0, -2.53846145, 0)
      UnderBarFrame.Size = UDim2.new(0, 346, 0, 39)

      Text1.Name = "Text1"
      Text1.Parent = UserChange
      Text1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      Text1.BackgroundTransparency = 1.000
      Text1.Position = UDim2.new(-0.000594122568, 0, 0.0202020202, 0)
      Text1.Size = UDim2.new(0, 346, 0, 68)
      Text1.Font = Enum.Font.GothamSemibold
      Text1.Text = "Change your username"
      Text1.TextColor3 = Color3.fromRGB(255, 255, 255)
      Text1.TextSize = 20.000

      Text2.Name = "Text2"
      Text2.Parent = UserChange
      Text2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      Text2.BackgroundTransparency = 1.000
      Text2.Position = UDim2.new(-0.000594122568, 0, 0.141587839, 0)
      Text2.Size = UDim2.new(0, 346, 0, 63)
      Text2.Font = Enum.Font.Gotham
      Text2.Text = "Enter your new username."
      Text2.TextColor3 = Color3.fromRGB(171, 172, 176)
      Text2.TextSize = 14.000

      TextBoxFrame.Name = "TextBoxFrame"
      TextBoxFrame.Parent = UserChange
      TextBoxFrame.AnchorPoint = Vector2.new(0.5, 0.5)
      TextBoxFrame.BackgroundColor3 = Color3.fromRGB(37, 40, 43)
      TextBoxFrame.Position = UDim2.new(0.49710983, 0, 0.560606062, 0)
      TextBoxFrame.Size = UDim2.new(0, 319, 0, 38)

      TextBoxFrameCorner.CornerRadius = UDim.new(0, 3)
      TextBoxFrameCorner.Name = "TextBoxFrameCorner"
      TextBoxFrameCorner.Parent = TextBoxFrame

      TextBoxFrame1.Name = "TextBoxFrame1"
      TextBoxFrame1.Parent = TextBoxFrame
      TextBoxFrame1.AnchorPoint = Vector2.new(0.5, 0.5)
      TextBoxFrame1.BackgroundColor3 = Color3.fromRGB(48, 51, 57)
      TextBoxFrame1.Position = UDim2.new(0.5, 0, 0.5, 0)
      TextBoxFrame1.Size = UDim2.new(0, 317, 0, 36)

      TextBoxFrame1Corner.CornerRadius = UDim.new(0, 3)
      TextBoxFrame1Corner.Name = "TextBoxFrame1Corner"
      TextBoxFrame1Corner.Parent = TextBoxFrame1

      UsernameTextbox.Name = "UsernameTextbox"
      UsernameTextbox.Parent = TextBoxFrame1
      UsernameTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      UsernameTextbox.BackgroundTransparency = 1.000
      UsernameTextbox.Position = UDim2.new(0.0378548913, 0, 0, 0)
      UsernameTextbox.Size = UDim2.new(0, 221, 0, 37)
      UsernameTextbox.Font = Enum.Font.Gotham
      UsernameTextbox.Text = user
      UsernameTextbox.TextColor3 = Color3.fromRGB(193, 195, 197)
      UsernameTextbox.TextSize = 14.000
      UsernameTextbox.TextXAlignment = Enum.TextXAlignment.Left

      Seperator.Name = "Seperator"
      Seperator.Parent = TextBoxFrame1
      Seperator.AnchorPoint = Vector2.new(0.5, 0.5)
      Seperator.BackgroundColor3 = Color3.fromRGB(25,25,25)
      Seperator.BorderSizePixel = 0
      Seperator.Position = UDim2.new(0.753000021, 0, 0.500999987, 0)
      Seperator.Size = UDim2.new(0, 1, 0, 25)

      HashtagLabel.Name = "HashtagLabel"
      HashtagLabel.Parent = TextBoxFrame1
      HashtagLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      HashtagLabel.BackgroundTransparency = 1.000
      HashtagLabel.Position = UDim2.new(0.765877604, 0, -0.0546001866, 0)
      HashtagLabel.Size = UDim2.new(0, 23, 0, 37)
      HashtagLabel.Font = Enum.Font.Gotham
      HashtagLabel.Text = "#"
      HashtagLabel.TextColor3 = Color3.fromRGB(79, 82, 88)
      HashtagLabel.TextSize = 16.000

      TagTextbox.Name = "TagTextbox"
      TagTextbox.Parent = TextBoxFrame1
      TagTextbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      TagTextbox.BackgroundTransparency = 1.000
      TagTextbox.Position = UDim2.new(0.824999988, 0, -0.0280000009, 0)
      TagTextbox.Size = UDim2.new(0, 59, 0, 38)
      TagTextbox.Font = Enum.Font.Gotham
      TagTextbox.PlaceholderColor3 = Color3.fromRGB(210, 211, 212)
      TagTextbox.Text = tag
      TagTextbox.TextColor3 = Color3.fromRGB(193, 195, 197)
      TagTextbox.TextSize = 14.000
      TagTextbox.TextXAlignment = Enum.TextXAlignment.Left

      ChangeBtn.Name = "ChangeBtn"
      ChangeBtn.Parent = UserChange
      ChangeBtn.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
      ChangeBtn.Position = UDim2.new(0.749670506, 0, 0.823232353, 0)
      ChangeBtn.Size = UDim2.new(0, 76, 0, 27)
      ChangeBtn.Font = Enum.Font.Gotham
      ChangeBtn.Text = "Change"
      ChangeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
      ChangeBtn.TextSize = 13.000
      ChangeBtn.AutoButtonColor = false

      ChangeBtn.MouseEnter:Connect(function()
         TweenService:Create(
            ChangeBtn,
            TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(103,123,196)}
         ):Play()
      end)

      ChangeBtn.MouseLeave:Connect(function()
         TweenService:Create(
            ChangeBtn,
            TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
         ):Play()
      end)

      ChangeBtn.MouseButton1Click:Connect(function()
         user = UsernameTextbox.Text
         tag = TagTextbox.Text
         UserSettingsPadUser.Text = user
         UserSettingsPadUser.Size = UDim2.new(0, UserSettingsPadUser.TextBounds.X + 2, 0, 19)
         UserSettingsPadTag.Text = "#" .. tag
         UserPanelTag.Text = "#" .. tag
         UserPanelUser.Text = user
         UserPanelUser.Size = UDim2.new(0, UserPanelUser.TextBounds.X + 2, 0, 19)
         UserName.Text = user
         UserTag.Text = "#" .. tag
         SaveInfo()

         UserChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
         TweenService:Create(
            UserChange,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 1}
         ):Play()
         TweenService:Create(
            NotificationHolder,
            TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 1}
         ):Play()
         wait(.2)
         NotificationHolder:Destroy()
      end)

      ChangeCorner.CornerRadius = UDim.new(0, 4)
      ChangeCorner.Name = "ChangeCorner"
      ChangeCorner.Parent = ChangeBtn

      CloseBtn2.Name = "CloseBtn2"
      CloseBtn2.Parent = UserChange
      CloseBtn2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      CloseBtn2.BackgroundTransparency = 1.000
      CloseBtn2.Position = UDim2.new(0.898000002, 0, 0, 0)
      CloseBtn2.Size = UDim2.new(0, 26, 0, 26)
      CloseBtn2.Font = Enum.Font.Gotham
      CloseBtn2.Text = ""
      CloseBtn2.TextColor3 = Color3.fromRGB(255, 255, 255)
      CloseBtn2.TextSize = 14.000

      Close2Icon.Name = "Close2Icon"
      Close2Icon.Parent = CloseBtn2
      Close2Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      Close2Icon.BackgroundTransparency = 1.000
      Close2Icon.Position = UDim2.new(-0.0384615399, 0, 0.312910825, 0)
      Close2Icon.Size = UDim2.new(0, 25, 0, 25)
      Close2Icon.Image = "http://www.roblox.com/asset/?id=6035047409"
      Close2Icon.ImageColor3 = Color3.fromRGB(119, 122, 127)

      CloseBtn1.Name = "CloseBtn1"
      CloseBtn1.Parent = UserChange
      CloseBtn1.BackgroundColor3 = Color3.fromRGB(114, 137, 228)
      CloseBtn1.BackgroundTransparency = 1.000
      CloseBtn1.Position = UDim2.new(0.495000005, 0, 0.823000014, 0)
      CloseBtn1.Size = UDim2.new(0, 76, 0, 27)
      CloseBtn1.Font = Enum.Font.Gotham
      CloseBtn1.Text = "Close"
      CloseBtn1.TextColor3 = Color3.fromRGB(255, 255, 255)
      CloseBtn1.TextSize = 13.000

      CloseBtn1Corner.CornerRadius = UDim.new(0, 4)
      CloseBtn1Corner.Name = "CloseBtn1Corner"
      CloseBtn1Corner.Parent = CloseBtn1

      CloseBtn1.MouseButton1Click:Connect(function()
         UserChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
         TweenService:Create(
            UserChange,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 1}
         ):Play()
         TweenService:Create(
            NotificationHolder,
            TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 1}
         ):Play()
         wait(.2)
         NotificationHolder:Destroy()
      end)

      CloseBtn2.MouseButton1Click:Connect(function()
         UserChange:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
         TweenService:Create(
            UserChange,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 1}
         ):Play()
         TweenService:Create(
            NotificationHolder,
            TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 1}
         ):Play()
         wait(.2)
         NotificationHolder:Destroy()
      end)

      CloseBtn2.MouseEnter:Connect(function()
         TweenService:Create(
            Close2Icon,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {ImageColor3 = Color3.fromRGB(210,210,210)}
         ):Play()
      end)

      CloseBtn2.MouseLeave:Connect(function()
         TweenService:Create(
            Close2Icon,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {ImageColor3 = Color3.fromRGB(119, 122, 127)}
         ):Play()
      end)

      TagTextbox.Changed:Connect(function()
         TagTextbox.Text = TagTextbox.Text:sub(1,4)
      end)

      TagTextbox:GetPropertyChangedSignal("Text"):Connect(function()
         TagTextbox.Text = TagTextbox.Text:gsub('%D+', '');
      end)

      UsernameTextbox.Changed:Connect(function()
         UsernameTextbox.Text = UsernameTextbox.Text:sub(1,13)
      end)

      TagTextbox.Focused:Connect(function()
         TweenService:Create(
            TextBoxFrame,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
         ):Play()
      end)

      TagTextbox.FocusLost:Connect(function()
         TweenService:Create(
            TextBoxFrame,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(37, 40, 43)}
         ):Play()
      end)

      UsernameTextbox.Focused:Connect(function()
         TweenService:Create(
            TextBoxFrame,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
         ):Play()
      end)

      UsernameTextbox.FocusLost:Connect(function()
         TweenService:Create(
            TextBoxFrame,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(37, 40, 43)}
         ):Play()
      end)

   end)

   function RadientPaid:Notification(titletext, desctext, btntext)
      local NotificationHolderMain = Instance.new("TextButton")
      local Notification = Instance.new("Frame")
      local NotificationCorner = Instance.new("UICorner")
      local UnderBar = Instance.new("Frame")
      local UnderBarCorner = Instance.new("UICorner")
      local UnderBarFrame = Instance.new("Frame")
      local Text1 = Instance.new("TextLabel")
      local Text2 = Instance.new("TextLabel")
      local AlrightBtn = Instance.new("TextButton")
      local AlrightCorner = Instance.new("UICorner")

      NotificationHolderMain.Name = "NotificationHolderMain"
      NotificationHolderMain.Parent = MainFrame
      NotificationHolderMain.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
      NotificationHolderMain.BackgroundTransparency = 1
      NotificationHolderMain.BorderSizePixel = 0
      NotificationHolderMain.Position = UDim2.new(0, 0, 0.0560000017, 0)
      NotificationHolderMain.Size = UDim2.new(0, 681, 0, 374)
      NotificationHolderMain.AutoButtonColor = false
      NotificationHolderMain.Font = Enum.Font.SourceSans
      NotificationHolderMain.Text = ""
      NotificationHolderMain.TextColor3 = Color3.fromRGB(0, 0, 0)
      NotificationHolderMain.TextSize = 14.000
      TweenService:Create(
         NotificationHolderMain,
         TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
         {BackgroundTransparency = 0.2}
      ):Play()


      Notification.Name = "Notification"
      Notification.Parent = NotificationHolderMain
      Notification.AnchorPoint = Vector2.new(0.5, 0.5)
      Notification.BackgroundColor3 = Color3.fromRGB(15,15,15)
      Notification.ClipsDescendants = true
      Notification.Position = UDim2.new(0.524819076, 0, 0.469270051, 0)
      Notification.Size = UDim2.new(0, 0, 0, 0)
      Notification.BackgroundTransparency = 1

      Notification:TweenSize(UDim2.new(0, 346, 0, 176), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)

      TweenService:Create(
         Notification,
         TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
         {BackgroundTransparency = 0}
      ):Play()

      NotificationCorner.CornerRadius = UDim.new(0, 5)
      NotificationCorner.Name = "NotificationCorner"
      NotificationCorner.Parent = Notification

      UnderBar.Name = "UnderBar"
      UnderBar.Parent = Notification
      UnderBar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
      UnderBar.Position = UDim2.new(-0.000297061284, 0, 0.945048928, 0)
      UnderBar.Size = UDim2.new(0, 346, 0, 10)

      UnderBarCorner.CornerRadius = UDim.new(0, 5)
      UnderBarCorner.Name = "UnderBarCorner"
      UnderBarCorner.Parent = UnderBar

      UnderBarFrame.Name = "UnderBarFrame"
      UnderBarFrame.Parent = UnderBar
      UnderBarFrame.BackgroundColor3 = Color3.fromRGB(14,14,14)
      UnderBarFrame.BorderSizePixel = 0
      UnderBarFrame.Position = UDim2.new(-0.000297061284, 0, -3.76068449, 0)
      UnderBarFrame.Size = UDim2.new(0, 346, 0, 40)

      Text1.Name = "Text1"
      Text1.Parent = Notification
      Text1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      Text1.BackgroundTransparency = 1.000
      Text1.Position = UDim2.new(-0.000594122568, 0, 0.0202020202, 0)
      Text1.Size = UDim2.new(0, 346, 0, 68)
      Text1.Font = Enum.Font.GothamSemibold
      Text1.Text = titletext
      Text1.TextColor3 = Color3.fromRGB(255, 255, 255)
      Text1.TextSize = 20.000

      Text2.Name = "Text2"
      Text2.Parent = Notification
      Text2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      Text2.BackgroundTransparency = 1.000
      Text2.Position = UDim2.new(0.106342293, 0, 0.317724228, 0)
      Text2.Size = UDim2.new(0, 272, 0, 63)
      Text2.Font = Enum.Font.Gotham
      Text2.Text = desctext
      Text2.TextColor3 = Color3.fromRGB(171, 172, 176)
      Text2.TextSize = 14.000
      Text2.TextWrapped = true

      AlrightBtn.Name = "AlrightBtn"
      AlrightBtn.Parent = Notification
      AlrightBtn.BackgroundColor3 = Color3.fromRGB(206, 61, 73)
      AlrightBtn.Position = UDim2.new(0.0332369953, 0, 0.789141417, 0)
      AlrightBtn.Size = UDim2.new(0, 322, 0, 27)
      AlrightBtn.Font = Enum.Font.Gotham
      AlrightBtn.Text = btntext
      AlrightBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
      AlrightBtn.TextSize = 13.000
      AlrightBtn.AutoButtonColor = false

      AlrightCorner.CornerRadius = UDim.new(0, 4)
      AlrightCorner.Name = "AlrightCorner"
      AlrightCorner.Parent = AlrightBtn

      AlrightBtn.MouseButton1Click:Connect(function()
         TweenService:Create(
            NotificationHolderMain,
            TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 1}
         ):Play()
         Notification:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .2, true)
         TweenService:Create(
            Notification,
            TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 1}
         ):Play()
         wait()
         NotificationHolderMain:Destroy()
      end)

      AlrightBtn.MouseEnter:Connect(function()
         TweenService:Create(
            AlrightBtn,
            TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(0, 255, 0)}
         ):Play()
      end)

      AlrightBtn.MouseLeave:Connect(function()
         TweenService:Create(
            AlrightBtn,
            TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(206, 61, 73)}
         ):Play()
      end)
   end

   MakeDraggable(TopFramess, MainFrame)
   ServersHoldPadding.PaddingLeft = UDim.new(0, 14)
   local ServerHold = {}
   function ServerHold:Server(text,textgame, img)
      local fc = false
      local currentchanneltoggled = ""
      local Server = Instance.new("TextButton")
      local ServerBtnCorner = Instance.new("UICorner")
      local ServerIco = Instance.new("ImageLabel")
      local ServerWhiteFrame = Instance.new("Frame")
      local ServerWhiteFrameCorner = Instance.new("UICorner")

      Server.Name = text .. "Server"
      Server.Parent = ServersHold
      Server.BackgroundColor3 = Color3.fromRGB(20,20,20)
      Server.Position = UDim2.new(0.125, 0, 0, 0)
      Server.Size = UDim2.new(0, 47, 0, 47)
      Server.AutoButtonColor = false
      Server.Font = Enum.Font.Gotham
      Server.Text = ""
      Server.BackgroundTransparency = 1
      Server.TextTransparency = 1
      Server.TextColor3 = Color3.fromRGB(0, 255, 0)
      Server.TextSize = 18.000

      ServerBtnCorner.CornerRadius = UDim.new(1, 0)
      ServerBtnCorner.Name = "ServerCorner"
      ServerBtnCorner.Parent = Server

      ServerWhiteFrame.Name = "ServerWhiteFrame"
      ServerWhiteFrame.Parent = Server
      ServerWhiteFrame.AnchorPoint = Vector2.new(0.5, 0.5)
      ServerWhiteFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      ServerWhiteFrame.BackgroundTransparency = 1
      ServerWhiteFrame.Position = UDim2.new(-0.347378343, 0, 0.502659559, 0)
      ServerWhiteFrame.Size = UDim2.new(0, 11, 0, 10)

      ServerWhiteFrameCorner.CornerRadius = UDim.new(1, 0)
      ServerWhiteFrameCorner.Name = "ServerWhiteFrameCorner"
      ServerWhiteFrameCorner.Parent = ServerWhiteFrame
      ServersHold.CanvasSize = UDim2.new(0, 0, 0, ServersHoldLayout.AbsoluteContentSize.Y)

      local ServerFrame = Instance.new("Frame")
      local ServerFrame1 = Instance.new("Frame")
      local ServerFrame2 = Instance.new("Frame")
      local ServerTitleFrame = Instance.new("Frame")
      local ServerTitle = Instance.new("TextLabel")
      local ServerTitle2 = Instance.new("TextLabel")
      local GlowFrame = Instance.new("Frame")
      local Glow = Instance.new("ImageLabel")
      local ServerContentFrame = Instance.new("Frame")
      local ServerCorner = Instance.new("UICorner")
      local ChannelCorner = Instance.new("UICorner")
      local ChannelTitleFrame = Instance.new("Frame")
      local Hashtag = Instance.new("TextLabel")
      local ChannelTitle = Instance.new("TextLabel")
      local ChannelContentFrame = Instance.new("Frame")
      local GlowChannel = Instance.new("ImageLabel")
      local ServerChannelHolder = Instance.new("ScrollingFrame")
      local ServerChannelHolderLayout = Instance.new("UIListLayout")
      local ServerChannelHolderPadding = Instance.new("UIPadding")


      ServerFrame.Name = "ServerFrame"
      ServerFrame.Parent = ServersHolder
      ServerFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
      ServerFrame.BorderSizePixel = 0
      ServerFrame.ClipsDescendants = true
      ServerFrame.Position = UDim2.new(0.105726875, 0, 1.01262593, 0)
      ServerFrame.Size = UDim2.new(0, 609, 0, 373)
      ServerFrame.Visible = false

      ServerFrame1.Name = "ServerFrame1"
      ServerFrame1.Parent = ServerFrame
      ServerFrame1.BackgroundColor3 = Color3.fromRGB(20,20,20)
      ServerFrame1.BorderSizePixel = 0
      ServerFrame1.Position = UDim2.new(0, 0, 0.972290039, 0)
      ServerFrame1.Size = UDim2.new(0, 12, 0, 10)

      ServerFrame2.Name = "ServerFrame2"
      ServerFrame2.Parent = ServerFrame
      ServerFrame2.BackgroundColor3 = Color3.fromRGB(20,20,20)
      ServerFrame2.BorderSizePixel = 0
      ServerFrame2.Position = UDim2.new(0.980295539, 0, 0.972290039, 0)
      ServerFrame2.Size = UDim2.new(0, 12, 0, 9)

      ServerTitleFrame.Name = "ServerTitleFrame"
      ServerTitleFrame.Parent = ServerFrame
      ServerTitleFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
      ServerTitleFrame.BackgroundTransparency = 1.000
      ServerTitleFrame.BorderSizePixel = 0
      ServerTitleFrame.Position = UDim2.new(-0.0010054264, 0, -0.000900391256, 0)
      ServerTitleFrame.Size = UDim2.new(0, 180, 0, 40)
------ NameKuy
      ServerTitle.Name = "ServerTitle"
      ServerTitle.Parent = ServerTitleFrame
      ServerTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      ServerTitle.BackgroundTransparency = 1.000
      ServerTitle.BorderSizePixel = 0
      ServerTitle.Position = UDim2.new(0.0751359761, 22.50, 0, 0)
      ServerTitle.Size = UDim2.new(0, 97, 0, 39)
      ServerTitle.Font = Enum.Font.GothamSemibold
      ServerTitle.Text = text
      ServerTitle.TextColor3 = Color3.fromRGB(0, 255, 0)
      ServerTitle.TextSize = 18.000
      ServerTitle.TextXAlignment = Enum.TextXAlignment.Left

      ServerTitle2.Name = "ServerTitle"
      ServerTitle2.Parent = ServerTitleFrame
      ServerTitle2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      ServerTitle2.BackgroundTransparency = 1
      ServerTitle2.BorderSizePixel = 0
      ServerTitle2.Position = UDim2.new(0.0541359761, 0, 7.5, 0)
      ServerTitle2.Size = UDim2.new(0, 97, 0, 39)
      ServerTitle2.ZIndex = 999
      ServerTitle2.Font = Enum.Font.GothamSemibold
      ServerTitle2.Text = textgame
      ServerTitle2.TextColor3 = Color3.fromRGB(255, 255, 255)
      ServerTitle2.TextTransparency = 0.8
      ServerTitle2.TextSize = 13.000
      ServerTitle2.TextXAlignment = Enum.TextXAlignment.Left

      GlowFrame.Name = "GlowFrame"
      GlowFrame.Parent = ServerFrame
      GlowFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
      GlowFrame.BackgroundTransparency = 1.000
      GlowFrame.BorderSizePixel = 0
      GlowFrame.Position = UDim2.new(-0.0010054264, 0, -0.000900391256, 0)
      GlowFrame.Size = UDim2.new(0, 609, 0, 40)

      Glow.Name = "Glow"
      Glow.Parent = GlowFrame
      Glow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      Glow.BackgroundTransparency = 1.000
      Glow.BorderSizePixel = 0
      Glow.Position = UDim2.new(0, -15, 0, -15)
      Glow.Size = UDim2.new(1, 30, 1, 30)
      Glow.ZIndex = 0
      Glow.Image = "rbxassetid://4996891970"
      Glow.ImageColor3 = Color3.fromRGB(15, 15, 15)
      Glow.ScaleType = Enum.ScaleType.Slice
      Glow.SliceCenter = Rect.new(20, 20, 280, 280)

      ServerContentFrame.Name = "ServerContentFrame"
      ServerContentFrame.Parent = ServerFrame
      ServerContentFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
      ServerContentFrame.BackgroundTransparency = 1.000
      ServerContentFrame.BorderSizePixel = 0
      ServerContentFrame.Position = UDim2.new(-0.0010054264, 0, 0.106338218, 0)
      ServerContentFrame.Size = UDim2.new(0, 180, 0, 333)

      ServerCorner.CornerRadius = UDim.new(0, 4)
      ServerCorner.Name = "ServerCorner"
      ServerCorner.Parent = ServerFrame

      ChannelTitleFrame.Name = "ChannelTitleFrame"
      ChannelTitleFrame.Parent = ServerFrame
      ChannelTitleFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
      ChannelTitleFrame.BorderSizePixel = 0
      ChannelTitleFrame.Position = UDim2.new(0.294561088, 0, -0.000900391256, 0)
      ChannelTitleFrame.Size = UDim2.new(0, 429, 0, 40)

      Hashtag.Name = "Hashtag"
      Hashtag.Parent = ChannelTitleFrame
      Hashtag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      Hashtag.BackgroundTransparency = 1.000
      Hashtag.BorderSizePixel = 0
      Hashtag.Position = UDim2.new(0.0279720277, 0, 0, 0)
      Hashtag.Size = UDim2.new(0, 19, 0, 39)
      Hashtag.Font = Enum.Font.Gotham
      Hashtag.Text = "•"
      Hashtag.TextColor3 = Color3.fromRGB(111, 111, 111)
      Hashtag.TextSize = 25.000

      ChannelTitle.Name = "ChannelTitle"
      ChannelTitle.Parent = ChannelTitleFrame
      ChannelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      ChannelTitle.BackgroundTransparency = 1.000
      ChannelTitle.BorderSizePixel = 0
      ChannelTitle.Position = UDim2.new(0.0862470865, 0, 0, 0)
      ChannelTitle.Size = UDim2.new(0, 95, 0, 39)
      ChannelTitle.Font = Enum.Font.GothamSemibold
      ChannelTitle.Text = ""
      ChannelTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
      ChannelTitle.TextSize = 15.000
      ChannelTitle.TextXAlignment = Enum.TextXAlignment.Left

      ChannelContentFrame.Name = "ChannelContentFrame"
      ChannelContentFrame.Parent = ServerFrame
      ChannelContentFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
      ChannelContentFrame.BorderSizePixel = 0
      ChannelContentFrame.ClipsDescendants = true
      ChannelContentFrame.Position = UDim2.new(0.294561088, 0, 0.106338218, 0)
      ChannelContentFrame.Size = UDim2.new(0, 429, 0, 333)

      GlowChannel.Name = "GlowChannel"
      GlowChannel.Parent = ChannelContentFrame
      GlowChannel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      GlowChannel.BackgroundTransparency = 1.000
      GlowChannel.BorderSizePixel = 0
      GlowChannel.Position = UDim2.new(0, -33, 0, -91)
      GlowChannel.Size = UDim2.new(1.06396091, 30, 0.228228226, 30)
      GlowChannel.ZIndex = 0
      GlowChannel.Image = "rbxassetid://4996891970"
      GlowChannel.ImageColor3 = Color3.fromRGB(15, 15, 15)
      GlowChannel.ScaleType = Enum.ScaleType.Slice
      GlowChannel.SliceCenter = Rect.new(20, 20, 280, 280)

      ServerChannelHolder.Name = "ServerChannelHolder"
      ServerChannelHolder.Parent = ServerContentFrame
      ServerChannelHolder.Active = true
      ServerChannelHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      ServerChannelHolder.BackgroundTransparency = 1.000
      ServerChannelHolder.BorderSizePixel = 0
      ServerChannelHolder.Position = UDim2.new(0.00535549596, 0, 0.0241984241, 0)
      ServerChannelHolder.Selectable = false
      ServerChannelHolder.Size = UDim2.new(0, 179, 0, 278)
      ServerChannelHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
      ServerChannelHolder.ScrollBarThickness = 4
      ServerChannelHolder.ScrollBarImageColor3 = Color3.fromRGB(18, 19, 21)
      ServerChannelHolder.ScrollBarImageTransparency = 1

      ServerChannelHolderLayout.Name = "ServerChannelHolderLayout"
      ServerChannelHolderLayout.Parent = ServerChannelHolder
      ServerChannelHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
      ServerChannelHolderLayout.Padding = UDim.new(0, 4)

      ServerChannelHolderPadding.Name = "ServerChannelHolderPadding"
      ServerChannelHolderPadding.Parent = ServerChannelHolder
      ServerChannelHolderPadding.PaddingLeft = UDim.new(0, 9)

      ServerChannelHolder.MouseEnter:Connect(function()
         ServerChannelHolder.ScrollBarImageTransparency = 0
      end)

      ServerChannelHolder.MouseLeave:Connect(function()
         ServerChannelHolder.ScrollBarImageTransparency = 1
      end)

      Server.MouseEnter:Connect(
         function()
            if currentservertoggled ~= Server.Name then
               TweenService:Create(
                  Server,
                  TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                  {BackgroundColor3 = Color3.fromRGB(114, 137, 228)}
               ):Play()
               TweenService:Create(
                  ServerBtnCorner,
                  TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                  {CornerRadius = UDim.new(0, 15)}
               ):Play()
               ServerWhiteFrame:TweenSize(
                  UDim2.new(0, 11, 0, 27),
                  Enum.EasingDirection.Out,
                  Enum.EasingStyle.Quart,
                  .3,
                  true
               )
            end
         end
      )

      Server.MouseLeave:Connect(
         function()
            if currentservertoggled ~= Server.Name then
               TweenService:Create(
                  Server,
                  TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                  {BackgroundColor3 = Color3.fromRGB(25,25,25)}
               ):Play()
               TweenService:Create(
                  ServerBtnCorner,
                  TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                  {CornerRadius = UDim.new(1, 0)}
               ):Play()
               ServerWhiteFrame:TweenSize(
                  UDim2.new(0, 11, 0, 10),
                  Enum.EasingDirection.Out,
                  Enum.EasingStyle.Quart,
                  .3,
                  true
               )
            end
         end
      )

      Server.MouseButton1Click:Connect(
         function()
            currentservertoggled = Server.Name
            for i, v in next, ServersHolder:GetChildren() do
               if v.Name == "ServerFrame" then
                  v.Visible = false
               end
               ServerFrame.Visible = true
            end
            for i, v in next, ServersHold:GetChildren() do
               if v.ClassName == "TextButton" then
                  TweenService:Create(
                     v,
                     TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                     {BackgroundColor3 = Color3.fromRGB(25,25,25)}
                  ):Play()
                  TweenService:Create(
                     Server,
                     TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                     {BackgroundColor3 = Color3.fromRGB(25,25,25)}
                  ):Play()
                  TweenService:Create(
                     v.ServerCorner,
                     TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                     {CornerRadius = UDim.new(1, 0)}
                  ):Play()
                  TweenService:Create(
                     ServerBtnCorner,
                     TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                     {CornerRadius = UDim.new(0, 15)}
                  ):Play()
                  v.ServerWhiteFrame:TweenSize(
                     UDim2.new(0, 11, 0, 10),
                     Enum.EasingDirection.Out,
                     Enum.EasingStyle.Quart,
                     .3,
                     true
                  )
                  ServerWhiteFrame:TweenSize(
                     UDim2.new(0, 11, 0, 46),
                     Enum.EasingDirection.Out,
                     Enum.EasingStyle.Quart,
                     .3,
                     true
                  )
               end
            end
         end
      )

      if fs == false then
         TweenService:Create(
            Server,
            TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(25,25,25)}
         ):Play()
         TweenService:Create(
            ServerBtnCorner,
            TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {CornerRadius = UDim.new(0, 15)}
         ):Play()
         ServerWhiteFrame:TweenSize(
            UDim2.new(0, 11, 0, 46),
            Enum.EasingDirection.Out,
            Enum.EasingStyle.Quart,
            .3,
            true
         )
         ServerFrame.Visible = true
         Server.Name = text .. "Server"
         currentservertoggled = Server.Name
         fs = true
      end
      local ChannelHold = {}
      function ChannelHold:Channel(text)
         local ChannelBtn = Instance.new("TextButton")
         local ChannelBtnCorner = Instance.new("UICorner")
         local ChannelBtnHashtag = Instance.new("TextLabel")
         local ChannelBtnTitle = Instance.new("TextLabel")

         ChannelBtn.Name = text .. "ChannelBtn"
         ChannelBtn.Parent = ServerChannelHolder
         ChannelBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
         ChannelBtn.BorderSizePixel = 0
         ChannelBtn.Position = UDim2.new(0.24118948, 0, 0.578947365, 0)
         ChannelBtn.Size = UDim2.new(0, 160, 0, 30)
         ChannelBtn.AutoButtonColor = false
         ChannelBtn.Font = Enum.Font.SourceSans
         ChannelBtn.Text = ""
         ChannelBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
         ChannelBtn.TextSize = 14.000

         ChannelBtnCorner.CornerRadius = UDim.new(0, 8)
         ChannelBtnCorner.Name = "ChannelBtnCorner"
         ChannelBtnCorner.Parent = ChannelBtn

         ChannelBtnHashtag.Name = "ChannelBtnHashtag"
         ChannelBtnHashtag.Parent = ChannelBtn
         ChannelBtnHashtag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         ChannelBtnHashtag.BackgroundTransparency = 1.000
         ChannelBtnHashtag.BorderSizePixel = 0
         ChannelBtnHashtag.Position = UDim2.new(0.08, 0, 0, 0)
         ChannelBtnHashtag.Size = UDim2.new(0, 24, 0, 30)
         ChannelBtnHashtag.Font = Enum.Font.Gotham
         ChannelBtnHashtag.Text = ""
         ChannelBtnHashtag.TextColor3 = Color3.fromRGB(114, 118, 125)
         ChannelBtnHashtag.TextSize = 21.000

         ChannelBtnTitle.Name = "ChannelBtnTitle"
         ChannelBtnTitle.Parent = ChannelBtn
         ChannelBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         ChannelBtnTitle.BackgroundTransparency = 1.000
         ChannelBtnTitle.BorderSizePixel = 0
         ChannelBtnTitle.Position = UDim2.new(0.05, 0, -0.166666672, 0)
         ChannelBtnTitle.Size = UDim2.new(0, 95, 0, 39)
         ChannelBtnTitle.Font = Enum.Font.Gotham
         ChannelBtnTitle.Text = text
         ChannelBtnTitle.TextColor3 = Color3.fromRGB(114, 118, 125)
         ChannelBtnTitle.TextSize = 14.000
         ChannelBtnTitle.TextXAlignment = Enum.TextXAlignment.Left
         ServerChannelHolder.CanvasSize = UDim2.new(0, 0, 0, ServerChannelHolderLayout.AbsoluteContentSize.Y)

         local ChannelHolder = Instance.new("ScrollingFrame")
         local ChannelHolderLayout = Instance.new("UIListLayout")

         ChannelHolder.Name = "ChannelHolder"
         ChannelHolder.Parent = ChannelContentFrame
         ChannelHolder.Active = true
         ChannelHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         ChannelHolder.BackgroundTransparency = 1.000
         ChannelHolder.BorderSizePixel = 0
         ChannelHolder.Position = UDim2.new(0.0360843192, 0, 0.0241984241, 0)
         ChannelHolder.Size = UDim2.new(0, 412, 0, 314)
         ChannelHolder.ScrollBarThickness = 6
         ChannelHolder.CanvasSize = UDim2.new(0,0,0,0)
         ChannelHolder.ScrollBarImageTransparency = 0
         ChannelHolder.ScrollBarImageColor3 = Color3.fromRGB(18, 19, 21)
         ChannelHolder.Visible = false
         ChannelHolder.ClipsDescendants = false

         ChannelHolderLayout.Name = "ChannelHolderLayout"
         ChannelHolderLayout.Parent = ChannelHolder
         ChannelHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
         ChannelHolderLayout.Padding = UDim.new(0, 8)

         ChannelBtn.MouseEnter:Connect(function()
            if currentchanneltoggled ~= ChannelBtn.Name then
               ChannelBtn.BackgroundColor3 = Color3.fromRGB(10,10,10)
               ChannelBtnTitle.TextColor3 = Color3.fromRGB(220,221,222)
            end
         end)

         ChannelBtn.MouseLeave:Connect(function()
            if currentchanneltoggled ~= ChannelBtn.Name then
               ChannelBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
               ChannelBtnTitle.TextColor3 = Color3.fromRGB(114, 118, 125)
            end
         end)

         ChannelBtn.MouseButton1Click:Connect(function()
            for i, v in next, ChannelContentFrame:GetChildren() do
               if v.Name == "ChannelHolder" then
                  v.Visible = false
               end
               ChannelHolder.Visible = true
            end
            for i, v in next, ServerChannelHolder:GetChildren() do
               if v.ClassName == "TextButton" then
                  v.BackgroundColor3 = Color3.fromRGB(25,25,25)
                  v.ChannelBtnTitle.TextColor3 = Color3.fromRGB(114, 118, 125)
               end
               ServerFrame.Visible = true
            end
            ChannelTitle.Text = text
            ChannelBtn.BackgroundColor3 = Color3.fromRGB(10,10,10)
            ChannelBtnTitle.TextColor3 = Color3.fromRGB(255,255,255)
            currentchanneltoggled = ChannelBtn.Name
         end)

         if fc == false then
            fc = true
            ChannelTitle.Text = text
            ChannelBtn.BackgroundColor3 = Color3.fromRGB(10,10,10)
            ChannelBtnTitle.TextColor3 = Color3.fromRGB(255,255,255)
            currentchanneltoggled = ChannelBtn.Name
            ChannelHolder.Visible = true
         end
         local ChannelContent = {}
         function ChannelContent:Button(text,callback)
            local Button = Instance.new("TextButton")
            local ButtonCorner = Instance.new("UICorner")

            Button.Name = "Button"
            Button.Parent = ChannelHolder
            Button.BackgroundColor3 = Color3.fromRGB(20,20,20)
            Button.Size = UDim2.new(0, 401, 0, 30)
            Button.AutoButtonColor = false
            Button.Font = Enum.Font.Gotham
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 14.000
            Button.Text = text

            ButtonCorner.CornerRadius = UDim.new(0, 4)
            ButtonCorner.Name = "ButtonCorner"
            ButtonCorner.Parent = Button

            Button.MouseEnter:Connect(function()
               TweenService:Create(
                  Button,
                  TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                  {BackgroundColor3 = Color3.fromRGB(15,15,15)}
               ):Play()
            end)

            Button.MouseButton1Click:Connect(function()
               pcall(callback)
               Button.TextSize = 0
               TweenService:Create(
                  Button,
                  TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                  {TextSize = 14}
               ):Play()
            end)

            Button.MouseLeave:Connect(function()
               TweenService:Create(
                  Button,
                  TweenInfo.new(.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                  {BackgroundColor3 = Color3.fromRGB(20,20,20)}
               ):Play()
            end)
            ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
         end
         function ChannelContent:Toggle(text,default,callback)
            local toggled = false
            local Toggle = Instance.new("TextButton")
            local ToggleTitle = Instance.new("TextLabel")
            local ToggleFrame = Instance.new("Frame")
            local ToggleFrameCorner = Instance.new("UICorner")
            local ToggleFrameCircle = Instance.new("Frame")
            local ToggleFrameCircleCorner = Instance.new("UICorner")
            local Icon = Instance.new("ImageLabel")

            Toggle.Name = "Toggle"
            Toggle.Parent = ChannelHolder
            Toggle.BackgroundColor3 = Color3.fromRGB(25,25,25)
            Toggle.BorderSizePixel = 0
            Toggle.Position = UDim2.new(0.261979163, 0, 0.190789461, 0)
            Toggle.Size = UDim2.new(0, 401, 0, 30)
            Toggle.AutoButtonColor = false
            Toggle.Font = Enum.Font.Gotham
            Toggle.Text = ""
            Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
            Toggle.TextSize = 14.000

            ToggleTitle.Name = "ToggleTitle"
            ToggleTitle.Parent = Toggle
            ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleTitle.BackgroundTransparency = 1.000
            ToggleTitle.Position = UDim2.new(0, 5, 0, 0)
            ToggleTitle.Size = UDim2.new(0, 200, 0, 30)
            ToggleTitle.Font = Enum.Font.Gotham
            ToggleTitle.Text = text
            ToggleTitle.TextColor3 = Color3.fromRGB(127, 131, 137)
            ToggleTitle.TextSize = 14.000
            ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

            ToggleFrame.Name = "ToggleFrame"
            ToggleFrame.Parent = Toggle
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)
            ToggleFrame.Position = UDim2.new(0.900481343, -5, 0.13300018, 0)
            ToggleFrame.Size = UDim2.new(0, 40, 0, 21)

            ToggleFrameCorner.CornerRadius = UDim.new(0, 4)
            ToggleFrameCorner.Name = "ToggleFrameCorner"
            ToggleFrameCorner.Parent = ToggleFrame

            ToggleFrameCircle.Name = "ToggleFrameCircle"
            ToggleFrameCircle.Parent = ToggleFrame
            ToggleFrameCircle.BackgroundColor3 = Color3.fromRGB(50,50,50)
            ToggleFrameCircle.Position = UDim2.new(0.234999999, -5, 0.133000001, 0)
            ToggleFrameCircle.Size = UDim2.new(0, 15, 0, 15)

            ToggleFrameCircleCorner.CornerRadius = UDim.new(0, 4)
            ToggleFrameCircleCorner.Name = "ToggleFrameCircleCorner"
            ToggleFrameCircleCorner.Parent = ToggleFrameCircle

            Icon.Name = "Icon"
            Icon.Parent = ToggleFrameCircle
            Icon.AnchorPoint = Vector2.new(0.5, 0.5)
            Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Icon.BackgroundTransparency = 1.000
            Icon.BorderColor3 = Color3.fromRGB(255,255,255)
            Icon.Position = UDim2.new(0, 7, 0, 7)
            Icon.Size = UDim2.new(0, 13, 0, 13)
            Icon.Image = "http://www.roblox.com/asset/?id=6035047409"
            Icon.ImageColor3 = Color3.fromRGB(255,255,255)

            Toggle.MouseButton1Click:Connect(function()
               if toggled == false then
                  TweenService:Create(Icon,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
                  TweenService:Create(ToggleFrame,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(0, 255, 0)}):Play()
                  ToggleFrameCircle:TweenPosition(UDim2.new(0.655, -5, 0.133000001, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
                  TweenService:Create(Icon,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
                  Icon.Image = "http://www.roblox.com/asset/?id=6023426926"
                  wait(.1)
                  TweenService:Create(Icon,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0}):Play()
               else
                  TweenService:Create(Icon,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
                  TweenService:Create(ToggleFrame,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(10,10,10)}):Play()
                  ToggleFrameCircle:TweenPosition(UDim2.new(0.234999999, -5, 0.133000001, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
                  TweenService:Create(Icon,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
                  Icon.Image = "http://www.roblox.com/asset/?id=6035047409"
                  wait(.01)
                  TweenService:Create(Icon,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0}):Play()
               end
               toggled = not toggled
               pcall(callback, toggled)
            end)
            if default == true then
               toggled = false
               TweenService:Create(Icon,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
               TweenService:Create(ToggleFrame,TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(0, 255, 0)}):Play()
               ToggleFrameCircle:TweenPosition(UDim2.new(0.655, -5, 0.133000001, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .3, true)
               TweenService:Create(Icon,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
               Icon.Image = "http://www.roblox.com/asset/?id=6023426926"
               wait(.1)
               TweenService:Create(Icon,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0}):Play()
               toggled = not toggled
               pcall(callback, toggled)
            else
               wait(.1)
            end
            ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
         end

         function ChannelContent:Slider(text, min, max, start, callback)
            local SliderFunc = {}
            local dragging = false
            local Slider = Instance.new("TextButton")
            local SliderTitle = Instance.new("TextLabel")
            local SliderFrame = Instance.new("Frame")
            local SliderFrameCorner = Instance.new("UICorner")
            local CurrentValueFrame = Instance.new("Frame")
            local CurrentValueFrameCorner = Instance.new("UICorner")
            local Zip = Instance.new("Frame")
            local ZipCorner = Instance.new("UICorner")
            local ValueBubble = Instance.new("Frame")
            local ValueBubbleCorner = Instance.new("UICorner")
            local SquareBubble = Instance.new("Frame")
            local GlowBubble = Instance.new("ImageLabel")
            local ValueLabel = Instance.new("TextLabel")


            Slider.Name = "Slider"
            Slider.Parent = ChannelHolder
            Slider.BackgroundColor3 = Color3.fromRGB(25,25,25)
            Slider.BorderSizePixel = 0
            Slider.Position = UDim2.new(0, 0, 0.216560602, 0)
            Slider.Size = UDim2.new(0, 401, 0, 38)
            Slider.AutoButtonColor = false
            Slider.Font = Enum.Font.Gotham
            Slider.Text = ""
            Slider.TextColor3 = Color3.fromRGB(255, 255, 255)
            Slider.TextSize = 14.000

            SliderTitle.Name = "SliderTitle"
            SliderTitle.Parent = Slider
            SliderTitle.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            SliderTitle.BackgroundTransparency = 1.000
            SliderTitle.Position = UDim2.new(0, 5, 0, -4)
            SliderTitle.Size = UDim2.new(0, 200, 0, 27)
            SliderTitle.Font = Enum.Font.Gotham
            SliderTitle.Text = text
            SliderTitle.TextColor3 = Color3.fromRGB(127, 131, 137)
            SliderTitle.TextSize = 14.000
            SliderTitle.TextXAlignment = Enum.TextXAlignment.Left

            SliderFrame.Name = "SliderFrame"
            SliderFrame.Parent = Slider
            SliderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            SliderFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
            SliderFrame.Position = UDim2.new(0.497999996, 0, 0.757000029, 0)
            SliderFrame.Size = UDim2.new(0, 385, 0, 8)

            SliderFrameCorner.Name = "SliderFrameCorner"
            SliderFrameCorner.Parent = SliderFrame

            CurrentValueFrame.Name = "CurrentValueFrame"
            CurrentValueFrame.Parent = SliderFrame
            CurrentValueFrame.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            CurrentValueFrame.Size = UDim2.new((start or 0) / max, 0, 0, 8)

            CurrentValueFrameCorner.Name = "CurrentValueFrameCorner"
            CurrentValueFrameCorner.Parent = CurrentValueFrame

            Zip.Name = "Zip"
            Zip.Parent = SliderFrame
            Zip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Zip.Position = UDim2.new((start or 0)/max, -6,-0.644999981, 0)
            Zip.Size = UDim2.new(0, 10, 0, 18)
            ZipCorner.CornerRadius = UDim.new(0, 3)
            ZipCorner.Name = "ZipCorner"
            ZipCorner.Parent = Zip

            ValueBubble.Name = "ValueBubble"
            ValueBubble.Parent = Zip
            ValueBubble.AnchorPoint = Vector2.new(0.5, 0.5)
            ValueBubble.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
            ValueBubble.Position = UDim2.new(0.5, 0, -1.00800002, 0)
            ValueBubble.Size = UDim2.new(0, 36, 0, 21)
            ValueBubble.Visible = false


            Zip.MouseEnter:Connect(function()
               if dragging == false then
                  ValueBubble.Visible = true
               end
            end)

            Zip.MouseLeave:Connect(function()
               if dragging == false then
                  ValueBubble.Visible = false
               end
            end)


            ValueBubbleCorner.CornerRadius = UDim.new(0, 3)
            ValueBubbleCorner.Name = "ValueBubbleCorner"
            ValueBubbleCorner.Parent = ValueBubble

            SquareBubble.Name = "SquareBubble"
            SquareBubble.Parent = ValueBubble
            SquareBubble.AnchorPoint = Vector2.new(0.5, 0.5)
            SquareBubble.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
            SquareBubble.BorderSizePixel = 0
            SquareBubble.Position = UDim2.new(0.493000001, 0, 0.637999971, 0)
            SquareBubble.Rotation = 45.000
            SquareBubble.Size = UDim2.new(0, 19, 0, 19)

            GlowBubble.Name = "GlowBubble"
            GlowBubble.Parent = ValueBubble
            GlowBubble.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            GlowBubble.BackgroundTransparency = 1.000
            GlowBubble.BorderSizePixel = 0
            GlowBubble.Position = UDim2.new(0, -15, 0, -15)
            GlowBubble.Size = UDim2.new(1, 30, 1, 30)
            GlowBubble.ZIndex = 0
            GlowBubble.Image = "rbxassetid://4996891970"
            GlowBubble.ImageColor3 = Color3.fromRGB(15, 15, 15)
            GlowBubble.ScaleType = Enum.ScaleType.Slice
            GlowBubble.SliceCenter = Rect.new(20, 20, 280, 280)

            ValueLabel.Name = "ValueLabel"
            ValueLabel.Parent = ValueBubble
            ValueLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ValueLabel.BackgroundTransparency = 1.000
            ValueLabel.Size = UDim2.new(0, 36, 0, 21)
            ValueLabel.Font = Enum.Font.Gotham
            ValueLabel.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
            ValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            ValueLabel.TextSize = 10.000
            local function move(input)
               local pos =
                  UDim2.new(
                     math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1),
                     -6,
                     -0.644999981,
                     0
                  )
               local pos1 =
                  UDim2.new(
                     math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1),
                     0,
                     0,
                     8
                  )
               CurrentValueFrame.Size = pos1
               Zip.Position = pos
               local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
               ValueLabel.Text = tostring(value)
               pcall(callback, value)
            end
            Zip.InputBegan:Connect(
               function(input)
                  if input.UserInputType == Enum.UserInputType.MouseButton1 then
                     dragging = true
                     ValueBubble.Visible = true
                  end
               end
            )
            Zip.InputEnded:Connect(
               function(input)
                  if input.UserInputType == Enum.UserInputType.MouseButton1 then
                     dragging = false
                     ValueBubble.Visible = false
                  end
               end
            )
            game:GetService("UserInputService").InputChanged:Connect(
            function(input)
               if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                  move(input)
               end
            end
            )

            function SliderFunc:Change(tochange)
               CurrentValueFrame.Size = UDim2.new((tochange or 0) / max, 0, 0, 8)
               Zip.Position = UDim2.new((tochange or 0)/max, -6,-0.644999981, 0)
               ValueLabel.Text = tostring(tochange and math.floor((tochange / max) * (max - min) + min) or 0)
               pcall(callback, tochange)
            end

            ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
            return SliderFunc
         end
         function ChannelContent:Line()
            local Seperator1 = Instance.new("Frame")
            local Seperator2 = Instance.new("Frame")

            Seperator1.Name = "Seperator1"
            Seperator1.Parent = ChannelHolder
            Seperator1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Seperator1.BackgroundTransparency = 1.000
            Seperator1.Position = UDim2.new(0, 0, 0.350318581, 0)
            Seperator1.Size = UDim2.new(0, 100, 0, 8)

            Seperator2.Name = "Seperator2"
            Seperator2.Parent = Seperator1
            Seperator2.BackgroundColor3 = Color3.fromRGB(66, 69, 74)
            Seperator2.BorderSizePixel = 0
            Seperator2.Position = UDim2.new(0, 0, 0, 4)
            Seperator2.Size = UDim2.new(0, 401, 0, 1)
            ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
         end
         function ChannelContent:Dropdown(text, list, callback)
            local DropFunc = {}
            local itemcount = 0
            local framesize = 0
            local DropTog = false
            local Dropdown = Instance.new("Frame")
            local DropdownTitle = Instance.new("TextLabel")
            local DropdownFrameOutline = Instance.new("Frame")
            local DropdownFrameOutlineCorner = Instance.new("UICorner")
            local DropdownFrame = Instance.new("Frame")
            local DropdownFrameCorner = Instance.new("UICorner")
            local CurrentSelectedText = Instance.new("TextLabel")
            local ArrowImg = Instance.new("ImageLabel")
            local DropdownFrameBtn = Instance.new("TextButton")

            Dropdown.Name = "Dropdown"
            Dropdown.Parent = ChannelHolder
            Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Dropdown.BackgroundTransparency = 1.000
            Dropdown.Position = UDim2.new(0.0796874985, 0, 0.445175439, 0)
            Dropdown.Size = UDim2.new(0, 403, 0, 73)

            DropdownTitle.Name = "DropdownTitle"
            DropdownTitle.Parent = Dropdown
            DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownTitle.BackgroundTransparency = 1.000
            DropdownTitle.Position = UDim2.new(0, 5, 0, 0)
            DropdownTitle.Size = UDim2.new(0, 200, 0, 29)
            DropdownTitle.Font = Enum.Font.Gotham
            DropdownTitle.Text = text
            DropdownTitle.TextColor3 = Color3.fromRGB(127, 131, 137)
            DropdownTitle.TextSize = 14.000
            DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left

            DropdownFrameOutline.Name = "DropdownFrameOutline"
            DropdownFrameOutline.Parent = DropdownTitle
            DropdownFrameOutline.AnchorPoint = Vector2.new(0.5, 0.5)
            DropdownFrameOutline.BackgroundColor3 = Color3.fromRGB(15,15,15)
            DropdownFrameOutline.Position = UDim2.new(0.988442957, 0, 1.6197437, 0)
            DropdownFrameOutline.Size = UDim2.new(0, 396, 0, 36)

            DropdownFrameOutlineCorner.CornerRadius = UDim.new(0, 3)
            DropdownFrameOutlineCorner.Name = "DropdownFrameOutlineCorner"
            DropdownFrameOutlineCorner.Parent = DropdownFrameOutline

            DropdownFrame.Name = "DropdownFrame"
            DropdownFrame.Parent = DropdownTitle
            DropdownFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
            DropdownFrame.ClipsDescendants = true
            DropdownFrame.Position = UDim2.new(0.00999999978, 0, 1.06638527, 0)
            DropdownFrame.Selectable = true
            DropdownFrame.Size = UDim2.new(0, 392, 0, 32)

            DropdownFrameCorner.CornerRadius = UDim.new(0, 4)
            DropdownFrameCorner.Name = "DropdownFrameCorner"
            DropdownFrameCorner.Parent = DropdownFrame

            CurrentSelectedText.Name = "CurrentSelectedText"
            CurrentSelectedText.Parent = DropdownFrame
            CurrentSelectedText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            CurrentSelectedText.BackgroundTransparency = 1.000
            CurrentSelectedText.Position = UDim2.new(0.0178571437, 0, 0, 0)
            CurrentSelectedText.Size = UDim2.new(0, 193, 0, 32)
            CurrentSelectedText.Font = Enum.Font.Gotham
            CurrentSelectedText.Text = "..."
            CurrentSelectedText.TextColor3 = Color3.fromRGB(212, 212, 212)
            CurrentSelectedText.TextSize = 14.000
            CurrentSelectedText.TextXAlignment = Enum.TextXAlignment.Left

            ArrowImg.Name = "ArrowImg"
            ArrowImg.Parent = CurrentSelectedText
            ArrowImg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ArrowImg.BackgroundTransparency = 1.000
            ArrowImg.Position = UDim2.new(1.84974098, 0, 0.167428851, 0)
            ArrowImg.Size = UDim2.new(0, 22, 0, 22)
            ArrowImg.Image = "http://www.roblox.com/asset/?id=6034818372"
            ArrowImg.ImageColor3 = Color3.fromRGB(212, 212, 212)

            DropdownFrameBtn.Name = "DropdownFrameBtn"
            DropdownFrameBtn.Parent = DropdownFrame
            DropdownFrameBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownFrameBtn.BackgroundTransparency = 1.000
            DropdownFrameBtn.Size = UDim2.new(0, 392, 0, 32)
            DropdownFrameBtn.Font = Enum.Font.SourceSans
            DropdownFrameBtn.Text = ""
            DropdownFrameBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
            DropdownFrameBtn.TextSize = 14.000

            local DropdownFrameMainOutline = Instance.new("Frame")
            local DropdownFrameMainOutlineCorner = Instance.new("UICorner")
            local DropdownFrameMain = Instance.new("Frame")
            local DropdownFrameMainCorner = Instance.new("UICorner")
            local DropItemHolderLabel = Instance.new("TextLabel")
            local DropItemHolder = Instance.new("ScrollingFrame")
            local DropItemHolderLayout = Instance.new("UIListLayout")

            DropdownFrameMainOutline.Name = "DropdownFrameMainOutline"
            DropdownFrameMainOutline.Parent = DropdownTitle
            DropdownFrameMainOutline.BackgroundColor3 = Color3.fromRGB(15,15,15)
            DropdownFrameMainOutline.Position = UDim2.new(-0.00155700743, 0, 2.16983342, 0)
            DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, 81)
            DropdownFrameMainOutline.Visible = false

            DropdownFrameMainOutlineCorner.CornerRadius = UDim.new(0, 3)
            DropdownFrameMainOutlineCorner.Name = "DropdownFrameMainOutlineCorner"
            DropdownFrameMainOutlineCorner.Parent = DropdownFrameMainOutline

            DropdownFrameMain.Name = "DropdownFrameMain"
            DropdownFrameMain.Parent = DropdownTitle
            DropdownFrameMain.BackgroundColor3 = Color3.fromRGB(25,25,25)
            DropdownFrameMain.ClipsDescendants = true
            DropdownFrameMain.Position = UDim2.new(0.00999999978, 0, 2.2568965, 0)
            DropdownFrameMain.Selectable = true
            DropdownFrameMain.Size = UDim2.new(0, 392, 0, 77)
            DropdownFrameMain.Visible = false

            DropdownFrameMainCorner.CornerRadius = UDim.new(0, 4)
            DropdownFrameMainCorner.Name = "DropdownFrameMainCorner"
            DropdownFrameMainCorner.Parent = DropdownFrameMain

            DropItemHolderLabel.Name = "ItemHolderLabel"
            DropItemHolderLabel.Parent = DropdownFrameMain
            DropItemHolderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropItemHolderLabel.BackgroundTransparency = 1.000
            DropItemHolderLabel.Position = UDim2.new(0.0178571437, 0, 0, 0)
            DropItemHolderLabel.Size = UDim2.new(0, 193, 0, 13)
            DropItemHolderLabel.Font = Enum.Font.Gotham
            DropItemHolderLabel.Text = ""
            DropItemHolderLabel.TextColor3 = Color3.fromRGB(212, 212, 212)
            DropItemHolderLabel.TextSize = 14.000
            DropItemHolderLabel.TextXAlignment = Enum.TextXAlignment.Left

            DropItemHolder.Name = "ItemHolder"
            DropItemHolder.Parent = DropItemHolderLabel
            DropItemHolder.Active = true
            DropItemHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropItemHolder.BackgroundTransparency = 1.000
            DropItemHolder.Position = UDim2.new(0, 0, 0.215384638, 0)
            DropItemHolder.Size = UDim2.new(0, 385, 0, 0)
            DropItemHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
            DropItemHolder.ScrollBarThickness = 4
            DropItemHolder.BorderSizePixel = 0
            DropItemHolder.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 0)

            DropItemHolderLayout.Name = "ItemHolderLayout"
            DropItemHolderLayout.Parent = DropItemHolder
            DropItemHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
            DropItemHolderLayout.Padding = UDim.new(0, 0)

            DropdownFrameBtn.MouseButton1Click:Connect(function()
               if DropTog == false then
                  DropdownFrameMain.Visible = true
                  DropdownFrameMainOutline.Visible = true
                  Dropdown.Size = UDim2.new(0, 403, 0, 73 + DropdownFrameMainOutline.AbsoluteSize.Y)
                  ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)

               else
                  Dropdown.Size = UDim2.new(0, 403, 0, 73)
                  DropdownFrameMain.Visible = false
                  DropdownFrameMainOutline.Visible = false
                  ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
               end
               DropTog = not DropTog
            end)


            for i,v in next, list do
               itemcount = itemcount + 1

               if itemcount == 1 then
                  framesize = 29
               elseif itemcount == 2 then
                  framesize = 58
               elseif itemcount >= 3 then
                  framesize = 87
               end

               local Item = Instance.new("TextButton")
               local ItemCorner = Instance.new("UICorner")
               local ItemText = Instance.new("TextLabel")

               Item.Name = "Item"
               Item.Parent = DropItemHolder
               Item.BackgroundColor3 = Color3.fromRGB(10,10,10)
               Item.Size = UDim2.new(0, 379, 0, 29)
               Item.AutoButtonColor = false
               Item.Font = Enum.Font.SourceSans
               Item.Text = ""
               Item.TextColor3 = Color3.fromRGB(0, 0, 0)
               Item.TextSize = 14.000
               Item.BackgroundTransparency = 1

               ItemCorner.CornerRadius = UDim.new(0, 4)
               ItemCorner.Name = "ItemCorner"
               ItemCorner.Parent = Item

               ItemText.Name = "ItemText"
               ItemText.Parent = Item
               ItemText.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
               ItemText.BackgroundTransparency = 1.000
               ItemText.Position = UDim2.new(0.0211081803, 0, 0, 0)
               ItemText.Size = UDim2.new(0, 192, 0, 29)
               ItemText.Font = Enum.Font.Gotham
               ItemText.TextColor3 = Color3.fromRGB(212, 212, 212)
               ItemText.TextSize = 14.000
               ItemText.TextXAlignment = Enum.TextXAlignment.Left
               ItemText.Text = v

               Item.MouseEnter:Connect(function()
                  ItemText.TextColor3 = Color3.fromRGB(255,255,255)
                  Item.BackgroundTransparency = 0
               end)

               Item.MouseLeave:Connect(function()
                  ItemText.TextColor3 = Color3.fromRGB(212, 212, 212)
                  Item.BackgroundTransparency = 1
               end)

               Item.MouseButton1Click:Connect(function()
                  CurrentSelectedText.Text = v
                  pcall(callback, v)
                  Dropdown.Size = UDim2.new(0, 403, 0, 73)
                  DropdownFrameMain.Visible = false
                  DropdownFrameMainOutline.Visible = false
                  ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
                  DropTog = not DropTog
               end)

               DropItemHolder.CanvasSize = UDim2.new(0,0,0,DropItemHolderLayout.AbsoluteContentSize.Y)

               DropItemHolder.Size = UDim2.new(0, 385, 0, framesize)
               DropdownFrameMain.Size = UDim2.new(0, 392, 0, framesize + 6)
               DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, framesize + 10)
            end

            ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)

            function DropFunc:Clear()
               for i,v in next, DropItemHolder:GetChildren() do
                  if v.Name == "Item" then
                     v:Destroy()
                  end
               end

               CurrentSelectedText.Text = "..."

               itemcount = 0
               framesize = 0
               DropItemHolder.Size = UDim2.new(0, 385, 0, 0)
               DropdownFrameMain.Size = UDim2.new(0, 392, 0, 0)
               DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, 0)
               Dropdown.Size = UDim2.new(0, 403, 0, 73)
               DropdownFrameMain.Visible = false
               DropdownFrameMainOutline.Visible = false
               ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
            end

            function DropFunc:Add(textadd)
               itemcount = itemcount + 1

               if itemcount == 1 then
                  framesize = 29
               elseif itemcount == 2 then
                  framesize = 58
               elseif itemcount >= 3 then
                  framesize = 87
               end

               local Item = Instance.new("TextButton")
               local ItemCorner = Instance.new("UICorner")
               local ItemText = Instance.new("TextLabel")

               Item.Name = "Item"
               Item.Parent = DropItemHolder
               Item.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
               Item.Size = UDim2.new(0, 379, 0, 29)
               Item.AutoButtonColor = false
               Item.Font = Enum.Font.SourceSans
               Item.Text = ""
               Item.TextColor3 = Color3.fromRGB(0, 0, 0)
               Item.TextSize = 14.000
               Item.BackgroundTransparency = 1

               ItemCorner.CornerRadius = UDim.new(0, 4)
               ItemCorner.Name = "ItemCorner"
               ItemCorner.Parent = Item

               ItemText.Name = "ItemText"
               ItemText.Parent = Item
               ItemText.BackgroundColor3 = Color3.fromRGB(42, 44, 48)
               ItemText.BackgroundTransparency = 1.000
               ItemText.Position = UDim2.new(0.0211081803, 0, 0, 0)
               ItemText.Size = UDim2.new(0, 192, 0, 29)
               ItemText.Font = Enum.Font.Gotham
               ItemText.TextColor3 = Color3.fromRGB(212, 212, 212)
               ItemText.TextSize = 14.000
               ItemText.TextXAlignment = Enum.TextXAlignment.Left
               ItemText.Text = textadd

               Item.MouseEnter:Connect(function()
                  ItemText.TextColor3 = Color3.fromRGB(255,255,255)
                  Item.BackgroundTransparency = 0
               end)

               Item.MouseLeave:Connect(function()
                  ItemText.TextColor3 = Color3.fromRGB(212, 212, 212)
                  Item.BackgroundTransparency = 1
               end)

               Item.MouseButton1Click:Connect(function()
                  CurrentSelectedText.Text = textadd
                  pcall(callback, textadd)
                  Dropdown.Size = UDim2.new(0, 403, 0, 73)
                  DropdownFrameMain.Visible = false
                  DropdownFrameMainOutline.Visible = false
                  ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
                  DropTog = not DropTog
               end)

               DropItemHolder.CanvasSize = UDim2.new(0,0,0,DropItemHolderLayout.AbsoluteContentSize.Y)

               DropItemHolder.Size = UDim2.new(0, 385, 0, framesize)
               DropdownFrameMain.Size = UDim2.new(0, 392, 0, framesize + 6)
               DropdownFrameMainOutline.Size = UDim2.new(0, 396, 0, framesize + 10)
            end
            return DropFunc
         end
         function ChannelContent:Colorpicker(text, preset, callback)
            local OldToggleColor = Color3.fromRGB(0, 0, 0)
            local OldColor = Color3.fromRGB(0, 0, 0)
            local OldColorSelectionPosition = nil
            local OldHueSelectionPosition = nil
            local ColorH, ColorS, ColorV = 1, 1, 1
            local RainbowColorPicker = false
            local ColorPickerInput = nil
            local ColorInput = nil
            local HueInput = nil

            local Colorpicker = Instance.new("Frame")
            local ColorpickerTitle = Instance.new("TextLabel")
            local ColorpickerFrameOutline = Instance.new("Frame")
            local ColorpickerFrameOutlineCorner = Instance.new("UICorner")
            local ColorpickerFrame = Instance.new("Frame")
            local ColorpickerFrameCorner = Instance.new("UICorner")
            local Color = Instance.new("ImageLabel")
            local ColorCorner = Instance.new("UICorner")
            local ColorSelection = Instance.new("ImageLabel")
            local Hue = Instance.new("ImageLabel")
            local HueCorner = Instance.new("UICorner")
            local HueGradient = Instance.new("UIGradient")
            local HueSelection = Instance.new("ImageLabel")
            local PresetClr = Instance.new("Frame")
            local PresetClrCorner = Instance.new("UICorner")

            Colorpicker.Name = "Colorpicker"
            Colorpicker.Parent = ChannelHolder
            Colorpicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Colorpicker.BackgroundTransparency = 1.000
            Colorpicker.Position = UDim2.new(0.0895741582, 0, 0.474232763, 0)
            Colorpicker.Size = UDim2.new(0, 403, 0, 175)

            ColorpickerTitle.Name = "ColorpickerTitle"
            ColorpickerTitle.Parent = Colorpicker
            ColorpickerTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorpickerTitle.BackgroundTransparency = 1.000
            ColorpickerTitle.Position = UDim2.new(0, 5, 0, 0)
            ColorpickerTitle.Size = UDim2.new(0, 200, 0, 29)
            ColorpickerTitle.Font = Enum.Font.Gotham
            ColorpickerTitle.Text = "Colorpicker"
            ColorpickerTitle.TextColor3 = Color3.fromRGB(127, 131, 137)
            ColorpickerTitle.TextSize = 14.000
            ColorpickerTitle.TextXAlignment = Enum.TextXAlignment.Left

            ColorpickerFrameOutline.Name = "ColorpickerFrameOutline"
            ColorpickerFrameOutline.Parent = ColorpickerTitle
            ColorpickerFrameOutline.BackgroundColor3 = Color3.fromRGB(37, 40, 43)
            ColorpickerFrameOutline.Position = UDim2.new(-0.00100000005, 0, 0.991999984, 0)
            ColorpickerFrameOutline.Size = UDim2.new(0, 238, 0, 139)

            ColorpickerFrameOutlineCorner.CornerRadius = UDim.new(0, 3)
            ColorpickerFrameOutlineCorner.Name = "ColorpickerFrameOutlineCorner"

            ColorpickerFrameOutlineCorner.Parent = ColorpickerFrameOutline

            ColorpickerFrame.Name = "ColorpickerFrame"
            ColorpickerFrame.Parent = ColorpickerTitle
            ColorpickerFrame.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
            ColorpickerFrame.ClipsDescendants = true
            ColorpickerFrame.Position = UDim2.new(0.00999999978, 0, 1.06638515, 0)
            ColorpickerFrame.Selectable = true
            ColorpickerFrame.Size = UDim2.new(0, 234, 0, 135)

            ColorpickerFrameCorner.CornerRadius = UDim.new(0, 3)
            ColorpickerFrameCorner.Name = "ColorpickerFrameCorner"
            ColorpickerFrameCorner.Parent = ColorpickerFrame

            Color.Name = "Color"
            Color.Parent = ColorpickerFrame
            Color.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
            Color.Position = UDim2.new(0, 10, 0, 10)
            Color.Size = UDim2.new(0, 154, 0, 118)
            Color.ZIndex = 10
            Color.Image = "rbxassetid://4155801252"

            ColorCorner.CornerRadius = UDim.new(0, 3)
            ColorCorner.Name = "ColorCorner"
            ColorCorner.Parent = Color

            ColorSelection.Name = "ColorSelection"
            ColorSelection.Parent = Color
            ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
            ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorSelection.BackgroundTransparency = 1.000
            ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
            ColorSelection.Size = UDim2.new(0, 18, 0, 18)
            ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
            ColorSelection.ScaleType = Enum.ScaleType.Fit

            Hue.Name = "Hue"
            Hue.Parent = ColorpickerFrame
            Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Hue.Position = UDim2.new(0, 171, 0, 10)
            Hue.Size = UDim2.new(0, 18, 0, 118)

            HueCorner.CornerRadius = UDim.new(0, 3)
            HueCorner.Name = "HueCorner"
            HueCorner.Parent = Hue

            HueGradient.Color = ColorSequence.new {
               ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
               ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
               ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
               ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
               ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
               ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
               ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
            }
            HueGradient.Rotation = 270
            HueGradient.Name = "HueGradient"
            HueGradient.Parent = Hue

            HueSelection.Name = "HueSelection"
            HueSelection.Parent = Hue
            HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
            HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            HueSelection.BackgroundTransparency = 1.000
            HueSelection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(preset)))
            HueSelection.Size = UDim2.new(0, 18, 0, 18)
            HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"

            PresetClr.Name = "PresetClr"
            PresetClr.Parent = ColorpickerFrame
            PresetClr.BackgroundColor3 = preset
            PresetClr.Position = UDim2.new(0.846153855, 0, 0.0740740746, 0)
            PresetClr.Size = UDim2.new(0, 25, 0, 25)

            PresetClrCorner.CornerRadius = UDim.new(0, 3)
            PresetClrCorner.Name = "PresetClrCorner"
            PresetClrCorner.Parent = PresetClr

            local function UpdateColorPicker(nope)
               PresetClr.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
               Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

               pcall(callback, PresetClr.BackgroundColor3)
            end

            ColorH =
               1 -
               (math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
                  Hue.AbsoluteSize.Y)
            ColorS =
               (math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
                  Color.AbsoluteSize.X)
            ColorV =
               1 -
               (math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
                  Color.AbsoluteSize.Y)

            PresetClr.BackgroundColor3 = preset
            Color.BackgroundColor3 = preset
            pcall(callback, PresetClr.BackgroundColor3)

            Color.InputBegan:Connect(
               function(input)
                  if input.UserInputType == Enum.UserInputType.MouseButton1 then

                     if ColorInput then
                        ColorInput:Disconnect()
                     end

                     ColorInput =
                        RunService.RenderStepped:Connect(
                           function()
                           local ColorX =
                              (math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
                                 Color.AbsoluteSize.X)
                           local ColorY =
                              (math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
                                 Color.AbsoluteSize.Y)

                           ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
                           ColorS = ColorX
                           ColorV = 1 - ColorY

                           UpdateColorPicker(true)
                        end
                        )
                  end
               end
            )

            Color.InputEnded:Connect(
               function(input)
                  if input.UserInputType == Enum.UserInputType.MouseButton1 then
                     if ColorInput then
                        ColorInput:Disconnect()
                     end
                  end
               end
            )

            Hue.InputBegan:Connect(
               function(input)
                  if input.UserInputType == Enum.UserInputType.MouseButton1 then


                     if HueInput then
                        HueInput:Disconnect()
                     end

                     HueInput =
                        RunService.RenderStepped:Connect(
                           function()
                           local HueY =
                              (math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
                                 Hue.AbsoluteSize.Y)

                           HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
                           ColorH = 1 - HueY

                           UpdateColorPicker(true)
                        end
                        )
                  end
               end
            )

            Hue.InputEnded:Connect(
               function(input)
                  if input.UserInputType == Enum.UserInputType.MouseButton1 then
                     if HueInput then
                        HueInput:Disconnect()
                     end
                  end
               end
            )

            ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
         end

         function ChannelContent:Textbox(text, placetext, disapper, callback)
            local Textbox = Instance.new("Frame")
            local TextboxTitle = Instance.new("TextLabel")
            local TextboxFrameOutline = Instance.new("Frame")
            local TextboxFrameOutlineCorner = Instance.new("UICorner")
            local TextboxFrame = Instance.new("Frame")
            local TextboxFrameCorner = Instance.new("UICorner")
            local TextBox = Instance.new("TextBox")

            Textbox.Name = "Textbox"
            Textbox.Parent = ChannelHolder
            Textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Textbox.BackgroundTransparency = 1.000
            Textbox.Position = UDim2.new(0.0796874985, 0, 0.445175439, 0)
            Textbox.Size = UDim2.new(0, 403, 0, 73)

            TextboxTitle.Name = "TextboxTitle"
            TextboxTitle.Parent = Textbox
            TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextboxTitle.BackgroundTransparency = 1.000
            TextboxTitle.Position = UDim2.new(0, 5, 0, 0)
            TextboxTitle.Size = UDim2.new(0, 200, 0, 29)
            TextboxTitle.Font = Enum.Font.Gotham
            TextboxTitle.Text = text
            TextboxTitle.TextColor3 = Color3.fromRGB(127, 131, 137)
            TextboxTitle.TextSize = 14.000
            TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left

            TextboxFrameOutline.Name = "TextboxFrameOutline"
            TextboxFrameOutline.Parent = TextboxTitle
            TextboxFrameOutline.AnchorPoint = Vector2.new(0.5, 0.5)
            TextboxFrameOutline.BackgroundColor3 = Color3.fromRGB(15,15,15)
            TextboxFrameOutline.Position = UDim2.new(0.988442957, 0, 1.6197437, 0)
            TextboxFrameOutline.Size = UDim2.new(0, 396, 0, 36)

            TextboxFrameOutlineCorner.CornerRadius = UDim.new(0, 3)
            TextboxFrameOutlineCorner.Name = "TextboxFrameOutlineCorner"
            TextboxFrameOutlineCorner.Parent = TextboxFrameOutline

            TextboxFrame.Name = "TextboxFrame"
            TextboxFrame.Parent = TextboxTitle
            TextboxFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
            TextboxFrame.ClipsDescendants = true
            TextboxFrame.Position = UDim2.new(0.00999999978, 0, 1.06638527, 0)
            TextboxFrame.Selectable = true
            TextboxFrame.Size = UDim2.new(0, 392, 0, 32)

            TextboxFrameCorner.CornerRadius = UDim.new(0, 4)
            TextboxFrameCorner.Name = "TextboxFrameCorner"
            TextboxFrameCorner.Parent = TextboxFrame

            TextBox.Parent = TextboxFrame
            TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.BackgroundTransparency = 1.000
            TextBox.Position = UDim2.new(0.0178571437, 0, 0, 0)
            TextBox.Size = UDim2.new(0, 377, 0, 32)
            TextBox.Font = Enum.Font.Gotham
            TextBox.PlaceholderColor3 = Color3.fromRGB(255,255,255)
            TextBox.PlaceholderText = placetext
            TextBox.Text = ""
            TextBox.TextColor3 = Color3.fromRGB(193, 195, 197)
            TextBox.TextSize = 14.000
            TextBox.TextXAlignment = Enum.TextXAlignment.Left

            TextBox.Focused:Connect(function()
               TweenService:Create(
                  TextboxFrameOutline,
                  TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                  {BackgroundColor3 = Color3.fromRGB(255, 170, 0)}
               ):Play()
            end)

            TextBox.FocusLost:Connect(function(ep)
               TweenService:Create(
                  TextboxFrameOutline,
                  TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                  {BackgroundColor3 = Color3.fromRGB(15,15,15)}
               ):Play()
               if ep then
                  if #TextBox.Text > 0 then
                     pcall(callback, TextBox.Text)
                     if disapper then
                        TextBox.Text = ""
                     end
                  end
               end
            end)

            ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
         end

         function ChannelContent:Label(text)
            local Label = Instance.new("TextButton")
            local LabelTitle = Instance.new("TextLabel")
            local labelfunc = {}

            Label.Name = "Label"
            Label.Parent = ChannelHolder
            Label.BackgroundColor3 = Color3.fromRGB(25,25,25)
            Label.BorderSizePixel = 0
            Label.Position = UDim2.new(0.261979163, 0, 0.190789461, 0)
            Label.Size = UDim2.new(0, 401, 0, 30)
            Label.AutoButtonColor = false
            Label.Font = Enum.Font.Gotham
            Label.Text = ""
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.TextSize = 14.000

            LabelTitle.Name = "LabelTitle"
            LabelTitle.Parent = Label
            LabelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            LabelTitle.BackgroundTransparency = 1.000
            LabelTitle.Position = UDim2.new(0, 5, 0, 0)
            LabelTitle.Size = UDim2.new(0, 200, 0, 30)
            LabelTitle.Font = Enum.Font.Gotham
            LabelTitle.Text = text
            LabelTitle.TextColor3 = Color3.fromRGB(127, 131, 137)
            LabelTitle.TextSize = 14.000
            LabelTitle.TextXAlignment = Enum.TextXAlignment.Left

            ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
            function labelfunc:Refresh(tochange)
               Label.Text = tochange
            end

            return labelfunc
         end

         function ChannelContent:Bind(text, presetbind, callback)
            local Key = presetbind.Name
            local Keybind = Instance.new("TextButton")
            local KeybindTitle = Instance.new("TextLabel")
            local KeybindText = Instance.new("TextLabel")

            Keybind.Name = "Keybind"
            Keybind.Parent = ChannelHolder
            Keybind.BackgroundColor3 = Color3.fromRGB(54, 57, 63)
            Keybind.BorderSizePixel = 0
            Keybind.Position = UDim2.new(0.261979163, 0, 0.190789461, 0)
            Keybind.Size = UDim2.new(0, 401, 0, 30)
            Keybind.AutoButtonColor = false
            Keybind.Font = Enum.Font.Gotham
            Keybind.Text = ""
            Keybind.TextColor3 = Color3.fromRGB(255, 255, 255)
            Keybind.TextSize = 14.000

            KeybindTitle.Name = "KeybindTitle"
            KeybindTitle.Parent = Keybind
            KeybindTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            KeybindTitle.BackgroundTransparency = 1.000
            KeybindTitle.Position = UDim2.new(0, 5, 0, 0)
            KeybindTitle.Size = UDim2.new(0, 200, 0, 30)
            KeybindTitle.Font = Enum.Font.Gotham
            KeybindTitle.Text = text
            KeybindTitle.TextColor3 = Color3.fromRGB(127, 131, 137)
            KeybindTitle.TextSize = 14.000
            KeybindTitle.TextXAlignment = Enum.TextXAlignment.Left

            KeybindText.Name = "KeybindText"
            KeybindText.Parent = Keybind
            KeybindText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            KeybindText.BackgroundTransparency = 1.000
            KeybindText.Position = UDim2.new(0, 316, 0, 0)
            KeybindText.Size = UDim2.new(0, 85, 0, 30)
            KeybindText.Font = Enum.Font.Gotham
            KeybindText.Text = presetbind.Name
            KeybindText.TextColor3 = Color3.fromRGB(127, 131, 137)
            KeybindText.TextSize = 14.000
            KeybindText.TextXAlignment = Enum.TextXAlignment.Right

            Keybind.MouseButton1Click:Connect(function()
               KeybindText.Text = "..."
               local inputwait = game:GetService("UserInputService").InputBegan:wait()
               if inputwait.KeyCode.Name ~= "Unknown" then
                  KeybindText.Text = inputwait.KeyCode.Name
                  Key = inputwait.KeyCode.Name
               end
            end)

            game:GetService("UserInputService").InputBegan:connect(function(current, pressed)
               if not pressed then
                  if current.KeyCode.Name == Key then
                     pcall(callback)
                  end
               end
            end)
            ChannelHolder.CanvasSize = UDim2.new(0,0,0,ChannelHolderLayout.AbsoluteContentSize.Y)
         end

         return ChannelContent
      end

      return ChannelHold
   end
   return ServerHold
end
 
local win = RadientPaid:Window("")
local serv = win:Server("HULK U HUB", "")
local Tab1 = serv:Channel("Auto Farm")
local Tab2 = serv:Channel("Auto Boos")
local Tab3 = serv:Channel("Auto Stat")
local Tab4 = serv:Channel("Player")
local Tab5 = serv:Channel("Teleport")
local Tab6 = serv:Channel("SHOP")
local Tab7 = serv:Channel("Dungeon")
local Tab8 = serv:Channel("Game")
local Tab9 = serv:Channel("Setting")
local Tab10 = serv:Channel("Credit")

local LocalPlayer = game:GetService("Players").LocalPlayer
local VirtualUser = game:GetService('VirtualUser')

local placeId = game.PlaceId
if placeId == 2753915549 then
    First_World = true
elseif placeId == 4442272183 then
    Second_World = true
elseif placeId == 7449423635 then
    Third_World = true
end

function CheckLv()

    MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
        if First_World then
    if MyLevel == 1 or MyLevel <= 9 then
        Mon = "Bandit [Lv. 5]"
        LevelQuest = 1
        NameQuest = "BanditQuest1"
        NameMon = "Bandit"
        CFrameTweenQuest = Vector3.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
        CFramePak = CFrame.new(1184.6668701172, 66.851402282715, 1513.2677001953)
        CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
        CFrameTweenPak = Vector3.new(1184.6668701172, 66.851402282715, 1513.2677001953)

    elseif MyLevel == 10 or MyLevel <= 14 then
        Mon = "Monkey [Lv. 14]"
        LevelQuest = 1
        NameQuest = "JungleQuest"
        NameMon = "Monkey"
        CFrameTweenQuest = Vector3.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        CFramePak = CFrame.new(-1606.4381103516, 35.292171478271, 171.13681030273)
        CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        CFrameTweenPak = Vector3.new(-1606.4381103516, 35.292171478271, 171.13681030273)

    elseif MyLevel == 15 or MyLevel <= 29 then
        Mon = "Gorilla [Lv. 20]"
        LevelQuest = 2
        NameQuest = "JungleQuest"
        NameMon = "Gorilla"
        CFrameTweenQuest = Vector3.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        CFramePak = CFrame.new(-1289.9700927734, 18.621431350708, -343.4475402832)
        CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        CFrameTweenPak = Vector3.new(-1289.9700927734, 18.621431350708, -343.4475402832)

    elseif MyLevel == 30 or MyLevel <= 39 then
        Mon = "Pirate [Lv. 35]"
        LevelQuest = 1
        NameQuest = "BuggyQuest1"
        NameMon = "Pirate"
        CFrameTweenQuest = Vector3.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
        CFramePak = CFrame.new(-1210.4885253906, 4.7520518302917, 3901.2900390625)
        CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
        CFrameTweenPak = Vector3.new(-1210.4885253906, 4.7520518302917, 3901.2900390625)

    elseif MyLevel == 40 or MyLevel <= 59 then
        Mon = "Brute [Lv. 45]"
        LevelQuest = 2
        NameQuest = "BuggyQuest1"
        NameMon = "Brute"
        CFrameTweenQuest = Vector3.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
        CFramePak = CFrame.new(-1123.4816894531, 14.809873580933, 4300.3334960938)
        CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
        CFrameTweenPak = Vector3.new(-1123.4816894531, 14.809873580933, 4300.3334960938)

    elseif MyLevel == 60 or MyLevel <= 74 then
        Mon = "Desert Bandit [Lv. 60]"
        LevelQuest = 1
        NameQuest = "DesertQuest"
        NameMon = "Desert Bandit"
        CFrameTweenQuest = Vector3.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
        CFramePak = CFrame.new(898.62774658203, 6.4384622573853, 4407.58203125)
        CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
        CFrameTweenPak = Vector3.new(898.62774658203, 6.4384622573853, 4407.58203125)

    elseif MyLevel == 75 or MyLevel <= 89 then
        Mon = "Desert Officer [Lv. 70]"
        LevelQuest = 2
        NameQuest = "DesertQuest"
        NameMon = "Desert Officer"
        CFrameTweenQuest = Vector3.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
        CFramePak = CFrame.new(1537.9205322266, 14.452037811279, 4386.3881835938)
        CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
        CFrameTweenPak = Vector3.new(1537.9205322266, 14.452037811279, 4386.3881835938)

    elseif MyLevel == 90 or MyLevel <= 99 then
        Mon = "Snow Bandit [Lv. 90]"
        LevelQuest = 1
        NameQuest = "SnowQuest"
        NameMon = "Snow Bandit"
        CFrameTweenQuest = Vector3.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
        CFramePak = CFrame.new(1379.6555175781, 87.272789001465, -1354.8793945313)
        CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
        CFrameTweenPak = Vector3.new(1379.6555175781, 87.272789001465, -1354.8793945313)

    elseif MyLevel == 100 or MyLevel <= 119 then
        Mon = "Snowman [Lv. 100]"
        LevelQuest = 2
        NameQuest = "SnowQuest"
        NameMon = "Snowman"
        CFrameTweenQuest = Vector3.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
        CFramePak = CFrame.new(1296.3176269531, 105.77800750732, -1586.8228759766)
        CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
        CFrameTweenPak = Vector3.new(1296.3176269531, 105.77800750732, -1586.8228759766)

    elseif MyLevel == 120 or MyLevel <= 149 then
        Mon = "Chief Petty Officer [Lv. 120]"
        LevelQuest = 1
        NameQuest = "MarineQuest2"
        NameMon = "Chief Petty Officer"
        CFrameTweenQuest = Vector3.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        CFramePak = CFrame.new(-4926.9541015625, 20.652038574219, 4254.30859375)
        CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        CFrameTweenPak = Vector3.new(-4926.9541015625, 20.652038574219, 4254.30859375)

    elseif MyLevel == 150 or MyLevel <= 174 then
        Mon = "Sky Bandit [Lv. 150]"
        LevelQuest = 1
        NameQuest = "SkyQuest"
        NameMon = "Sky Bandit"
        CFrameTweenQuest = Vector3.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
        CFramePak = CFrame.new(-5035.4375, 278.06744384766, -2845.1437988281)
        CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
        CFrameTweenPak = Vector3.new(-5035.4375, 278.06744384766, -2845.1437988281)

    elseif MyLevel == 175 or MyLevel <= 224 then
        Mon = "Dark Master [Lv. 175]"
        LevelQuest = 2
        NameQuest = "SkyQuest"
        NameMon = "Dark Master"
        CFrameTweenQuest = Vector3.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
        CFramePak = CFrame.new(-5252.2421875, 388.65203857422, -2273.1125488281)
        CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
        CFrameTweenPak = Vector3.new(-5252.2421875, 388.65203857422, -2273.1125488281)

    elseif MyLevel == 225 or MyLevel <= 274 then
        Mon = "Toga Warrior [Lv. 225]"
        LevelQuest = 1
        NameQuest = "ColosseumQuest"
        NameMon = "Toga Warrior"
        CFrameTweenQuest = Vector3.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
        CFramePak = CFrame.new(-1951.6307373047, 7.2890739440918, -2795.9350585938)
        CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
        CFrameTweenPak = Vector3.new(-1951.6307373047, 7.2890739440918, -2795.9350585938)

    elseif MyLevel == 275 or MyLevel <= 299 then
        Mon = "Gladiator [Lv. 275]"
        LevelQuest = 2
        NameQuest = "ColosseumQuest"
        NameMon = "Gladiator"
        CFrameTweenQuest = Vector3.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
        CFramePak = CFrame.new(-1361.2359619141, 7.4425468444824, -3206.2006835938)
        CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
        CFrameTweenPak = Vector3.new(-1361.2359619141, 7.4425468444824, -3206.2006835938)

    elseif MyLevel == 300 or MyLevel <= 329 then
        Mon = "Military Soldier [Lv. 300]"
        LevelQuest = 1
        NameQuest = "MagmaQuest"
        NameMon = "Military Soldier"
        CFrameTweenQuest = Vector3.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
        CFramePak = CFrame.new(-5425.244140625, 10.298267364502, 8442.607421875)
        CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
        CFrameTweenPak = Vector3.new(-5425.244140625, 10.298267364502, 8442.607421875)

    elseif MyLevel == 330 or MyLevel <= 374 then
        Mon = "Military Spy [Lv. 330]"
        LevelQuest = 2
        NameQuest = "MagmaQuest"
        NameMon = "Military Spy"
        CFrameTweenQuest = Vector3.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
        CFramePak = CFrame.new(-5808.0297851563, 82.834617614746, 8825.5166015625)
        CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
        CFrameTweenPak = Vector3.new(-5808.0297851563, 82.834617614746, 8825.5166015625)

    elseif MyLevel == 375 or MyLevel <= 399 then
        Mon = "Fishman Warrior [Lv. 375]"
        LevelQuest = 1
        NameQuest = "FishmanQuest"
        NameMon = "Fishman Warrior"
        CFrameTweenQuest = Vector3.new(61121.1094, 17.953125, 1564.52637, -0.913477898, 0, -0.406888306, 0, 1, 0, 0.406888306, 0, -0.913477898)
        CFramePak = CFrame.new(60924.6328125, 18.482824325562, 1626.8103027344)
        CFrameQuest = CFrame.new(61121.1094, 17.953125, 1564.52637, -0.913477898, 0, -0.406888306, 0, 1, 0, 0.406888306, 0, -0.913477898)
        CFrameTweenPak = Vector3.new(60924.6328125, 18.482824325562, 1626.8103027344)

    elseif MyLevel == 400 or MyLevel <= 449 then
        Mon = "Fishman Commando [Lv. 400]"
        LevelQuest = 2
        NameQuest = "FishmanQuest"
        NameMon = "Fishman Commando"
        CFrameTweenQuest = Vector3.new(61121.1094, 17.953125, 1564.52637, -0.913477898, 0, -0.406888306, 0, 1, 0, 0.406888306, 0, -0.913477898)
        CFramePak = CFrame.new(61867.33203125, 18.482824325562, 1499.2142333984)
        CFrameQuest = CFrame.new(61121.1094, 17.953125, 1564.52637, -0.913477898, 0, -0.406888306, 0, 1, 0, 0.406888306, 0, -0.913477898)
        CFrameTweenPak = Vector3.new(61867.33203125, 18.482824325562, 1499.2142333984)

    elseif MyLevel == 450 or MyLevel <= 474 then
        Mon = "God's Guard [Lv. 450]"
        LevelQuest = 1
        NameQuest = "SkyExp1Quest"
        NameMon = "God's Guard"
        CFrameTweenQuest = Vector3.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
        CFramePak = CFrame.new(-4681.8432617188, 845.27716064453, -1955.4534912109)
        CFrameQuest = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
        CFrameTweenPak = Vector3.new(-4681.8432617188, 845.27716064453, -1955.4534912109)

    elseif MyLevel == 475 or MyLevel <= 524 then
        Mon = "Shanda [Lv. 475]"
        LevelQuest = 2
        NameQuest = "SkyExp1Quest"
        NameMon = "Shanda"
        CFrameTweenQuest = Vector3.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
        CFramePak = CFrame.new(-7656.3056640625, 5545.4931640625, -531.23907470703)
        CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
        CFrameTweenPak = Vector3.new(-7656.3056640625, 5545.4931640625, -531.23907470703)

    elseif MyLevel == 525 or MyLevel <= 549 then
        Mon = "Royal Squad [Lv. 525]"
        LevelQuest = 1
        NameQuest = "SkyExp2Quest"
        NameMon = "Royal Squad"
        CFrameTweenQuest = Vector3.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        CFramePak = CFrame.new(-7722.328125, 5610.9272460938, -1441.6092529297)
        CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        CFrameTweenPak = Vector3.new(-7722.328125, 5610.9272460938, -1441.6092529297)

    elseif MyLevel == 550 or MyLevel <= 624 then
        Mon = "Royal Soldier [Lv. 550]"
        LevelQuest = 2
        NameQuest = "SkyExp2Quest"
        NameMon = "Royal Soldier"
        CFrameTweenQuest = Vector3.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        CFramePak = CFrame.new(-7825.0087890625, 5606.8784179688, -1731.4152832031)
        CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        CFrameTweenPak = Vector3.new(-7825.0087890625, 5606.8784179688, -1731.4152832031)

    elseif MyLevel == 625 or MyLevel <= 649 then
        Mon = "Galley Pirate [Lv. 625]"
        LevelQuest = 1
        NameQuest = "FountainQuest"
        NameMon = "Galley Pirate"
        CFrameTweenQuest = Vector3.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
        CFramePak = CFrame.new(5379.8198242188, 38.501140594482, 4033.5905761719)
        CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
        CFrameTweenPak = Vector3.new(5379.8198242188, 38.501140594482, 4033.5905761719)

    elseif MyLevel == 650 or MyLevel <= 700 then
        Mon = "Galley Captain [Lv. 650]"
        LevelQuest = 2
        NameQuest = "FountainQuest"
        NameMon = "Galley Captain"
        CFrameTweenQuest = Vector3.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
        CFramePak = CFrame.new(5556.1420898438, 113.47412109375, 4819.0576171875)
        CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
        CFrameTweenPak = Vector3.new(5556.1420898438, 113.47412109375, 4819.0576171875)
    end
elseif Second_World then

    if MyLevel == 700 or MyLevel <= 724 then
        Mon = "Raider [Lv. 700]"
        LevelQuest = 1
        NameQuest = "Area1Quest"
        NameMon = "Raider"
        CFrameTweenQuest = Vector3.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
        CFramePak = CFrame.new(-122.82179260254, 39.079746246338, 2362.2602539063)
        CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
        CFrameTweenPak = Vector3.new(-122.82179260254, 39.079746246338, 2362.2602539063)

    elseif MyLevel == 725 or MyLevel <= 774 then
        Mon = "Mercenary [Lv. 725]"
        LevelQuest = 2
        NameQuest = "Area1Quest"
        NameMon = "Mercenary"
        CFrameTweenQuest = Vector3.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
        CFramePak = CFrame.new(-942.66076660156, 72.959716796875, 1720.8294677734)
        CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
        CFrameTweenPak = Vector3.new(-942.66076660156, 72.959716796875, 1720.8294677734)
        
    elseif MyLevel == 775 or MyLevel <= 799 then
        Mon = "Swan Pirate [Lv. 775]"
        LevelQuest = 1
        NameQuest = "Area2Quest"
        NameMon = "Swan Pirate"
        CFrameTweenQuest = Vector3.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
        CFramePak = CFrame.new(1024.1345214844, 73.029739379883, 1262.7456054688)
        CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
        CFrameTweenPak = Vector3.new(1024.1345214844, 73.029739379883, 1262.7456054688)

    elseif MyLevel == 800 or MyLevel <= 874 then
        Mon = "Factory Staff [Lv. 800]"
        NameQuest = "Area2Quest"
        LevelQuest = 2
        NameMon = "Factory Staff"
        CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
        CFrameTweenQuest = Vector3.new(502.98501586914, 73.303024291992, 8.5735998153687)
        CFramePak = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
        CFrameTweenPak = Vector3.new(502.98501586914, 73.303024291992, 8.5735998153687)

    elseif MyLevel == 875 or MyLevel <= 899 then
        Mon = "Marine Lieutenant [Lv. 875]"
        LevelQuest = 1
        NameQuest = "MarineQuest3"
        NameMon = "Marine Lieutenant"
        CFrameTweenQuest = Vector3.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
        CFramePak = CFrame.new(-2842.595703125, 72.96614074707, -3012.0222167969)
        CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
        CFrameTweenPak = Vector3.new(-2842.595703125, 72.96614074707, -3012.0222167969)

    elseif MyLevel == 900 or MyLevel <= 949 then
        Mon = "Marine Captain [Lv. 900]"
        LevelQuest = 2
        NameQuest = "MarineQuest3"
        NameMon = "Marine Captain"
        CFrameTweenQuest = Vector3.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
        CFramePak = CFrame.new(-1927.8619384766, 72.96614074707, -3385.0322265625)
        CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
        CFrameTweenPak = Vector3.new(-1927.8619384766, 72.96614074707, -3385.0322265625)

    elseif MyLevel == 950 or MyLevel <= 974 then
        Mon = "Zombie [Lv. 950]"
        LevelQuest = 1
        NameQuest = "ZombieQuest"
        NameMon = "Zombie"
        CFrameTweenQuest = Vector3.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
        CFramePak = CFrame.new(-5685.9233398438, 48.480125427246, -853.23724365234)
        CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
        CFrameTweenPak = Vector3.new(-5685.9233398438, 48.480125427246, -853.23724365234)

    elseif MyLevel == 975 or MyLevel <= 999 then
        Mon = "Vampire [Lv. 975]"
        LevelQuest = 2
        NameQuest = "ZombieQuest"
        NameMon = "Vampire"
        CFrameTweenQuest = Vector3.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
        CFramePak = CFrame.new(-6018.3452148438, 6.4027013778687, -1267.6065673828)
        CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
        CFrameTweenPak = Vector3.new(-6018.3452148438, 6.4027013778687, -1267.6065673828)

    elseif MyLevel == 1000 or MyLevel <= 1049 then
        Mon = "Snow Trooper [Lv. 1000]"
        LevelQuest = 1
        NameQuest = "SnowMountainQuest"
        NameMon = "Snow Trooper"
        CFrameTweenQuest = Vector3.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
        CFramePak = CFrame.new(481.48031616211, 401.42202758789, -5361.2138671875)
        CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
        CFrameTweenPak = Vector3.new(481.48031616211, 401.42202758789, -5361.2138671875)

    elseif MyLevel == 1050 or MyLevel <= 1099 then
        Mon = "Winter Warrior [Lv. 1050]"
        LevelQuest = 2
        NameQuest = "SnowMountainQuest"
        NameMon = "Winter Warrior"
        CFrameTweenQuest = Vector3.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
        CFramePak = CFrame.new(1148.3015136719, 429.38235473633, -5262.1708984375)
        CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
        CFrameTweenPak = Vector3.new(1148.3015136719, 429.38235473633, -5262.1708984375)

    elseif MyLevel == 1100 or MyLevel <= 1124 then
        Mon = "Lab Subordinate [Lv. 1100]"
        LevelQuest = 1
        NameQuest = "IceSideQuest"
        NameMon = "Lab Subordinate"
        CFrameTweenQuest = Vector3.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
        CFramePak = CFrame.new(-5775.5200195313, 42.301044464111, -4483.5092773438)
        CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
        CFrameTweenPak = Vector3.new(-5775.5200195313, 42.301044464111, -4483.5092773438)

    elseif MyLevel == 1125 or MyLevel <= 1174 then
        Mon = "Horned Warrior [Lv. 1125]"
        LevelQuest = 2
        NameQuest = "IceSideQuest"
        NameMon = "Horned Warrior"
        CFrameTweenQuest = Vector3.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
        CFramePak = CFrame.new(-6283.5942382813, 18.321973800659, -5606.4282226563)
        CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
        CFrameTweenPak = Vector3.new(-6283.5942382813, 18.321973800659, -5606.4282226563)

    elseif MyLevel == 1175 or MyLevel <= 1199 then
        Mon = "Magma Ninja [Lv. 1175]"
        LevelQuest = 1
        NameQuest = "FireSideQuest"
        NameMon = "Magma Ninja"
        CFrameTweenQuest = Vector3.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
        CFramePak = CFrame.new(-5686.64453125, 15.951762199402, -5713.7026367188)
        CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
        CFrameTweenPak = Vector3.new(-5686.64453125, 15.951762199402, -5713.7026367188)

    elseif MyLevel == 1200 or MyLevel <= 1249 then
        Mon = "Lava Pirate [Lv. 1200]"
        LevelQuest = 2
        NameQuest = "FireSideQuest"
        NameMon = "Lava Pirate"
        CFrameTweenQuest = Vector3.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
        CFramePak = CFrame.new(-5363.17578125, 15.951762199402, -4754.68359375)
        CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
        CFrameTweenPak = Vector3.new(-5363.17578125, 15.951762199402, -4754.68359375)

    elseif MyLevel == 1250 or MyLevel <= 1274 then
        Mon = "Ship Deckhand [Lv. 1250]"
        LevelQuest = 1
        NameQuest = "ShipQuest1"
        NameMon = "Ship Deckhand"
        CFrameTweenQuest = Vector3.new(1041.09521, 124.167358, 32909.25, -0.642763734, 0, 0.766064942, 0, 1, 0, -0.766064942, 0, -0.642763734)
        CFramePak = CFrame.new(819.51647949219, 125.0571975708, 32936.8515625)
        CFrameQuest = CFrame.new(1041.09521, 124.167358, 32909.25, -0.642763734, 0, 0.766064942, 0, 1, 0, -0.766064942, 0, -0.642763734)
        CFrameTweenPak = Vector3.new(819.51647949219, 125.0571975708, 32936.8515625)

    elseif MyLevel == 1275 or MyLevel <= 1299 then
        Mon = "Ship Engineer [Lv. 1275]"
        LevelQuest = 2
        NameQuest = "ShipQuest1"
        NameMon = "Ship Engineer"
        CFrameTweenQuest = Vector3.new(1041.09521, 124.167358, 32909.25, -0.642763734, 0, 0.766064942, 0, 1, 0, -0.766064942, 0, -0.642763734)
        CFramePak = CFrame.new(919.3759765625, 125.958152771, 33075.125)
        CFrameQuest = CFrame.new(1041.09521, 124.167358, 32909.25, -0.642763734, 0, 0.766064942, 0, 1, 0, -0.766064942, 0, -0.642763734)
        CFrameTweenPak = Vector3.new(919.3759765625, 125.958152771, 33075.125)

    elseif MyLevel == 1300 or MyLevel <= 1324 then
        Mon = "Ship Steward [Lv. 1300]"
        LevelQuest = 1
        NameQuest = "ShipQuest2"
        NameMon = "Ship Steward"
        CFrameTweenQuest = Vector3.new(971.373047, 124.167488, 33248.7109, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
        CFramePak = CFrame.new(919.3759765625, 125.958152771, 33075.125)
        CFrameQuest = CFrame.new(971.373047, 124.167488, 33248.7109, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
        CFrameTweenPak = Vector3.new(919.3759765625, 125.958152771, 33075.125)

    elseif MyLevel == 1325 or MyLevel <= 1349 then
        Mon = "Ship Officer [Lv. 1325]"
        LevelQuest = 2
        NameQuest = "ShipQuest2"
        NameMon = "Ship Officer"
        CFrameTweenQuest = Vector3.new(971.373047, 124.167488, 33248.7109, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
        CFramePak = CFrame.new(941.85382080078, 181.43907165527, 33324.90234375)
        CFrameQuest = CFrame.new(971.373047, 124.167488, 33248.7109, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
        CFrameTweenPak = Vector3.new(941.85382080078, 181.43907165527, 33324.90234375)

    elseif MyLevel == 1350 or MyLevel <= 1374 then
        Mon = "Arctic Warrior [Lv. 1350]"
        LevelQuest = 1
        NameQuest = "FrostQuest"
        NameMon = "Arctic Warrior"
        CFrameTweenQuest = Vector3.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
        CFramePak = CFrame.new(6009.58203125, 28.367122650146, -6247.9741210938)
        CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
        CFrameTweenPak = Vector3.new(6009.58203125, 28.367122650146, -6247.9741210938)

    elseif MyLevel == 1375 or MyLevel <= 1424 then
        Mon = "Snow Lurker [Lv. 1375]"
        LevelQuest = 2
        NameQuest = "FrostQuest"
        NameMon = "Snow Lurker"
        CFrameTweenQuest = Vector3.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
        CFramePak = CFrame.new(5476.5615234375, 28.82799911499, -6847.412109375)
        CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
        CFrameTweenPak = Vector3.new(5476.5615234375, 28.82799911499, -6847.412109375)

    elseif MyLevel == 1425 or MyLevel <= 1449 then
        Mon = "Sea Soldier [Lv. 1425]"
        LevelQuest = 1
        NameQuest = "ForgottenQuest"
        NameMon = "Sea Soldier"
        CFrameTweenQuest = Vector3.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
        CFramePak = CFrame.new(-3032.2255859375, 70.041687011719, -9779.5869140625)
        CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
        CFrameTweenPak = Vector3.new(-3032.2255859375, 70.041687011719, -9779.5869140625)

    elseif MyLevel == 1450 or MyLevel <= 1525 then
        Mon = "Water Fighter [Lv. 1450]"
        LevelQuest = 2
        NameQuest = "ForgottenQuest"
        NameMon = "Water Fighter"
        CFrameTweenQuest = Vector3.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
        CFramePak = CFrame.new(-3261.4780273438, 291.33917236328, -10596.365234375)
        CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
        CFrameTweenPak = Vector3.new(-3261.4780273438, 291.33917236328, -10596.365234375)
    end
elseif Third_World then

    if MyLevel == 1500 or MyLevel <= 1524 then
        Mon = "Pirate Millionaire [Lv. 1500]"
        LevelQuest = 1
        NameQuest = "PiratePortQuest"
        NameMon = "Pirate Millionaire"
        CFrameTweenQuest = Vector3.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
        CFramePak = CFrame.new(-366.55215454102, 68.321365356445, 5561.5541992188)
        CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
        CFrameTweenPak = Vector3.new(-366.55215454102, 68.321365356445, 5561.5541992188)
        
    elseif MyLevel == 1525 or MyLevel <= 1574 then
        Mon = "Pistol Billionaire [Lv. 1525]"
        LevelQuest = 2
        NameQuest = "PiratePortQuest"
        NameMon = "Pistol Billionaire"
        CFrameTweenQuest = Vector3.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
        CFramePak = CFrame.new(-413.86712646484, 123.34642028809, 5857.123046875)
        CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
        CFrameTweenPak = Vector3.new(-413.86712646484, 123.34642028809, 5857.123046875)
        
    elseif MyLevel == 1575 or MyLevel <= 1699 then
        Mon = "Dragon Crew Warrior [Lv. 1575]"
        LevelQuest = 1
        NameQuest = "AmazonQuest"
        NameMon = "Dragon Crew Warrior"
        CFrameTweenQuest = Vector3.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
        CFramePak = CFrame.new(6297.5546875, 108.10154724121, -1078.3551025391)
        CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
        CFrameTweenPak = Vector3.new(6297.5546875, 108.10154724121, -1078.3551025391)

    elseif MyLevel == 1700 or MyLevel <= 1774 then
        Mon = "Marine Commodore [Lv. 1700]"
        LevelQuest = 1
        NameQuest = "MarineTreeIsland"
        NameMon = "Marine Commodore"
        CFrameTweenQuest = Vector3.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
        CFramePak = CFrame.new(2335.4865722656, 190.39758300781, -7183.552734375)
        CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
        CFrameTweenPak = Vector3.new(2335.4865722656, 190.39758300781, -7183.552734375)
        
    elseif MyLevel == 1775 or MyLevel <= 1799 then
        Mon = "Fishman Raider [Lv. 1775]"
        LevelQuest = 1
        NameQuest = "DeepForestIsland3"
        NameMon = "Fishman Raider"
        CFrameTweenQuest = Vector3.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
        CFramePak = CFrame.new(-10310.296875, 426.3200378418, -8592.0048828125)
        CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
        CFrameTweenPak = Vector3.new(-10310.296875, 426.3200378418, -8592.0048828125)
        
    elseif MyLevel == 1800 or MyLevel <= 1824 then
        Mon = "Fishman Captain [Lv. 1800]"
        LevelQuest = 2
        NameQuest = "DeepForestIsland3"
        NameMon = "Fishman Captain"
        CFrameTweenQuest = Vector3.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
        CFramePak = CFrame.new(-10728.3046875, 397.76626586914, -9079.86328125)
        CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
        CFrameTweenPak = Vector3.new(-10728.3046875, 397.76626586914, -9079.86328125)
        
    elseif MyLevel == 1825 or MyLevel <= 1899 then
        Mon = "Forest Pirate [Lv. 1825]"
        LevelQuest = 1
        NameQuest = "DeepForestIsland"
        NameMon = "Forest Pirate"
        CFrameTweenQuest = Vector3.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
        CFramePak = CFrame.new(-13265.977539063, 428.16796875, -7758.57421875)
        CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
        CFrameTweenPak = Vector3.new(-13265.977539063, 428.16796875, -7758.57421875)
        
    elseif MyLevel == 1900 or MyLevel <= 1924 then
        Mon = "Jungle Pirate [Lv. 1900]"
        LevelQuest = 1
        NameQuest = "DeepForestIsland2"
        NameMon = "Jungle Pirate"
        CFrameTweenQuest = Vector3.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
        CFramePak = CFrame.new(-11997.963867188, 431.92016601563, -10300.259765625)
        CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
        CFrameTweenPak = Vector3.new(-11997.963867188, 431.92016601563, -10300.259765625)
        
    elseif MyLevel == 1925 or MyLevel <= 1974 then
        Mon = "Musketeer Pirate [Lv. 1925]"
        LevelQuest = 2
        NameQuest = "DeepForestIsland2"
        NameMon = "Musketeer Pirate"
        CFrameTweenQuest = Vector3.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
        CFramePak = CFrame.new(-13293.668945313, 496.21118164063, -9573.9326171875)
        CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
        CFrameTweenPak = Vector3.new(-13293.668945313, 496.21118164063, -9573.9326171875)

    elseif MyLevel == 1975 or MyLevel <= 1999 then
        Mon = "Reborn Skeleton [Lv. 1975]"
        LevelQuest = 1
        NameQuest = "HauntedQuest1"
        NameMon = "Reborn Skeleton"
        CFrameTweenQuest = Vector3.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        CFramePak = CFrame.new(-8767.4658203125, 184.68771362305, 6228.1762695313)
        CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        CFrameTweenPak = Vector3.new(-8767.4658203125, 184.68771362305, 6228.1762695313)

    elseif MyLevel == 2000 or MyLevel <= 2024 then
        Mon = "Living Zombie [Lv. 2000]"
        LevelQuest = 2
        NameQuest = "HauntedQuest1"
        NameMon = "Living Zombie"
        CFrameTweenQuest = Vector3.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        CFramePak = CFrame.new(-10146.403320313, 139.62678527832, 5987.4208984375)
        CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        CFrameTweenPak = Vector3.new(-10146.403320313, 139.62678527832, 5987.4208984375)

    elseif MyLevel == 2025 or MyLevel <= 2049 then
        Mon = "Demonic Soul [Lv. 2025]"
        LevelQuest = 1
        NameQuest = "HauntedQuest2"
        NameMon = "Demonic Soul"
        CFrameTweenQuest = Vector3.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        CFramePak = CFrame.new(-9365.5595703125, 222.10494995117, 6231.1879882813)
        CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        CFrameTweenPak = Vector3.new(-9365.5595703125, 222.10494995117, 6231.1879882813)
        
    elseif MyLevel == 2050 or MyLevel <= 2100 then
        Mon = "Posessed Mummy [Lv. 2050]"
        LevelQuest = 2
        NameQuest = "HauntedQuest2"
        NameMon = "Posessed Mummy"
        CFrameTweenQuest = Vector3.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        CFramePak = CFrame.new(-9576.322265625, 5.7926025390625, 6186.6337890625)
        CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        CFrameTweenPak = Vector3.new(-9576.322265625, 5.7926025390625, 6186.6337890625)
    end
end
end

function Quest()
    if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
        local args = {
            [1] = "AbandonQuest"
        }
        
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end

    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
    else
        wait(1.5)
    local Distance = (CFrameTweenQuest - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude -- จุดที่จะไป Position Only
    if Distance <= 2000 then
        Speed = 350
    else
    Speed = 250
    end
    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)
    tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrameQuest})
    tween:Play()
    wait(Distance/Speed)
    wait(1)
    local args = {
        [1] = "StartQuest",
        [2] = NameQuest,
        [3] = LevelQuest
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    wait(1.5)
    end
end

function Tp()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v.Name == Mon and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then            
            local HP = v.Humanoid.MaxHealth*50/100
            Distance = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            Speed = 250
            if HP <= v.Humanoid.Health then
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)            
            tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = v.HumanoidRootPart.CFrame*CFrame.new(0,0,25)})
            else
            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)            
            tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = v.HumanoidRootPart.CFrame*CFrame.new(0,20,0)})
            end
            tween:Play()
            else
            end
    end
end
spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if _G.AutoFarm or _G.AutoRengoku or _G.elitehunt or _G.AutoNew or _G.Pole or _G.AutoThird or _G.Auto_Farm_Bone then
            pcall(function()
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
            end)
        end
    end)
end)



 

function Hitbox()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v.Name == Mon then
            v.HumanoidRootPart.Size = Vector3.new(60,60,60)
            v.HumanoidRootPart.CanCollide = false
            v.HumanoidRootPart.Transparency = 1
            v.Humanoid.WalkSpeed = 0
            v.Humanoid.JumpPower = 0
            v.Humanoid:ChangeState(11)
        end
    end
end

function BringMob()
    for i,x in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        for n,y in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if x.Name == Mon then
                if y.Name == Mon then
                    x.HumanoidRootPart.CFrame = y.HumanoidRootPart.CFrame
                    x.HumanoidRootPart.CanCollide = false
                    y.HumanoidRootPart.CanCollide = false
                    y.Humanoid:ChangeState(11)
                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                end
            end
        end
    end
end


function Click()
    game:GetService'VirtualUser':CaptureController()
    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
end

function AutoHaki()
    if game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
    else
    local args = {
        [1] = "Buso"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
end

_G.SelectToolWeapon = nil
function EquipWeapon(ToolSe)
   if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
       getgenv().tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
       wait(.1)
       game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
   end
end

Tab1:Label("Auto Farm")


Tab1:Toggle("Auto Farm Level",false,function(t)
    _G.AutoFarm = t
    game:GetService("RunService").Heartbeat:Connect(function()
    end)
    while wait() do
    if _G.AutoFarm then
        while _G.AutoFarm do wait()
            pcall(function()
                CheckLv()
                Quest()
                --Abandon()
                EquipWeapon(_G.SelectToolWeapon)
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11) 
                Tp()
                Hitbox()
                BringMob()
                AutoHaki()
                if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
                   _G.AutoFarm = false
                   local args = {
                    [1] = "AbandonQuest"
                }
                
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                   wait(6)
                    _G.AutoFarm = true
                end
            end)
        end
    end
    end
end)



local RigC = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework) 
local Rig = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework.CameraShaker)

spawn(function()
pcall(function()
	
    game:GetService("RunService").Heartbeat:Connect(function()
        if _G.AutoFarm then
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
            game:GetService'VirtualUser':CaptureController()
            game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
            game:GetService'VirtualUser':CaptureController()
            game:GetService('VirtualUser'):ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
            RigC.activeController.hitboxMagnitude = 80
            Rig.CameraShakeInstance.CameraShakeState = {FadingIn = 3,FadingOut =  2,Sustained = 0,Inactive = 1} 
            RigC.activeController.timeToNextAttack = 1
            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
            end
    end
end)
end)
end)


Tab1:Toggle("Fast Attack",_G.FastAttk,function(value)
    _G.FastAttk = value
end)

local CombatFrameworkR = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework) 

local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)

spawn(function()
	for i = 1,math.huge do
		game:GetService("RunService").Heartbeat:wait()
		if _G.FastAttk then
			pcall(function()
					CameraShakerR:Stop()
					CombatFrameworkR.activeController.attacking = false
					CombatFrameworkR.activeController.timeToNextAttack = 0
					CombatFrameworkR.activeController.increment = 3
					CombatFrameworkR.activeController.hitboxMagnitude = 50
			end)
		end
		game:GetService("RunService").Heartbeat:wait()
	end
end)

spawn(function()
	game:GetService("RunService").Heartbeat:connect(function()
		pcall(function()
			if _G.FastAttk then
					VirtualUser:CaptureController()
					VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
			end
		end)
	end)
	game:GetService("RunService").Heartbeat:connect(function()
		pcall(function()
			if _G.FastAttk then
					VirtualUser:CaptureController()
					VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
			end
		end)
	end)
end)



function TP(P1,P2)
    local Distance = (P1 - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance >= 2000 then
    Speed = 150
    else
    Speed = 300
    end
    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)
    tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = P2})
    tween:Play()
    _G.Clip = true
    wait(Distance/Speed)
    _G.Clip = false
end




Tab1:Toggle("Auto New World",_G.AutoNew,function(vu)
    _G.AutoNew = vu
end)

spawn(function()
    while wait(.1) do
       if _G.AutoNew then
          local MyLevel = game.Players.LocalPlayer.Data.Level.Value
          if MyLevel >= 700 and First_World then
            _G.AutoFarm = false
             _G.SelectToolWeapon = "Key"
             TP(Vector3.new(4849.29883, 5.65138149, 719.611877),CFrame.new(4849.29883, 5.65138149, 719.611877))
             wait(0.5)
             local args = {
                [1] = "DressrosaQuestProgress",
                [2] = "Detective"
             }
             game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
             wait(0.5)
             if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") then
                local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Key")
                wait(.4)
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
             end
             TP(Vector3.new(1347.7124, 37.3751602, -1325.6488),CFrame.new(1347.7124, 37.3751602, -1325.6488))
             wait(0.5)
             if game.Workspace.Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]") and game.Workspace.Map.Ice.Door.CanCollide == false and game.Workspace.Map.Ice.Door.Transparency == 1 then
                CheckBoss = true
                _G.SelectToolWeapon = SelectToolWeaponOld
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                   if CheckBoss and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == "Ice Admiral [Lv. 700] [Boss]" then
                      repeat wait(.1)
                         pcall(function() 
                            EquipWeapon(_G.SelectToolWeapon)
                            v.HumanoidRootPart.Transparency = 1
                            v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                            v.HumanoidRootPart.BrickColor = BrickColor.new("White")
                            v.HumanoidRootPart.CanCollide = false
                            TP(v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(0,20,20))
                            RigC.activeController.hitboxMagnitude = 80
                            Rig.CameraShakeInstance.CameraShakeState = {FadingIn = 3,FadingOut =  2,Sustained = 0,Inactive = 1} 
                            RigC.activeController.timeToNextAttack = .5
                            Click()
                         end)
                      until not CheckBoss or not v.Parent or v.Humanoid.Health <= 0
                   end
                end
                CheckBoss = false
                wait(0.5)
                TP(Vector3.new(1166.23743, 7.65220165, 1728.36487),CFrame.new(1166.23743, 7.65220165, 1728.36487))
                wait(0.5)
                local args = {
                    [1] = "TravelDressrosa" 
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
             else
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") then
                   local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Key")
                   wait(.4)
                   game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
                end
                TP(Vector3.new(1347.7124, 37.3751602, -1325.6488),CFrame.new(1347.7124, 37.3751602, -1325.6488))
             end 
          end
       end 
    end
 end)



 Tab1:Toggle("Auto Third Sea",_G.AutoThird,function(th)
    _G.AutoThird = th
end)

spawn(function()
    while wait() do
        if _G.AutoThird then
            if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1500 and Second_World then
                _G.AutoFarm = false
                KUYKUY = Vector3.new(-1926.3221435547, 12.819851875305, 1738.3092041016)
                Distance = (KUYKUY - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude -- จุดที่จะไป Position Only
                Speed = 150 -- ความเร็วของมึง
                tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)            
                tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-1926.3221435547, 12.819851875305, 1738.3092041016)})            
                tween:Play()                
                wait(Distance/Speed)
                wait(1.1)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress","Begin")
                wait(1.1)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                AA = Vector3.new(-26880.93359375, 22.848554611206, 473.18951416016)
                Distance = (AA - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude -- จุดที่จะไป Position Only
                Speed = 150 -- ความเร็วของมึง
                tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)            
                tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016)})
                if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra [Lv. 1500] [Boss]") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "rip_indra [Lv. 1500] [Boss]" then
                            repeat wait(.1)
                                pcall(function()
                                    EquipWeapon(_G.SelectToolWeapon)
                                    AutoHaki()
                                    Distance = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude -- จุดที่จะไป Position Only
                                    Speed = 150 -- ความเร็วของมึง
                                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)            
                                    tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = v.HumanoidRootPart.CFrame*CFrame.new(0,0,25)})            
                                    tween:Play()    
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Transparency = 1
                                    v.HumanoidRootPart.Size = Vector3.new(70,70,70)
                                    game:GetService'VirtualUser':CaptureController()
                                    game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                end)
                            until _G.AutoThird == false or v.Humanoid.Health <= 0 or not v.Parent
                            AHE = Vector3.new(-26880.93359375, 22.848554611206, 473.18951416016)
                            Distance = (AHE - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude -- จุดที่จะไป Position Only
                            Speed = 150 -- ความเร็วของมึง
                            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)            
                            tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016)})            
                            tween:Play()   
                        end
                    end
                else
                    KIKI = Vector3.new(-26880.93359375, 22.848554611206, 473.18951416016)
                    Distance = (KIKI - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude -- จุดที่จะไป Position Only
                    Speed = 150 -- ความเร็วของมึง
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)            
                    tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-26880.93359375, 22.848554611206, 473.18951416016)})            
                    tween:Play()  
                end
            end
        end
    end
end)

local RigC = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework) 
local Rig = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework.CameraShaker)



Tab1:Button("Check Elite Progress",function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Elite Hunter", 
        Text = "Elite Progress : " ..game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress"),
        Icon = "",
        Duration = 2.5
    })
end)


Tab1:Toggle("Auto Elite Hunter",_G.elitehunt,function(aa)
    _G.elitehunt = aa
end)

spawn(function()
    while wait() do
        pcall(function()
        if _G.elitehunt then
            if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo") or string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban") or string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre") then
                if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo [Lv. 1750]") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban [Lv. 1750]") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre [Lv. 1750]") then
                    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                        if v.Name == "Diablo [Lv. 1750]" or v.Name == "Urban [Lv. 1750]" or v.Name == "Deandre [Lv. 1750]" then
                            repeat wait(.1)
                                noclipnew()
                                EquipWeapon(_G.SelectToolWeapon)
                                AutoHaki()
                                Distance = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude -- จุดที่จะไป Position Only
                                Speed = 130 -- ความเร็วของมึง
                                tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)
                                tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = v.HumanoidRootPart.CFrame*CFrame.new(0,0,25)})
                                tween:Play()
                                _G.Clip = true
                                wait(Distance/Speed)
                                _G.Clip = false
                                v.HumanoidRootPart.Transparency = 1
                                v.HumanoidRootPart.CanCollide = true
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                Click()           
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            until _G.elitehunt == false or not v.Parent or v.Humanoid.Health <= 0 or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
                        end
                    end
                else
                    RUOK = Vector3.new(-5418.392578125, 313.74130249023, -2824.9157714844)
                    Distance = (RUOK - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude -- จุดที่จะไป Position Only
                    Speed = 100 -- ความเร็วของมึง
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)
                    tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-5418.392578125, 313.74130249023, -2824.9157714844)})
                    tween:Play()
                    _G.Clip = true
                    wait(Distance/Speed)
                    _G.Clip = false
                    wait(Distance/Speed)
                end
            else
                EE = Vector3.new(-5418.392578125, 313.74130249023, -2824.9157714844)
                Distance = (EE - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude -- จุดที่จะไป Position Only
                Speed = 100 -- ความเร็วของมึง
                tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)
                tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-5418.392578125, 313.74130249023, -2824.9157714844)})
                tween:Play()
                _G.Clip = true
                wait(Distance/Speed)
                _G.Clip = false
                wait(Distance/Speed)
                wait(1.5)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
                wait(1.1)
            end
        end
    end)
    end
end)





Tab1:Toggle("Auto Superhuman",false,function(vu)
    Superhuman = vu
    while Superhuman do wait()
        if Superhuman then
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
                local args = {
                    [1] = "BuyBlackLeg"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end   
            if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") then
                SelectToolWeapon = "Superhuman"
            end  
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") then
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 299 then
                    SelectToolWeapon = "Black Leg"
                end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 299 then
                    SelectToolWeapon = "Electro"
                end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 299 then
                    SelectToolWeapon = "Fishman Karate"
                end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 299 then
                    SelectToolWeapon = "Dragon Claw"
                end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300 then
                    local args = {
                        [1] = "BuyElectro"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
                if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300 then
                    local args = {
                        [1] = "BuyElectro"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 then
                    local args = {
                        [1] = "BuyFishmanKarate"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
                if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300 then
                    local args = {
                        [1] = "BuyFishmanKarate"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300 then
                    local args = {
                        [1] = "BlackbeardReward",
                        [2] = "DragonClaw",
                        [3] = "1"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    local args = {
                        [1] = "BlackbeardReward",
                        [2] = "DragonClaw",
                        [3] = "2"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
                end
                if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300 then
                    local args = {
                        [1] = "BlackbeardReward",
                        [2] = "DragonClaw",
                        [3] = "1"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    local args = {
                        [1] = "BlackbeardReward",
                        [2] = "DragonClaw",
                        [3] = "2"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
                end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300 then
                    local args = {
                        [1] = "BuySuperhuman"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
                if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300 then
                    local args = {
                        [1] = "BuySuperhuman"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end 
            end
        end
    end
end)

Tab1:Toggle("Auto Death Step",false,function(vu)
    _G.DeathStep = vu
end)
spawn(function()
    while wait() do wait()
        if _G.DeathStep then
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step") or game.Players.LocalPlayer.Character:FindFirstChild("Death Step") then
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 450 then
                    local args = {
                        [1] = "BuyDeathStep"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    _G.SelectWeapon = "Death Step"
                end  
                if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 450 then
                    local args = {
                        [1] = "BuyDeathStep"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                    _G.SelectWeapon = "Death Step"
                end  
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 449 then
                    _G.SelectWeapon = "Black Leg"
                end 
            else 
                local args = {
                    [1] = "BuyBlackLeg"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end
end)




spawn(function()
    while wait() do
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
            if v:IsA("Tool") then
                if v:FindFirstChild("RemoteFunctionShoot") then 
                    SelectToolWeaponGun = v.Name
                end
            end
        end
    end
end)

Tab1:Toggle("Auto Dragon Talon",false,function(vuu)
    _G.DA = vuu
end)
spawn(function()
    while wait() do
        if _G.DA then
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Backpack:FindFirstChild("Death Step") or game.Players.LocalPlayer.Character:FindFirstChild("Death Step") then
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 400 then
                    local args = {
                        [1] = "BuyDragonTalon"
                    }
                    
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    _G.SelectToolWeapon = "Dragon Talon"
                end  
                if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 400 then
                    local args = {
                        [1] = "BuyDragonTalon"
                    }
                    
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                    _G.SelectToolWeapon = "Dragon Talon"
                end  
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 399 then
                    _G.SelectToolWeapon = "Dragon Claw"
                end 
            else 
                local args = {
                    [1] = "BlackbeardReward",
                    [2] = "DragonClaw",
                    [3] = "2"
                }
                
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end
end)


Tab1:Button("Check Bone",function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Bones", 
        Text = "My Bones : " ..game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Check"),
        Icon = "",
        Duration = 2.5
    })
end)



Tab1:Toggle("Auto Random Bone",false,function(vu)
    _G.Haloween1 = vu
end)




Tab1:Toggle("Auto Farm Bone",false,function(vu)
    _G.Auto_Farm_Bone = vu
end)

local RigC = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework) 
local Rig = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework.CameraShaker)
spawn(function()
    pcall(function()
    while wait() do
        if _G.Auto_Farm_Bone then
            if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == Mon then
                        repeat game:GetService("RunService").Heartbeat:wait()
                        Distance = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude 
                        Speed = 150
                        if Distance <= 3000 then
                        tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)
                        tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = v.HumanoidRootPart.CFrame*CFrame.new(0,20,20)})
                        tween:Play()
                        else
                        end
                        EquipWeapon(_G.SelectToolWeapon)
                        AutoHaki()
                        RigC.activeController.hitboxMagnitude = 80
                        Rig.CameraShakeInstance.CameraShakeState = {FadingIn = 3,FadingOut =  2,Sustained = 0,Inactive = 1} 
                        RigC.activeController.timeToNextAttack = 1
                        game:GetService('VirtualUser'):CaptureController()
                        game:GetService('VirtualUser'):ClickButton1(Vector2.new(851, 158), Workspace.CurrentCamera.CFrame)
                        v.Humanoid.WalkSpeed = 0
                        v.Humanoid.JumpPower = 0
                        v.HumanoidRootPart.CanCollide = false
                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                        v.HumanoidRootPart.Transparency = 1
                        v.Humanoid:ChangeState(11)
                        BringMob()
                        until _G.Auto_Farm_Bone == false or v.Humanoid.Health <= 0 
                    end
                end
            end
        end
    end
end)
end)



spawn(function()
    pcall(function()
        while wait(.5) do
            if _G.Haloween1 then
                local args = {
                    [1] = "Bones",
                    [2] = "Buy",
                    [3] = 1,
                    [4] = 1
                }
                
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end)
end)


Wapon = {}
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
    if v:IsA("Tool") then
        table.insert(Wapon ,v.Name)
    end
end
 local SelectWeapona = Tab1:Dropdown("Select Weapon",Wapon,function(Value)
    _G.SelectToolWeapon = Value
    SelectToolWeaponOld = Value
end)
Tab1:Button("Refresh Weapon",function()
    SelectWeapona:Clear()
    Wapon = {}
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
        if v:IsA("Tool") then
            SelectWeapona:Add(v.Name)
        end
    end
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
        if v:IsA("Tool") then
            SelectWeapona:Add(v.Name)
        end
    end
end)





Tab1:Line()

Tab1:Toggle("Auto Buy Haki Colours",false,function(Value)
    _G.HakiColorHop = Value
end)
spawn(function()
    while _G.HakiColorHop do wait()
        if _G.HakiColorHop then
            local args = {
                [1] = "ColorsDealer",
                [2] = "2"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end 
    end
end)

Tab1:Toggle("Auto Buy Legendary Sword",false,function(Value)
    _G.BuySword = Value
end)
spawn(function()
    while wait() do
        if _G.BuySword then
            local args = {
                [1] = "LegendarySwordDealer",
                [2] = "2"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end 
    end
end)

Tab1:Toggle("Auto Legendary Swords Hop",_G.Auto_Sword,function(gg)
    _G.Auto_Sword_Hop = gg
end)


Tab1:Toggle("Auto Yama",_G.AutoYama,function(aa)
    _G.AutoYama = aa
end)

spawn(function()
    while wait() do
        pcall(function()
        if _G.AutoYama then
            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress") >= 30 then
                fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
            else
            if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo") or string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban") or string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre") then
                if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo [Lv. 1750]") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban [Lv. 1750]") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre [Lv. 1750]") then
                    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                        if v.Name == "Diablo [Lv. 1750]" or v.Name == "Urban [Lv. 1750]" or v.Name == "Deandre [Lv. 1750]" then
                            repeat wait(.1)
                                EquipWeapon(_G.SelectToolWeapon)
                                AutoHaki()
                                noclipnew()
                                Distance = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude -- จุดที่จะไป Position Only
                                Speed = 100 -- ความเร็วของมึง
                                tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)
                                tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = v.HumanoidRootPart.CFrame*CFrame.new(0,0,30)})
                                tween:Play()
                                v.HumanoidRootPart.Transparency = 1
                                v.HumanoidRootPart.CanCollide = true
                                v.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                Click()           
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            until _G.AutoYama == false or not v.Parent or v.Humanoid.Health <= 0 or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
                        end
                    end
                else
                    RUOK = Vector3.new(-5418.392578125, 313.74130249023, -2824.9157714844)
                    Distance = (RUOK - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude -- จุดที่จะไป Position Only
                    Speed = 100 -- ความเร็วของมึง
                    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)
                    tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-5418.392578125, 313.74130249023, -2824.9157714844)})
                    tween:Play()
                    wait(Distance/Speed)
                end
            else
                EE = Vector3.new(-5418.392578125, 313.74130249023, -2824.9157714844)
                Distance = (EE - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude -- จุดที่จะไป Position Only
                Speed = 100 -- ความเร็วของมึง
                tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)
                tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-5418.392578125, 313.74130249023, -2824.9157714844)})
                tween:Play()
                wait(Distance/Speed)
                wait(1.5)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
                wait(1.1)
            end
        end
        end
    end)
    end
end)

function autoTushita()
    if _G.checkup and not game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") and not game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
        if game.Workspace.Enemies:FindFirstChild("Deandre [Lv. 1750]") or game.Workspace.Enemies:FindFirstChild("Urban [Lv. 1750]") or game.Workspace.Enemies:FindFirstChild("Diablo [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Deandre [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Urban [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Diablo [Lv. 1750]") then
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                _G.FastBoss = false
				TP(Vector3.new(-5420.49219, 314.446045, -2823.07373, -0.370539844, 6.66716105e-08, -0.928816557, 8.17477854e-08, 1, 3.91689809e-08, 0.928816557, -6.14150295e-08, -0.370539844),CFrame.new(-5420.49219, 314.446045, -2823.07373, -0.370539844, 6.66716105e-08, -0.928816557, 8.17477854e-08, 1, 3.91689809e-08, 0.928816557, -6.14150295e-08, -0.370539844))
                wait(1)
				TP(Vector3.new(-5420.49219, 314.446045, -2823.07373, -0.370539844, 6.66716105e-08, -0.928816557, 8.17477854e-08, 1, 3.91689809e-08, 0.928816557, -6.14150295e-08, -0.370539844),CFrame.new(-5420.49219, 314.446045, -2823.07373, -0.370539844, 6.66716105e-08, -0.928816557, 8.17477854e-08, 1, 3.91689809e-08, 0.928816557, -6.14150295e-08, -0.370539844))

                wait(1.1)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
                wait(1)
            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                CheckQuest()
                pcall(function()
                    EquipWeapon(_G.SelectToolWeapon)
                    AutoHaki()
                    noclipnew()
                    pcall(function()
                        local v = enemyEliteBoss()
                        v.HumanoidRootPart.CanCollide = false
                        v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(1,10,1)
                        _G.FastBoss = true
                    end)
                end)
            end
        elseif _G.ServerHop then
        _G.FastBoss = false
        TP(Vector3.new(-12554.9443, 337.194092, -7501.44727, 0.906377554, 4.23948272e-08, -0.422468632, -1.89128269e-08, 1, 5.97740595e-08, 0.422468632, -4.61877896e-08, 0.906377554),CFrame.new(-12554.9443, 337.194092, -7501.44727, 0.906377554, 4.23948272e-08, -0.422468632, -1.89128269e-08, 1, 5.97740595e-08, 0.422468632, -4.61877896e-08, 0.906377554))

            wait(1)
            Hopey()
        end
    elseif game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
        _G.checkup = false
        _G.FastBoss = false
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Winter Sky")
        wait(0.5)
		TP(Vector3.new(-5420.16602, 1084.9657, -2666.8208, 0.390717864, 0, 0.92051065, 0, 1, 0, -0.92051065, 0, 0.390717864),CFrame.new(-5420.16602, 1084.9657, -2666.8208, 0.390717864, 0, 0.92051065, 0, 1, 0, -0.92051065, 0, 0.390717864))
        wait(Distance/Speed)
        wait(0.5)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Pure Red")
        wait(0.5)
		TP(Vector3.new(-5414.41357, 309.865753, -2212.45776, 0.374604106, -0, -0.92718488, 0, 1, -0, 0.92718488, 0, 0.374604106),CFrame.new(-5414.41357, 309.865753, -2212.45776, 0.374604106, -0, -0.92718488, 0, 1, -0, 0.92718488, 0, 0.374604106))
        wait(Distance/Speed)
        wait(0.5)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Snow White")
        wait(0.5)
		TP(Vector3.new(-4971.47559, 331.565765, -3720.02954, -0.92051065, 0, 0.390717506, 0, 1, 0, -0.390717506, 0, -0.92051065),CFrame.new(-4971.47559, 331.565765, -3720.02954, -0.92051065, 0, 0.390717506, 0, 1, 0, -0.390717506, 0, -0.92051065))
        wait(Distance/Speed)
        wait(0.5)
        EquipWeapon("God's Chalice")
        wait(0.5)
		TP(Vector3.new(-5560.27295, 313.915466, -2663.89795, -0.438523829, 2.38801645e-09, 0.898719549, -5.84364612e-10, 1, -2.94226843e-09, -0.898719549, -1.81543469e-09, -0.438523829),CFrame.new(-5560.27295, 313.915466, -2663.89795, -0.438523829, 2.38801645e-09, 0.898719549, -5.84364612e-10, 1, -2.94226843e-09, -0.898719549, -1.81543469e-09, -0.438523829))
        wait(Distance/Speed)
        wait(0.5)
        TP(Vector3.new(-5561.37451, 313.342529, -2663.49487, -0.308039904, -2.99654097e-08, 0.951373458, -2.03540047e-08, 1, 2.49066918e-08, -0.951373458, -1.16920047e-08, -0.308039904),CFrame.new(-5561.37451, 313.342529, -2663.49487, -0.308039904, -2.99654097e-08, 0.951373458, -2.03540047e-08, 1, 2.49066918e-08, -0.951373458, -1.16920047e-08, -0.308039904))
		wait(Distance/Speed)
        wait(1)
        TP(Vector3.new(5154.17676, 141.786423, 911.046326, 0.0786230937, 1.10107962e-07, 0.996904433, 8.76694628e-09, 1, -1.11141297e-07, -0.996904433, 1.74780794e-08, 0.0786230937),CFrame.new(5154.17676, 141.786423, 911.046326, 0.0786230937, 1.10107962e-07, 0.996904433, 8.76694628e-09, 1, -1.11141297e-07, -0.996904433, 1.74780794e-08, 0.0786230937))
        wait(Distance/Speed)
        wait(0.2)
		TP(Vector3.new(5148.03613, 162.352493, 910.548218, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(5148.03613, 162.352493, 910.548218, 0, 0, -1, 0, 1, 0, 1, 0, 0))
        wait(Distance/Speed)
        wait(1)
        EquipWeapon("Holy Torch")
        wait(1)
        wait(0.4)
		TP(Vector3.new(-10752.7695, 412.229523, -9366.36328, 0.97063309, -3.15659037e-08, 0.240564749, 5.60982159e-08, 1, -9.51298205e-08, -0.240564749, 1.05831404e-07, 0.97063309),CFrame.new(-10752.7695, 412.229523, -9366.36328, 0.97063309, -3.15659037e-08, 0.240564749, 5.60982159e-08, 1, -9.51298205e-08, -0.240564749, 1.05831404e-07, 0.97063309))
        wait(Distance/Speed)
        wait(0.4)
		TP(Vector3.new(-11673.4111, 331.749023, -9474.34668, 0.200540408, 6.91700279e-08, -0.979685426, -2.19707559e-08, 1, 6.6106935e-08, 0.979685426, 8.2673175e-09, 0.200540408),CFrame.new(-11673.4111, 331.749023, -9474.34668, 0.200540408, 6.91700279e-08, -0.979685426, -2.19707559e-08, 1, 6.6106935e-08, 0.979685426, 8.2673175e-09, 0.200540408))
        wait(Distance/Speed)
        wait(0.4)
		TP(Vector3.new(-12133.3389, 519.47522, -10653.1904, 0.845298052, -6.34159107e-08, -0.534295022, 4.46860327e-08, 1, -4.79938898e-08, 0.534295022, 1.66936172e-08, 0.845298052),CFrame.new(-12133.3389, 519.47522, -10653.1904, 0.845298052, -6.34159107e-08, -0.534295022, 4.46860327e-08, 1, -4.79938898e-08, 0.534295022, 1.66936172e-08, 0.845298052))
        wait(Distance/Speed)
        wait(0.4)
		TP(Vector3.new(-13336.5, 485.280396, -6983.35254, 0.912677109, -1.29153763e-08, -0.408681422, 2.20926388e-08, 1, 1.77352568e-08, 0.408681422, -2.52154138e-08, 0.912677109),CFrame.new(-13336.5, 485.280396, -6983.35254, 0.912677109, -1.29153763e-08, -0.408681422, 2.20926388e-08, 1, 1.77352568e-08, 0.408681422, -2.52154138e-08, 0.912677109))
        wait(Distance/Speed)
        wait(0.4)
		TP(Vector3.new(-13487.4131, 334.84845, -7926.34863, -0.999999702, -6.9906867e-09, -0.000721037388, -6.9868662e-09, 1, -5.30099697e-09, 0.000721037388, -5.29595745e-09, -0.999999702),CFrame.new(-13487.4131, 334.84845, -7926.34863, -0.999999702, -6.9906867e-09, -0.000721037388, -6.9868662e-09, 1, -5.30099697e-09, 0.000721037388, -5.29595745e-09, -0.999999702))
        wait(Distance/Speed)
        wait(1)
    elseif game.Workspace.Enemies:FindFirstChild("Longma [Lv. 2000] [Boss]") or game.ReplicatedStorage:FindFirstChild("Longma [Lv. 2000] [Boss]") then
        pcall(function()
            EquipWeapon(_G.SelectToolWeapon)
            pcall(function()
                local v = enemylongma()
                v.HumanoidRootPart.CanCollide = false
                v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,25,25)
                _G.FastBoss = true
            end)
        end)
    elseif game.Workspace.Enemies:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]")  or game.ReplicatedStorage:FindFirstChild("rip_indra True Form [Lv. 5000] [Raid Boss]") then
        pcall(function()
            EquipWeapon(_G.SelectWeapon)
            pcall(function()
                local v = enemyrip()
                v.HumanoidRootPart.CanCollide = false
                v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(1,10,1)
                _G.FastBoss = true
            end)
        end)
    elseif _G.ServerHop then
        _G.FastBoss = false
		tweenteleoirtxx(Vector3.new(-12554.9443, 337.194092, -7501.44727, 0.906377554, 4.23948272e-08, -0.422468632, -1.89128269e-08, 1, 5.97740595e-08, 0.422468632, -4.61877896e-08, 0.906377554),CFrame.new(-12554.9443, 337.194092, -7501.44727, 0.906377554, 4.23948272e-08, -0.422468632, -1.89128269e-08, 1, 5.97740595e-08, 0.422468632, -4.61877896e-08, 0.906377554))
    end
end

Tab1:Toggle("Auto Tushita",_G.Tushitahop,function(aa)
    _G.Tushitahop = aa
end)

spawn(function()
    while wait(.1) do
        if _G.Tushitahop then
            autoTushita()
        end
    end
end)

------------------------------------

function CheckQuestBoss()
	if SelectBoss == "Diamond [Lv. 750] [Boss]" then
	   MsBoss = "Diamond [Lv. 750] [Boss]"
		NaemQuestBoss = "Area1Quest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
		CFrameBoss = CFrame.new(-1736.26587, 198.627731, -236.412857, -0.997808516, 0, -0.0661673471, 0, 1, 0, 0.0661673471, 0, -0.997808516)
	elseif SelectBoss == "Jeremy [Lv. 850] [Boss]" then
		MsBoss = "Jeremy [Lv. 850] [Boss]"
		NaemQuestBoss = "Area2Quest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
		CFrameBoss = CFrame.new(2203.76953, 448.966034, 752.731079, -0.0217453763, 0, -0.999763548, 0, 1, 0, 0.999763548, 0, -0.0217453763)
	elseif SelectBoss == "Fajita [Lv. 925] [Boss]" then
		MsBoss = "Fajita [Lv. 925] [Boss]"
		NaemQuestBoss = "MarineQuest3"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08, -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
		CFrameBoss = CFrame.new(-2297.40332, 115.449463, -3946.53833, 0.961227536, -1.46645796e-09, -0.275756449, -2.3212845e-09, 1, -1.34094433e-08, 0.275756449, 1.35296352e-08, 0.961227536)
	elseif SelectBoss == "Don Swan [Lv. 1000] [Boss]" then
		MsBoss = "Don Swan [Lv. 1000] [Boss]"
		CFrameBoss = CFrame.new(2288.802, 15.1870775, 863.034607, 0.99974072, -8.41247214e-08, -0.0227668174, 8.4774733e-08, 1, 2.75850098e-08, 0.0227668174, -2.95079072e-08, 0.99974072)
	elseif SelectBoss == "Smoke Admiral [Lv. 1150] [Boss]" then
		MsBoss = "Smoke Admiral [Lv. 1150] [Boss]"
		NaemQuestBoss = "IceSideQuest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-6059.96191, 15.9868021, -4904.7373, -0.444992423, -3.0874483e-09, 0.895534337, -3.64098796e-08, 1, -1.4644522e-08, -0.895534337, -3.91229982e-08, -0.444992423)
		CFrameBoss = CFrame.new(-5115.72754, 23.7664986, -5338.2207, 0.251453817, 1.48345061e-08, -0.967869282, 4.02796978e-08, 1, 2.57916977e-08, 0.967869282, -4.54708946e-08, 0.251453817)
	elseif SelectBoss == "Cursed Captain [Lv. 1325] [Raid Boss]" then
		MsBoss = "Cursed Captain [Lv. 1325] [Raid Boss]"
		CFrameBoss = CFrame.new(916.928589, 181.092773, 33422, -0.999505103, 9.26310495e-09, 0.0314563364, 8.42916226e-09, 1, -2.6643713e-08, -0.0314563364, -2.63653774e-08, -0.999505103)
	elseif SelectBoss == "Awakened Ice Admiral [Lv. 1400] [Boss]" then
		MsBoss = "Awakened Ice Admiral [Lv. 1400] [Boss]"
		NaemQuestBoss = "FrostQuest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(5669.33203, 28.2118053, -6481.55908, 0.921275556, -1.25320829e-08, 0.388910472, 4.72230788e-08, 1, -7.96414241e-08, -0.388910472, 9.17372489e-08, 0.921275556)
		CFrameBoss = CFrame.new(6407.33936, 340.223785, -6892.521, 0.49051559, -5.25310213e-08, -0.871432424, -2.76146022e-08, 1, -7.58250565e-08, 0.871432424, 6.12576301e-08, 0.49051559)
	elseif SelectBoss == "Tide Keeper [Lv. 1475] [Boss]" then
		MsBoss = "Tide Keeper [Lv. 1475] [Boss]"
		NaemQuestBoss = "ForgottenQuest"             
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-3053.89648, 236.881363, -10148.2324, -0.985987961, -3.58504737e-09, 0.16681771, -3.07832915e-09, 1, 3.29612559e-09, -0.16681771, 2.73641976e-09, -0.985987961)
		CFrameBoss = CFrame.new(-3570.18652, 123.328949, -11555.9072, 0.465199202, -1.3857326e-08, 0.885206044, 4.0332897e-09, 1, 1.35347511e-08, -0.885206044, -2.72606271e-09, 0.465199202)
		-- Old World
	elseif SelectBoss == "Saber Expert [Lv. 200] [Boss]" then
		MsBoss = "Saber Expert [Lv. 200] [Boss]"
		CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564, 0.858821094, 1.13848939e-08, 0.512275636, -4.85649254e-09, 1, -1.40823326e-08, -0.512275636, 9.6063415e-09, 0.858821094)
	elseif SelectBoss == "The Gorilla King [Lv. 25] [Boss]" then
		MsBoss = "The Gorilla King [Lv. 25] [Boss]"
		NaemQuestBoss = "JungleQuest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06, -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
		CFrameBoss = CFrame.new(-1223.52808, 6.27936459, -502.292664, 0.310949147, -5.66602516e-08, 0.950426519, -3.37275488e-08, 1, 7.06501808e-08, -0.950426519, -5.40241736e-08, 0.310949147)
	elseif SelectBoss == "Bobby [Lv. 55] [Boss]" then
		MsBoss = "Bobby [Lv. 55] [Boss]"
		NaemQuestBoss = "BuggyQuest1"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383, -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
		CFrameBoss = CFrame.new(-1147.65173, 32.5966301, 4156.02588, 0.956680477, -1.77109952e-10, -0.29113996, 5.16530874e-10, 1, 1.08897802e-09, 0.29113996, -1.19218679e-09, 0.956680477)
	elseif SelectBoss == "Yeti [Lv. 110] [Boss]" then
		MsBoss = "Yeti [Lv. 110] [Boss]"
		NaemQuestBoss = "SnowQuest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(1384.90247, 87.3078308, -1296.6825, 0.280209213, 2.72035177e-08, -0.959938943, -6.75690828e-08, 1, 8.6151708e-09, 0.959938943, 6.24481444e-08, 0.280209213)
		CFrameBoss = CFrame.new(1221.7356, 138.046906, -1488.84082, 0.349343032, -9.49245944e-08, 0.936994851, 6.29478194e-08, 1, 7.7838429e-08, -0.936994851, 3.17894653e-08, 0.349343032)
	elseif SelectBoss == "Mob Leader [Lv. 120] [Boss]" then
		MsBoss = "Mob Leader [Lv. 120] [Boss]"
		CFrameBoss = CFrame.new(-2848.59399, 7.4272871, 5342.44043, -0.928248107, -8.7248246e-08, 0.371961564, -7.61816636e-08, 1, 4.44474857e-08, -0.371961564, 1.29216433e-08, -0.928248107)
		--The Gorilla King [Lv. 25] [Boss]
	elseif SelectBoss == "Vice Admiral [Lv. 130] [Boss]" then
		MsBoss = "Vice Admiral [Lv. 130] [Boss]"
		NaemQuestBoss = "MarineQuest2"
		LevelQuestBoss = 2
		CFrameQuestBoss = CFrame.new(-5035.42285, 28.6520386, 4324.50293, -0.0611100644, -8.08395768e-08, 0.998130739, -1.57416586e-08, 1, 8.00271849e-08, -0.998130739, -1.08217701e-08, -0.0611100644)
		CFrameBoss = CFrame.new(-5078.45898, 99.6520691, 4402.1665, -0.555574954, -9.88630566e-11, 0.831466436, -6.35508286e-08, 1, -4.23449258e-08, -0.831466436, -7.63661632e-08, -0.555574954)
	elseif SelectBoss == "Warden [Lv. 175] [Boss]" then
		MsBoss = "Warden [Lv. 175] [Boss]"
		NaemQuestBoss = "ImpelQuest"
		LevelQuestBoss = 1
		CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
		CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
	elseif SelectBoss == "Chief Warden [Lv. 200] [Boss]" then
		MsBoss = "Chief Warden [Lv. 200] [Boss]"
		NaemQuestBoss = "ImpelQuest"
		LevelQuestBoss = 2
		CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
		CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
	elseif SelectBoss == "Flamingo [Lv. 225] [Boss]" then
		MsBoss = "Flamingo [Lv. 225] [Boss]"
		NaemQuestBoss = "ImpelQuest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(4851.35059, 5.68744135, 743.251282, -0.538484037, -6.68303741e-08, -0.842635691, 1.38001752e-08, 1, -8.81300792e-08, 0.842635691, -5.90851599e-08, -0.538484037)
		CFrameBoss = CFrame.new(5232.5625, 5.26856995, 747.506897, 0.943829298, -4.5439414e-08, 0.330433697, 3.47818627e-08, 1, 3.81658154e-08, -0.330433697, -2.45289105e-08, 0.943829298)
	elseif SelectBoss == "Magma Admiral [Lv. 350] [Boss]" then
		MsBoss = "Magma Admiral [Lv. 350] [Boss]"
		NaemQuestBoss = "MagmaQuest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-5317.07666, 12.2721891, 8517.41699, 0.51175487, -2.65508806e-08, -0.859131515, -3.91131572e-08, 1, -5.42026761e-08, 0.859131515, 6.13418294e-08, 0.51175487)
		CFrameBoss = CFrame.new(-5530.12646, 22.8769703, 8859.91309, 0.857838571, 2.23414389e-08, 0.513919294, 1.53689133e-08, 1, -6.91265853e-08, -0.513919294, 6.71978384e-08, 0.857838571)
	elseif SelectBoss == "Fishman Lord [Lv. 425] [Boss]" then
		MsBoss = "Fishman Lord [Lv. 425] [Boss]"
		NaemQuestBoss = "FishmanQuest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(61123.0859, 18.5066795, 1570.18018, 0.927145958, 1.0624845e-07, 0.374700129, -6.98219367e-08, 1, -1.10790765e-07, -0.374700129, 7.65569368e-08, 0.927145958)
		CFrameBoss = CFrame.new(61351.7773, 31.0306778, 1113.31409, 0.999974668, 0, -0.00714713801, 0, 1.00000012, 0, 0.00714714266, 0, 0.999974549)
	elseif SelectBoss == "Wysper [Lv. 500] [Boss]" then
		MsBoss = "Wysper [Lv. 500] [Boss]"
		NaemQuestBoss = "SkyExp1Quest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-7862.94629, 5545.52832, -379.833954, 0.462944925, 1.45838088e-08, -0.886386991, 1.0534996e-08, 1, 2.19553424e-08, 0.886386991, -1.95022007e-08, 0.462944925)
		CFrameBoss = CFrame.new(-7925.48389, 5550.76074, -636.178345, 0.716468513, -1.22915289e-09, 0.697619379, 3.37381434e-09, 1, -1.70304748e-09, -0.697619379, 3.57381835e-09, 0.716468513)
	elseif SelectBoss == "Thunder God [Lv. 575] [Boss]" then
		MsBoss = "Thunder God [Lv. 575] [Boss]"
		NaemQuestBoss = "SkyExp2Quest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(-7902.78613, 5635.99902, -1411.98706, -0.0361216255, -1.16895912e-07, 0.999347389, 1.44533963e-09, 1, 1.17024491e-07, -0.999347389, 5.6715117e-09, -0.0361216255)
		CFrameBoss = CFrame.new(-7917.53613, 5616.61377, -2277.78564, 0.965189934, 4.80563429e-08, -0.261550069, -6.73089886e-08, 1, -6.46515304e-08, 0.261550069, 8.00056768e-08, 0.965189934)
	elseif SelectBoss == "Cyborg [Lv. 675] [Boss]" then
		MsBoss = "Cyborg [Lv. 675] [Boss]"
		NaemQuestBoss = "FountainQuest"
		LevelQuestBoss = 3
		CFrameQuestBoss = CFrame.new(5253.54834, 38.5361786, 4050.45166, -0.0112687312, -9.93677887e-08, -0.999936521, 2.55291371e-10, 1, -9.93769547e-08, 0.999936521, -1.37512213e-09, -0.0112687312)
		CFrameBoss = CFrame.new(6041.82813, 52.7112198, 3907.45142, -0.563162148, 1.73805248e-09, -0.826346457, -5.94632716e-08, 1, 4.26280238e-08, 0.826346457, 7.31437524e-08, -0.563162148)
   elseif SelectBoss == "Stone [Lv. 1550] [Boss]" then
      MsBoss = "Stone [Lv. 1550] [Boss]"
      NaemQuestBoss = "PiratePortQuest"
      LevelQuestBoss = 3
      CFrameQuestBoss = CFrame.new(-288.003815, 43.7675667, 5573.12012, -0.959750533, 1.11968195e-08, 0.280853927, -1.77952231e-08, 1, -1.00677937e-07, -0.280853927, -1.01623563e-07, -0.959750533)
      CFrameBoss = CFrame.new(-1086.11621, 38.8425903, 6768.71436, 0.0231462717, -0.592676699, 0.805107772, 2.03251839e-05, 0.805323839, 0.592835128, -0.999732077, -0.0137055516, 0.0186523199)
   elseif SelectBoss == "Island Empress [Lv. 1675] [Boss]" then
      MsBoss = "Island Empress [Lv. 1675] [Boss]"
      NaemQuestBoss = "AmazonQuest2"
      LevelQuestBoss = 3
      CFrameQuestBoss = CFrame.new(5447.27734375, 601.68060302734, 750.61822509766)
      CFrameBoss = CFrame.new(5713.98877, 601.922974, 202.751251, -0.101080291, -0, -0.994878292, -0, 1, -0, 0.994878292, 0, -0.101080291)
   elseif SelectBoss == "Kilo Admiral [Lv. 1750] [Boss]" then
      MsBoss = "Kilo Admiral [Lv. 1750] [Boss]"
      NaemQuestBoss = "MarineTreeIsland"
      LevelQuestBoss = 3
      CFrameQuestBoss = CFrame.new(2179.8757324219, 28.705436706543, -6739.759765625)
      CFrameBoss = CFrame.new(2877.61743, 423.558685, -7207.31006, -0.989591599, -0, -0.143904909, -0, 1.00000012, -0, 0.143904924, 0, -0.989591479)
   elseif SelectBoss == "Captain Elephant [Lv. 1875] [Boss]" then
      MsBoss = "Captain Elephant [Lv. 1875] [Boss]"
      NaemQuestBoss = "DeepForestIsland"
      LevelQuestBoss = 3
      CFrameQuestBoss = CFrame.new(-13231.1602, 333.744446, -7624.40723, -0.0901302397, 8.36351219e-08, 0.995930016, 2.76566414e-08, 1, -8.14740204e-08, -0.995930016, 2.02008046e-08, -0.0901302397)
      CFrameBoss = CFrame.new(-13485.0283, 331.709259, -8012.4873, 0.714521289, 7.98849911e-08, 0.69961375, -1.02065748e-07, 1, -9.94383065e-09, -0.69961375, -6.43015241e-08, 0.714521289)
   elseif SelectBoss == "Beautiful Pirate [Lv. 1950] [Boss]" then
    MsBoss = "Beautiful Pirate [Lv. 1950] [Boss]"
    NaemQuestBoss = "DeepForestIsland2"
    LevelQuestBoss = 3
    CFrameQuestBoss = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
    CFrameBoss = CFrame.new(5312.3598632813, 20.141201019287, -10.158538818359)
    end 
end

function AutoFarmAll()
    for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
        if CheckAllBoss then
            if v.Name == "The Gorilla King [Lv. 25] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 20 then
                SelectBoss = "The Gorilla King [Lv. 25] [Boss]"
            elseif v.Name == "Bobby [Lv. 55] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 55 then
                SelectBoss = "Bobby [Lv. 55] [Boss]"
            elseif v.Name == "Yeti [Lv. 110] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 105 then
                SelectBoss = "Yeti [Lv. 110] [Boss]"
            elseif v.Name == "Mob Leader [Lv. 120] [Boss]"  and game.Players.localPlayer.Data.Level.Value >= 120 then
                SelectBoss = "Mob Leader [Lv. 120] [Boss]"
            elseif v.Name == "Vice Admiral [Lv. 130] [Boss]"  and game.Players.localPlayer.Data.Level.Value >= 130 then
                SelectBoss = "Vice Admiral [Lv. 130] [Boss]"
            elseif v.Name == "Warden [Lv. 175] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 175 then
                SelectBoss = "Warden [Lv. 175] [Boss]"
            elseif v.Name == "Chief Warden [Lv. 200] [Boss]"  and game.Players.localPlayer.Data.Level.Value >= 200 then
                SelectBoss = "Chief Warden [Lv. 200] [Boss]"
            elseif v.Name == "Saber Expert [Lv. 200] [Boss]" and game.Workspace.Map.Jungle.Final.Part.Transparency == 1 then
                SelectBoss = "Saber Expert [Lv. 200] [Boss]"
            elseif v.Name == "Swan [Lv. 225] [Boss]"  and game.Players.localPlayer.Data.Level.Value >= 250 then
                SelectBoss = "Swan [Lv. 225] [Boss]"
            elseif v.Name == "Magma Admiral [Lv. 350] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 350 then
                SelectBoss = "Magma Admiral [Lv. 350] [Boss]"
            elseif v.Name == "Fishman Lord [Lv. 425] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 425 then
                SelectBoss = "Fishman Lord [Lv. 425] [Boss]"
            elseif v.Name == "Wysper [Lv. 500] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 500 then
                SelectBoss = "Wysper [Lv. 500] [Boss]"
            elseif v.Name == "Thunder God [Lv. 575] [Boss]"  and game.Players.localPlayer.Data.Level.Value >= 575 then
                SelectBoss = "Thunder God [Lv. 575] [Boss]"
            elseif v.Name == "Cyborg [Lv. 675] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 675 then
                SelectBoss = "Cyborg [Lv. 675] [Boss]"
            elseif v.Name == "Diamond [Lv. 750] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 750 then
                SelectBoss = "Diamond [Lv. 750] [Boss]"
            elseif v.Name == "Jeremy [Lv. 850] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 850 then
                SelectBoss = "Jeremy [Lv. 850] [Boss]"
            elseif v.Name == "Fajita [Lv. 925] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 925 then
                SelectBoss = "Fajita [Lv. 925] [Boss]"
            elseif v.Name == "Don Swan [Lv. 1000] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1000 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","1") == 0 then
                SelectBoss = "Don Swan [Lv. 1000] [Boss]" 
            elseif v.Name == "Smoke Admiral [Lv. 1150] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1150 then
                SelectBoss = "Smoke Admiral [Lv. 1150] [Boss]"
            elseif v.Name == "Cursed Captain [Lv. 1325] [Raid Boss]" then
                SelectBoss = "Cursed Captain [Lv. 1325] [Raid Boss]"
            elseif v.Name == "Awakened Ice Admiral [Lv. 1400] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1400 then
                SelectBoss = "Awakened Ice Admiral [Lv. 1400] [Boss]"
            elseif v.Name == "Tide Keeper [Lv. 1475] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1475 then
                SelectBoss = "Tide Keeper [Lv. 1475] [Boss]"
            elseif v.Name == "Stone [Lv. 1550] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1550 then
                SelectBoss = "Stone [Lv. 1550] [Boss]"
            elseif v.Name == "Island Empress [Lv. 1675] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1675 then
                SelectBoss = "Island Empress [Lv. 1675] [Boss]"
            elseif v.Name == "Kilo Admiral [Lv. 1750] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1750 then
                SelectBoss = "Kilo Admiral [Lv. 1750] [Boss]"
            elseif v.Name == "Captain Elephant [Lv. 1875] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1875 then
                SelectBoss = "Captain Elephant [Lv. 1875] [Boss]"
            elseif v.Name == "Beautiful Pirate [Lv. 1950] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1950 then
                SelectBoss = "Beautiful Pirate [Lv. 1950] [Boss]"
            elseif v.Name == "Longma [Lv. 2000] [Boss]" and not game:GetService("Workspace").Map.Turtle:FindFirstChild("TushitaGate") then
                SelectBoss = "Longma [Lv. 2000] [Boss]"
            end
        end
    end
	for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if CheckAllBoss then
            if v.Name == "The Gorilla King [Lv. 25] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 20 then
                SelectBoss = "The Gorilla King [Lv. 25] [Boss]"
            elseif v.Name == "Bobby [Lv. 55] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 55 then
                SelectBoss = "Bobby [Lv. 55] [Boss]"
            elseif v.Name == "Yeti [Lv. 110] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 105 then
                SelectBoss = "Yeti [Lv. 110] [Boss]"
            elseif v.Name == "Mob Leader [Lv. 120] [Boss]"  and game.Players.localPlayer.Data.Level.Value >= 120 then
                SelectBoss = "Mob Leader [Lv. 120] [Boss]"
            elseif v.Name == "Vice Admiral [Lv. 130] [Boss]"  and game.Players.localPlayer.Data.Level.Value >= 130 then
                SelectBoss = "Vice Admiral [Lv. 130] [Boss]"
            elseif v.Name == "Warden [Lv. 175] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 175 then
                SelectBoss = "Warden [Lv. 175] [Boss]"
            elseif v.Name == "Chief Warden [Lv. 200] [Boss]"  and game.Players.localPlayer.Data.Level.Value >= 200 then
                SelectBoss = "Chief Warden [Lv. 200] [Boss]"
            elseif v.Name == "Saber Expert [Lv. 200] [Boss]" and game.Workspace.Map.Jungle.Final.Part.Transparency == 1 then
                SelectBoss = "Saber Expert [Lv. 200] [Boss]"
            elseif v.Name == "Swan [Lv. 225] [Boss]"  and game.Players.localPlayer.Data.Level.Value >= 250 then
                SelectBoss = "Swan [Lv. 225] [Boss]"
            elseif v.Name == "Magma Admiral [Lv. 350] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 350 then
                SelectBoss = "Magma Admiral [Lv. 350] [Boss]"
            elseif v.Name == "Fishman Lord [Lv. 425] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 425 then
                SelectBoss = "Fishman Lord [Lv. 425] [Boss]"
            elseif v.Name == "Wysper [Lv. 500] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 500 then
                SelectBoss = "Wysper [Lv. 500] [Boss]"
            elseif v.Name == "Thunder God [Lv. 575] [Boss]"  and game.Players.localPlayer.Data.Level.Value >= 575 then
                SelectBoss = "Thunder God [Lv. 575] [Boss]"
            elseif v.Name == "Cyborg [Lv. 675] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 675 then
                SelectBoss = "Cyborg [Lv. 675] [Boss]"
            elseif v.Name == "Diamond [Lv. 750] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 750 then
                SelectBoss = "Diamond [Lv. 750] [Boss]"
            elseif v.Name == "Jeremy [Lv. 850] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 850 then
                SelectBoss = "Jeremy [Lv. 850] [Boss]"
            elseif v.Name == "Fajita [Lv. 925] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 925 then
                SelectBoss = "Fajita [Lv. 925] [Boss]"
            elseif v.Name == "Don Swan [Lv. 1000] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1000 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","1") == 0 then
                SelectBoss = "Don Swan [Lv. 1000] [Boss]" 
            elseif v.Name == "Smoke Admiral [Lv. 1150] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1150 then
                SelectBoss = "Smoke Admiral [Lv. 1150] [Boss]"
            elseif v.Name == "Cursed Captain [Lv. 1325] [Raid Boss]" then
                SelectBoss = "Cursed Captain [Lv. 1325] [Raid Boss]"
            elseif v.Name == "Awakened Ice Admiral [Lv. 1400] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1400 then
                SelectBoss = "Awakened Ice Admiral [Lv. 1400] [Boss]"
            elseif v.Name == "Tide Keeper [Lv. 1475] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1475 then
                SelectBoss = "Tide Keeper [Lv. 1475] [Boss]"
            elseif v.Name == "Stone [Lv. 1550] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1550 then
                SelectBoss = "Stone [Lv. 1550] [Boss]"
            elseif v.Name == "Island Empress [Lv. 1675] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1675 then
                SelectBoss = "Island Empress [Lv. 1675] [Boss]"
            elseif v.Name == "Kilo Admiral [Lv. 1750] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1750 then
                SelectBoss = "Kilo Admiral [Lv. 1750] [Boss]"
            elseif v.Name == "Captain Elephant [Lv. 1875] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1875 then
                SelectBoss = "Captain Elephant [Lv. 1875] [Boss]"
            elseif v.Name == "Beautiful Pirate [Lv. 1950] [Boss]" and game.Players.localPlayer.Data.Level.Value >= 1950 then
                SelectBoss = "Beautiful Pirate [Lv. 1950] [Boss]"
            elseif v.Name == "Longma [Lv. 2000] [Boss]" and not game:GetService("Workspace").Map.Turtle:FindFirstChild("TushitaGate") then
                SelectBoss = "Longma [Lv. 2000] [Boss]"
            end
        end
    end
end


local TweenSpeed= 300
local TweenSpeedF = 205
function TeleportTween(dist, Speed)
   local char = game.Players.LocalPlayer.Character
   local hm = char:WaitForChild("HumanoidRootPart")
    local info = TweenInfo.new((hm.Position - dist.Position).magnitude / Speed,Enum.EasingStyle.Linear)
    local tween =  game:service"TweenService":Create(hm, info, {CFrame = dist})
    tween:Play()
    tween.Completed:Wait()
end

local Boss = {}

for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
	if string.find(v.Name, "Boss") then
		if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
		else
			table.insert(Boss, v.Name)
		end
	end
end

for i, v in pairs(game.workspace.Enemies:GetChildren()) do
	if string.find(v.Name, "Boss") then
		if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
		else
			table.insert(Boss, v.Name)
		end
	end
end

local RigC = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework) 
local Rig = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework.CameraShaker)

Tab2:Toggle("Auto Boss",false,function(Value)
    wait(.1)
	local args = {
		[1] = "AbandonQuest"
	}
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    FarmBoss = Value
   while FarmBoss do
      wait(0.1)
      CheckQuestBoss()
      if SelectBoss == "Don Swan [Lv. 1000] [Boss]" or SelectBoss == "Cursed Captain [Lv. 1325] [Raid Boss]" or SelectBoss == "Saber Expert [Lv. 200] [Boss]" or SelectBoss == "Mob Leader [Lv. 120] [Boss]" or SelectBoss == "Darkbeard [Lv. 1000] [Raid Boss]" then
         if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) then
            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
               if FarmBoss and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == MsBoss then
   
                  TeleportTween(v.HumanoidRootPart.CFrame,TweenSpeed)
                   repeat  wait()                     
                     if FarmBoss and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                        pcall(function() 
                            v.HumanoidRootPart.Transparency = 1
                           v.HumanoidRootPart.CanCollide = false
                           v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                           TP(v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(0,20,20))
                           EquipWeapon(_G.SelectToolWeaponBoss)
                           RigC.activeController.hitboxMagnitude = 80
                           Rig.CameraShakeInstance.CameraShakeState = {FadingIn = 3,FadingOut =  2,Sustained = 0,Inactive = 1} 
                           RigC.activeController.timeToNextAttack = .5
                           VirtualUser:CaptureController()
                           VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
                        end)
                     end
                  until not FarmBoss or not v.Parent or v.Humanoid.Health <= 0
               end
            end
         else
            TeleportTween(CFrameBoss,TweenSpeed)
         end
      elseif SelectBoss == "Order [Lv. 1250] [Raid Boss]" then
         if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) then
            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
               if FarmBoss and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == MsBoss then
                  TeleportTween(v.HumanoidRootPart.CFrame)
                  repeat wait()                      
                     pcall(function() 
                        v.HumanoidRootPart.Transparency = 1
                        v.HumanoidRootPart.CanCollide = false
                        v.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
                        TP(v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(0,20,20))
                        EquipWeapon(_G.SelectToolWeaponBoss)
                        RigC.activeController.hitboxMagnitude = 80
                        Rig.CameraShakeInstance.CameraShakeState = {FadingIn = 3,FadingOut =  2,Sustained = 0,Inactive = 1} 
                        RigC.activeController.timeToNextAttack = .5
                        VirtualUser:CaptureController()
                        VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
                     end)
                  until not FarmBoss or not v.Parent or v.Humanoid.Health <= 0
               end
            end
         else
            TeleportTween(CFrameBoss,TweenSpeed)
         end
        elseif SelectBoss == "Rip_indra [Lv. 1500] [Boss]" then
            if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) then
               for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                  if FarmBoss and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == MsBoss then
                     TeleportTween(v.HumanoidRootPart.CFrame)
                     repeat wait()                         
                        pcall(function() 
                           v.HumanoidRootPart.Transparency = 1
                           v.HumanoidRootPart.CanCollide = false
                           v.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
                           TP(v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(0,20,20))
                           EquipWeapon(_G.SelectToolWeaponBoss)
                           RigC.activeController.hitboxMagnitude = 80
                           Rig.CameraShakeInstance.CameraShakeState = {FadingIn = 3,FadingOut =  2,Sustained = 0,Inactive = 1} 
                           RigC.activeController.timeToNextAttack = .5
                           VirtualUser:CaptureController()
                           VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
                        end)
                     until not FarmBoss or not v.Parent or v.Humanoid.Health <= 0
                  end
               end
            else
               TeleportTween(CFrameBoss,TweenSpeed)
            end
        elseif SelectBoss == "Longma [Lv. 2000] [Boss]" then
            if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) then
               for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                  if FarmBoss and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == MsBoss then
                     TeleportTween(v.HumanoidRootPart.CFrame)
                     repeat wait()                         
                        pcall(function() 
                           v.HumanoidRootPart.Transparency = 1
                           v.HumanoidRootPart.CanCollide = false
                           v.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
                           TP(v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(0,20,20))
                           EquipWeapon(_G.SelectToolWeaponBoss)
                           RigC.activeController.hitboxMagnitude = 80
                           Rig.CameraShakeInstance.CameraShakeState = {FadingIn = 3,FadingOut =  2,Sustained = 0,Inactive = 1} 
                           RigC.activeController.timeToNextAttack = .5
                           VirtualUser:CaptureController()
                           VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
                        end)
                     until not FarmBoss or not v.Parent or v.Humanoid.Health <= 0
                  end
               end
            else
               TeleportTween(CFrameBoss,TweenSpeed)
            end
      else
         if game:GetService("Workspace").Enemies:FindFirstChild(SelectBoss) or game:GetService("ReplicatedStorage"):FindFirstChild(SelectBoss) then
            if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false then
               print("How Crashed1")
               CheckQuestBoss()
               TeleportTween(CFrameQuestBoss,TweenSpeed)
               wait(1.5)
               game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NaemQuestBoss, LevelQuestBoss)
               wait(1)
               TeleportTween(CFrameBoss,TweenSpeed)
               print("Tweened")
            elseif game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
               for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                  if FarmBoss and v.Humanoid.Health > 0 and v.Name == MsBoss then
                     TeleportTween(CFrameBoss,TweenSpeed)
                     print("Tweened")
                     repeat wait()                         
                        pcall(function() 
                        v.HumanoidRootPart.Transparency = 1
                           v.HumanoidRootPart.CanCollide = false
                           v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                           TP(v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(0,17,10))
                           EquipWeapon(_G.SelectToolWeaponBoss)
                           RigC.activeController.hitboxMagnitude = 80
                            Rig.CameraShakeInstance.CameraShakeState = {FadingIn = 3,FadingOut =  2,Sustained = 0,Inactive = 1} 
                            RigC.activeController.timeToNextAttack = .5
                           VirtualUser:CaptureController()
                           VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
                        end)
                     until not FarmBoss or v.Humanoid.Health <= 0 or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
                  end
               end
               TeleportTween(CFrameBoss,TweenSpeed)
            end
         end
      end
	end
end)

Tab2:Toggle("Auto Farm All Boss [Bug]", false, function(vu)
	_G.AutoFarmAllBoss = vu
	CheckAllBoss = vu
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
	while _G.AutoFarmAllBoss do wait(.1)
		noclipnew()
        EquipWeapon(_G.SelectToolWeaponBoss)
        AutoHaki()
        AutoFarmAll()
	end
end)

local AutoBossDD = Tab2:Dropdown("Select Boss",Boss,function(Value)
   SelectBoss = Value
end)

Tab2:Button("Refresh Boss",function()
    table.clear(Boss)
    for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
       if string.find(v.Name, "Boss") then
          if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
          else
             table.insert(Boss, v.Name)
          end
       end
    end
    
    for i, v in pairs(game.workspace.Enemies:GetChildren()) do
       if string.find(v.Name, "Boss") then
          if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
          else
             table.insert(Boss, v.Name)
          end
       end
    end
    
end)
 
WaponBoss = {}
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
    if v:IsA("Tool") then
        table.insert(WaponBoss ,v.Name)
    end
end


local SelectWeapona = Tab2:Dropdown("Select Weapon Boss",WaponBoss,function(Value)
    _G.SelectToolWeaponBoss = Value
    SelectToolWeaponOld = Value
end)
Tab2:Button("Refresh Weapon Boss", function(gh)
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
           table.insert(WaponBoss,v.Name)
        end
     end
     for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") then
           table.insert(WaponBoss,v.Name)
        end
     end
end)


Tab3:Button("Check Points",function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Points", 
        Text = "My Points = " ..game:GetService("Players")["LocalPlayer"].Data.Points.Value,
        Icon = "",
        Duration = 2.5
    })
end)
_G.Melee = false
Tab3:Toggle("Melee",false,function(Value)
    _G.Melee = Value    
end)
_G.Defense = false
Tab3:Toggle("Defense",false,function(value)
    _G.Defense = value
end)
_G.Sword = false
Tab3:Toggle("Sword",false,function(value)
    _G.Sword = value
end)
_G.Gun = false
Tab3:Toggle("Gun",false,function(value)
    _G.Gun = value
end)
_G.Fruit = false
Tab3:Toggle("Devil Fruit",false,function(value)
    _G.Fruit = value
end)
PointStats = 1
Tab3:Slider("Point", 1, 100,PointStats,function(a)
    PointStats = a
end)
spawn(function()
    while wait(.1) do
        if _G.Melee then
            pcall(function()
                local args = {
                    [1] = "AddPoint",
                    [2] = "Melee",
                    [3] = PointStats
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end)
        end
    end
end)
spawn(function()
    while wait(.1) do
        if _G.Defense then
            pcall(function()
                local args = {
                    [1] = "AddPoint",
                    [2] = "Defense",
                    [3] = PointStats
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end)
        end
    end
end)
spawn(function()
    while wait(.1) do
        if _G.Gun then
            pcall(function()
                local args = {
                    [1] = "AddPoint",
                    [2] = "Gun",
                    [3] = PointStats
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end)
        end
    end
end)
spawn(function()
    while wait(.1) do
        if _G.Sword then
            pcall(function()
                local args = {
                    [1] = "AddPoint",
                    [2] = "Sword",
                    [3] = PointStats
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end)
        end
    end
end)
spawn(function()
    while wait(.1) do
        if _G.Fruit then
            pcall(function()
                local args = {
                    [1] = "AddPoint",
                    [2] = "Demon Fruit",
                    [3] = PointStats
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end)
        end
    end
end)


players = {}

for i,v in pairs(game:GetService("Players"):GetChildren()) do
    table.insert(players,v.Name)
end







Tab4:Dropdown("Select/Players", players, function(abc)
    _G.SelectP = abc
end)


Tab4:Button("Refesh Player",function()
    table.clear(players)
for i,v in pairs(game:GetService("Players"):GetChildren()) do
   table.insert(players,v.Name)
end
end)   

Tab4:Line()

Tab4:Button("Teleport to Player",function()
    Distance = (game.Players[_G.SelectP].Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude -- จุดที่จะไป Position Only
    Speed = 150 -- ความเร็วของมึง
    tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)
    tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = game.Players[_G.SelectP].Character.HumanoidRootPart.CFrame})
    tween:Play()
    _G.Clip = true
    wait(Distance/Speed)
    _G.Clip = false
end)


Tab4:Toggle("Spectate Player",false,function(bool)
    Sp = bool
    local plr1 = game.Players.LocalPlayer.Character.Humanoid
    local plr2 = game.Players:FindFirstChild(_G.SelectP)
    repeat wait(.1)
        game.Workspace.Camera.CameraSubject = plr2.Character.Humanoid
    until Sp == false 
    game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
end)

Tab5:Button("First Sea",function()
    local args = {
        [1] = "TravelMain" -- OLD WORLD to NEW WORLD made by Nino_exe
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)
    Tab5:Button("Second Sea",function()
    local args = {
        [1] = "TravelDressrosa" -- NEW WORLD to OLD WORLD made by Nino_exe
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)
    Tab5:Button("Third Sea",function()
    local args = {
        [1] = "TravelZou" -- Tp to third sea by Nino_exe
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)


Tab5:Button("Teleport to SeaBeatsts",function()
    for i,v in pairs(game.Workspace.SeaBeasts:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,100,0)
        end
    end
end)

Tab5:Line()







if First_World then

	Tab5:Button("Start lsland",function()
		TP(Vector3.new(913.00811767578, 16.51661491394, 1426.8312988281),CFrame.new(913.00811767578, 16.51661491394, 1426.8312988281))
	end)

	Tab5:Button("Marine Start",function()
		TP(Vector3.new(-2538.8186035156, 6.8556709289551, 2041.4378662109),CFrame.new(-2538.8186035156, 6.8556709289551, 2041.4378662109))
	end)

	Tab5:Button("Middle Town",function()
		TP(Vector3.new(-656.02801513672, 7.8522319793701, 1576.12890625),CFrame.new(-656.02801513672, 7.8522319793701, 1576.12890625))
	end)

	Tab5:Button("Jungle",function()
		TP(Vector3.new(-1323.1574707031, 11.853185653687, 499.8410949707),CFrame.new(-1323.1574707031, 11.853185653687, 499.8410949707))
	end)

	Tab5:Button("Pirate Village",function()
		TP(Vector3.new(-1163.6958007813, 4.7520518302917, 3807.4201660156),CFrame.new(-1163.6958007813, 4.7520518302917, 3807.4201660156))
	end)

	Tab5:Button("Desert",function()
		TP(Vector3.new(902.65106201172, 3.3937797546387, 4116.853515625),CFrame.new(902.65106201172, 3.3937797546387, 4116.853515625))
	end)

	Tab5:Button("Frozen Village",function()
		TP(Vector3.new(1109.7423095703, 7.303599357605, -1159.4165039063),CFrame.new(1109.7423095703, 7.303599357605, -1159.4165039063))
	end)

	Tab5:Button("MarineFord",function()
		TP(Vector3.new(-4997.8090820313, 20.652038574219, 4315.8168945313),CFrame.new(-4997.8090820313, 20.652038574219, 4315.8168945313))
	end)

	Tab5:Button("Colosseum",function()
		TP(Vector3.new(-1400.4593505859, 7.289125919342, -2824.9514160156),CFrame.new(-1400.4593505859, 7.289125919342, -2824.9514160156))
	end)

	Tab5:Button("Sky 1st Floor",function()
		TP(Vector3.new(-4921.875, 717.68664550781, -2621.3881835938),CFrame.new(-4921.875, 717.68664550781, -2621.3881835938))
	end)

	Tab5:Button("Sky 2st Floor",function()
		TP(Vector3.new(-4741.9560546875, 844.27716064453, -1970.5590820313),CFrame.new(-4741.9560546875, 844.27716064453, -1970.5590820313))
	end)

	Tab5:Button("Sky 3st Floor",function()
		TP(Vector3.new(-7881.6787109375, 5545.5278320313, -352.81063842773),CFrame.new(-7881.6787109375, 5545.5278320313, -352.81063842773))
	end)

	Tab5:Button("Prison",function()
		TP(Vector3.new(4854.6298828125, 5.652172088623, 734.31909179688),CFrame.new(4854.6298828125, 5.652172088623, 734.31909179688))
	end)

	Tab5:Button("Magma Village",function()
		TP(Vector3.new(-5218.4506835938, 8.5904512405396, 8459.55859375),CFrame.new(-5218.4506835938, 8.5904512405396, 8459.55859375))
	end)

	Tab5:Button("UndeyWater City",function()
		TP(Vector3.new(3862.7133789063, 5.3731489181519, -1914.9368896484),CFrame.new(3862.7133789063, 5.3731489181519, -1914.9368896484))
	end)

	Tab5:Button("Fountain City",function()
		TP(Vector3.new(5182.5512695313, 38.501140594482, 4131.5986328125),CFrame.new(5182.5512695313, 38.501140594482, 4131.5986328125))
	end)

	Tab5:Button("Mob lsland",function()
		TP(Vector3.new(-2843.2143554688, 7.3922481536865, 5340.787109375),CFrame.new(-2843.2143554688, 7.3922481536865, 5340.787109375))
	end)

elseif Second_World then

	Tab5:Button("First Spot",function()
		TP(Vector3.new(-15.968032836914, 29.276802062988, 2778.4587402344),CFrame.new(-15.968032836914, 29.276802062988, 2778.4587402344))
	end)

	Tab5:Button("Cafe",function()
		TP(Vector3.new(-383.54037475586, 73.020164489746, 292.15808105469),CFrame.new(-383.54037475586, 73.020164489746, 292.15808105469))
	end)

	Tab5:Button("Flamingo Mansion",function()
		TP(Vector3.new(-341.21893310547, 331.86071777344, 655.52770996094),CFrame.new(-341.21893310547, 331.86071777344, 655.52770996094))
	end)

	Tab5:Button("Flamingo Room",function()
		TP(Vector3.new(2286.8090820313, 15.152108192444, 810.17022705078),CFrame.new(2286.8090820313, 15.152108192444, 810.17022705078))
	end)

	Tab5:Button("Dark Ares",function()
		TP(Vector3.new(3621.9033203125, 13.349418640137, -3345.3859863281),CFrame.new(3621.9033203125, 13.349418640137, -3345.3859863281))
	end)

	Tab5:Button("Green bit",function()
		TP(Vector3.new(-2208.3815917969, 72.966209411621, -2724.0458984375),CFrame.new(-2208.3815917969, 72.966209411621, -2724.0458984375))
	end)

	Tab5:Button("Factroy",function()
		TP(Vector3.new(406.11721801758, 186.41944885254, -409.95733642578),CFrame.new(406.11721801758, 186.41944885254, -409.95733642578))
	end)

	Tab5:Button("Colsseum",function()
		TP(Vector3.new(-1831.3973388672, 45.794780731201, 1343.7779541016),CFrame.new(-1831.3973388672, 45.794780731201, 1343.7779541016))
	end)

	Tab5:Button("Ghost lsland",function()
		TP(Vector3.new(-5584.7553710938, 235.83395385742, -719.38653564453),CFrame.new(-5584.7553710938, 235.83395385742, -719.38653564453))
	end)

	Tab5:Button("Ghost lsland 2nd",function()
		TP(Vector3.new(-5951.60546875, 6.4027719497681, -1228.2615966797),CFrame.new(-5951.60546875, 6.4027719497681, -1228.2615966797))
	end)

	Tab5:Button("Snow Mountain",function()
		TP(Vector3.new(408.20986938477, 401.42208862305, -5325.58203125),CFrame.new(408.20986938477, 401.42208862305, -5325.58203125))
	end)

	Tab5:Button("Hot and Cold",function()
		TP(Vector3.new(-5874.16796875, 15.953011512756, -5016.3374023438),CFrame.new(-5874.16796875, 15.953011512756, -5016.3374023438))
	end)

	Tab5:Button("Magma Side",function()
		TP(Vector3.new(-5496.7919921875, 15.951955795288, -5116.1181640625),CFrame.new(-5496.7919921875, 15.951955795288, -5116.1181640625))
	end)

	Tab5:Button("Cursed Ship",function()
		local args = {
            [1] = "GetUnlockables"
        }
        
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        
        
        local args = {
            [1] = "requestEntrance",
            [2] = Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
        }
        
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))        
	end)

    Tab5:Button("Cursed Ship 2nd",function()
		local args = {
            [1] = "GetUnlockables"
        }
        
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        
        
        local args = {
            [1] = "requestEntrance",
            [2] = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125)
        }
        
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)

	Tab5:Button("Frosted lsland",function()
		TP(Vector3.new(5550.5283203125, 28.190727233887, -6126.408203125),CFrame.new(5550.5283203125, 28.190727233887, -6126.408203125))
	end)

	Tab5:Button("Forgotten lsland",function()
		TP(Vector3.new(-3050.9008789063, 238.84631347656, -10178.013671875),CFrame.new(-3050.9008789063, 238.84631347656, -10178.013671875))
	end)

	Tab5:Button("Usoapp lsland",function()
		TP(Vector3.new(4734.6948242188, 8.150782585144, 2888.1411132813),CFrame.new(4734.6948242188, 8.150782585144, 2888.1411132813))
	end)
elseif Third_World then

	Tab5:Button("Port Town",function()
        TP(Vector3.new(-291.60256958008, 43.86499786377, 5459.919921875),CFrame.new(-291.60256958008, 43.86499786377, 5459.919921875))
    end)
    Tab5:Button("Hydar Island",function()
        TP(Vector3.new(5436.98046875, 601.57604980469, 767.82757568359),CFrame.new(5436.98046875, 601.57604980469, 767.82757568359))
    end)
    Tab5:Button("Great Tree",function()
        TP(Vector3.new(2251.9440917969, 25.85277557373, -6415.7651367188),CFrame.new(2251.9440917969, 25.85277557373, -6415.7651367188))
    end)
    Tab5:Button("Floating Turtle",function()
        TP(Vector3.new(-10603.2890625, 331.76278686523, -8747.3466796875),CFrame.new(-10603.2890625, 331.76278686523, -8747.3466796875))
    end)
    Tab5:Button("Castle on the Sea",function()
        TP(Vector3.new(-4982.5913085938, 314.51559448242, -3017.0119628906),CFrame.new(-4982.5913085938, 314.51559448242, -3017.0119628906))
    end)
    Tab5:Button("Mansion",function()
        TP(Vector3.new(-12551.794921875, 337.16836547852, -7541.5478515625),CFrame.new(-12551.794921875, 337.16836547852, -7541.5478515625))
    end)
    Tab5:Button("Haunted Castle",function()
        TP(Vector3.new(-9519.708984375, 142.10493469238, 5495.5805664063),CFrame.new(-9519.708984375, 142.10493469238, 5495.5805664063))
    end)
    Tab5:Button("Uzoth",function()
        TP(Vector3.new(-9792.06738, 851.815735, 6666.17383, 0.185018286, -1.19744541e-07, -0.982735097, 1.75790031e-08, 1, -1.18538665e-07, 0.982735097, 4.65631844e-09, 0.185018286),CFrame.new(-9792.06738, 851.815735, 6666.17383, 0.185018286, -1.19744541e-07, -0.982735097, 1.75790031e-08, 1, -1.18538665e-07, 0.982735097, 4.65631844e-09, 0.185018286),CFrame.new(-9792.06738, 851.815735, 6666.17383, 0.185018286, -1.19744541e-07, -0.982735097, 1.75790031e-08, 1, -1.18538665e-07, 0.982735097, 4.65631844e-09, 0.185018286),CFrame.new(-9792.06738, 851.815735, 6666.17383, 0.185018286, -1.19744541e-07, -0.982735097, 1.75790031e-08, 1, -1.18538665e-07, 0.982735097, 4.65631844e-09, 0.185018286))
    end)
end


Tab6:Button("Geppo ",function()
    local args = {
        [1] = "BuyHaki",
        [2] = "Geppo"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Tab6:Button("Buso Haki",function()
    local args = {
        [1] = "BuyHaki",
        [2] = "Buso"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Tab6:Button("Ken Haki",function()
    local args = {
        [1] = "KenTalk",
        [2] = "Buy"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Tab6:Button("Soru",function()
    local args = {
        [1] = "BuyHaki",
        [2] = "Soru"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Tab6:Line()
Tab6:Label("Fighting Style")

Tab6:Button("Black Leg",function()
    local args = {
        [1] = "BuyBlackLeg"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Tab6:Button("Electro",function()
    local args = {
        [1] = "BuyElectro"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Tab6:Button("Fishman Karate",function()
    local args = {
        [1] = "BuyFishmanKarate"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Tab6:Button("Dragon Claw",function()
    local args = {
        [1] = "BlackbeardReward",
        [2] = "DragonClaw",
        [3] = "1"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {
        [1] = "BlackbeardReward",
        [2] = "DragonClaw",
        [3] = "2"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Tab6:Button("Superhuman",function()
    local args = {
        [1] = "BuySuperhuman"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Tab6:Button("Death Step",function()
    local args = {
        [1] = "BuyDeathStep"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Tab6:Button("Sharkman Karate",function()
    local args = {
        [1] = "BuySharkmanKarate",
        [2] = true
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {
        [1] = "BuySharkmanKarate"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Tab6:Button("Electric Claw",function()
    local args = {
        [1] = "BuyElectricClaw"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Tab6:Button("DragonTalon",function()
    local args = {
        [1] = "BuyDragonTalon"
    }
    
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Tab6:Line()
Tab6:Label(" Sword ")

Tab6:Button("Bisento",function()

    local args = {
        [1] = "BuyItem",
        [2] = "Bisento"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Tab6:Button("Dual-Headed Blade",function()
    local args = {
        [1] = "BuyItem",
        [2] = "Dual-Headed Blade"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Tab6:Button("Soul Cane",function()

    local args = {
        [1] = "BuyItem",
        [2] = "Soul Cane"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Tab6:Button("Triple Katana",function()

    local args = {
        [1] = "BuyItem",
        [2] = "Triple Katana"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Tab6:Button("Pipe",function()

    local args = {
        [1] = "BuyItem",
        [2] = "Pipe"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Tab6:Button("Dual Katana",function()

    local args = {
        [1] = "BuyItem",
        [2] = "Dual Katana"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Tab6:Button("Iron Mace",function()
    -- Script generated by SimpleSpy - credits to exx#9394

    local args = {
        [1] = "BuyItem",
        [2] = "Iron Mace"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Tab6:Line()
Tab6:Label(" Accessories ")

Tab6:Button("Black Cape",function()

    local args = {
        [1] = "BuyItem",
        [2] = "Black Cape"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Tab6:Button("Swordsman Hat",function()

    local args = {
        [1] = "BuyItem",
        [2] = "Swordsman Hat"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Tab6:Button("Tomoe Ring",function()

    local args = {
        [1] = "BuyItem",
        [2] = "Tomoe Ring"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Tab6:Line()
Tab6:Label(" Ectoplasm ")

Tab6:Button("Race Ghoul",function()
    local args = {
        [1] = "Ectoplasm",
        [2] = "BuyCheck",
        [3] = 4
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {
        [1] = "Ectoplasm",
        [2] = "Change",
        [3] = 4
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Tab6:Button("Race Cyborg",function()
    local args = {
        [1] = "CyborgTrainer",
        [2] = "Buy"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Tab6:Line()
Tab6:Label(" Fragment ")
Tab6:Button("Random Race",function()
    local args = {
        [1] = "BlackbeardReward",
        [2] = "Reroll",
        [3] = "2"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Tab6:Button("Reset Stats",function()
    local args = {
        [1] = "BlackbeardReward",
        [2] = "Refund",
        [3] = "2"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)



Tab6:Button("Microchip [ Raw ]",function()
    local args = {
        [1] = "BlackbeardReward",
        [2] = "Microchip",
        [3] = "2"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Tab6:Line()
Tab6:Label(" Gun ")

Tab6:Button("Slingshot",function()
    local args = {
        [1] = "BuyItem",
        [2] = "Slingshot"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Tab6:Button("Musket",function()
    local args = {
        [1] = "BuyItem",
        [2] = "Musket"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Tab6:Button("Refined Slingshot",function()

    local args = {
        [1] = "BuyItem",
        [2] = "Refined Slingshot"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)


Tab6:Button("Cannon",function()
    local args = {
        [1] = "BuyItem",
        [2] = "Cannon"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)


Tab6:Button("Bizarre Rifle",function()
    local args = {
        [1] = "Ectoplasm",
        [2] = "Buy",
        [3] = 1
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Tab7:Toggle("Kill Aura", false, function(v)
    _G.KILLALL = v
end)

spawn(function()
    while wait() do
        if _G.KILLALL then
            for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                    pcall(function()
                        repeat wait()
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            v.Humanoid.Health = 0
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(80,80,80)
                            v.HumanoidRootPart.Transparency = 1
                        until not _G.KILLALL or not v.Parent or v.Humanoid.Health <= 0
                    end)
                end
            end
        end
    end
end)


Tab7:Toggle("Auto Next Island",false,function(value)
    NextIsland = value
end)
Tab7:Toggle("Auto Awake",false,function(value)
    Awakener = value
end)
if Second_World then
    Tab7:Button("Teleport to Lab",function()
        game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
        Lab2 = Vector3.new(-6438.73535, 250.645355, -4501.50684)
        local Distance = (Lab2 - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude -- จุดที่จะไป Position Only
        local Speed = 150 -- ความเร็วของมึง
        tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)
        tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-6438.73535, 250.645355, -4501.50684)})
        tween:Play()
        _G.Clip = true
        wait(Distance/Speed)
        _G.Clip = false
    end)
end
if Third_World then
    Tab7:Button("Teleport to Lab",function()
        game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
        Lab3 = Vector3.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 4.48217499e-08, -0.378151238, 4.55503146e-09, 1, 1.07377559e-07, 0.378151238, 9.7681621e-08, -0.925743818)
        local Distance = (Lab3 - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude -- จุดที่จะไป Position Only
        local Speed = 150 -- ความเร็วของมึง
        tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)
        tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 4.48217499e-08, -0.378151238, 4.55503146e-09, 1, 1.07377559e-07, 0.378151238, 9.7681621e-08, -0.925743818)})
        tween:Play()
        _G.Clip = true
        wait(Distance/Speed)
        _G.Clip = false
    end)
end

Tab7:Button("Awakening Room",function()
    game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
        Lab1 = Vector3.new(266.227783, 1.39509034, 1857.00732)
        local Distance = (Lab1 - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude -- จุดที่จะไป Position Only
        local Speed = 150 -- ความเร็วของมึง
        tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)
        tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(266.227783, 1.39509034, 1857.00732)})
        tween:Play()
        _G.Clip = true
        wait(Distance/Speed)
        _G.Clip = false
end)

Tab7:Line()

Tab7:Dropdown("Select/Raids", {"Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Budha"}, function(text)
    _G.Select = text
end)

Tab7:Toggle("Auto Buy", false, function(bu)

        _G.AB = bu
end)
            

  spawn(function()
pcall(function()
    while wait() do 
    if _G.AB then
    
    
            local args = {
                [1] = "RaidsNpc",
                [2] = "Select",
                [3] = _G.Select
            }
            
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)
end)



spawn(function()
    while wait(.1) do
        if Awakener then
            local args = {
                [1] = "Awakener",
                [2] = "Check"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            local args = {
                [1] = "Awakener",
                [2] = "Awaken"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if NextIsland then
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
    end
end)

Tab7:Button("Start Raid",function(at)
fireclickdetector(game.Workspace.Map.CircleIsland:FindFirstChild("RaidSummon2").Button.Main.ClickDetector)
end)



spawn(function()
    while wait(.1) do
        if NextIsland then
            game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
            if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
                Distance = (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude -- จุดที่จะไป Position Only
                Speed = 150 -- ความเร็วของมึง
                tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)
                tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame*CFrame.new(0,20,0)})
                tween:Play()
            elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
                Distance = (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude -- จุดที่จะไป Position Only
                Speed = 150 -- ความเร็วของมึง
                tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)
                tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame*CFrame.new(0,20,0)})
                tween:Play()
            elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
                Distance = (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude -- จุดที่จะไป Position Only
                Speed = 150 -- ความเร็วของมึง
                tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)
                tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame*CFrame.new(0,20,0)})
                tween:Play()
            elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
                Distance = (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude -- จุดที่จะไป Position Only
                Speed = 150 -- ความเร็วของมึง
                tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)
                tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame*CFrame.new(0,20,0)})
                tween:Play()
            elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
                Distance = (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude -- จุดที่จะไป Position Only
                Speed = 150 -- ความเร็วของมึง
                tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)
                tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame*CFrame.new(0,20,0)})
                tween:Play()
            else
                if Second_World then                        
                        game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
                        Lab2 = Vector3.new(-6438.73535, 250.645355, -4501.50684)
                        local Distance = (Lab2 - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude -- จุดที่จะไป Position Only
                        local Speed = 150 -- ความเร็วของมึง
                        tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)
                        tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-6438.73535, 250.645355, -4501.50684)})
                        tween:Play()
                        _G.Clip = true
                        wait(Distance/Speed)
                        _G.Clip = false                        
                end
                if Third_World then                        
                        game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
                        Lab3 = Vector3.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 4.48217499e-08, -0.378151238, 4.55503146e-09, 1, 1.07377559e-07, 0.378151238, 9.7681621e-08, -0.925743818)
                        local Distance = (Lab3 - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude -- จุดที่จะไป Position Only
                        local Speed = 150 -- ความเร็วของมึง
                        tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)
                        tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 4.48217499e-08, -0.378151238, 4.55503146e-09, 1, 1.07377559e-07, 0.378151238, 9.7681621e-08, -0.925743818)})
                        tween:Play()
                        _G.Clip = true
                        wait(Distance/Speed)
                        _G.Clip = false                        
                end
            end
        end
    end
end)


Tab8:Button("Random Fruit",function()
    local args = {
        [1] = "Cousin",
        [2] = "Buy"
    }
    
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)


Tab8:Toggle("Auto Random Fruit",false,function(ff)
    _G.RF = ff
end)


spawn(function()
    while wait() do
        if _G.RF then
            local args = {
                [1] = "Cousin",
                [2] = "Buy"
            }
            
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)

Tab8:Toggle("TP to Fruit [Beta]",false,function(ff)
    _G.BRING = ff
end)


spawn(function()
    while wait() do
        if _G.BRING then
            pcall(function()
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if string.find(v.Name, "Fruit") then
                        local OF = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        if (v.Handle.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 450 then
                            v.Handle.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
                        else 
                            Distance = (v.Handle.CFrame - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude -- จุดที่จะไป Position Only
                            Speed = 150 -- ความเร็วของมึง
                            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)
                            tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = v.Handle.CFrame*CFrame.new(20,0,9)})
                            tween:Play()
                            _G.Clip = true
                            wait(Distance/Speed)
                            _G.Clip = false                            
                            wait(.8)
                            Distance = (v.Handle.CFrame - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude -- จุดที่จะไป Position Only
                            Speed = 150 -- ความเร็วของมึง
                            tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear)
                            tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = v.Handle.CFrame})
                            tween:Play()
                            wait(.8)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OF
                        end
                    end
                end
            end)
        end
    end
end)


Tab8:Line()

Tab8:Button("Join Pirates Team",function()
		local args = {
			[1] = "SetTeam",
			[2] = "Pirates"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
		local args = {
			[1] = "BartiloQuestProgress"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		local args = {
			[1] = "Buso"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	Tab8:Button("Join Marines Team",function()
		local args = {
			[1] = "SetTeam",
			[2] = "Marines"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		local args = {
			[1] = "BartiloQuestProgress"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		local args = {
			[1] = "Buso"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	Tab8:Button("Open Devil Shop",function()
		local args = {
			[1] = "GetFruits"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		game.Players.localPlayer.PlayerGui.Main.FruitShop.Visible = true
	end)
	Tab8:Button("Open Inventory",function()
		local args = {
			[1] = "getInventoryWeapons"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		wait(1)
		game.Players.localPlayer.PlayerGui.Main.Inventory.Visible = true
	end)
	Tab8:Button("Invisible[Risk]",function()
		game.Players.LocalPlayer.Character.LowerTorso:Destroy()
	end)

    Tab8:Button("Delete Name[Observation]",function(DE)
		_G.DN = DE
	end)


    Tab8:Button("FPS Boost",function(t)
		local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
		local g = game
		local w = g.Workspace
		local l = g.Lighting
		local t = w.Terrain
		t.WaterWaveSize = 0
		t.WaterWaveSpeed = 0
		t.WaterReflectance = 0
		t.WaterTransparency = 0
		l.GlobalShadows = false
		l.FogEnd = 9e9
		l.Brightness = 0
		settings().Rendering.QualityLevel = "Level01"
		for i, v in pairs(g:GetDescendants()) do
			if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then 
				v.Material = "Plastic"
				v.Reflectance = 0
			elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
				v.Transparency = 1
			elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
				v.Lifetime = NumberRange.new(0)
			elseif v:IsA("Explosion") then
				v.BlastPressure = 1
				v.BlastRadius = 1
			elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
				v.Enabled = false
			elseif v:IsA("MeshPart") then
				v.Material = "Plastic"
				v.Reflectance = 0
				v.TextureID = 10385902758728957
			end
		end
		for i, e in pairs(l:GetChildren()) do
			if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
				e.Enabled = false
			end
		end
	end)


	Tab8:Button("Teleport To Lower Server",function()
		local maxplayers, gamelink, goodserver, data_table = math.huge, "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
		if not _G.FailedServerID then _G.FailedServerID = {} end

		local function serversearch()
			data_table = game:GetService"HttpService":JSONDecode(game:HttpGetAsync(gamelink))
			for _, v in pairs(data_table.data) do
				pcall(function()
					if type(v) == "table" and v.id and v.playing and tonumber(maxplayers) > tonumber(v.playing) and not table.find(_G.FailedServerID, v.id) then
						maxplayers = v.playing
						goodserver = v.id
					end
				end)
			end
		end

		function getservers()
			pcall(serversearch)
			for i, v in pairs(data_table) do
				if i == "nextPageCursor" then
					if gamelink:find"&cursor=" then
						local a = gamelink:find"&cursor="
						local b = gamelink:sub(a)
						gamelink = gamelink:gsub(b, "")
					end
					gamelink = gamelink .. "&cursor=" .. v
					pcall(getservers)
				end
			end
		end

		pcall(getservers)
		wait()
		if goodserver == game.JobId or maxplayers == #game:GetService"Players":GetChildren() - 1 then
		end
		table.insert(_G.FailedServerID, goodserver)
		game:GetService"TeleportService":TeleportToPlaceInstance(game.PlaceId, goodserver)
	end)

    Tab8:Button("Rejoin",function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end)




    Tab8:Line()


    Tab8:Toggle("Walk on Water",false,function(Value)
		_G.WalkWater = Value
		if _G.WalkWater == true then
			game.Players.LocalPlayer.Data.DevilFruit.Value = ("Ice-Ice")
		elseif _G.WalkWater == false then
			game.Players.LocalPlayer.Data.DevilFruit.Value = ("")
		end
	end)


    Tab8:Toggle("ESP Player",false,function(Value)
    PlayerESP = Value
	while PlayerESP do wait()
		UpdatePlayer()
	end
end)
Tab8:Toggle("ESP Chest",false,function(Value)
    ChestESP = Value
	while ChestESP do wait()
        UpdateChest()
    end
end)
Tab8:Toggle("ESP Devil Fruit",false,function(Value)
    DevilESP = Value
	while DevilESP do wait()
		UpdateDevilFruit()
	end
end)

Tab8:Toggle("ESP Flower",false,function(Value)
		FlowerESP = Value
		while FlowerESP do wait()
			UpdateFlower()
        end
    end)

    Number = math.random(1,1000000)

function UpdateChest()
	for i,v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if string.find(v.Name, "Chest") then
				if ChestESP then
					if string.find(v.Name, "Chest") and (v.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 60000 then
						if not v:FindFirstChild("ChestESP"..Number) then
							local Bb = Instance.new("BillboardGui", v)
							Bb.Name = "ChestESP"..Number
							Bb.ExtentsOffset = Vector3.new(0, 1, 0)
							Bb.Size = UDim2.new(1, 200, 1, 30)
							Bb.Adornee = v
							Bb.AlwaysOnTop = true
							local Textlb = Instance.new("TextLabel", Bb)
							Textlb.Font = "GothamBold"
							Textlb.FontSize = "Size14"
							Textlb.Size = UDim2.new(1,0,1,0)
							Textlb.BackgroundTransparency = 1
							Textlb.TextStrokeTransparency = 0.5
							if v.Name == "Chest1" then
								Textlb.TextColor3 = Color3.fromRGB(174, 123, 47)
								Textlb.Text = "Bronze Chest".."\n"..math.round((v.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude/3).." m."
							end
							if v.Name == "Chest2" then
								Textlb.TextColor3 = Color3.fromRGB(255, 255, 127)
								Textlb.Text = "Gold Chest".."\n"..math.round((v.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude/3).." m."
							end
							if v.Name == "Chest3" then
								Textlb.Text = "Diamond Chest".."\n"..math.round((v.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude/3).." m."
								Textlb.TextColor3 = Color3.fromRGB(5, 243, 255)
							end
						else
							v["ChestESP"..Number].TextLabel.Text = v.Name.."\n"..math.round((v.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude/3).." m."
						end
					end
				else
					if v:FindFirstChild("ChestESP"..Number) then
						v:FindFirstChild("ChestESP"..Number):Destroy()
					end
				end
			end
		end)
	end
end

function UpdatePlayer()
	for i,v in pairs(game:GetService("Players"):GetChildren()) do
		pcall(function()
			if v.Character then
				if PlayerESP then
					if v.Character.Head and not v.Character.Head:FindFirstChild("PlayerESP"..Number) then
						local Bb = Instance.new("BillboardGui", v.Character.Head)
						Bb.Name = "PlayerESP"..Number
						Bb.ExtentsOffset = Vector3.new(0, 1, 0)
						Bb.Size = UDim2.new(1, 200, 1, 30)
						Bb.Adornee = v.Character.Head
						Bb.AlwaysOnTop = true
						local Textlb = Instance.new("TextLabel", Bb)
						Textlb.Font = "GothamBold"
						Textlb.FontSize = "Size14"
						Textlb.Text = v.Name.."\n"..math.round((v.Character.Head.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude/3).." m."
						Textlb.Size = UDim2.new(1,0,1,0)
						Textlb.BackgroundTransparency = 1
						Textlb.TextStrokeTransparency = 0.5
						if v.Team == game:GetService("Players").LocalPlayer.Team then
							Textlb.TextColor3 = Color3.new(0, 255, 0)
						else
							Textlb.TextColor3 = Color3.new(0, 0, 204)
						end
					else
						v.Character.Head["PlayerESP"..Number].TextLabel.Text = v.Name.."\n"..math.round((v.Character.Head.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude/3).." m."
					end
				else
					if v.Character.Head:FindFirstChild("PlayerESP"..Number) then
						v.Character.Head:FindFirstChild("PlayerESP"..Number):Destroy()
					end
				end
			end
		end)
	end
end

function UpdateDevilFruit()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		pcall(function()
			if string.find(v.Name, "Fruit") then
				if DevilESP then
					if string.find(v.Name, "Fruit") then
						if not v.Handle:FindFirstChild("DevilESP"..Number) then
							local Bb = Instance.new("BillboardGui", v.Handle)
							Bb.Name = "DevilESP"..Number
							Bb.ExtentsOffset = Vector3.new(0, 1, 0)
							Bb.Size = UDim2.new(1, 200, 1, 30)
							Bb.Adornee = v.Handle
							Bb.AlwaysOnTop = true
							local Textlb = Instance.new("TextLabel", Bb)
							Textlb.Font = "GothamBold"
							Textlb.FontSize = "Size14"
							Textlb.Size = UDim2.new(1,0,1,0)
							Textlb.BackgroundTransparency = 1
							Textlb.TextStrokeTransparency = 0.5
							Textlb.Text = v.Name.."\n"..math.round((v.Handle.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude/3).." m."
							Textlb.TextColor3 = Color3.new(255, 255, 255)
						else
							v.Handle["DevilESP"..Number].TextLabel.Text = v.Name.."\n"..math.round((v.Handle.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude/3).." m."
						end
					end
				else
					if v.Handle:FindFirstChild("DevilESP"..Number) then
						v.Handle:FindFirstChild("DevilESP"..Number):Destroy()
					end
				end
			end
		end)
	end
end

function UpdateFlower()
	for i,v in pairs(game.Workspace:GetChildren()) do
		pcall(function()
			if v.Name == "Flower2" or v.Name == "Flower1" then
				if FlowerESP then
					if not v:FindFirstChild("FindFlower"..Number) then
						local bill = Instance.new("BillboardGui",v)
						bill.Name = "FindFlower"..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v
						bill.AlwaysOnTop = true
						local name = Instance.new("TextLabel",bill)
						name.Font = "GothamBold"
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = "Top"
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						name.TextColor3 = Color3.fromRGB(248, 41, 41)
						if v.Name == "Flower1" then
							name.Text = ("Blue Flower".."\n"..math.round((v.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude/3).." m.")
							name.TextColor3 = Color3.fromRGB(28, 126, 255)
						end
						if v.Name == "Flower2" then
							name.Text = ("Red Flower".."\n"..math.round((v.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude/3).." m.")
							name.TextColor3 = Color3.fromRGB(248, 41, 41)
						end
					else
						v["FindFlower"..Number].TextLabel.Text = (v.Name.."\n"..math.round((v.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude/3).." m.")
					end
				else
					if v:FindFirstChild("FindFlower"..Number) then
						v:FindFirstChild("FindFlower"..Number):Destroy()
					end
				end
			end
		end)
	end
end

function UpdateFruits()
	for i,v in pairs(game.Workspace:GetChildren()) do
	    pcall(function()
			if v.Name == "Banana" or v.Name == "Apple" or v.Name == "Pineapple" then
				if FindFruits then
					if not v:FindFirstChild("FindFruit"..Number) then
						local bill = Instance.new("BillboardGui",v)
						bill.Name = "FindFruit"..Number
						bill.ExtentsOffset = Vector3.new(0, 1, 0)
						bill.Size = UDim2.new(1,200,1,30)
						bill.Adornee = v
						bill.AlwaysOnTop = true
						local name = Instance.new("TextLabel",bill)
						name.Font = "GothamBold"
						name.FontSize = "Size14"
						name.TextWrapped = true
						name.Size = UDim2.new(1,0,1,0)
						name.TextYAlignment = "Top"
						name.BackgroundTransparency = 1
						name.TextStrokeTransparency = 0.5
						if v.Name == "Banana" then
							name.Text = ("Banana".."\n"..math.round((v.Handle.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude/3).." m.")
							name.TextColor3 = Color3.fromRGB(255, 255, 0)
						end
						if v.Name == "Apple" then
							name.Text = ("Apple".."\n"..math.round((v.Handle.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude/3).." m.")
							name.TextColor3 = Color3.fromRGB(208, 0, 0)
						end
						if v.Name == "PineApple" then
						    name.Text = ("PineApple".."\n"..math.round((v.Handle.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude/3).." m.")
							name.TextColor3 = Color3.fromRGB(255, 128, 0)
						end
					else
						v["FindFruit"..Number].TextLabel.Text = (v.Name.."\n"..math.round((v.Handel.Position - game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position).Magnitude/3).." m.")
					end
				else
					if v:FindFirstChild("FindFruit"..Number) then
						v:FindFirstChild("FindFruit"..Number):Destroy()
					end
				end
			end
		end)
	end
end

Tab9:Toggle("Anit AFK",true,function(vu)
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)


	local ScreenGui = Instance.new("ScreenGui")
	local TextLabel = Instance.new("TextLabel")
	local UIGradient = Instance.new("UIGradient")

	ScreenGui.Parent = game.CoreGui
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	TextLabel.Parent = ScreenGui
	TextLabel.Active = true
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.Position = UDim2.new(0.424812019, 0, 0, 0)
	TextLabel.Size = UDim2.new(0, 200, 0, 50)
	TextLabel.Font = Enum.Font.GothamBold
	TextLabel.Text = "Server Time"
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 25.000
	TextLabel.TextTransparency = 1
	TextLabel.TextStrokeTransparency = 300.000

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(204, 255, 69)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(150, 240, 69)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(204, 255, 69))}
	UIGradient.Parent = TextLabel

	local function UpdateTime()
		local GameTime = math.floor(workspace.DistributedGameTime+0.5)
		local Hour = math.floor(GameTime/(60^2))%24
		local Minute = math.floor(GameTime/(60^1))%60
		local Second = math.floor(GameTime/(60^0))%60
		TextLabel.Text = ("Hour : "..Hour.." Minute : "..Minute.." Second : "..Second)
	end

	spawn(function()
		while true do
			UpdateTime()
			game:GetService("RunService").RenderStepped:Wait()
		end
	end)


    Tab9:Toggle("Server Time",true,function(value)
        ServerTime = value game:GetService("VirtualUser")
        if ServerTime == true then
            TextLabel.TextTransparency = 0
        elseif ServerTime == false then
            TextLabel.TextTransparency = 1
        end
    end)

    Tab9:Toggle("Ctrl + Click = TP",false,function(vu)
        CTRL = vu
    end)
    local Plr = game:GetService("Players").LocalPlayer
    local Mouse = Plr:GetMouse()
    Mouse.Button1Down:connect(
        function()
            if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
                return
            end
            if not Mouse.Target then
                return
            end
            if CTRL then
                Plr.Character:MoveTo(Mouse.Hit.p)
            end
        end
    )
    

    Fly = false  
    function activatefly()
       local mouse=game.Players.LocalPlayer:GetMouse''
       localplayer=game.Players.LocalPlayer
       game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
       local torso = game.Players.LocalPlayer.Character.HumanoidRootPart
       local speedSET=25
       local keys={a=false,d=false,w=false,s=false}
       local e1
       local e2
       local function start()
          local pos = Instance.new("BodyPosition",torso)
          local gyro = Instance.new("BodyGyro",torso)
          pos.Name="EPIXPOS"
          pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
          pos.position = torso.Position
          gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
          gyro.cframe = torso.CFrame
          repeat
                wait()
                localplayer.Character.Humanoid.PlatformStand=true
                local new=gyro.cframe - gyro.cframe.p + pos.position
                if not keys.w and not keys.s and not keys.a and not keys.d then
                   speed=1
                end
                if keys.w then
                   new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                   speed=speed+speedSET
                end
                if keys.s then
                   new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                   speed=speed+speedSET
                end
                if keys.d then
                   new = new * CFrame.new(speed,0,0)
                   speed=speed+speedSET
                end
                if keys.a then
                   new = new * CFrame.new(-speed,0,0)
                   speed=speed+speedSET
                end
                if speed>speedSET then
                   speed=speedSET
                end
                   pos.position=new.p
                if keys.w then
                   gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*15),0,0)
                elseif keys.s then
                   gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*15),0,0)
                else
                   gyro.cframe = workspace.CurrentCamera.CoordinateFrame
                end
          until not Fly
          if gyro then 
                   gyro:Destroy() 
          end
          if pos then 
                   pos:Destroy() 
          end
          flying=false
          localplayer.Character.Humanoid.PlatformStand=false
          speed=0
       end
       e1=mouse.KeyDown:connect(function(key)
          if not torso or not torso.Parent then 
                flying=false e1:disconnect() e2:disconnect() return 
          end
          if key=="w" then
             keys.w=true
          elseif key=="s" then
             keys.s=true
          elseif key=="a" then
             keys.a=true
          elseif key=="d" then
             keys.d=true
          end
       end)
       e2=mouse.KeyUp:connect(function(key)
          if key=="w" then
             keys.w=false
          elseif key=="s" then
             keys.s=false
          elseif key=="a" then
             keys.a=false
          elseif key=="d" then
             keys.d=false
          end
       end)
       start()
    end
    Tab9:Toggle("Fly", false, function(Value)
       Fly = Value
       activatefly()
    end)


    local LocalPlayer = game:GetService'Players'.LocalPlayer
	local originalstam = LocalPlayer.Character.Energy.Value
	function infinitestam()
		LocalPlayer.Character.Energy.Changed:connect(function()
			if InfinitsEnergy then
				LocalPlayer.Character.Energy.Value = originalstam
			end 
		end)
	end


	spawn(function()
		while wait(.1) do
			if InfinitsEnergy then
				wait(0.3)
				originalstam = LocalPlayer.Character.Energy.Value
				infinitestam()
			end
		end
	end)

    function NoDodgeCool()
		if nododgecool then
			for i,v in next, getgc() do
				if game.Players.LocalPlayer.Character.Dodge then
					if typeof(v) == "function" and getfenv(v).script == game.Players.LocalPlayer.Character.Dodge then
						for i2,v2 in next, getupvalues(v) do
							if tostring(v2) == "0.4" then
								repeat wait(.1)
									setupvalue(v,i2,0)
								until not nododgecool
							end
						end
					end
				end
			end
		end
	end



    Tab9:Toggle("Dodge No Cooldown",false,function(Value)
		nododgecool = Value
		NoDodgeCool()
	end)

    Tab9:Toggle("Infinits Energy",false,function(value)
		InfinitsEnergy = value
		originalstam = LocalPlayer.Character.Energy.Value
	end)


    Tab9:Line()

    Tab9:Button("Redeem All Code",function()

    local args = {
       [1] = "UPD15"
    }
    
    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
    wait(.5)
    local args = {
       [1] = "Sub2OfficialNoobie"
    }
    
    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
    wait(.5)
    local args = {
       [1] = "SUB2GAMERROBOT_EXP1"
    }
    
    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
    wait(.5)
    local args = {
       [1] = "Sub2NoobMaster123"
    }
    
    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
    wait(.5)
    local args = {
       [1] = "Sub2Daigrock"
    }
    
    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
    wait(.5)
    local args = {
       [1] = "Axiore"
    }
    
    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
    wait(.5)
    local args = {
       [1] = "THEGREATACE"
    }
    
    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
    wait(.5)
    local args = {
       [1] = "TantaiGaming"
    }
    
    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
    wait(.5)
    local args = {
       [1] = "StrawHatMaine"
    }

    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
    wait(.5)
    local args = {
       [1] = "2BILLION"
    }

    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
    wait(.5)
    local args = {
       [1] = "UPD16"
    }
    
    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
    end)

    Tab9:Button("Redeem Reset STAT1",function()
        wait(.5)
        local args = {
           [1] = "SUB2GAMERROBOT_RESET1"
        }
        
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
    end)

    Tab9:Button("Redeem Reset STAT2",function()
        wait(.5)
        local args = {
           [1] = "Sub2UncleKizaru"
        }
        
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
    end)

    Tab9:Button("Redeem Reset STAT3",function()
        wait(.5)
        local args = {
           [1] = "THIRDSEA"
        }
        
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
    end)

    Tab9:Button("Redeem Reset STAT4",function()
        wait(.5)
        local args = {
           [1] = "1MLIKES_RESET"
        }
        
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
    end)

    Tab9:Line()

    Tab9:Textbox("Fake Level", "Default",true, function(level)
    game:GetService("Players")["LocalPlayer"].Data.Level.Value = level
end)

Tab9:Textbox("Fake Fragments", "Default",true, function(f)
    game:GetService("Players")["LocalPlayer"].Data.Fragments.Value = f
end)

Tab9:Textbox("Fake Beli", "Default", true,function(m)
    game:GetService("Players")["LocalPlayer"].Data.Beli.Value = m
end)


Tab10:Button("Copy Discord Link", function()
    setclipboard("https://discord.gg/xhCvnysVpB")
    wait(.5)
game.StarterGui:SetCore("SendNotification", {
Title = "Successfully!"; -- the title (ofc)
Text = "You Can Paste Link"; -- what the text says (ofc)
Icon = "rbxassetid://7529398102"; -- the image if u want. 
Duration = 5; -- how long the notification should in secounds
})
end)

Tab10:Button("Youtube Channel: HULK U", function()
end)

Tab10:Button("Copy Link Youtube", function()
    setclipboard("https://www.youtube.com/channel/UCydtOVSESbO2N0qBYndQR1A")
    wait(.5)
game.StarterGui:SetCore("SendNotification", {
Title = "Successfully!"; -- the title (ofc)
Text = "You Can Paste Link"; -- what the text says (ofc)
Icon = "rbxassetid://7529398102"; -- the image if u want. 
Duration = 5; -- how long the notification should in secounds
})
end)

