--[[
    JHI HUB - AIMBOT, AIM ASSIST & ESP MINI HUB
    Créditos: by pablo🥋
    - Hub elegante, minimalista e profissional para Roblox (PC e celular).
    - Toggle AIMBOT, AIM ASSIST e ESP independentes, tudo draggable.
    - ESP (amarelo) só em inimigos (time diferente).
    - AIMBOT mira SEMPRE no inimigo mais próximo (distância 3D, ignora visibilidade).
    - AIM ASSIST suaviza a mira para o inimigo mais próximo (distância 3D, ignora visibilidade).
    - Coloque como LocalScript em StarterPlayerScripts.
--]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- Tela escura translúcida (blur de fundo)
local blur = Instance.new("BlurEffect")
blur.Size = 6
blur.Parent = game.Lighting

-- ScreenGui elegante
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "JHIHub"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Sombra moderna
local shadow = Instance.new("ImageLabel")
shadow.Name = "HubShadow"
shadow.Size = UDim2.new(0, 260, 0, 170)
shadow.Position = UDim2.new(0, 16, 1, -190)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://1316045217"
shadow.ImageTransparency = 0.83
shadow.Parent = screenGui
shadow.ZIndex = 0

-- Hub frame elegante e MENOR (cor alterada para roxo escuro)
local hubFrame = Instance.new("Frame")
hubFrame.Size = UDim2.new(0, 240, 0, 140)
hubFrame.Position = UDim2.new(0, 30, 1, -160)
hubFrame.BackgroundColor3 = Color3.fromRGB(36, 22, 50) -- Roxo escuro elegante
hubFrame.BackgroundTransparency = 0.09
hubFrame.BorderSizePixel = 0
hubFrame.Active = true
hubFrame.Draggable = true
hubFrame.Parent = screenGui
hubFrame.ZIndex = 1

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 16)
uiCorner.Parent = hubFrame

local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(155, 102, 255)
uiStroke.Thickness = 2.5
uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uiStroke.Parent = hubFrame

-- Título sofisticado
local hubTitle = Instance.new("TextLabel")
hubTitle.Size = UDim2.new(1, 0, 0, 36)
hubTitle.Position = UDim2.new(0, 0, 0, 0)
hubTitle.BackgroundTransparency = 1
hubTitle.Text = "JHI HUB"
hubTitle.Font = Enum.Font.FredokaOne
hubTitle.TextScaled = true
hubTitle.TextColor3 = Color3.fromRGB(180, 135, 255)
hubTitle.TextStrokeTransparency = 0.74
hubTitle.TextStrokeColor3 = Color3.fromRGB(0,0,0)
hubTitle.ZIndex = 2
hubTitle.Parent = hubFrame

-- Linha decorativa
local decoLine = Instance.new("Frame")
decoLine.Size = UDim2.new(0.95, 0, 0, 2)
decoLine.Position = UDim2.new(0.025, 0, 0, 32)
decoLine.BackgroundColor3 = Color3.fromRGB(155, 102, 255)
decoLine.BorderSizePixel = 0
decoLine.ZIndex = 2
decoLine.Parent = hubFrame

-- Label descrição discreta
local descLabel = Instance.new("TextLabel")
descLabel.Size = UDim2.new(1, -36, 0, 14)
descLabel.Position = UDim2.new(0, 18, 0, 38)
descLabel.BackgroundTransparency = 1
descLabel.Font = Enum.Font.Gotham
descLabel.Text = "Aimbot, Aim Assist & ESP"
descLabel.TextScaled = true
descLabel.TextColor3 = Color3.fromRGB(210, 190, 255)
descLabel.TextTransparency = 0.16
descLabel.ZIndex = 2
descLabel.Parent = hubFrame

-- Função botão elegante
local function elegantButton(label, xOff, colorMain, colorOn)
    local bt = Instance.new("TextButton")
    bt.Size = UDim2.new(1/3, -12, 0, 32)
    bt.Position = UDim2.new(xOff, 8*(xOff==0 and 1 or 0), 0, 62)
    bt.Text = label
    bt.BackgroundColor3 = colorMain
    bt.Font = Enum.Font.GothamBold
    bt.TextScaled = true
    bt.TextColor3 = Color3.fromRGB(220, 234, 255)
    bt.AutoButtonColor = false
    bt.BorderSizePixel = 0
    bt.Parent = hubFrame
    bt.Active = true
    bt.ZIndex = 3
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = bt
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1.2
    stroke.Color = Color3.fromRGB(110, 60, 150)
    stroke.Parent = bt
    return bt, stroke, colorMain, colorOn
end

local aimButton, aimStroke, aimColor, aimColorOn = elegantButton("AIMBOT OFF", 0, Color3.fromRGB(40, 25, 58), Color3.fromRGB(44, 160, 100))
local assistButton, assistStroke, assistColor, assistColorOn = elegantButton("AIM ASSIST OFF", 1/3, Color3.fromRGB(40, 25, 58), Color3.fromRGB(155, 102, 255))
local espButton, espStroke, espColor, espColorOn = elegantButton("ESP OFF", 2/3, Color3.fromRGB(40, 25, 58), Color3.fromRGB(230, 200, 50))

-- Créditos sofisticado
local credits = Instance.new("TextLabel")
credits.Size = UDim2.new(1, -14, 0, 14)
credits.Position = UDim2.new(0, 7, 1, -20)
credits.BackgroundTransparency = 1
credits.Text = "by pablo🥋"
credits.Font = Enum.Font.GothamBold
credits.TextScaled = true
credits.TextColor3 = Color3.fromRGB(180, 135, 255)
credits.TextTransparency = 0.20
credits.ZIndex = 3
credits.Parent = hubFrame

