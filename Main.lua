local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local Httadmin = {}
local GUI_NAME, activeNotifications = "NotificationGui", {}
local CONFIG = {
    WIDTH = 250, HEIGHT = 75, SPACING = 8, OFFSET = Vector2.new(20, 20),
    BG_TRANS = 0.5, RADIUS = 4, ANIM = {0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out},
    TITLE = {Font = Enum.Font.GothamBold, Size = 18, Color = Color3.new(1,1,1), Y = 8},
    MSG = {Font = Enum.Font.Gotham, Size = 14, Color = Color3.new(0.86,0.86,0.86), Y = 30},
    ICON = {Size = UDim2.new(0,24,0,24), Offset = 8}
}

local function createElement(class, props, parent)
    local el = Instance.new(class)
    for k,v in pairs(props) do el[k] = v end
    el.Parent = parent
    return el
end

local function animate(element, props, duration)
    TweenService:Create(element, TweenInfo.new(duration or 0.3, unpack(CONFIG.ANIM,2)), props):Play()
end

local function setupGui()
    local gui = Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild(GUI_NAME) or
        createElement("ScreenGui", {Name = GUI_NAME, IgnoreGuiInset = true, ResetOnSpawn = false}, 
            Players.LocalPlayer.PlayerGui)
    gui.DisplayOrder = 1000
    return gui
end

local function updatePositions()
    for i, n in ipairs(activeNotifications) do
        animate(n.frame, {Position = UDim2.new(1,-CONFIG.OFFSET.X,1,-CONFIG.OFFSET.Y-(CONFIG.HEIGHT+CONFIG.SPACING)*(i-1)})
    end
end

local function createProgress(parent, duration)
    local bar = createElement("Frame", {
        Size = UDim2.new(1,0,0,4), Position = UDim2.new(0,0,1,-4),
        BackgroundTransparency = 1, ClipsDescendants = true, ZIndex = 11
    }, parent)
    
    local fill = createElement("Frame", {
        Size = UDim2.new(1,0,1,0), BackgroundColor3 = Color3.new(1,0,0), ZIndex = 12
    }, bar)
    createElement("UICorner", {CornerRadius = UDim.new(0,2)}, fill)
    
    animate(fill, {Size = UDim2.new(0,0,1,0)}, duration)
    
    local hue = 0
    return RunService.RenderStepped:Connect(function()
        if fill then fill.BackgroundColor3 = Color3.fromHSV((hue + 0.01) % 1, 1, 1) end
    end)
end

function Httadmin.send(title, msg, duration, icon)
    duration = duration or 4
    local sound = createElement("Sound", {
        SoundId = "rbxassetid://4590657391", Volume = 10, Parent = workspace:FindFirstChild("Httadmin音频储存") or
            createElement("Folder", {Name = "Httadmin音频储存"}, workspace)
    })
    sound:Play() sound.Ended:Connect(function() sound:Destroy() end)
    
    local frame = createElement("Frame", {
        Size = UDim2.new(0,CONFIG.WIDTH,0,CONFIG.HEIGHT),
        Position = UDim2.new(1,-CONFIG.OFFSET.X,1,-CONFIG.OFFSET.Y),
        AnchorPoint = Vector2.new(1,1), BackgroundTransparency = CONFIG.BG_TRANS,
        ZIndex = 10
    }, setupGui())
    
    createElement("UICorner", {CornerRadius = UDim.new(0,CONFIG.RADIUS)}, frame)
    local stroke = createElement("UIStroke", {Thickness = 2, ApplyStrokeMode = Enum.ApplyStrokeMode.Border}, frame)
    
    local borderHue = RunService.RenderStepped:Connect(function()
        if stroke then stroke.Color = Color3.fromHSV((hue + 0.01) % 1, 1, 1) end
    end)
    
    local iconOffset = 0
    if icon then
        createElement("ImageLabel", {
            Size = CONFIG.ICON.Size, Position = UDim2.new(0,CONFIG.ICON.Offset,0,CONFIG.ICON.Offset),
            Image = icon, ImageTransparency = 1, ZIndex = 11
        }, frame)
        animate(icon, {ImageTransparency = 0})
        iconOffset = 40
    end
    
    local function createText(text, cfg, yPos)
        return createElement("TextLabel", {
            Size = UDim2.new(1, -(iconOffset + 8), cfg == CONFIG.TITLE and 0 or 1, cfg == CONFIG.TITLE and 24 or -32),
            Position = UDim2.new(0, iconOffset > 0 and 40 or 8, 0, cfg.Y),
            Text = text, Font = cfg.Font, TextSize = cfg.Size,
            TextColor3 = cfg.Color, TextTransparency = 1, ZIndex = 11
        }, frame)
    end
    
    animate(createText(title or "Notification", CONFIG.TITLE), {TextTransparency = 0})
    animate(createText(msg or "", CONFIG.MSG), {TextTransparency = 0})
    
    task.delay(duration, function()
        animate(frame, {BackgroundTransparency = 1})
        for _, child in ipairs(frame:GetChildren()) do
            if child:IsA("TextLabel") or child:IsA("ImageLabel") then
                animate(child, {TextTransparency = 1, ImageTransparency = 1})
            end
        end
        
        frame.Destroying:Once(function()
            table.remove(activeNotifications, table.find(activeNotifications, frame))
            borderHue:Disconnect()
            updatePositions()
        end)
    end)
    
    table.insert(activeNotifications, frame)
    updatePositions()
    createProgress(frame, duration)
end

return Httadmin