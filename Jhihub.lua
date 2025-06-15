--[[
    JHI HUB - AIMBOT, AIM ASSIST & ESP MINI HUB
    Créditos: by pablo🥋
    Agora com botão "Hide/Show" arrastável na lateral esquerda.
--]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- Blur de fundo
local blur = Instance.new("BlurEffect")
blur.Size = 6
blur.Parent = game.Lighting

-- GUI principal
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "JHIHub"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Frame Hub
local hubFrame = Instance.new("Frame")
hubFrame.Size = UDim2.new(0, 240, 0, 140)
hubFrame.Position = UDim2.new(0, 30, 1, -160)
hubFrame.BackgroundColor3 = Color3.fromRGB(36, 22, 50)
hubFrame.Active = true
hubFrame.Draggable = true
hubFrame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 16)
uiCorner.Parent = hubFrame

local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(155, 102, 255)
uiStroke.Thickness = 2.5
uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uiStroke.Parent = hubFrame

-- Título
local hubTitle = Instance.new("TextLabel")
hubTitle.Size = UDim2.new(1, 0, 0, 28)
hubTitle.BackgroundTransparency = 1
hubTitle.Text = "JHI HUB"
hubTitle.Font = Enum.Font.FredokaOne
hubTitle.TextScaled = true
hubTitle.TextColor3 = Color3.fromRGB(180, 135, 255)
hubTitle.TextStrokeTransparency = 0.74
hubTitle.TextStrokeColor3 = Color3.fromRGB(0,0,0)
hubTitle.Parent = hubFrame

-- Linha decorativa
local decoLine = Instance.new("Frame")
decoLine.Size = UDim2.new(0.95, 0, 0, 2)
decoLine.Position = UDim2.new(0.025, 0, 0, 28)
decoLine.BackgroundColor3 = Color3.fromRGB(155, 102, 255)
decoLine.BorderSizePixel = 0
decoLine.Parent = hubFrame

-- Função botão padrão
local function createButton(name, posX, colorMain, colorOn)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1/3, -12, 0, 32)
    button.Position = UDim2.new(posX, 8*(posX==0 and 1 or 0), 0, 40)
    button.Text = name
    button.BackgroundColor3 = colorMain
    button.Font = Enum.Font.GothamBold
    button.TextScaled = true
    button.TextColor3 = Color3.fromRGB(220, 234, 255)
    button.AutoButtonColor = false
    button.BorderSizePixel = 0
    button.Parent = hubFrame
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = button
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1.2
    stroke.Color = Color3.fromRGB(110, 60, 150)
    stroke.Parent = button
    return button, stroke, colorMain, colorOn
end

local aimButton, aimStroke, aimColor, aimColorOn = createButton("AIMBOT OFF", 0, Color3.fromRGB(40, 25, 58), Color3.fromRGB(44, 160, 100))
local assistButton, assistStroke, assistColor, assistColorOn = createButton("AIM ASSIST OFF", 1/3, Color3.fromRGB(40, 25, 58), Color3.fromRGB(155, 102, 255))
local espButton, espStroke, espColor, espColorOn = createButton("ESP OFF", 2/3, Color3.fromRGB(40, 25, 58), Color3.fromRGB(230, 200, 50))

-- Créditos
local credits = Instance.new("TextLabel")
credits.Size = UDim2.new(1, -14, 0, 14)
credits.Position = UDim2.new(0, 7, 1, -20)
credits.BackgroundTransparency = 1
credits.Text = "by pablo🥋"
credits.Font = Enum.Font.GothamBold
credits.TextScaled = true
credits.TextColor3 = Color3.fromRGB(180, 135, 255)
credits.Parent = hubFrame

-- Estados
local aimActive = false
local assistActive = false
local espActive = false

local function updateAim()
    aimButton.Text = aimActive and "AIMBOT ON" or "AIMBOT OFF"
    aimButton.BackgroundColor3 = aimActive and aimColorOn or aimColor
    aimStroke.Color = aimActive and aimColorOn or Color3.fromRGB(110, 60, 150)