-- Estado dos toggles
local aimActive = false
local assistActive = false
local espActive = false

local function updateAimButton()
    if aimActive then
        aimButton.Text = "AIMBOT ON"
        aimButton.BackgroundColor3 = aimColorOn
        aimButton.TextColor3 = Color3.fromRGB(230,255,230)
        aimStroke.Color = aimColorOn
    else
        aimButton.Text = "AIMBOT OFF"
        aimButton.BackgroundColor3 = aimColor
        aimButton.TextColor3 = Color3.fromRGB(220,234,255)
        aimStroke.Color = Color3.fromRGB(110, 60, 150)
    end
end

local function updateAssistButton()
    if assistActive then
        assistButton.Text = "AIM ASSIST ON"
        assistButton.BackgroundColor3 = assistColorOn
        assistButton.TextColor3 = Color3.fromRGB(235, 230, 255)
        assistStroke.Color = assistColorOn
    else
        assistButton.Text = "AIM ASSIST OFF"
        assistButton.BackgroundColor3 = assistColor
        assistButton.TextColor3 = Color3.fromRGB(220,234,255)
        assistStroke.Color = Color3.fromRGB(110, 60, 150)
    end
end

local function updateESPButton()
    if espActive then
        espButton.Text = "ESP ON"
        espButton.BackgroundColor3 = espColorOn
        espButton.TextColor3 = Color3.fromRGB(70, 65, 10)
        espStroke.Color = Color3.fromRGB(230, 200, 50)
    else
        espButton.Text = "ESP OFF"
        espButton.BackgroundColor3 = espColor
        espButton.TextColor3 = Color3.fromRGB(220,234,255)
        espStroke.Color = Color3.fromRGB(110, 60, 150)
    end
end

-- ESP: Aparece apenas em jogadores de time diferente
local espFolder = Instance.new("Folder")
espFolder.Name = "ESPFOLDER"
espFolder.Parent = screenGui

local espEnemies = {}

function ClearESP()
    for _, v in ipairs(espFolder:GetChildren()) do
        v:Destroy()
    end
    espEnemies = {}
end

function IsEnemy(player)
    local myTeam = LocalPlayer.Team
    return player.Team ~= myTeam
end

function CreateESPBox(player)
    if player == LocalPlayer then return end
    if not player.Character then return end
    local hrp = player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local box = Instance.new("Frame")
    box.Name = "ESP_" .. player.Name
    box.AnchorPoint = Vector2.new(0.5, 0.5)
    box.Size = UDim2.new(0, 40, 0, 80)
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
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and IsEnemy(player) and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            local hrp = player.Character.HumanoidRootPart
            local head = player.Character:FindFirstChild("Head")
            if humanoid and humanoid.Health > 0 then
                table.insert(espEnemies, player)
                if espActive and head and hrp then
                    local pos, visible = Camera:WorldToViewportPoint(hrp.Position)
                    if visible then
                        local topY = Camera:WorldToViewportPoint(head.Position).Y
                        local bottomY = Camera:WorldToViewportPoint(hrp.Position - Vector3.new(0, humanoid.HipHeight, 0)).Y
                        local height = math.abs(topY - bottomY)
                        local width = height / 2
                        local box = CreateESPBox(player)
                        if box then
                            box.Size = UDim2.new(0, width, 0, height)
                            box.Position = UDim2.new(0, pos.X, 0, (topY + bottomY)/2)
                            box.Visible = true
                        end
                    end
                end
            end
        end
    end
end

local function getClosestEnemy3D()
    local closestHead = nil
    local shortestDistance = math.huge
    local myChar = LocalPlayer.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then return nil end

    for _, player in ipairs(espEnemies) do
        if player.Character and player.Character:FindFirstChild("Head") and player.Character:FindFirstChild("HumanoidRootPart") then
            local head = player.Character.Head
            local enemyRoot = player.Character.HumanoidRootPart
            local distance = (myRoot.Position - enemyRoot.Position).Magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                closestHead = head
            end
        end
    end
    return closestHead
end

-- AIM ASSIST aprimorado: força menor e ajuste angular elegante
local aimAssistStrength = 0.17 -- Mais fraco que antes, suave
local aimAssistMaxAngle = math.rad(100) -- ângulo máximo em relação à mira

local function aimAssistStep(strength)
    local targetHead = getClosestEnemy3D()
    if not targetHead then return end
    local camPos = Camera.CFrame.Position
    local camLook = Camera.CFrame.LookVector
    local dir = (targetHead.Position - camPos).Unit
    local dot = camLook:Dot(dir)
    local angle = math.acos(math.clamp(dot, -1, 1))
    if angle < aimAssistMaxAngle then
        local smoothDir = camLook:Lerp(dir, strength)
        Camera.CFrame = CFrame.new(camPos, camPos + smoothDir)
    end
end

aimButton.MouseButton1Click:Connect(function()
    aimActive = not aimActive
    if aimActive then assistActive = false end
    updateAimButton()
    updateAssistButton()
end)
assistButton.MouseButton1Click:Connect(function()
    assistActive = not assistActive
    if assistActive then aimActive = false end
    updateAimButton()
    updateAssistButton()
end)
espButton.MouseButton1Click:Connect(function()
    espActive = not espActive
    updateESPButton()
end)

updateAimButton()
updateAssistButton()
updateESPButton()

RunService.RenderStepped:Connect(function()
    UpdateESP()
    if aimActive then
        local targetHead = getClosestEnemy3D()
        if targetHead then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetHead.Position)
        end
    elseif assistActive then
        aimAssistStep(aimAssistStrength)
    end
end)
