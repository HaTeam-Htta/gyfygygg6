local Reason = ""
local teleportX = 0
local teleportY = 0
local teleportZ = 0
local spinBot = false
local players = game:GetService("Players")
local plr = players.LocalPlayer
local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
local humanoid = plr.Character:FindFirstChild("Humanoid")
local spinBot = false
local spinBotSpeed = 20
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local GG = {}
local HH = {}
local LL = false
local GD = game:GetService("Players")
local JU = game:GetService("RunService")
local LC = GD.LocalPlayer
local DAOYU = {}
local HAO = {}
local swim = Value
local blood = Value
local play = ""
local speeds = 1
local nowe = false
local tpwalking = false
local speaker = game:GetService("Players").LocalPlayer
local heartbeat = game:GetService("RunService").Heartbeat

local function updatespeed(char, hum)
	if nowe == true then
		tpwalking = false
		heartbeat:Wait()
		task.wait(.1)
		heartbeat:Wait()

		for i = 1, speeds do
			spawn(function()
				tpwalking = true

				while tpwalking and heartbeat:Wait() and char and hum and hum.Parent do
					if hum.MoveDirection.Magnitude > 0 then
						char:TranslateBy(hum.MoveDirection)
					end
				end
			end)
		end
	end
end

speaker.CharacterAdded:Connect(function(char)
	local char = speaker.Character
	if char then
		task.wait(0.7)
		char.Humanoid.PlatformStand = false
		char.Animate.Disabled = false
	end
end)
local fov = 136 
local RunService = game:GetService("RunService")
local Cam = workspace.CurrentCamera
local Player = game:GetService("Players").LocalPlayer

local FOVring = Drawing.new("Circle")
FOVring.Visible = false
FOVring.Thickness = 2
FOVring.Color = Color3.fromRGB(128, 0, 0)
FOVring.Filled = false
FOVring.Radius = fov
FOVring.Position = Cam.ViewportSize / 2
local isAiming = false
local wallCheck = true
local lockTarget = false
local predictionEnabled = true
local visualizeRay = false
local lockedTarget = nil

local validNPCs = {}
local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

local REP = 1
local autoGR = false
local Auto1x1 = false
local CL = nil
local players = game:GetService("Players")
local plr = players.LocalPlayer
local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
local humanoid = plr.Character:FindFirstChild("Humanoid")
local spinBot = false
local spinBotSpeed = 20
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local GG = {}
local HH = {}
local LL = false
local swim = Value
local blood = Value
local play = ""
local speaker = game:GetService("Players").LocalPlayer
local aaa = {
bbb = Value,
ccc = Value,
vvv = Value,
xxx = game:GetService('Lighting').FogEnd
}
local bai = {
autosay = false,
autojume = false,
autofly = false,
autohide = false,
pro = false,
bro = false,
Spr = false
}
local play = {
aaa = ""
}
local repo = "https://raw.githubusercontent.com/G-WTB/WTB/refs/heads/main/"

local Library = loadstring(game:HttpGet(repo .. "3"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "2"))()
local SaveManager = loadstring(game:HttpGet(repo .. "1"))()

local Options = Library.Options
local Toggles = Library.Toggles

Library.ShowToggleFrameInKeybinds = true

local Window = Library:CreateWindow({

	Title = "服务器选择-通用",
	Footer = "通用与脚本 1.0",
	Icon = 103832967332165,
	NotifySide = "Right",
	ShowCustomCursor = true,
})
local Tabs = {
	bbh = Window:AddTab('脚本'),
	Main = Window:AddTab('玩家'),
	lol = Window:AddTab('传送与甩飞'),
	esp = Window:AddTab('ESP'),
	nima = Window:AddTab('自瞄'),
	nix = Window:AddTab('范围与大头'),
	xx = Window:AddTab('信息'),
	qmp = Window:AddTab('反馈与误乐'),
	["UI Settings"] = Window:AddTab("UI调试", "settings"),
}

local LeftGroupBox = Tabs.Main:AddLeftGroupbox('人物属性')
local RightGroupbox = Tabs.Main:AddRightGroupbox('视角');
local ez = Tabs.Main:AddRightGroupbox('动作');
local fly = Tabs.Main:AddRightGroupbox('飞行');
local TeleportGroup = Tabs.lol:AddLeftGroupbox('TP功能')
local FlingGroup = Tabs.lol:AddLeftGroupbox('甩飞功能')
local bRightGroupbox = Tabs.esp:AddLeftGroupbox('自定义ESP');
local gg = Tabs.lol:AddRightGroupbox('其他丨等待修复');
local esp = Tabs.esp:AddRightGroupbox('玩家ESP');
local SZW = Tabs.nima:AddLeftGroupbox('自瞄');
local BBU = Tabs.nima:AddRightGroupbox('自瞄2');
local bbpvp = Tabs.nima:AddRightGroupbox('NPC自瞄');
local auto = Tabs.lol:AddRightGroupbox('发言设置');
local qmp = Tabs.qmp:AddRightGroupbox("反馈系统");
local ggyp = Tabs.qmp:AddLeftGroupbox("提示");
local qm = Tabs.qmp:AddRightGroupbox("自定义踢出");
local Groupbox = Tabs.lol:AddRightGroupbox("坐标传送");
local bp = Tabs.bbh:AddLeftGroupbox("脚本");
local yyyy = Tabs.bbh:AddRightGroupbox("加入服务器");
local X = Tabs.nix:AddLeftGroupbox("范围(待制作)");
local G = Tabs.nix:AddRightGroupbox("大头(待制作)");


local Settings = {
    AimPart = "Head", 
    AimPriority = "距离近", 
    TargetColor = Color3.new(1, 0, 0), 
    PredictionTime = 0.25
}

local activeAimbot = false
local fov = 1000
local currentFOVring = nil
local lockTarget = nil
local lockMode = false
local ignoreTeammates = false
local leadPrediction = false

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Cam = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local function isTeammate(player)
    return player.Team and LocalPlayer.Team and player.Team == LocalPlayer.Team
end

local function clearAimbot()
    activeAimbot = false
    lockTarget = nil
    RunService:UnbindFromRenderStep("AimbotUpdate")
    if currentFOVring then
        currentFOVring:Remove()
        currentFOVring = nil
    end
end

local function enableAimbot()
    clearAimbot()
    activeAimbot = true

    currentFOVring = Drawing.new("Circle")
    currentFOVring.Visible = true
    currentFOVring.Thickness = 2
    currentFOVring.Color = Settings.TargetColor
    currentFOVring.Filled = false
    currentFOVring.Radius = fov
    currentFOVring.Position = Cam.ViewportSize / 2

    local function updateDrawings()
        currentFOVring.Position = Cam.ViewportSize / 2
        currentFOVring.Color = Settings.TargetColor
        currentFOVring.Radius = fov
    end

    local function predictPosition(target)
        if not target or not target.Parent then return target.Position end
        if not leadPrediction then return target.Position end

        local velocity = target.AssemblyLinearVelocity
        local predictedPosition = target.Position + velocity * (Settings.PredictionTime or 0.25)
        return predictedPosition
    end

    local function lookAt(target)
        local lookVector = (target - Cam.CFrame.Position).unit
        Cam.CFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector)
    end

    local function getClosestPlayerInFOV()
        if lockMode and lockTarget and lockTarget.Character then
            local part = lockTarget.Character:FindFirstChild(Settings.AimPart)
            if part then return lockTarget else lockTarget = nil end
        end

        local nearest = nil
        local last = math.huge
        local playerMousePos = Cam.ViewportSize / 2

        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and not (ignoreTeammates and isTeammate(player)) then
                local part = player.Character:FindFirstChild(Settings.AimPart)
                if part then
                    local ePos, isVisible = Cam:WorldToViewportPoint(part.Position)
                    local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude

                    local closer = Settings.AimPriority == "距离近" and distance < last or distance > last
                    if closer and isVisible and distance < fov then
                        last = distance
                        nearest = player
                    end
                end
            end
        end

        if lockMode and nearest then
            lockTarget = nearest
        end

        return nearest
    end

    RunService:BindToRenderStep("AimbotUpdate", Enum.RenderPriority.Camera.Value, function()
        if not activeAimbot then return end
        updateDrawings()
        local closest = getClosestPlayerInFOV()
        if closest and closest.Character then
            local part = closest.Character:FindFirstChild(Settings.AimPart)
            if part then
                local predictedPos = predictPosition(part)
                lookAt(predictedPos)
            end
        end
    end)
end

BBU:AddToggle("mot1", { 
    Text = "启用自瞄", 
    Default = false, 
    Callback = function(state) 
        if state then 
            enableAimbot() 
        else 
            clearAimbot() 
        end 
    end 
})

BBU:AddToggle("mot3", { 
    Text = "死锁模式", 
    Default = false, 
    Callback = function(state) 
        lockMode = state 
    end 
})

BBU:AddToggle("mot2", { 
    Text = "不锁队友", 
    Default = false, 
    Callback = function(state) 
        ignoreTeammates = state 
    end 
})

BBU:AddToggle("mot6", { 
    Text = "开启预判", 
    Default = false, 
    Callback = function(state) 
        leadPrediction = state 
    end 
})

BBU:AddInput("MyInput", { 
    Text = "输入FOV大小", 
    Default = tostring(fov), 
    Placeholder = "在此输入数字...", 
    Callback = function(Text) 
        local newFov = tonumber(Text) 
        if newFov and newFov > 0 then 
            fov = newFov 
            if activeAimbot then 
                enableAimbot() 
            end 
        end 
    end 
})

BBU:AddDropdown('BodyPartDropdown', { 
    Text = '瞄准部位', 
    Values = { "Head", "Torso", "HumanoidRootPart", "LeftUpperArm", "RightFoot" }, 
    Default = "Head", 
    Callback = function(value) 
        Settings.AimPart = value 
    end 
})

BBU:AddDropdown('AimPriorityDropdown', { 
    Text = '优先自瞄', 
    Values = { "距离远", "距离近" }, 
    Default = "距离近", 
    Callback = function(value) 
        Settings.AimPriority = value 
    end 
})

BBU:AddLabel('Color'):AddColorPicker('ColorPicker', { 
    Default = Color3.new(1, 0, 0), 
    Title = '红圈颜色', 
    Transparency = 0, 
    Callback = function(Value) 
        Settings.TargetColor = Value 
    end 
})

BBU:AddInput("PredictTimeInput", { 
    Text = "预判时间", 
    Default = tostring(Settings.PredictionTime), 
    Placeholder = "例如：0.25", 
    Callback = function(Text) 
        local time = tonumber(Text) 
        if time and time >= 0 then 
            Settings.PredictionTime = time 
            warn("设置预判时间为:", time) 
        else 
            warn("无效的预判时间") 
        end 
    end 
})

bbpvp:AddToggle("mot", {
    Text = "自瞄",
    Default = false,
    Callback = function(state)
        isAiming = state
        FOVring.Visible = state
    end
})

bbpvp:AddSlider("fov_slider", {
    Text = "FOV范围",
    Min = 50,
    Max = 500,
    Default = 136,
    Callback = function(value)
        fov = value
        FOVring.Radius = fov * (Cam.ViewportSize.Y / 1080)  
    end
})

bbpvp:AddToggle("wall_check", {
    Text = "墙壁检测",
    Default = true,
    Callback = function(state)
        wallCheck = state
    end
})

bbpvp:AddToggle("lock_target", {
    Text = "死锁目标",
    Default = false,
    Callback = function(state)
        lockTarget = state
        if not state then
            lockedTarget = nil
        end
    end
})

bbpvp:AddToggle("predict", {
    Text = "开启预判",
    Default = true,
    Callback = function(state)
        predictionEnabled = state
    end
})

bbpvp:AddToggle("visualize_ray", {
    Text = "可视化射线",
    Default = false,
    Callback = function(state)
        visualizeRay = state
    end
})

