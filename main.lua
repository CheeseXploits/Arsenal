-- Gui to Lua
-- Version: 3.2
 
-- Instances:
 
local ScreenGui = Instance.new("ScreenGui")
local Aimlock = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local ExpandHitboxButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local TitleCorner = Instance.new("UICorner")
local ButtonCorner1 = Instance.new("UICorner")
local ButtonCorner2 = Instance.new("UICorner")
local Notification = Instance.new("Frame")
local NotificationText = Instance.new("TextLabel")
 
--Properties:
 
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 999
ScreenGui.ResetOnSpawn = false
 
Aimlock.Name = "Aimlock"
Aimlock.Parent = ScreenGui
Aimlock.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Aimlock.Position = UDim2.new(0.05, 0, 0.1, 0)
Aimlock.Size = UDim2.new(0, 320, 0, 200)
Aimlock.BorderSizePixel = 0
Aimlock.BackgroundTransparency = 0.1
Aimlock.ClipsDescendants = true
Aimlock.Active = true
Aimlock.Draggable = true

UICorner.Parent = Aimlock
UICorner.CornerRadius = UDim.new(0, 8)
 
Title.Name = "Title"
Title.Parent = Aimlock
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Title.Size = UDim2.new(1, 0, 0, 45)
Title.Font = Enum.Font.GothamBold
Title.Text = "Cheese Script"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.TextScaled = true
Title.BorderSizePixel = 0
Title.TextStrokeTransparency = 0.75

TitleCorner.Parent = Title
TitleCorner.CornerRadius = UDim.new(0, 8)
 
ExpandHitboxButton.Name = "ExpandHitboxButton"
ExpandHitboxButton.Parent = Aimlock
ExpandHitboxButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ExpandHitboxButton.Size = UDim2.new(0.9, 0, 0, 50)
ExpandHitboxButton.Position = UDim2.new(0.05, 0, 0.3, 0)
ExpandHitboxButton.Font = Enum.Font.GothamMedium
ExpandHitboxButton.Text = "Expand Hitbox"
ExpandHitboxButton.TextColor3 = Color3.fromRGB(220, 220, 220)
ExpandHitboxButton.TextScaled = true
ExpandHitboxButton.BorderSizePixel = 0

ButtonCorner1.Parent = ExpandHitboxButton
ButtonCorner1.CornerRadius = UDim.new(0, 6)

ExpandHitboxButton.MouseButton1Down:connect(function()
	function getplrsname()
		for i,v in pairs(game:GetChildren()) do
			if v.ClassName == "Players" then
				return v.Name
			end
		end
	end
	local players = getplrsname()
	local plr = game[players].LocalPlayer
	coroutine.resume(coroutine.create(function()
		while  wait(1) do
			coroutine.resume(coroutine.create(function()
				for _,v in pairs(game[players]:GetPlayers()) do
					if v.Name ~= plr.Name and v.Character then
						v.Character.RightUpperLeg.CanCollide = false
						v.Character.RightUpperLeg.Transparency = 10
						v.Character.RightUpperLeg.Size = Vector3.new(13,13,13)
 
						v.Character.LeftUpperLeg.CanCollide = false
						v.Character.LeftUpperLeg.Transparency = 10
						v.Character.LeftUpperLeg.Size = Vector3.new(13,13,13)
 
						v.Character.HeadHB.CanCollide = false
						v.Character.HeadHB.Transparency = 10
						v.Character.HeadHB.Size = Vector3.new(13,13,13)
 
						v.Character.HumanoidRootPart.CanCollide = false
						v.Character.HumanoidRootPart.Transparency = 10
						v.Character.HumanoidRootPart.Size = Vector3.new(13,13,13)
 
					end
				end
			end))
		end
	end))
end)
CloseButton.Name = "CloseButton"
CloseButton.Parent = Aimlock
CloseButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
CloseButton.Size = UDim2.new(0.9, 0, 0, 45)
CloseButton.Position = UDim2.new(0.05, 0, 0.65, 0)
CloseButton.Font = Enum.Font.GothamMedium
CloseButton.Text = "Close"
CloseButton.TextColor3 = Color3.fromRGB(255, 85, 85)
CloseButton.TextScaled = true
CloseButton.BorderSizePixel = 0

ButtonCorner2.Parent = CloseButton
ButtonCorner2.CornerRadius = UDim.new(0, 6)

CloseButton.MouseButton1Down:connect(function()
	CloseButton.Parent.Visible = False
 
end)

-- Scripts:
 
local function IRPAKL_fake_script() -- ScreenGui.Script 
	local script = Instance.new('Script', ScreenGui)
 
	frame = script.Parent.Aimlock -- Take out {}s, and put name of frame
	frame.Draggable = true
	frame.Active = true
	frame.Selectable = true
end
coroutine.wrap(IRPAKL_fake_script)()

-- Notification System with Slide-In and Slide-Out Animation
Notification.Name = "Notification"
Notification.Parent = ScreenGui
Notification.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Notification.Position = UDim2.new(1, 0, 0.92, 0) -- Start off-screen, adjusted closer to bottom-right
Notification.Size = UDim2.new(0, 250, 0, 50)
Notification.BorderSizePixel = 0
Notification.BackgroundTransparency = 0.1
Notification.Visible = false

local NotifCorner = Instance.new("UICorner", Notification)
NotifCorner.CornerRadius = UDim.new(0, 8)

NotificationText.Name = "NotificationText"
NotificationText.Parent = Notification
NotificationText.BackgroundTransparency = 1
NotificationText.Size = UDim2.new(1, 0, 1, 0)
NotificationText.Font = Enum.Font.GothamBold
NotificationText.Text = "Subscribe to @CheeseXploits"
NotificationText.TextColor3 = Color3.fromRGB(255, 215, 0)
NotificationText.TextScaled = true

-- Slide-in and Slide-out animation
local function showNotification()
    Notification.Visible = true
    Notification:TweenPosition(UDim2.new(0.85, 0, 0.92, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
    
    task.wait(5) -- Wait for 5 seconds
    
    Notification:TweenPosition(UDim2.new(1, 0, 0.92, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.5, true, function()
        Notification.Visible = false
    end)
end

-- Call notification function
showNotification()
