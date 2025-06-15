--[[
Hub: Jhi amor da minha vida❤️ - MOBILE (Roblox, Mobile Friendly, Dark Pink)
Coloque este script em StarterPlayerScripts
--]]

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

-- GUI Setup
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "JhiAmorDaMinhaVidaHub"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Fundo translúcido central (médio, otimizado p/ celular)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainPanel"
mainFrame.Size = UDim2.new(0, 270, 0, 230)
mainFrame.Position = UDim2.new(0.5, -135, 0.7, -115)
mainFrame.BackgroundColor3 = Color3.fromRGB(185, 47, 97)
mainFrame.BackgroundTransparency = 0.13
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
mainFrame.AnchorPoint = Vector2.new(0, 0)
mainFrame.Active = true
mainFrame.Draggable = true

-- Borda decorativa
local border = Instance.new("UICorner")
border.CornerRadius = UDim.new(0, 20)
border.Parent = mainFrame

-- Sombra
local shadow = Instance.new("ImageLabel")
shadow.Name = "Shadow"
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://6015897843"
shadow.Size = UDim2.new(1, 28, 1, 28)
shadow.Position = UDim2.new(0, -14, 0, -14)
shadow.ImageColor3 = Color3.fromRGB(185, 47, 97)
shadow.ImageTransparency = 0.55
shadow.Parent = mainFrame
shadow.ZIndex = 0

-- Título personalizado
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Parent = mainFrame
title.Size = UDim2.new(1, 0, 0, 37)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Jhi amor da minha vida❤️"
title.TextColor3 = Color3.fromRGB(255, 105, 180)
title.TextStrokeTransparency = 0.6
title.Font = Enum.Font.GothamBold
title.TextScaled = true

-- Linha decorativa
local line = Instance.new("Frame")
line.Parent = mainFrame
line.Size = UDim2.new(0.9, 0, 0, 2)
line.Position = UDim2.new(0.05, 0, 0, 32)
line.BackgroundColor3 = Color3.fromRGB(255, 20, 147)
line.BorderSizePixel = 0

-- Botão estilizado (médio)
local function makeCuteButton(name, pos, txt, color)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Size = UDim2.new(0, 84, 0, 38)
    btn.Position = pos
    btn.Text = txt
    btn.BackgroundColor3 = color or Color3.fromRGB(231, 84, 128)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextStrokeTransparency = 0.65
    btn.TextScaled = true
    btn.Font = Enum.Font.GothamBold
    btn.Parent = mainFrame
    btn.AutoButtonColor = true

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 14)
    corner.Parent = btn

    local uiStroke = Instance.new("UIStroke")
    uiStroke.Color = Color3.fromRGB(255, 20, 147)
    uiStroke.Thickness = 2.5
    uiStroke.Parent = btn

    return btn
end

local espBtn = makeCuteButton("ESPButton", UDim2.new(0, 11, 0, 55), "ESP", Color3.fromRGB(212, 38, 128))
local offEspBtn = makeCuteButton("OFFESPButton", UDim2.new(0, 97, 0, 55), "OFF ESP", Color3.fromRGB(185, 47, 97))
local flyBtn = makeCuteButton("FLYButton", UDim2.new(0, 183, 0, 55), "FLY", Color3.fromRGB(255, 20, 147))
local swordBtn = makeCuteButton("SwordButton", UDim2.new(0, 97, 0, 105), "spawm sword", Color3.fromRGB(255, 20, 147))

-- SLIDER PARA ESCOLHER VELOCIDADE
local sliderFrame = Instance.new("Frame")
sliderFrame.Name = "SliderFrame"
sliderFrame.Parent = mainFrame
sliderFrame.Size = UDim2.new(0, 200, 0, 28)
sliderFrame.Position = UDim2.new(0, 35, 0, 155)
sliderFrame.BackgroundTransparency = 1

local sliderLabel = Instance.new("TextLabel")
sliderLabel.Name = "SliderLabel"
sliderLabel.Parent = sliderFrame
sliderLabel.Size = UDim2.new(0, 60, 1, 0)
sliderLabel.Position = UDim2.new(0, 0, 0, 0)
sliderLabel.BackgroundTransparency = 1
sliderLabel.Text = "Velocidade:"
sliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
sliderLabel.TextScaled = true
sliderLabel.Font = Enum.Font.Gotham