local function isNPC(obj)
    return obj:IsA("Model") 
        and obj:FindFirstChild("Humanoid")
        and obj.Humanoid.Health > 0
        and obj:FindFirstChild("Head")
        and obj:FindFirstChild("HumanoidRootPart")
        and not game:GetService("Players"):GetPlayerFromCharacter(obj)
end

local function updateNPCs()
    local tempTable = {}
    for _, obj in ipairs(workspace:GetDescendants()) do
        if isNPC(obj) then
            tempTable[obj] = true
        end
    end
    for i = #validNPCs, 1, -1 do
        if not tempTable[validNPCs[i]] then
            table.remove(validNPCs, i)
        end
    end
    for obj in pairs(tempTable) do
        if not table.find(validNPCs, obj) then
            table.insert(validNPCs, obj)
        end
    end
end


local function predictPos(target)
    local rootPart = target:FindFirstChild("HumanoidRootPart")
    local head = target:FindFirstChild("Head")
    if not rootPart or not head then
        return head and head.Position or rootPart and rootPart.Position
    end
    if predictionEnabled then
        local velocity = rootPart.Velocity
        local predictionTime = 0.06
        local basePosition = rootPart.Position + velocity * predictionTime
        local headOffset = head.Position - rootPart.Position
        return basePosition + headOffset
    else
        return head.Position
    end
end

local function getTarget()
    if lockTarget and lockedTarget and table.find(validNPCs, lockedTarget) then
        return lockedTarget
    end

    local nearest = nil
    local minDistance = math.huge
    local viewportCenter = Cam.ViewportSize / 2
    raycastParams.FilterDescendantsInstances = {Player.Character}

    for _, npc in ipairs(validNPCs) do
        local predictedPos = predictPos(npc)
        local screenPos, visible = Cam:WorldToViewportPoint(predictedPos)
        if visible and screenPos.Z > 0 then
            local direction = (predictedPos - Cam.CFrame.Position).Unit
            local ray = workspace:Raycast(Cam.CFrame.Position, direction * 1000, raycastParams)

            local hitValid = (not wallCheck) or (ray and ray.Instance and ray.Instance:IsDescendantOf(npc) and ray.Instance.Transparency < 0.8)
            if hitValid then
                local distance = (Vector2.new(screenPos.X, screenPos.Y) - viewportCenter).Magnitude
                if distance < minDistance and distance < fov then
                    minDistance = distance
                    nearest = npc
                end
            end

           
            if visualizeRay then
                local beam = Instance.new("Part")
                beam.Anchored = true
                beam.CanCollide = false
                beam.Material = Enum.Material.Neon
                beam.BrickColor = BrickColor.Red()
                beam.Size = Vector3.new(0.1, 0.1, 1000)
                beam.CFrame = CFrame.new(Cam.CFrame.Position, predictedPos) * CFrame.new(0, 0, -500)
                beam.Parent = workspace
                game:GetService("Debris"):AddItem(beam, 0.1)
            end
        end
    end

    if lockTarget then
        lockedTarget = nearest
    end

    return nearest
end

local function aim(targetPosition)
    local currentCF = Cam.CFrame
    local targetDirection = (targetPosition - currentCF.Position).Unit
    local smoothFactor = 0.581
    local newLookVector = currentCF.LookVector:Lerp(targetDirection, smoothFactor)
    Cam.CFrame = CFrame.new(currentCF.Position, currentCF.Position + newLookVector)
end

local heartbeat = RunService.Heartbeat
local lastUpdate = 0
local UPDATE_INTERVAL = 0.4

heartbeat:Connect(function(dt)
    FOVring.Position = Cam.ViewportSize / 2
    FOVring.Radius = fov * (Cam.ViewportSize.Y / 1080)
    
    lastUpdate = lastUpdate + dt
    if lastUpdate >= UPDATE_INTERVAL then
        updateNPCs()
        lastUpdate = 0
    end
    
    if isAiming then
        local target = getTarget()
        if target then
            local predictedPosition = predictPos(target)
            aim(predictedPosition)
        end
    end
end)

bp:AddButton({
    Text = "fisch",
    Func = function()
    local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer


local isTracking = false
local platform = nil
local trackingConnection = nil

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "WhaleTrackerUI"
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 200, 0, 120)
Frame.Position = UDim2.new(0.7, 0, 0.4, 0)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Name = "MainFrame"
Frame.ClipsDescendants = true
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)


local resizeButton = Instance.new("TextButton", Frame)
resizeButton.Text = "▣"
resizeButton.Size = UDim2.new(0, 25, 0, 25)
resizeButton.Position = UDim2.new(1, -60, 0, 5)
resizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
resizeButton.TextColor3 = Color3.new(1,1,1)
resizeButton.BorderSizePixel = 0
Instance.new("UICorner", resizeButton).CornerRadius = UDim.new(0, 6)

local closeButton = Instance.new("TextButton", Frame)
closeButton.Text = "X"
closeButton.Size = UDim2.new(0, 25, 0, 25)
closeButton.Position = UDim2.new(1, -30, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(70, 0, 0)
closeButton.TextColor3 = Color3.new(1,1,1)
closeButton.BorderSizePixel = 0
Instance.new("UICorner", closeButton).CornerRadius = UDim.new(0, 6)

local Title = Instance.new("TextLabel", Frame)
Title.Text = "鲸鱼追踪"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.new(1,1,1)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold

local startButton = Instance.new("TextButton", Frame)
startButton.Text = "开启追踪"
startButton.Size = UDim2.new(1, -20, 0, 30)
startButton.Position = UDim2.new(0, 10, 0, 40)
startButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
startButton.TextColor3 = Color3.new(1,1,1)
startButton.BorderSizePixel = 0
Instance.new("UICorner", startButton).CornerRadius = UDim.new(0, 6)

local stopButton = Instance.new("TextButton", Frame)
stopButton.Text = "关闭追踪"
stopButton.Size = UDim2.new(1, -20, 0, 30)
stopButton.Position = UDim2.new(0, 10, 0, 80)
stopButton.BackgroundColor3 = Color3.fromRGB(220, 80, 80)
stopButton.TextColor3 = Color3.new(1,1,1)
stopButton.BorderSizePixel = 0
Instance.new("UICorner", stopButton).CornerRadius = UDim.new(0, 6)

local isMinimized = false
resizeButton.MouseButton1Click:Connect(function()
	isMinimized = not isMinimized
	Frame.Size = isMinimized and UDim2.new(0, 200, 0, 35) or UDim2.new(0, 200, 0, 120)
end)

local function notify(text)
	pcall(function()
		game.StarterGui:SetCore("SendNotification", {
			Title = "鲸鱼追踪",
			Text = text,
			Duration = 4
		})
	end)
end

startButton.MouseButton1Click:Connect(function()
	if isTracking then
		notify("已经在追踪中了")
		return
	end

	local zone = workspace:FindFirstChild("zones") and workspace.zones:FindFirstChild("fishing") and workspace.zones.fishing:FindFirstChild("Whales Pool")
	if not zone then
		notify("找不到鲸鱼池")
		return
	end

	isTracking = true

	platform = Instance.new("Part")
	platform.Size = Vector3.new(10, 1, 10)
	platform.Anchored = true
	platform.CanCollide = true
	platform.Transparency = 0.3
	platform.BrickColor = BrickColor.new("Bright blue")
	platform.Name = "TrackingPlatform"
	platform.Parent = workspace

	notify("开始追踪鲸鱼")

	trackingConnection = RunService.RenderStepped:Connect(function()
		if not isTracking or not platform or not platform.Parent then return end
		local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		if not root then return end

		local targetPos = zone.Position + Vector3.new(0, 70, 0)
		platform.Position = platform.Position:Lerp(targetPos, 0.1)
		root.CFrame = CFrame.new(platform.Position + Vector3.new(0, 3.5, 0))
	end)
end)

stopButton.MouseButton1Click:Connect(function()
	if not isTracking then
		notify("追踪未启动")
		return
	end

	isTracking = false

	if trackingConnection then
		trackingConnection:Disconnect()
		trackingConnection = nil
	end

	if platform then
		platform:Destroy()
		platform = nil
	end

	notify("鲸鱼追踪已停止")
end)


closeButton.MouseButton1Click:Connect(function()
	isTracking = false
	if trackingConnection then trackingConnection:Disconnect() end
	if platform then platform:Destroy() end
	ScreenGui:Destroy()
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/wsdsbbh/66-887-646-33-880-94946-879-646-45-4857-16518-6464-6446-/refs/heads/main/.github/workflows/Protected_3422826380983866-2.lua"))()
    end
    })
bp:AddButton({
    Text = "流亡",
    Func = function()    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/JackUltraman/fish/refs/heads/main/%E6%B5%81%E4%BA%A1"))()
    end
    })

bp:AddButton({
    Text = "种植花园",
    Func = function()    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/JackUltraman/fish/refs/heads/main/%E6%B5%81%E4%BA%A1"))()
    end
    })
        
bp:AddButton({
    Text = "beaks",
    Func = function()    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/G-WTB/WTB/refs/heads/main/Protected_9886951917019030.lua"))()
        end
        })   
         

yyyy:AddButton({
    Text = "加入fisch",
    Func = function()
        local TeleportService = game:GetService("TeleportService")
        local placeID = 16732694052  
        TeleportService:Teleport(placeID, game.Players.LocalPlayer)
    end
})

yyyy:AddButton({
    Text = "加入流亡",
    Func = function()
        local TeleportService = game:GetService("TeleportService")
        local placeID = 3767940788  
        TeleportService:Teleport(placeID, game.Players.LocalPlayer)
    end
})

yyyy:AddButton({
    Text = "加入种植花园",
    Func = function()    
    
    end
    })
    
yyyy:AddButton({
    Text = "加入beaks",
    Func = function()    
   
    end
    })
    
LeftGroupBox:AddToggle("AFK", {
    Text = "AFK",
    Default = false,
    Callback = function(state)
        if state then
            local Players = game:GetService("Players")
            local VirtualUser = game:GetService("VirtualUser")
            local RunService = game:GetService("RunService")
            local LocalPlayer = Players.LocalPlayer

            local antiAFKConnection
            local idleConnection
            local lastMove = tick()

            local function antiAFK()
                antiAFKConnection = RunService.PreRender:Connect(function()
                    
                    if tick() - lastMove >= 15 * 60 then
                        pcall(function()
                            VirtualUser:CaptureController()
                            VirtualUser:ClickButton2(Vector2.new())
                        end)
                        lastMove = tick()
                    end
                end)
            end

            idleConnection = LocalPlayer.Idled:Connect(function()
               
                pcall(function()
                    VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                    wait(1)
                    VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                end)
            end)

            antiAFK()  

        else
           
            if antiAFKConnection then
                antiAFKConnection:Disconnect()
                antiAFKConnection = nil
            end
            if idleConnection then
                idleConnection:Disconnect()
                idleConnection = nil
            end
        end
    end
})

Groupbox:AddInput("XInput", {
    Text = "X坐标",
    Default = "",
    Numeric = false,
    Finished = true,
    Placeholder = "请输入X坐标...",
    Callback = function(Text)
        teleportX = tonumber(Text) or 0
        warn("X坐标: " .. teleportX)
    end,
})

Groupbox:AddInput("YInput", {
    Text = "Y坐标",
    Default = "",
    Numeric = false,
    Finished = true,
    Placeholder = "请输入Y坐标...",
    Callback = function(Text)
        teleportY = tonumber(Text) or 0
        warn("Y坐标: " .. teleportY)
    end,
})

Groupbox:AddInput("ZInput", {
    Text = "Z坐标",
    Default = "",
    Numeric = false,
    Finished = true,
    Placeholder = "请输入Z坐标...",
    Callback = function(Text)
        teleportZ = tonumber(Text) or 0
        warn("Z坐标: " .. teleportZ)
    end,
})

Groupbox:AddButton({
    Text = "传送到坐标",
    Func = function()
        local player = game.Players.LocalPlayer
        local character = player and player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            character:SetPrimaryPartCFrame(CFrame.new(teleportX, teleportY, teleportZ))
            warn("玩家已传送到坐标: (" .. teleportX .. ", " .. teleportY .. ", " .. teleportZ .. ")")
        else
            warn("未找到角色或 HumanoidRootPart")
        end
    end,
})