end

local function updateAssist()
    assistButton.Text = assistActive and "AIM ASSIST ON" or "AIM ASSIST OFF"
    assistButton.BackgroundColor3 = assistActive and assistColorOn or assistColor
    assistStroke.Color = assistActive and assistColorOn or Color3.fromRGB(110, 60, 150)
end

local function updateESP()
    espButton.Text = espActive and "ESP ON" or "ESP OFF"
    espButton.BackgroundColor3 = espActive and espColorOn or espColor
    espStroke.Color = espActive and espColorOn or Color3.fromRGB(110, 60, 150)
end

-- ESP
local espFolder = Instance.new("Folder", screenGui)
espFolder.Name = "ESP_FOLDER"
local espEnemies = {}

function ClearESP()
    for _, v in ipairs(espFolder:GetChildren()) do v:Destroy() end
    espEnemies = {}
end

function IsEnemy(player)
    return player.Team ~= LocalPlayer.Team
end

function CreateESP(player)
    local box = Instance.new("Frame")
    box.Name = "ESP_" .. player.Name
    box.AnchorPoint = Vector2.new(0.5, 0.5)
    box.BackgroundTransparency = 1
    box.BorderSizePixel = 0
    box.ZIndex = 10
    box.Parent = espFolder
    local outline = Instance.new("UIStroke")
    outline.Color = Color3.fromRGB(255, 235, 66)
    outline.Thickness = 2
    outline.Parent = box
    return box
end

function UpdateESP()
    ClearESP()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and IsEnemy(p) and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            table.insert(espEnemies, p)
        end
    end
end

function getClosestHead()
    local closest = nil
    local minDist = math.huge
    local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end
    for _, p in ipairs(espEnemies) do
        local head = p.Character and p.Character:FindFirstChild("Head")
        local root = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
        if head and root then
            local dist = (myRoot.Position - root.Position).Magnitude
            if dist < minDist then
                minDist = dist
                closest = head
            end
        end
    end
    return closest
end

local assistStrength = 0.23

function aimAssistStep(strength)
    local target = getClosestHead()
    if not target then return end
    local camPos = Camera.CFrame.Position
    local dir = (target.Position - camPos).Unit
    local smoothDir = Camera.CFrame.LookVector:Lerp(dir, strength)
    Camera.CFrame = CFrame.new(camPos, camPos + smoothDir)
end

aimButton.MouseButton1Click:Connect(function()
    aimActive = not aimActive
    if aimActive then assistActive = false end
    updateAim()
    updateAssist()
end)

assistButton.MouseButton1Click:Connect(function()
    assistActive = not assistActive
    if assistActive then aimActive = false end
    updateAim()
    updateAssist()
end)

espButton.MouseButton1Click:Connect(function()
    espActive = not espActive
    updateESP()
end)

updateAim()
updateAssist()
updateESP()

RunService.RenderStepped:Connect(function()
    UpdateESP()
    if aimActive then
        local target = getClosestHead()
        if target then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Position)
        end
    elseif assistActive then
        aimAssistStep(assistStrength)
    end
end)

-- Botão Hide/Show - Arrastável na lateral esquerda (meio da tela)
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 80, 0, 30)
toggleButton.Position = UDim2.new(0, 10, 0.5, -15)
toggleButton.BackgroundColor3 = Color3.fromRGB(60, 40, 80)
toggleButton.Font = Enum.Font.GothamBold
toggleButton.Text = "Hide"
toggleButton.TextScaled = true
toggleButton.TextColor3 = Color3.fromRGB(230, 230, 255)
toggleButton.Parent = screenGui

local corner = Instance.new("UICorner")
corner.Parent = toggleButton

toggleButton.Active = true
toggleButton.Draggable = true

local hidden = false
toggleButton.MouseButton1Click:Connect(function()
    if hidden then
        hubFrame.Visible = true
        toggleButton.Text = "Hide"
    else
        hubFrame.Visible = false
        toggleButton.Text = "Show"
    end
    hidden = not hidden
end)