local valueLabel = Instance.new("TextLabel")
valueLabel.Name = "ValueLabel"
valueLabel.Parent = sliderFrame
valueLabel.Size = UDim2.new(0, 42, 1, 0)
valueLabel.Position = UDim2.new(1, -42, 0, 0)
valueLabel.BackgroundTransparency = 1
valueLabel.Text = "60"
valueLabel.TextColor3 = Color3.fromRGB(255, 105, 180)
valueLabel.TextScaled = true
valueLabel.Font = Enum.Font.GothamBold

local slider = Instance.new("Frame")
slider.Name = "SliderBar"
slider.Parent = sliderFrame
slider.Size = UDim2.new(0, 88, 0, 8)
slider.Position = UDim2.new(0, 70, 0.5, -4)
slider.BackgroundColor3 = Color3.fromRGB(255, 20, 147)
slider.BorderSizePixel = 0
local sliderCorner = Instance.new("UICorner", slider)
sliderCorner.CornerRadius = UDim.new(0, 4)

local knob = Instance.new("Frame")
knob.Name = "Knob"
knob.Parent = slider
knob.Size = UDim2.new(0, 18, 0, 18)
knob.Position = UDim2.new(0, 35, 0.5, -5)
knob.BackgroundColor3 = Color3.fromRGB(255, 182, 193)
knob.BorderSizePixel = 0
local knobCorner = Instance.new("UICorner", knob)
knobCorner.CornerRadius = UDim.new(1, 0)
knob.ZIndex = 2

-- Variáveis de velocidade
local minSpeed = 10
local maxSpeed = 150
local flySpeed = 60 -- valor inicial
valueLabel.Text = tostring(flySpeed)

local function setFlySpeedFromKnob(x)
    local sliderAbs = slider.AbsolutePosition.X
    local sliderWidth = slider.AbsoluteSize.X
    local percent = math.clamp((x - sliderAbs) / sliderWidth, 0, 1)
    local speed = math.floor(minSpeed + (maxSpeed - minSpeed) * percent)
    flySpeed = speed
    knob.Position = UDim2.new(0, math.floor(percent * (sliderWidth - knob.AbsoluteSize.X)), 0.5, -5)
    valueLabel.Text = tostring(speed)
end

-- Eventos para arrastar o knob
local dragging = false

knob.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
    end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        setFlySpeedFromKnob(input.Position.X)
    end
end)

slider.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        setFlySpeedFromKnob(input.Position.X)
        dragging = true
    end
end)

-- Créditos personalizados
local credits = Instance.new("TextLabel")
credits.Parent = mainFrame
credits.Size = UDim2.new(1, 0, 0, 20)
credits.Position = UDim2.new(0, 0, 1, -24)
credits.BackgroundTransparency = 1
credits.Text = "by pablo💖"
credits.TextColor3 = Color3.fromRGB(231, 84, 128)
credits.Font = Enum.Font.Gotham
credits.TextScaled = true

-- ESP Functions
local highlights = {}

local function addESP()
    for _,plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            if not highlights[plr] then
                local highlight = Instance.new("Highlight")
                highlight.Parent = plr.Character
                highlight.Adornee = plr.Character
                highlight.FillColor = Color3.fromHSV(math.random(),1,0.8)
                highlight.OutlineColor = Color3.fromRGB(255, 20, 147)
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlights[plr] = highlight
            end
        end
    end
end

local function clearESP()
    for plr,highlight in pairs(highlights) do
        if highlight and highlight.Parent then
            highlight:Destroy()
        end
        highlights[plr] = nil
    end
end

espBtn.MouseButton1Click:Connect(function()
    addESP()
end)

offEspBtn.MouseButton1Click:Connect(function()
    clearESP()
end)

Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function()
        if highlights[plr] then
            highlights[plr] = nil
        end
    end)
end)

Players.PlayerRemoving:Connect(function(plr)
    if highlights[plr] then
        highlights[plr] = nil
    end
end)