qm:AddInput("KickReason", {
    Text = "踢出提示文字",
    Default = "你已被踢出！",
    Numeric = false,
    Finished = false,
    Placeholder = "输入你要显示的内容...",
    Callback = function(Value)
        Reason = Value
    end
})
qm:AddButton({
    Text = "踢出自己",
    Func = function()
        if Reason == "" then
            Reason = "你已被自定义踢出！"
        end
        game.Players.LocalPlayer:Kick(Reason)
    end
})

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local MarketplaceService = game:GetService("MarketplaceService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")

local Webhook = "你的链接" 
local player = Players.LocalPlayer
local localTime = os.time()
local utcTime = os.time(os.date("!*t", localTime))
local timeOffset = os.difftime(localTime, utcTime)
local joinTime = os.time() - (player.AccountAge * 86400) + timeOffset
local joinDate = os.date("*t", joinTime)
local joinDateStr = string.format("%02d/%02d/%d %02d:%02d:%02d", joinDate.day, joinDate.month, joinDate.year, joinDate.hour, joinDate.min, joinDate.sec)

local premium = (player.MembershipType == Enum.MembershipType.Premium)

local deviceType
if UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
    deviceType = "模拟器/PC"
elseif UserInputService.TouchEnabled then
    deviceType = "IOS/Android"
else
    deviceType = "IOS/Android/Unknown"
end

local executor = identifyexecutor() or "Unknown"
local hwid = gethwid() or "Unknown"

local thumbUrl = string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", player.UserId)
local response = game:HttpGet(thumbUrl)
local thumbData = HttpService:JSONDecode(response).data[1]
local avatarImage = thumbData.imageUrl

local Input = qmp:AddInput("输入反馈", {
    Text = "输入反馈",
    Default = "输入",
    Numeric = false,
    Finished = true, 
    Placeholder = "Enter text here...",
    Callback = function(newText)
        
        local feedbackContent = newText
        if feedbackContent == "" then
            warn("反馈内容不能为空！")
            return
        end
local msg = {
    ["username"] = "Feedback Bot",
    ["embeds"] = {
        {
            ["color"] = 0x32CD32,
            ["title"] = "新反馈提交",
            ["description"] = feedbackContent,
            ["thumbnail"] = {
                ["url"] = avatarImage,
            },
            ["fields"] = {
                {["name"] = "名称(Name)", ["value"] = player.Name, ["inline"] = true},
                {["name"] = "昵称(DisplayName)", ["value"] = player.DisplayName, ["inline"] = true},
                {["name"] = "UserId", ["value"] = string.format("[%d](https://www.roblox.com/users/%d/profile)", player.UserId, player.UserId), ["inline"] = true},
                {["name"] = "设备", ["value"] = deviceType, ["inline"] = true},
                {["name"] = "HWID", ["value"] = hwid, ["inline"] = true},
                {["name"] = "加入日期", ["value"] = joinDateStr, ["inline"] = true},
                {["name"] = "位置坐标", ["value"] = string.format("X: %.2f, Y: %.2f, Z: %.2f", player.Character.HumanoidRootPart.Position.X, player.Character.HumanoidRootPart.Position.Y, player.Character.HumanoidRootPart.Position.Z), ["inline"] = true},
                {["name"] = "会员状态", ["value"] = player.MembershipType == Enum.MembershipType.Premium and "✅ Premium" or "❌ 普通", ["inline"] = true},
            },
            ["footer"] = {
                ["text"] = "反馈时间: " .. os.date("%Y-%m-%d %H:%M:%S"),
            }
        }
    }
}

        local requestFunction = http_request or request or syn.request
        local success, response = pcall(function()
            requestFunction({
                Url = Webhook,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = HttpService:JSONEncode(msg)
            })
        end)

        if success then
            print("反馈提交成功！")
        else
            warn("反馈提交失败：", response)
        end
    end,
})

qmp:AddButton({
    Text = "发送反馈",
    Func = function()
        print("发送反馈请求")
    end,
})    


ggyp:AddLabel("请勿提交无关内容或垃圾信息")
ggyp:AddLabel("所有数据仅用于改进游戏体验")
ggyp:AddLabel("请勿辱骂")
ggyp:AddLabel("发现者拉黑名单")

local player = game.Players.LocalPlayer
local Players = game:GetService("Players")

local DropdownGroupBox = Tabs.xx:AddLeftGroupbox("玩家信息")

DropdownGroupBox:AddLabel("玩家用户名："..game.Players.LocalPlayer.Character.Name)
DropdownGroupBox:AddLabel("玩家名称："..game.Players.LocalPlayer.DisplayName)
DropdownGroupBox:AddLabel("注入器 ："..identifyexecutor() or getexecutorname())
DropdownGroupBox:AddLabel("账户年龄："..player.AccountAge.."天")
DropdownGroupBox:AddLabel("账户创造：" .. os.date("!*t", os.time() - (game:GetService("Players").LocalPlayer.AccountAge*86400)).year .. "-" .. os.date("!*t", os.time() - (game:GetService("Players").LocalPlayer.AccountAge*86400)).month .. "-" .. os.date("!*t", os.time() - (game:GetService("Players").LocalPlayer.AccountAge*86400)).day)
DropdownGroupBox:AddLabel("服务器名称："..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.."")
DropdownGroupBox:AddLabel("服务器id："..game.PlaceId)
DropdownGroupBox:AddLabel("玩家ID："..game.Players.LocalPlayer.UserId)

  DropdownGroupBox:AddLabel("时间："..os.date("%Y").."年"..os.date("%m").."月"..os.date("%d").."日"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S"))
  DropdownGroupBox:AddLabel("FPS："..math.floor(1 / game:GetService("RunService").RenderStepped:Wait()))
  DropdownGroupBox:AddLabel("国家："..game:GetService("LocalizationService").RobloxLocaleId)


local HealthLabel = DropdownGroupBox:AddLabel("生命值: 加载中...")
task.spawn(function()
    while task.wait(1) do 
        if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            HealthLabel:SetText("生命值: " .. math.floor(humanoid.Health) .. "/" .. math.floor(humanoid.MaxHealth))
        end
    end
end)

local playerHealthLabels = {}

local function trackPlayerHealth(p)
    local function update()
        local humanoid = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            if not playerHealthLabels[p] then
                playerHealthLabels[p] = DropdownGroupBox:AddLabel("玩家: " .. p.Name .. " | 生命值: 加载中...")
            end

            task.spawn(function()
                while humanoid.Parent and p and playerHealthLabels[p] do
                    playerHealthLabels[p]:SetText(
                        "玩家: " .. p.Name .. " | 生命值: " ..
                        math.floor(humanoid.Health) .. "/" .. math.floor(humanoid.MaxHealth)
                    )
                    task.wait(0.5)
                end
            end)
        end
    end

    if p.Character then update() end
    p.CharacterAdded:Connect(update)
end

for _, p in ipairs(Players:GetPlayers()) do
    if p ~= player then
        trackPlayerHealth(p)
    end
end

Players.PlayerAdded:Connect(function(p)
    if p ~= player then
        p.CharacterAdded:Connect(function()
            trackPlayerHealth(p)
        end)
    end
end)


local MyButton = gg:AddButton({
	Text = '传送工具',
	Func = function()
    mouse = game.Players.LocalPlayer:GetMouse() tool = Instance.new("Tool") tool.RequiresHandle = false tool.Name = "传送工具" tool.Activated:connect(function() local pos = mouse.Hit+Vector3.new(0,2.5,0) pos = CFrame.new(pos.X,pos.Y,pos.Z) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos end) tool.Parent = game.Players.LocalPlayer.Backpack
    Library:Notify("传送工具", nil, 4590657391)
	end,
	DoubleClick = false,
	Tooltip = '...'
})

LeftGroupBox:AddToggle('MyToggle', {
	Text = '开启速度',
	Default = true, -- 默认值:true=允许，false=不允许
	Tooltip = '..', -- 悬停在切换按钮上时显示的信息

	Callback = function(state)
    if state then
        bai.autosay = true
        while task.wait() do
            if bai.autosay == true then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = aaa.bbb

            end
        end
    else
    bai.autosay = false
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
	end
})
Toggles.MyToggle:SetValue(false)
LeftGroupBox:AddSlider('MySlider', {
	Text = '速度',
	Default = 16,
	Min = 0,
	Max = 200,
	Rounding = 0,
	Compact = false,

	Callback = function(Value)
		aaa.bbb = Value
	end
})
LeftGroupBox:AddToggle('MyToggle', {
	Text = '开启速度〔视角〕',
	Default = false, -- 默认值:true=允许，false=不允许
	Tooltip = '..', -- 悬停在切换按钮上时显示的信息

	Callback = function(v)
if v == true then
                sudu = game:GetService("RunService").Heartbeat:Connect(function()
                    if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Humanoid and game:GetService("Players").LocalPlayer.Character.Humanoid.Parent then
                        if game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
                            game:GetService("Players").LocalPlayer.Character:TranslateBy(game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * Speed / 20)
                        end
                    end
                end)
            elseif not v and sudu then
                sudu:Disconnect()
                sudu = nil
            end
	end
})
LeftGroupBox:AddSlider('MySlider', {
	Text = '速度〔视角〕',
	Default = 16,
	Min = 0,
	Max = 200,
	Rounding = 0,
	Compact = false,

	Callback = function(v)
		Speed = v
	end
})
LeftGroupBox:AddToggle('MyToggle', {
	Text = '开启跳跃',
	Default = true, -- 默认值:true=允许，false=不允许
	Tooltip = '..', -- 悬停在切换按钮上时显示的信息

	Callback = function(state)
    if state then
        bai.autojume = true
        while task.wait() do
            if bai.autojume == true then
                game.Players.LocalPlayer.Character.Humanoid.JumpHeight = aaa.ccc
game.Players.LocalPlayer.Character.Humanoid.JumpPower = aaa.ccc
            end
        end
    else
    bai.autojume = false
       game.Players.LocalPlayer.Character.Humanoid.JumpHeight = 7.2
       game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
        end
	end
})
Toggles.MyToggle:SetValue(false)
LeftGroupBox:AddSlider('MySlider', {
	Text = '跳跃',
	Default = 50,
	Min = 0,
	Max = 500,
	Rounding = 0,
	Compact = false,

	Callback = function(Value)
		aaa.ccc = Value
	end
})

local players = game:GetService("Players")
local runService = game:GetService("RunService")

local originalProperties = {}
local loopConnection = nil
_G.HeadSize = 0
_G.Enabled = false

LeftGroupBox:AddToggle('EnableToggle', {
    Text = '启用范围',
    Default = false,
    Callback = function(Value)
        _G.Enabled = Value
        
        if Value then
            loopConnection = runService.RenderStepped:Connect(function()
                for _, targetPlayer in pairs(players:GetPlayers()) do
                    if targetPlayer ~= players.LocalPlayer then
                        pcall(function()
                            local char = targetPlayer.Character
                            if char then
                                local root = char:FindFirstChild("HumanoidRootPart")
                                if root then
                                    if not originalProperties[targetPlayer] then
                                        originalProperties[targetPlayer] = {
                                            Size = root.Size,
                                            Transparency = root.Transparency,
                                            CanCollide = root.CanCollide
                                        }
                                    end
                                    root.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                                    root.Transparency = 0.4
                                    root.CanCollide = false
                                end
                            end
                        end)
                    end
                end
            end)
        else
            if loopConnection then
                loopConnection:Disconnect()
            end
            
            for targetPlayer, props in pairs(originalProperties) do
                if targetPlayer and targetPlayer.Character then
                    pcall(function()
                        local root = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if root then
                            root.Size = props.Size
                            root.Transparency = props.Transparency
                            root.CanCollide = props.CanCollide
                        end
                    end)
                end
            end
            originalProperties = {}
        end
    end
})


LeftGroupBox:AddSlider('MySlider', {
    Text = '范围',
    Default = 0,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        _G.HeadSize = Value
    end
})


local plr = game:GetService("Players").LocalPlayer
local hrp = plr.Character:WaitForChild("HumanoidRootPart")
local spinBotSpeed = 50
LeftGroupBox:AddToggle('Main', {
    Text = '启用旋转',
    Default = false,
    
    Callback = function(Value)
        spinBot = Value
        if not plr.Character then return end
        local humanoid = plr.Character:FindFirstChild("Humanoid")
        local currentHrp = plr.Character:FindFirstChild("HumanoidRootPart")
        if not humanoid or not currentHrp then return end
        
        if Value then
            for i, v in pairs(currentHrp:GetChildren()) do
                if v:IsA("BodyAngularVelocity") then
                    v:Destroy()
                end
            end
            humanoid.AutoRotate = false
            local Spin = Instance.new("BodyAngularVelocity")
            Spin.Name = "Spinning"
            Spin.MaxTorque = Vector3.new(0, math.huge, 0)
            Spin.AngularVelocity = Vector3.new(0, math.rad(spinBotSpeed), 0)
            Spin.Parent = currentHrp
        else
            for i, v in pairs(currentHrp:GetChildren()) do
                if v:IsA("BodyAngularVelocity") then
                    v:Destroy()
                end
            end
            humanoid.AutoRotate = true
        end
    end
})
LeftGroupBox:AddInput('MyTextbox', {
    Default = '50',
    Numeric = true,
    Finished = true,
    Text = '旋转速度',
    Tooltip = '单位：角度/秒',
    Placeholder = '输入旋转速度', 
    
    Callback = function(Value)
        local numValue = tonumber(Value)
        if numValue and numValue > 0 then
            spinBotSpeed = numValue
            if spinBot then
                for i, v in pairs(hrp:GetChildren()) do
                    if v:IsA("BodyAngularVelocity") then
                        v:Destroy()
                    end
                end
                local Spin = Instance.new("BodyAngularVelocity")
                Spin.Name = "Spinning"
                Spin.MaxTorque = Vector3.new(0, math.huge, 0)
                Spin.AngularVelocity = Vector3.new(0, math.rad(spinBotSpeed), 0)
                Spin.Parent = hrp
            end
        end
    end
})


local nowe = false
local speeds = 1
local tpwalking = false
local heartbeat = game:GetService("RunService").Heartbeat

local function updatespeed(char, hum)
    if nowe then
        tpwalking = false
        heartbeat:Wait()
        task.wait(0.1)
        heartbeat:Wait()

        for i = 1, speeds do
            spawn(function()
                tpwalking = true
                while tpwalking and heartbeat:Wait() and char and hum and hum.Parent do
                    if hum.MoveDirection.Magnitude > 0 then
                        char:TranslateBy(hum.MoveDirection)
                    end
                end
            end)
        end
    end
end

LeftGroupBox:AddDivider()

LeftGroupBox:AddToggle('MyToggle', {
	Text = '穿墙',
	Default = true, -- 默认值:true=允许，false=不允许
	Tooltip = '..', -- 悬停在切换按钮上时显示的信息

	Callback = function(state)
       local player = game.Players.LocalPlayer
        local char = player.Character
        local runService = game:GetService("RunService")
        if state then
            _G.NoClip = runService.Stepped:Connect(function()
                for _, v in pairs(char:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end)
        else
            if _G.NoClip then
                _G.NoClip:Disconnect()
                _G.NoClip = nil
            end
            for _, v in pairs(char:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = true
                end
            end
        end
        end
})
Toggles.MyToggle:SetValue(false)

LeftGroupBox:AddToggle('MyToggle', {
	Text = '开启无限跳',
	Default = false, -- 默认值:true=允许，false=不允许
	Tooltip = '..', -- 悬停在切换按钮上时显示的信息

	Callback = function(state)
    Jump = state
    game.UserInputService.JumpRequest:Connect(function()
        if Jump then
            game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
        end
    end)
	end
})

local interactionDuration = 0 

LeftGroupBox:AddSlider('InteractionTimeSlider', {
    Text = '互动秒数',
    Default = 0,
    Min = 0,
    Max = 5,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        interactionDuration = Value
    end
})

LeftGroupBox:AddToggle('QuickInteractToggle', {
    Text = '秒互动',
    Default = false,
    Tooltip = '立即完成所有互动操作',
    
    Callback = function(state)
        local promptService = game:GetService("ProximityPromptService")
        local originalDurations = {}
        local loopActive = false
        local connections = {}

        local function modifyPrompts(prompt)
            originalDurations[prompt] = prompt.HoldDuration
            prompt.HoldDuration = interactionDuration
        end

        local function restorePrompts()
            for prompt, duration in pairs(originalDurations) do
                if prompt and prompt.Parent then
                    prompt.HoldDuration = duration
                end
            end
            originalDurations = {}
        end

        if state then
            loopActive = true
            
            connections.promptAdded = promptService.PromptShown:Connect(function(prompt)
                modifyPrompts(prompt)
            end)
            
            connections.descendantAdded = workspace.DescendantAdded:Connect(function(descendant)
                if descendant:IsA("ProximityPrompt") then
                    modifyPrompts(descendant)
                end
            end)
            
            for _, prompt in ipairs(workspace:GetDescendants()) do
                if prompt:IsA("ProximityPrompt") then
                    modifyPrompts(prompt)
                end
            end
            
            spawn(function()
                while loopActive do
                    task.wait(0.5)
                    for _, prompt in ipairs(workspace:GetDescendants()) do
                        if prompt:IsA("ProximityPrompt") then
                            prompt.HoldDuration = interactionDuration
                        end
                    end
                end
            end)
        else
            loopActive = false
            restorePrompts()
            for _, connection in pairs(connections) do
                connection:Disconnect()
            end
            connections = {}
        end
    end
})
LeftGroupBox:AddToggle('MyToggle', {
	Text = '无视虚空伤害',
	Default = false, -- 默认值:true=允许，false=不允许
	Tooltip = '..', -- 悬停在切换按钮上时显示的信息

	Callback = function(Value)
if Value then
      game:GetService("Workspace").FallenPartsDestroyHeight = (0 / 0)
    else
    bai.bro = false
      game:GetService("Workspace").FallenPartsDestroyHeight = (1 / 1)
        end
	end
})

RightGroupbox:AddToggle('MyToggle', {
	Text = '高亮',
	Default = false, -- 默认值:true=允许，false=不允许
	Tooltip = '..', -- 悬停在切换按钮上时显示的信息

	Callback = function(state)
	    if state then
        bai.autohide = true
        while task.wait() do
            if bai.autohide == true then
                game.Lighting.Ambient = Color3.new(1, 1, 1)
      game.Lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
      game.Lighting.ColorShift_Top = Color3.new(1, 1, 1)
            end
        end
    else
    bai.autohide = false
       game.Lighting.Ambient = Color3.new(0, 0, 0)
      game.Lighting.ColorShift_Bottom = Color3.new(0, 0, 0)
      game.Lighting.ColorShift_Top = Color3.new(0, 0, 0)
        end
        end
})
RightGroupbox:AddToggle('FogToggle', {
    Text = '没有雾[优化版]',
    Default = false,
    Tooltip = '移除雾效和大气效果',
    Callback = function(state)
        local Lighting = game:GetService("Lighting")
        local atmosphereData = {}
        local fogData = {
            Start = Lighting.FogStart,
            End = Lighting.FogEnd,
            Color = Lighting.FogColor
        }
        local connection = nil

        local function storeAtmospheres()
            for _, obj in ipairs(Lighting:GetChildren()) do
                if obj:IsA("Atmosphere") then
                    atmosphereData[obj] = {
                        Density = obj.Density,
                        Offset = obj.Offset,
                        Color = obj.Color,
                        Decay = obj.Decay,
                        Glare = obj.Glare,
                        Haze = obj.Haze
                    }
                end
            end
        end

        local function restoreEnvironment()
            Lighting.FogStart = fogData.Start
            Lighting.FogEnd = fogData.End
            Lighting.FogColor = fogData.Color
            
            for obj, props in pairs(atmosphereData) do
                if obj.Parent then
                    obj.Density = props.Density
                    obj.Offset = props.Offset
                    obj.Color = props.Color
                    obj.Decay = props.Decay
                    obj.Glare = props.Glare
                    obj.Haze = props.Haze
                end
            end
        end

        if state then
            storeAtmospheres()
            connection = Lighting.DescendantAdded:Connect(function(descendant)
                if descendant:IsA("Atmosphere") then
                    atmosphereData[descendant] = {
                        Density = descendant.Density,
                        Offset = descendant.Offset,
                        Color = descendant.Color,
                        Decay = descendant.Decay,
                        Glare = descendant.Glare,
                        Haze = descendant.Haze
                    }
                    descendant:Destroy()
                end
            end)
            
            Lighting.FogEnd = 100000
            for _, obj in ipairs(Lighting:GetChildren()) do
                if obj:IsA("Atmosphere") then
                    obj:Destroy()
                end
            end
        else
            if connection then
                connection:Disconnect()
            end
            restoreEnvironment()
            atmosphereData = {}
        end
    end
})
RightGroupbox:AddToggle('GraphicsToggle', {
    Text = '极简画质',
    Default = false,
    Tooltip = '简化场景材质效果',

    Callback = function(state)
        local originalProperties = {}
        local descendantConnection = nil
        local materialWhitelist = {
            [Enum.Material.Foil] = true,
            [Enum.Material.Neon] = true,
            [Enum.Material.Glacier] = true,
            [Enum.Material.Ice] = true
        }
        local themeColor = Color3.new(0.5, 0.75, 1)

        local function applySimplification(instance)
            if instance:IsA("BasePart") then
                if not originalProperties[instance] then
                    originalProperties[instance] = {
                        Material = instance.Material,
                        Color = instance.Color
                    }
                end
                if not materialWhitelist[instance.Material] then
                    instance.Material = Enum.Material.Foil
                    instance.Color = themeColor
                end
            end
        end

        local function restoreOriginal(instance)
            if originalProperties[instance] then
                instance.Material = originalProperties[instance].Material
                instance.Color = originalProperties[instance].Color
                originalProperties[instance] = nil
            end
        end

        if state then
            for _, obj in ipairs(workspace:GetDescendants()) do
                applySimplification(obj)
            end
            descendantConnection = workspace.DescendantAdded:Connect(function(obj)
                applySimplification(obj)
            end)
        else
            for _, obj in ipairs(workspace:GetDescendants()) do
                restoreOriginal(obj)
            end
            originalProperties = {}
            if descendantConnection then
                descendantConnection:Disconnect()
            end
        end
    end
})


local LS = {
    playernamedied = "",
    dropdown = {},
    LoopTeleport = false,
    message = "",
}

function shuaxinlb(zji)
    LS.dropdown = {}
    if zji == true then
        for _, player in pairs(game.Players:GetPlayers()) do
            table.insert(LS.dropdown, player.Name)
        end
    else
        local lp = game.Players.LocalPlayer
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= lp then
                table.insert(LS.dropdown, player.Name)
            end
        end
    end
end
shuaxinlb(true)

local PlayersDropdown = TeleportGroup:AddDropdown("PlayerSelect", {
    Text = "选择玩家名称",
    Values = LS.dropdown,
    Default = 1,
    Tooltip = "选择目标玩家",
    Callback = function(v)
        LS.playernamedied = v
    end
})

TeleportGroup:AddButton('刷新玩家名称', function()
    shuaxinlb(true)
    PlayersDropdown:SetValues(LS.dropdown)
    Library:Notify({
        Title = "系统提示",
        Description = "玩家列表已刷新",
        Time = 3
    })
end)

TeleportGroup:AddButton('传送到玩家旁边', function()
    local HumRoot = game.Players.LocalPlayer.Character.HumanoidRootPart
    local tp_player = game.Players:FindFirstChild(LS.playernamedied)
    if tp_player and tp_player.Character and tp_player.Character.HumanoidRootPart then
        HumRoot.CFrame = tp_player.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
        Library:Notify({
            Title = "传送成功",
            Description = "已传送到玩家身边",
            Time = 3
        })
    else
        Library:Notify({
            Title = "传送失败",
            Description = "无法传送: 玩家已消失",
            Time = 5
        })
    end
end)

TeleportGroup:AddToggle('LoopTeleport', {
    Text = '循环传送',
    Default = false,
    Tooltip = '持续传送到目标玩家',
    Callback = function(state)
        if state then
            LS.LoopTeleport = true
            Library:Notify({
                Title = "系统提示",
                Description = "已开启循环传送",
                Time = 3
            })
            while LS.LoopTeleport do
                local HumRoot = game.Players.LocalPlayer.Character.HumanoidRootPart
                local tp_player = game.Players:FindFirstChild(LS.playernamedied)
                if tp_player and tp_player.Character and tp_player.Character.HumanoidRootPart then
                    HumRoot.CFrame = tp_player.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
                end
                task.wait()
            end
        else
            LS.LoopTeleport = false
            Library:Notify({
                Title = "系统提示",
                Description = "已关闭循环传送",
                Time = 3
            })
        end
    end
})

TeleportGroup:AddButton('把玩家传送过来', function()
    local HumRoot = game.Players.LocalPlayer.Character.HumanoidRootPart
    local tp_player = game.Players:FindFirstChild(LS.playernamedied)
    if tp_player and tp_player.Character and tp_player.Character.HumanoidRootPart then
        tp_player.Character.HumanoidRootPart.CFrame = HumRoot.CFrame + Vector3.new(0, 3, 0)
        Library:Notify({
            Title = "传送成功",
            Description = "已将玩家传送过来",
            Time = 3
        })
    else
        Library:Notify({
            Title = "传送失败",
            Description = "无法传送: 玩家已消失",
            Time = 5
        })
    end
end)

TeleportGroup:AddToggle('LoopTeleportToMe', {
    Text = '循环传送玩家过来',
    Default = false,
    Tooltip = '持续将玩家传送到自己身边',
    Callback = function(state)
        if state then
            LS.LoopTeleport = true
            Library:Notify({
                Title = "系统提示",
                Description = "已开启循环传送玩家过来",
                Time = 3
            })
            while LS.LoopTeleport do
                local HumRoot = game.Players.LocalPlayer.Character.HumanoidRootPart
                local tp_player = game.Players:FindFirstChild(LS.playernamedied)
                if tp_player and tp_player.Character and tp_player.Character.HumanoidRootPart then
                    tp_player.Character.HumanoidRootPart.CFrame = HumRoot.CFrame + Vector3.new(0, 3, 0)
                end
                task.wait()
            end
        else
            LS.LoopTeleport = false
            Library:Notify({
                Title = "系统提示",
                Description = "已关闭循环传送玩家过来",
                Time = 3
            })
        end
    end
})

TeleportGroup:AddToggle('SpectatePlayer', {
    Text = '查看玩家',
    Default = false,
    Tooltip = '查看目标玩家视角',
    Callback = function(state)
        if state then
            game:GetService('Workspace').CurrentCamera.CameraSubject = game:GetService('Players'):FindFirstChild(LS.playernamedied).Character.Humanoid
            Library:Notify({
                Title = "视角切换",
                Description = "已切换到玩家视角",
                Time = 3
            })
        else
            local lp = game.Players.LocalPlayer
            game:GetService('Workspace').CurrentCamera.CameraSubject = lp.Character.Humanoid
            Library:Notify({
                Title = "视角切换",
                Description = "已恢复本地视角",
                Time = 3
            })
        end
    end
})

FlingGroup:AddButton('甩飞一次', function()
    if LS.playernamedied == nil then 
        Library:Notify({
            Title = "操作失败",
            Description = "请先选择玩家",
            Time = 3
        })
        return 
    end
    
    local Targets = {LS.playernamedied}
    local Players = game:GetService("Players")
    local Player = Players.LocalPlayer
    local AllBool = false

    local GetPlayer = function(Name)
        Name = Name:lower()
        if Name == "all" or Name == "others" then
            AllBool = true
            return
        elseif Name == "random" then
            local GetPlayers = Players:GetPlayers()
            if table.find(GetPlayers,Player) then table.remove(GetPlayers,table.find(GetPlayers,Player)) end
            return GetPlayers[math.random(#GetPlayers)]
        elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
            for _,x in next, Players:GetPlayers() do
                if x ~= Player then
                    if x.Name:lower():match("^"..Name) then
                        return x;
                    elseif x.DisplayName:lower():match("^"..Name) then
                        return x;
                    end
                end
            end
        else
            return
        end
    end

    local SkidFling = function(TargetPlayer)
        local Character = Player.Character
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
        local RootPart = Humanoid and Humanoid.RootPart

        local TCharacter = TargetPlayer.Character
        local THumanoid
        local TRootPart
        local THead
        local Accessory
        local Handle

        if TCharacter:FindFirstChildOfClass("Humanoid") then
            THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
        end
        if THumanoid and THumanoid.RootPart then
            TRootPart = THumanoid.RootPart
        end
        if TCharacter:FindFirstChild("Head") then
            THead = TCharacter.Head
        end
        if TCharacter:FindFirstChildOfClass("Accessory") then
            Accessory = TCharacter:FindFirstChildOfClass("Accessory")
        end
        if Accessory and Accessory:FindFirstChild("Handle") then
            Handle = Accessory.Handle
        end

        if Character and Humanoid and RootPart then
            if RootPart.Velocity.Magnitude < 50 then
                getgenv().OldPos = RootPart.CFrame
            end
            if THumanoid and THumanoid.Sit and not AllBool then
                Library:Notify({
                    Title = "操作失败",
                    Description = "目标玩家已坐下",
                    Time = 3
                })
                return
            end
            if THead then
                workspace.CurrentCamera.CameraSubject = THead
            elseif not THead and Handle then
                workspace.CurrentCamera.CameraSubject = Handle
            elseif THumanoid and TRootPart then
                workspace.CurrentCamera.CameraSubject = THumanoid
            end
            if not TCharacter:FindFirstChildWhichIsA("BasePart") then
                return
            end

            local FPos = function(BasePart, Pos, Ang)
                RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
                Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
                RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
                RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
            end

            local SFBasePart = function(BasePart)
                local TimeToWait = 2
                local Time = tick()
                local Angle = 0

                repeat
                    if RootPart and THumanoid then
                        if BasePart.Velocity.Magnitude < 50 then
                            Angle = Angle + 100

                            FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()
                        else
                            FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                            task.wait()
                        end
                    else
                        break
                    end
                until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
            end

            workspace.FallenPartsDestroyHeight = 0/0

            local BV = Instance.new("BodyVelocity")
            BV.Name = "EpixVel"
            BV.Parent = RootPart
            BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
            BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)

            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

            if TRootPart and THead then
                if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                    SFBasePart(THead)
                else
                    SFBasePart(TRootPart)
                end
            elseif TRootPart and not THead then
                SFBasePart(TRootPart)
            elseif not TRootPart and THead then
                SFBasePart(THead)
            elseif not TRootPart and not THead and Accessory and Handle then
                SFBasePart(Handle)
            else
                Library:Notify({
                    Title = "系统提示",
                    Description = "甩飞操作已执行",
                    Time = 3
                })
                return
            end

            BV:Destroy()
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
            workspace.CurrentCamera.CameraSubject = Humanoid

            repeat
                RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
                Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
                Humanoid:ChangeState("GettingUp")
                table.foreach(Character:GetChildren(), function(_, x)
                    if x:IsA("BasePart") then
                        x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                    end
                end)
                task.wait()
            until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
            workspace.FallenPartsDestroyHeight = getgenv().FPDH
        else
            Library:Notify({
                Title = "操作失败",
                Description = "无法执行甩飞",
                Time = 3
            })
        end
    end

    if Targets[1] then for _,x in next, Targets do GetPlayer(x) end else return end

    if AllBool then
        for _,x in next, Players:GetPlayers() do
            SkidFling(x)
        end
    end

    for _,x in next, Targets do
        if GetPlayer(x) and GetPlayer(x) ~= Player then
            if GetPlayer(x).UserId ~= 1414978355 then
                local TPlayer = GetPlayer(x)
                if TPlayer then
                    SkidFling(TPlayer)
                end
            else
                Library:Notify({
                    Title = "操作失败",
                    Description = "目标玩家无效",
                    Time = 3
                })
            end
        elseif not GetPlayer(x) and not AllBool then
            Library:Notify({
                Title = "操作失败",
                Description = "未找到目标玩家",
                Time = 3
            })
        end
    end
end)

FlingGroup:AddToggle('AutoFling', {
    Text = '循环甩飞',
    Default = false,
    Tooltip = '持续甩飞目标玩家',
    Callback = function(t)
        if LS.playernamedied == nil then 
            Library:Notify({
                Title = "操作失败",
                Description = "请先选择玩家",
                Time = 3
            })
            return 
        end
        
        getgenv().autofling = t
        spawn(function()
            while autofling do 
                task.wait()
                pcall(function()
                    local Targets = {LS.playernamedied}
                    local Players = game:GetService("Players")
                    local Player = Players.LocalPlayer
                    local AllBool = false

                    local GetPlayer = function(Name)
                        Name = Name:lower()
                        if Name == "all" or Name == "others" then
                            AllBool = true
                            return
                        elseif Name == "random" then
                            local GetPlayers = Players:GetPlayers()
                            if table.find(GetPlayers,Player) then table.remove(GetPlayers,table.find(GetPlayers,Player)) end
                            return GetPlayers[math.random(#GetPlayers)]
                        elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
                            for _,x in next, Players:GetPlayers() do
                                if x ~= Player then
                                    if x.Name:lower():match("^"..Name) then
                                        return x;
                                    elseif x.DisplayName:lower():match("^"..Name) then
                                        return x;
                                    end
                                end
                            end
                        else
                            return
                        end
                    end

                    local SkidFling = function(TargetPlayer)
                        local Character = Player.Character
                        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
                        local RootPart = Humanoid and Humanoid.RootPart

                        local TCharacter = TargetPlayer.Character
                        local THumanoid
                        local TRootPart
                        local THead
                        local Accessory
                        local Handle

                        if TCharacter:FindFirstChildOfClass("Humanoid") then
                            THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
                        end
                        if THumanoid and THumanoid.RootPart then
                            TRootPart = THumanoid.RootPart
                        end
                        if TCharacter:FindFirstChild("Head") then
                            THead = TCharacter.Head
                        end
                        if TCharacter:FindFirstChildOfClass("Accessory") then
                            Accessory = TCharacter:FindFirstChildOfClass("Accessory")
                        end
                        if Accessory and Accessory:FindFirstChild("Handle") then
                            Handle = Accessory.Handle
                        end

                        if Character and Humanoid and RootPart then
                            if RootPart.Velocity.Magnitude < 50 then
                                getgenv().OldPos = RootPart.CFrame
                            end
                            if THumanoid and THumanoid.Sit and not AllBool then
                                Library:Notify({
                                    Title = "操作失败",
                                    Description = "目标玩家已坐下",
                                    Time = 3
                                })
                                return
                            end
                            if THead then
                                workspace.CurrentCamera.CameraSubject = THead
                            elseif not THead and Handle then
                                workspace.CurrentCamera.CameraSubject = Handle
                            elseif THumanoid and TRootPart then
                                workspace.CurrentCamera.CameraSubject = THumanoid
                            end
                            if not TCharacter:FindFirstChildWhichIsA("BasePart") then
                                return
                            end

                            local FPos = function(BasePart, Pos, Ang)
                                RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
                                Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
                                RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
                                RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
                            end

                            local SFBasePart = function(BasePart)
                                local TimeToWait = 2
                                local Time = tick()
                                local Angle = 0

                                repeat
                                    if RootPart and THumanoid then
                                        if BasePart.Velocity.Magnitude < 50 then
                                            Angle = Angle + 100

                                            FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                                            task.wait()

                                            FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                            task.wait()

                                            FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                            task.wait()

                                            FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                            task.wait()

                                            FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                                            task.wait()

                                            FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                                            task.wait()
                                        else
                                            FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                                            task.wait()

                                            FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                                            task.wait()

                                            FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                                            task.wait()

                                            FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                                            task.wait()

                                            FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                                            task.wait()

                                            FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                                            task.wait()

                                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                                            task.wait()

                                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                                            task.wait()

                                            FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
                                            task.wait()

                                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                                            task.wait()
                                        end
                                    else
                                        break
                                    end
                                until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
                            end

                            workspace.FallenPartsDestroyHeight = 0/0

                            local BV = Instance.new("BodyVelocity")
                            BV.Name = "EpixVel"
                            BV.Parent = RootPart
                            BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
                            BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)

                            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

                            if TRootPart and THead then
                                if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                                    SFBasePart(THead)
                                else
                                    SFBasePart(TRootPart)
                                end
                            elseif TRootPart and not THead then
                                SFBasePart(TRootPart)
                            elseif not TRootPart and THead then
                                SFBasePart(THead)
                            elseif not TRootPart and not THead and Accessory and Handle then
                                SFBasePart(Handle)
                            else
                                Library:Notify({
                                    Title = "系统提示",
                                    Description = "甩飞操作已执行",
                                    Time = 3
                                })
                                return
                            end

                            BV:Destroy()
                            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                            workspace.CurrentCamera.CameraSubject = Humanoid

                            repeat
                                RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
                                Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
                                Humanoid:ChangeState("GettingUp")
                                table.foreach(Character:GetChildren(), function(_, x)
                                    if x:IsA("BasePart") then
                                        x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                                    end
                                end)
                                task.wait()
                            until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
                            workspace.FallenPartsDestroyHeight = getgenv().FPDH
                        else
                            Library:Notify({
                                Title = "操作失败",
                                Description = "无法执行甩飞",
                                Time = 3
                            })
                        end
                    end

                    if Targets[1] then for _,x in next, Targets do GetPlayer(x) end else return end

                    if AllBool then
                        for _,x in next, Players:GetPlayers() do
                            SkidFling(x)
                        end
                    end

                    for _,x in next, Targets do
                        if GetPlayer(x) and GetPlayer(x) ~= Player then
                            if GetPlayer(x).UserId ~= 1414978355 then
                                local TPlayer = GetPlayer(x)
                                if TPlayer then
                                    SkidFling(TPlayer)
                                end
                            else
                                Library:Notify({
                                    Title = "操作失败",
                                    Description = "目标玩家无效",
                                    Time = 3
                                })
                            end
                        elseif not GetPlayer(x) and not AllBool then
                            Library:Notify({
                                Title = "操作失败",
                                Description = "未找到目标玩家",
                                Time = 3
                            })
                        end
                    end
                end)
            end
        end)
    end
})

local targetModelName = nil
local distanceToggleState = false
local highlightToggleState = false
local textSize = 15
local textColor = Color3.new(0, 1, 1)

local distanceUpdateConnection = nil
local highlightConnection = nil
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local function parseColor(input)
    if input:match("^%d+%,%d+%,%d+$") then
        local r, g, b = input:match("(%d+),(%d+),(%d+)")
        return Color3.new(r/255, g/255, b/255)
    else
        local success, color = pcall(function()
            return Color3.new(tonumber(input))
        end)
        return success and color or textColor
    end
end

local function startGlobalDistanceUpdate()
    if distanceUpdateConnection then
        distanceUpdateConnection:Disconnect()
    end
    distanceUpdateConnection = RunService.Heartbeat:Connect(function()
        local localPlayer = Players.LocalPlayer
        local character = localPlayer and localPlayer.Character
        local humanoidRoot = character and character:FindFirstChild("HumanoidRootPart")
        for _, model in ipairs(workspace:GetDescendants()) do
            if model:IsA("Model") and model.Name == targetModelName then
                local billboard = model:FindFirstChild("DoorBillboard")
                if billboard then
                    local textLabel = billboard:FindFirstChild("DoorLabel")
                    if textLabel then
                        local modelPart = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
                        if humanoidRoot and modelPart then
                            local distance = (humanoidRoot.Position - modelPart.Position).Magnitude
                            textLabel.Text = string.format(" %s\n [%.1f米]", targetModelName, distance)
                        end
                    end
                end
            end
        end
    end)
end

local function stopGlobalDistanceUpdate()
    if distanceUpdateConnection then
        distanceUpdateConnection:Disconnect()
        distanceUpdateConnection = nil
    end
end

local function updateAllBillboardsToNameOnly()
    for _, model in ipairs(workspace:GetDescendants()) do
        if model:IsA("Model") and model.Name == targetModelName then
            local billboard = model:FindFirstChild("DoorBillboard")
            if billboard then
                local textLabel = billboard:FindFirstChild("DoorLabel")
                if textLabel then
                    textLabel.Text = string.format(" %s", targetModelName)
                end
            end
        end
    end
end

local function toggleHighlight(state)
    for _, model in ipairs(workspace:GetDescendants()) do
        if model:IsA("Model") and model.Name == targetModelName then
            if state then
                if not model:FindFirstChild("DoorHighlight") then
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "DoorHighlight"
                    highlight.Parent = model
                    highlight.Adornee = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
                    highlight.FillColor = Color3.new(0, 1, 1)
                    highlight.OutlineColor = Color3.new(0, 0, 0)
                    highlight.FillTransparency = 0.3
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                end
            else
                if model:FindFirstChild("DoorHighlight") then
                    model.DoorHighlight:Destroy()
                end
            end
        end
    end
end

local function updateAllBillboardsTextSize()
    for _, model in ipairs(workspace:GetDescendants()) do
        if model:IsA("Model") and model.Name == targetModelName then
            local billboard = model:FindFirstChild("DoorBillboard")
            if billboard then
                local textLabel = billboard:FindFirstChild("DoorLabel")
                if textLabel then
                    textLabel.TextSize = textSize
                end
            end
        end
    end
end

local function updateAllBillboardsTextColor()
    for _, model in ipairs(workspace:GetDescendants()) do
        if model:IsA("Model") and model.Name == targetModelName then
            local billboard = model:FindFirstChild("DoorBillboard")
            if billboard then
                local textLabel = billboard:FindFirstChild("DoorLabel")
                if textLabel then
                    textLabel.TextColor3 = textColor
                end
            end
        end
    end
end

local function createBillboard(model)
    if not model:FindFirstChild("DoorBillboard") then
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "DoorBillboard"
        billboard.Parent = model
        billboard.Adornee = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
        billboard.Size = UDim2.new(0, 200, 0, 40)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true

        local textLabel = Instance.new("TextLabel")
        textLabel.Name = "DoorLabel"
        textLabel.Parent = billboard
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Font = Enum.Font.SourceSansBold
        textLabel.TextColor3 = textColor
        textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
        textLabel.TextStrokeTransparency = 0
        textLabel.TextSize = textSize
        textLabel.Text = distanceToggleState and string.format(" %s\n [%.1f米]", targetModelName, 0) or string.format(" %s", targetModelName)
    end
end

bRightGroupbox:AddToggle('Main', {
    Text = '透视',
    Default = false,
    Callback = function(state)
        local ModelConnection = nil
        
        local function cleanup()
            stopGlobalDistanceUpdate()
            for _, model in ipairs(workspace:GetDescendants()) do
                if model:IsA("Model") then
                    if model:FindFirstChild("DoorBillboard") then
                        model.DoorBillboard:Destroy()
                    end
                end
            end
            if ModelConnection then
                ModelConnection:Disconnect()
                ModelConnection = nil
            end
        end

        if state then
            cleanup()
            if not targetModelName or targetModelName == "" then
                Library:Notify("请先输入要透视的模型名字", 2, 4590657391)
                return
            end

            for _, model in ipairs(workspace:GetDescendants()) do
                if model.Name == targetModelName and model:IsA("Model") then
                    createBillboard(model)
                end
            end

            ModelConnection = workspace.DescendantAdded:Connect(function(model)
                if model.Name == targetModelName and model:IsA("Model") then
                    createBillboard(model)
                    if highlightToggleState then
                        toggleHighlight(true)
                    end
                end
            end)

            if distanceToggleState then
                startGlobalDistanceUpdate()
            end
        else
            cleanup()
        end
    end
})

bRightGroupbox:AddToggle('DistanceToggle', {
    Text = '显示距离',
    Default = false,
    Callback = function(state)
        distanceToggleState = state
        if state then
            startGlobalDistanceUpdate()
        else
            stopGlobalDistanceUpdate()
            updateAllBillboardsToNameOnly()
        end
    end
})

bRightGroupbox:AddToggle('HighlightToggle', {
    Text = '显示高亮',
    Default = false,
    Callback = function(state)
        highlightToggleState = state
        toggleHighlight(state)
        
        if state then
            highlightConnection = workspace.DescendantAdded:Connect(function(model)
                if model.Name == targetModelName and model:IsA("Model") then
                    if highlightToggleState then
                        toggleHighlight(true)
                    end
                end
            end)
        else
            if highlightConnection then
                highlightConnection:Disconnect()
                highlightConnection = nil
            end
        end
    end
})

bRightGroupbox:AddInput('MyTextbox', {
    Default = '',
    Numeric = false,
    Finished = true,
    Text = '模型名字',
    Tooltip = 'esp',
    Placeholder = '输入你要透视的模型名字',
    Callback = function(Value)
        targetModelName = Value
    end
})

bRightGroupbox:AddInput('ColorInput', {
    Default = '0,255,255',
    Numeric = false,
    Finished = true,
    Text = '文字颜色 (RGB/颜色名)',
    Tooltip = '示例: 255,0,0 或 red',
    Placeholder = '输入颜色值',
    Callback = function(Value)
        local newColor = parseColor(Value)
        if newColor ~= textColor then
            textColor = newColor
            updateAllBillboardsTextColor()
        end
    end
})

bRightGroupbox:AddSlider('MySlider', {
    Text = 'ESP显示文字大小',
    Default = 15,
    Min = 0,
    Max = 60,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
        textSize = Value
        updateAllBillboardsTextSize()
    end
})
local textColor = Color3.fromRGB(0, 255, 0)
local textSize = 15
local showDistance = false
local teamCheck = false
local highlightEnabled = false
local highlightColor = Color3.fromRGB(255, 255, 0)

local ESPManager = {
    Cache = {},
    Connections = {
        Players = {},
        Global = {}
    },
    HighlightCache = {},
    Active = false
}

local function deepCleanPlayer(player)
    if not ESPManager.Cache[player] then return end

    local function safeDisconnect(conn)
        if typeof(conn) == "RBXScriptConnection" and conn.Connected then
            conn:Disconnect()
        end
    end

    pcall(function()
        safeDisconnect(ESPManager.Cache[player].heartbeat)
        safeDisconnect(ESPManager.Cache[player].ancestry)
    end)

    pcall(function()
        if ESPManager.Cache[player].billboard then
            ESPManager.Cache[player].billboard:Destroy()
        end
    end)

    ESPManager.Cache[player] = nil

    if ESPManager.Connections.Players[player] then
        for _, conn in pairs(ESPManager.Connections.Players[player]) do
            safeDisconnect(conn)
        end
        ESPManager.Connections.Players[player] = nil
    end

    if ESPManager.HighlightCache[player] then
        ESPManager.HighlightCache[player]:Destroy()
        ESPManager.HighlightCache[player] = nil
    end
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local ESPObjects = {}

local ESPSettings = {
    PlayerESP = false,
    DistanceESP = false,
    NameESP = false,
    HealthESP = false,
    Box3D = false,
    TeamESP = false,
    RayESP = false,
    OnlyEnemies = false
}

local function GetTeamColor(player)
    if ESPSettings.TeamESP and player.Team then
        return player.TeamColor.Color
    else
        return Color3.fromRGB(255, 255, 255)
    end
end

local function IsEnemy(player)
    return not ESPSettings.OnlyEnemies or (player.Team ~= LocalPlayer.Team)
end

local function CreateESP(Player)
    if Player == LocalPlayer or ESPObjects[Player] then return end

    local Box3D = Instance.new("Highlight")
    Box3D.FillTransparency = 0.5
    Box3D.OutlineTransparency = 0
    Box3D.Parent = game.CoreGui
    Box3D.Enabled = false

    local Box2D = Drawing.new("Square")
    Box2D.Thickness = 2
    Box2D.Filled = false
    Box2D.Visible = false

    local Name = Drawing.new("Text")
    Name.Size = 18
    Name.Center = true
    Name.Outline = true
    Name.Visible = false

    local Distance = Drawing.new("Text")
    Distance.Size = 16
    Distance.Center = true
    Distance.Visible = false

    local Health = Drawing.new("Text")
    Health.Size = 16
    Health.Center = true
    Health.Visible = false

    local Ray = Drawing.new("Line")
    Ray.Thickness = 2
    Ray.Visible = false

    ESPObjects[Player] = {
        Box = Box2D,
        Name = Name,
        Distance = Distance,
        Health = Health,
        Ray = Ray,
        Box3D = Box3D
    }

    local function Update3D()
        if ESPObjects[Player] and Player.Character then
            ESPObjects[Player].Box3D.Adornee = Player.Character
        end
    end

    Player.CharacterAdded:Connect(function()
        wait(1)
        Update3D()
    end)

    Update3D()
end

local function RemoveESP(Player)
    local obj = ESPObjects[Player]
    if not obj then return end
    for _, v in pairs(obj) do
        if typeof(v) == "Instance" then
            v:Destroy()
        elseif typeof(v) == "Drawing" then
            v:Remove()
        end
    end
    ESPObjects[Player] = nil
end

RunService.RenderStepped:Connect(function()
    for Player, obj in pairs(ESPObjects) do
        local Char = Player.Character
        local HRP = Char and Char:FindFirstChild("HumanoidRootPart")
        local Humanoid = Char and Char:FindFirstChildOfClass("Humanoid")

        if not Char or not HRP or not Humanoid or Humanoid.Health <= 0 or not IsEnemy(Player) then
            obj.Box.Visible = false
            obj.Name.Visible = false
            obj.Distance.Visible = false
            obj.Health.Visible = false
            obj.Ray.Visible = false
            obj.Box3D.Enabled = false
            continue
        end

        local pos, visible = Camera:WorldToViewportPoint(HRP.Position)
        local teamColor = GetTeamColor(Player)

        if visible then
            if ESPSettings.Box3D then
                obj.Box3D.Adornee = Char
                obj.Box3D.FillColor = teamColor
                obj.Box3D.OutlineColor = teamColor
                obj.Box3D.Enabled = true
            else
                obj.Box3D.Enabled = false
            end

            if ESPSettings.PlayerESP then
                obj.Box.Size = Vector2.new(50, 100)
                obj.Box.Position = Vector2.new(pos.X - 25, pos.Y - 50)
                obj.Box.Color = teamColor
                obj.Box.Visible = true
            else
                obj.Box.Visible = false
            end

            if ESPSettings.NameESP then
                obj.Name.Text = Player.Name
                obj.Name.Position = Vector2.new(pos.X, pos.Y - 60)
                obj.Name.Color = teamColor
                obj.Name.Visible = true
            else
                obj.Name.Visible = false
            end

            if ESPSettings.DistanceESP and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local dist = math.floor((LocalPlayer.Character.HumanoidRootPart.Position - HRP.Position).Magnitude)
                obj.Distance.Text = "["..dist.."m]"
                obj.Distance.Position = Vector2.new(pos.X, pos.Y + 35)
                obj.Distance.Color = teamColor
                obj.Distance.Visible = true
            else
                obj.Distance.Visible = false
            end

            if ESPSettings.HealthESP then
                local ratio = Humanoid.Health / Humanoid.MaxHealth
                obj.Health.Text = "HP: "..math.floor(Humanoid.Health)
                obj.Health.Position = Vector2.new(pos.X, pos.Y + 55)
                obj.Health.Color = Color3.fromRGB(255 - ratio * 255, ratio * 255, 0)
                obj.Health.Visible = true
            else
                obj.Health.Visible = false
            end

            if ESPSettings.RayESP and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local localPos = Camera:WorldToViewportPoint(LocalPlayer.Character.HumanoidRootPart.Position)
                obj.Ray.From = Vector2.new(localPos.X, localPos.Y)
                obj.Ray.To = Vector2.new(pos.X, pos.Y)
                obj.Ray.Color = teamColor
                obj.Ray.Visible = true
            else
                obj.Ray.Visible = false
            end
        else
            obj.Box.Visible = false
            obj.Name.Visible = false
            obj.Distance.Visible = false
            obj.Health.Visible = false
            obj.Ray.Visible = false
            obj.Box3D.Enabled = false
        end
    end
end)

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        CreateESP(player)
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        CreateESP(player)
    end
end)

Players.PlayerRemoving:Connect(RemoveESP)

esp:AddToggle("mot1", { Text = "玩家ESP", Default = false, Callback = function(state) ESPSettings.PlayerESP = state end })
esp:AddToggle("mot2", { Text = "距离显示", Default = false, Callback = function(state) ESPSettings.DistanceESP = state end })
esp:AddToggle("mot3", { Text = "名字", Default = false, Callback = function(state) ESPSettings.NameESP = state end })
esp:AddToggle("mot4", { Text = "血量", Default = false, Callback = function(state) ESPSettings.HealthESP = state end })
esp:AddToggle("mot5", { Text = "3D玩家ESP", Default = false, Callback = function(state) ESPSettings.Box3D = state end })
esp:AddToggle("mot9", { Text = "队伍ESP", Default = false, Callback = function(state) ESPSettings.TeamESP = state end })
esp:AddToggle("mot7", { Text = "射线", Default = false, Callback = function(state) ESPSettings.RayESP = state end })
esp:AddToggle("mot10", { Text = "只显示敌人", Default = false, Callback = function(state) ESPSettings.OnlyEnemies = state end })

ez:AddToggle('Toggle', {
    Text = '坐下',
    Default = false,
    Callback = function(Value)
        if Value then
      game.Players.LocalPlayer.Character.Humanoid.Sit = true
    else
      game.Players.LocalPlayer.Character.Humanoid.Sit = false
    end
    end
})

ez:AddToggle('Toggle', {
    Text = '固定方向移动视角',
    Default = false,
    Callback = function(Value)
    if Value then
      game.Players.LocalPlayer.Character.Humanoid.AutoRotate = false
    else
      game.Players.LocalPlayer.Character.Humanoid.AutoRotate= true
    end
    end
})

ez:AddToggle('Toggle', {
    Text = '站着不动',
    Default = false,
    Callback = function(Value)
    if Value then
      game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
    else
      game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
    end
    end
})

RightGroupbox:AddSlider('MySlider', {
    Text = '视野',
    Default = workspace.CurrentCamera.FieldOfView,
    Min = 0,
    Max = 120,
    Rounding = 0,
    Compact = false,
    Callback = function(Value)
    workspace.CurrentCamera.FieldOfView = Value
    end
})

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Camera = workspace.CurrentCamera

local Settings = {
    AimbotEnabled = false,
    AimDistance = 100,
    CircleSize = 100,
    AimPriority = "距离近",
    AimPart = "Head",
    TeamCheck = false,
    AliveCheck = false,
    WallCheck = false,
    PredictionEnabled = false,
    PredictionDistance = 0.1,
    StaticFOV = true,
    ShowCircle = true,
    CircleColor = Color3.fromRGB(255, 255, 255),
    CircleColorMode = "白色",
    ShowTargetCircle = true,
    TargetColor = Color3.new(1, 0, 0),
    ShowTargetName = false,
}

local FOVCircle = Drawing.new("Circle")
FOVCircle.Visible = Settings.AimbotEnabled and Settings.ShowCircle
FOVCircle.Thickness = 2
FOVCircle.Filled = false
FOVCircle.Radius = Settings.CircleSize
FOVCircle.Position = Camera.ViewportSize / 2
FOVCircle.Color = Settings.CircleColor

local TargetDot = Drawing.new("Circle")
TargetDot.Visible = false
TargetDot.Radius = 5
TargetDot.Filled = true
TargetDot.Thickness = 2
TargetDot.Color = Settings.TargetColor

local NameText = Drawing.new("Text")
NameText.Size = 16
NameText.Center = true
NameText.Outline = true
NameText.Visible = false
NameText.Color = Color3.fromRGB(255, 255, 255)

local function updateCircle()
    FOVCircle.Visible = Settings.AimbotEnabled and Settings.ShowCircle
    FOVCircle.Position = Camera.ViewportSize / 2

    if Settings.StaticFOV then
        FOVCircle.Radius = Settings.CircleSize
    else
        local target = getClosestPlayer()
        if target then
            local root = target.Parent:FindFirstChild("HumanoidRootPart")
            if root then
                FOVCircle.Radius = math.clamp(Settings.CircleSize + root.Velocity.Magnitude * 0.3, 10, 500)
            end
        end
    end
    FOVCircle.Color = Settings.CircleColor
end

function getPredictedPosition(part)
    if not part or not part.Parent then return part.Position end
    local root = part.Parent:FindFirstChild("HumanoidRootPart")
    if root and Settings.PredictionEnabled then
        return part.Position + root.Velocity * Settings.PredictionDistance
    end
    return part.Position
end

function getClosestPlayer()
    local closest = nil
    local shortest = math.huge
    local screenCenter = Camera.ViewportSize / 2
    local myTeam = Players.LocalPlayer.Team

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer and player.Character then
            local part = player.Character:FindFirstChild(Settings.AimPart)
            if part then
                if Settings.AliveCheck and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health <= 0 then
                    continue
                end
                if Settings.TeamCheck and player.Team == myTeam then
                    continue
                end

                local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
                local dist = (Vector2.new(screenPos.X, screenPos.Y) - screenCenter).Magnitude

                if onScreen and dist < shortest and dist < Settings.CircleSize then
                    if Settings.WallCheck then
                        local origin = Camera.CFrame.Position
                        local direction = (part.Position - origin)
                        local rayParams = RaycastParams.new()
                        rayParams.FilterDescendantsInstances = {Players.LocalPlayer.Character}
                        rayParams.FilterType = Enum.RaycastFilterType.Blacklist
                        local result = workspace:Raycast(origin, direction, rayParams)
                        if result and not result.Instance:IsDescendantOf(player.Character) then
                            continue
                        end
                    end
                    shortest = dist
                    closest = part
                end
            end
        end
    end
    return closest
end

local AimbotConnection = nil

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end

    if input.KeyCode == Enum.KeyCode.Delete then
        if AimbotConnection then AimbotConnection:Disconnect() AimbotConnection = nil end
        FOVCircle:Remove()
        TargetDot:Remove()
        NameText:Remove()
    elseif input.KeyCode == Enum.KeyCode.CapsLock then
        Settings.AimPart = (Settings.AimPart == "Head") and "HumanoidRootPart" or "Head"
    elseif input.KeyCode == Enum.KeyCode.PageUp then
        Settings.AimDistance = math.clamp(Settings.AimDistance + 10, 10, 500)
    elseif input.KeyCode == Enum.KeyCode.PageDown then
        Settings.AimDistance = math.clamp(Settings.AimDistance - 10, 10, 500)
    end
end)

SZW:AddSlider('AimDistanceSlider', {
    Text = '自瞄距离',
    Default = 100,
    Min = 10,
    Max = 500,
    Callback = function(value) Settings.AimDistance = value end
})

SZW:AddSlider('CircleSizeSlider', {
    Text = '圈圈大小',
    Default = 100,
    Min = 10,
    Max = 500,
    Callback = function(value) Settings.CircleSize = value end
})

SZW:AddSlider('PredictionDistanceSlider', {
    Text = '预判距离',
    Default = 0.1,
    Min = 0.01,
    Max = 1,
    Increment = 0.01,
    Callback = function(value) Settings.PredictionDistance = value end
})

SZW:AddDropdown('BodyPartDropdown', {
    Text = '瞄准部位',
    Values = { "Head", "Torso", "HumanoidRootPart", "LeftUpperArm", "RightFoot" },
    Default = "Head",
    Callback = function(value) Settings.AimPart = value end
})

SZW:AddDropdown('AimPriorityDropdown', {
    Text = '优先自瞄',
    Values = { "距离远", "距离近" },
    Default = "距离近",
    Callback = function(value) Settings.AimPriority = value end
})

SZW:AddDropdown('CircleColorDropdown', {
    Text = '圈圈颜色',
    Values = { "白色", "红色", "绿色", "蓝色", "彩虹" },
    Default = "白色",
    Callback = function(value)
        Settings.CircleColorMode = value
        if value == "红色" then
            Settings.CircleColor = Color3.fromRGB(255, 0, 0)
        elseif value == "绿色" then
            Settings.CircleColor = Color3.fromRGB(0, 255, 0)
        elseif value == "蓝色" then
            Settings.CircleColor = Color3.fromRGB(0, 0, 255)
        elseif value == "彩虹" then
            coroutine.wrap(function()
                while Settings.AimbotEnabled and Settings.CircleColorMode == "彩虹" do
                    for h = 0, 360, 5 do
                        if not Settings.AimbotEnabled or Settings.CircleColorMode ~= "彩虹" then return end
                        Settings.CircleColor = Color3.fromHSV(h / 360, 1, 1)
                        wait(0.05)
                    end
                end
            end)()
        else
            Settings.CircleColor = Color3.fromRGB(255, 255, 255)
        end
    end
})

SZW:AddToggle('StaticFOVToggle', {
    Text = '静态FOV圈',
    Default = false,
    Callback = function(state) Settings.StaticFOV = state end
})

SZW:AddToggle('ShowCircleToggle', {
    Text = '显示圈圈',
    Default = false,
    Callback = function(state) 
        Settings.ShowCircle = state 
        updateCircle()
    end
})

SZW:AddToggle('TeamCheck', {
    Text = '队伍检测',
    Default = false,
    Callback = function(state) Settings.TeamCheck = state end
})

SZW:AddToggle('AliveCheck', {
    Text = '活体检测',
    Default = false,
    Callback = function(state) Settings.AliveCheck = state end
})

SZW:AddToggle('WallCheck', {
    Text = '墙壁检测',
    Default = false,
    Callback = function(state) Settings.WallCheck = state end
})

SZW:AddToggle('PredictionEnabled', {
    Text = '启用预判',
    Default = false,
    Callback = function(state) Settings.PredictionEnabled = state end
})

SZW:AddToggle('ShowTargetCircle', {
    Text = '显示目标红圈',
    Default = false,
    Callback = function(state)
        Settings.ShowTargetCircle = state
        if not state then TargetDot.Visible = false end
    end
})

SZW:AddToggle('ShowTargetName', {
    Text = '显示目标名称',
    Default = false,
    Callback = function(state)
        Settings.ShowTargetName = state
        if not state then NameText.Visible = false end
    end
})

SZW:AddLabel('Color'):AddColorPicker('ColorPicker', {
    Default = Color3.new(1, 0, 0),
    Title = '红圈颜色',
    Transparency = 0,
    Callback = function(Value)
        Settings.TargetColor = Value
        TargetDot.Color = Value
    end
})

SZW:AddToggle('AimbotEnabled', {
    Text = '启用自瞄',
    Default = false,
    Callback = function(state)
        Settings.AimbotEnabled = state
        if state then
            AimbotConnection = RunService.RenderStepped:Connect(function()
                updateCircle()
                local target = getClosestPlayer()
                if target then
                    local predicted = getPredictedPosition(target)
                    local look = (predicted - Camera.CFrame.Position).Unit
                    Camera.CFrame = CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position + look)

                    local screenPos, onScreen = Camera:WorldToViewportPoint(predicted)
                    if onScreen then
                        if Settings.ShowTargetCircle then
                            TargetDot.Position = Vector2.new(screenPos.X, screenPos.Y)
                            TargetDot.Color = Settings.TargetColor
                            TargetDot.Visible = true
                        end
                        if Settings.ShowTargetName then
                            for _, player in ipairs(Players:GetPlayers()) do
                                if player.Character and player.Character:FindFirstChild(Settings.AimPart) == target then
                                    NameText.Text = player.Name
                                    NameText.Position = Vector2.new(screenPos.X, screenPos.Y - 25)
                                    NameText.Visible = true
                                    break
                                end
                            end
                        end
                    else
                        TargetDot.Visible = false
                        NameText.Visible = false
                    end
                else
                    TargetDot.Visible = false
                    NameText.Visible = false
                end
            end)
        else
            if AimbotConnection then AimbotConnection:Disconnect() AimbotConnection = nil end
            TargetDot.Visible = false
            NameText.Visible = false
        end
    end
})

fly:AddToggle('mytoggle', {
    Text = '开关飞行',
    Default = false,
    Tooltip = '',
    Callback = function(Value)
local char = speaker.Character
	if not char or not char.Humanoid then
		return
	end

	local hum = char.Humanoid
	if nowe == true then
		nowe = false

		hum:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.Running,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
		hum:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)	
	else
		nowe = true
		updatespeed(char, hum)

		char.Animate.Disabled = true
		for i,v in next, hum:GetPlayingAnimationTracks() do
			v:AdjustSpeed(0)
		end

		hum:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.Running,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
		hum:ChangeState(Enum.HumanoidStateType.Swimming)
	end
    
    local function CheckRig()
        if speaker.Character and speaker.Character:FindFirstChild("Torso") then
                return speaker.Character.Torso
        elseif speaker.Character and speaker.Character:FindFirstChild("LowerTorso") then
                return speaker.Character.LowerTorso
        end
    end


	local UpperTorso = CheckRig()
	local flying = true
	local deb = true
	local ctrl = {f = 0, b = 0, l = 0, r = 0}
	local lastctrl = {f = 0, b = 0, l = 0, r = 0}
	local maxspeed = 50
	local speed = 0

	local bg = Instance.new("BodyGyro", UpperTorso)
	bg.P = 9e4
	bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
	bg.cframe = UpperTorso.CFrame

	local bv = Instance.new("BodyVelocity", UpperTorso)
	bv.velocity = Vector3.new(0,0.1,0)
	bv.maxForce = Vector3.new(9e9, 9e9, 9e9)

	if nowe == true then
		hum.PlatformStand = true
	end

	while nowe == true or hum.Health == 0 do
		task.wait()

		if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
			speed = speed+.5+(speed/maxspeed)
			if speed > maxspeed then
				speed = maxspeed
			end
		elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
			speed = speed-1
			if speed < 0 then
				speed = 0
			end
		end
		if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
			bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
		elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
			bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
		else
			bv.velocity = Vector3.new(0,0,0)
		end

		bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
	end

	ctrl = {f = 0, b = 0, l = 0, r = 0}
	lastctrl = {f = 0, b = 0, l = 0, r = 0}
	speed = 0
	bg:Destroy()
	bv:Destroy()

	hum.PlatformStand = false
	char.Animate.Disabled = false
	tpwalking = false
    end
})

fly:AddSlider('MySlider', {
	Text = '飞行速度',
	Default = 1,
	Min = 1,
	Max = 50,
	Rounding = 0,
	Compact = false,

	Callback = function(Value)
		local char = speaker.Character
	if char and char.Humanoid then
		local hum = char.Humanoid
		if speeds >= 1 then
			speeds = Value
			updatespeed(char, hum)
			end
			end
	end
})

local Input = fly:AddInput("MyInput", {
    Text = "飞行速度",
    Default = "",
    Numeric = true,
    Finished = true, 
    Placeholder = "在此输入速度...",
    Callback = function(Text)
        local Value = tonumber(Text)
        if Value and Value >= 1 and Value <= 1000000000000000000 then
            local char = speaker.Character
            if char and char:FindFirstChild("Humanoid") then
                speeds = Value
                updatespeed(char, char.Humanoid)
            end
        else
            warn("请输入数字")
        end
    end
})

SaveManager:LoadAutoloadConfig()
local TextChatService = game:GetService("TextChatService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function SendChatMessage(message)
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local textChannel = TextChatService.TextChannels.RBXGeneral
        if textChannel then
            textChannel:SendAsync(message)
        else
            warn("TextChannel 未找到")
        end
    else
        ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
    end
end

local isAutoSending = false
local autoSendMessage = "默认消息"
local autoSendCount = 1
local autoSendDelay = 1

auto:AddInput("MessageInput", {
    Text = "发言内容",
    Default = autoSendMessage,
    Placeholder = "输入要发送的消息",
    Numeric = false,
    Callback = function(Value)
        autoSendMessage = Value
    end
})

auto:AddInput("CountInput", {
    Text = "发送次数",
    Default = tostring(autoSendCount),
    Placeholder = "输入1-100次",
    Numeric = true,
    Callback = function(Value)
        local num = tonumber(Value)
        if num and num > 0 and num <= 100 then
            autoSendCount = num
        else
            warn("请输入1-100的有效数字")
        end
    end
})

auto:AddButton({
    Text = "立即发送",
    Func = function()
        SendChatMessage(autoSendMessage)
    end
})

local autoSendToggle = auto:AddToggle("AutoSendToggle", {
    Text = "自动发送",
    Default = false,
    Tooltip = "不要使用太多",
    Callback = function(state)
        isAutoSending = state

        if state then
            print("开始自动发送...")
            coroutine.wrap(function()
                for i = 1, autoSendCount do
                    if not isAutoSending then break end
                    SendChatMessage(autoSendMessage)
                    task.wait(autoSendDelay)
                end
                isAutoSending = false
                autoSendToggle:SetState(false)  
            end)()
        else
            print("已停止自动发送")
        end
    end
})


local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("UI设置")
    MenuGroup:AddToggle("KeybindMenuOpen", {
        Default = Library.KeybindFrame.Visible,
        Text = "打开键绑定菜单",
        Callback = function(value)
            Library.KeybindFrame.Visible = value
        end,
    })
    MenuGroup:AddToggle("ShowCustomCursor", {
        Text = "自定义光标",
        Default = true,
        Callback = function(Value)
            Library.ShowCustomCursor = Value
        end,
    })
    MenuGroup:AddDropdown("NotificationSide", {
        Values = { "左", "右" },
        Default = "Right",
        Text = "通知端",
        Callback = function(Value)
            Library:SetNotifySide(Value)
        end,
    })
    MenuGroup:AddDropdown("DPIDropdown", {
        Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
        Default = "100%",
        Text = "DPI刻度",
        Callback = function(Value)
            Value = Value:gsub("%%", "")
            local DPI = tonumber(Value)
            Library:SetDPIScale(DPI)
        end,
    })
    MenuGroup:AddDivider()
    MenuGroup:AddLabel("Menu bind")
        :AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "菜单键绑定" })


    MenuGroup:AddButton("Unload", function()
        Library:Unload()
    end)
    ThemeManager:SetLibrary(Library)
    SaveManager:SetLibrary(Library)
    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
    ThemeManager:SetFolder("X WTB Hub") 
SaveManager:SetFolder("X WTB Hub/specific-game") 
SaveManager:SetSubFolder("specific-place") 
SaveManager:BuildConfigSection(Tabs["UI Settings"])

ThemeManager:ApplyToTab(Tabs["UI Settings"])  
updateNPCs()

workspace.DescendantRemoved:Connect(function(descendant)
    if isNPC(descendant) then
        for i = #validNPCs, 1, -1 do
            if validNPCs[i] == descendant then
                table.remove(validNPCs, i)
                break
            end
        end
    end
end)

game:GetService("Players").PlayerRemoving:Connect(function()
    FOVring:Remove()
end)

game.Players.PlayerAdded:Connect(UpdatePlayerDropdown)
game.Players.PlayerRemoving:Connect(UpdatePlayerDropdown)
UpdatePlayerDropdown()

SaveManager:LoadAutoloadConfig()