-- FLY Functions: Voa na direção exata do analógico e da câmera (controle total sobre a altura)
local flying = false
local bodyGyro, bodyVel

local function startFly()
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    flying = true

    local hrp = char.HumanoidRootPart
    local hum = char:FindFirstChildWhichIsA("Humanoid")

    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.P = 9e4
    bodyGyro.Parent = hrp
    bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    bodyGyro.CFrame = hrp.CFrame

    bodyVel = Instance.new("BodyVelocity")
    bodyVel.Velocity = Vector3.zero
    bodyVel.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    bodyVel.Parent = hrp

    RunService:BindToRenderStep("Fly", 211, function()
        if not flying or not hrp or not hum then return end
        local moveDir = hum.MoveDirection
        local velocity = Vector3.zero
        local camera = workspace.CurrentCamera
        if moveDir.Magnitude > 0 then
            -- Move na direção EXATA da câmera, incluindo altura!
            local camCF = camera.CFrame
            local look = camCF.LookVector.Unit
            -- MoveDirection representa o quanto o analógico está pressionado (sempre no plano XZ)
            -- Então, multiplicamos o lookVector pela magnitude, controlando altura pelo ângulo da câmera
            velocity = look * moveDir.Magnitude * flySpeed
        end
        bodyVel.Velocity = velocity
        bodyGyro.CFrame = workspace.CurrentCamera.CFrame
    end)
end

local function stopFly()
    flying = false
    RunService:UnbindFromRenderStep("Fly")
    if bodyGyro then bodyGyro:Destroy() end
    if bodyVel then bodyVel:Destroy() end
end

flyBtn.MouseButton1Click:Connect(function()
    if flying then
        stopFly()
        flyBtn.Text = "FLY"
    else
        startFly()
        flyBtn.Text = "STOP FLY"
    end
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    stopFly()
    flyBtn.Text = "FLY"
end)

-- SÓ VOCÊ VÊ A ESPADA: "spawm sword" (cliente)
local function createSwordForMe()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("SwordFake") then return end
    local tool = Instance.new("Tool")
    tool.Name = "SwordFake"
    tool.RequiresHandle = true
    tool.CanBeDropped = true

    local handle = Instance.new("Part")
    handle.Name = "Handle"
    handle.Size = Vector3.new(1,4,1)
    handle.Color = Color3.fromRGB(255, 20, 147)
    handle.Material = Enum.Material.Neon
    handle.CanCollide = false
    handle.Anchored = false
    handle.Parent = tool

    tool.Grip = CFrame.new(0, -1.2, 0) * CFrame.Angles(0, math.rad(0), 0)
    tool.Parent = LocalPlayer.Backpack

    local blade = Instance.new("Part")
    blade.Name = "Blade"
    blade.Size = Vector3.new(0.3, 3, 0.3)
    blade.Color = Color3.fromRGB(255, 182, 193)
    blade.Material = Enum.Material.Neon
    blade.CanCollide = false
    blade.Anchored = false
    blade.Parent = tool

    local weld = Instance.new("WeldConstraint")
    weld.Part0 = handle
    weld.Part1 = blade
    weld.Parent = handle
    blade.CFrame = handle.CFrame * CFrame.new(0, 2.5, 0)

    local spark = Instance.new("ParticleEmitter")
    spark.Color = ColorSequence.new(Color3.fromRGB(255, 105, 180))
    spark.LightEmission = 1
    spark.Texture = "rbxassetid://243098098"
    spark.Size = NumberSequence.new({NumberSequenceKeypoint.new(0,0.25),NumberSequenceKeypoint.new(1,0.1)})
    spark.Lifetime = NumberRange.new(0.3)
    spark.Rate = 8
    spark.Speed = NumberRange.new(0.5)
    spark.Parent = blade

    local swingSound = Instance.new("Sound")
    swingSound.SoundId = "rbxassetid://12222242"
    swingSound.Volume = 0.7
    swingSound.Parent = handle
    tool.Activated:Connect(function()
        swingSound:Play()
    end)
end

swordBtn.MouseButton1Click:Connect(function()
    createSwordForMe()
end)
