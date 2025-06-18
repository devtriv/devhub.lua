--[[
Especial Aniversário FINAL - Fundo Detalhado + MUITAS FRASES + Sem Música
By pablo🥋
]]

local frases = {
    "Hoje é o seu dia! Feliz aniversário meu amor! 🎉💖",
    "Que essa data se repita por muitos anos com muita felicidade! 👑",
    "Que todos os seus sonhos se realizem! 🌟",
    "Você é a melhor coisa que já me aconteceu! ❤️",
    "O universo sorriu no dia que você nasceu... e eu também! ✨",
    "Você merece o mundo inteiro! 🌍",
    "Estar com você é um presente diário! 🎁",
    "Eu te amo de um jeito que não cabe em palavras! 🥰",
    "Parabéns minha princesa linda! 👸",
    "Que seu sorriso continue iluminando tudo ao redor! ✨",
    "Hoje celebramos a sua vida... e que vida maravilhosa você tem! 🎈",
    "Eu te amo daqui até a eternidade... e além! 🚀💕",
    "Você é minha poesia favorita em forma de gente! 📖❤️",
    "Seus olhos brilham mais que qualquer estrela... Feliz aniversário! ⭐",
    "Obrigado por existir e por ser tão incrível! 🌸",
    "Minha missão é te fazer sorrir... hoje e sempre! 😊",
    "Você é a definição de felicidade na minha vida! 🌷",
    "Que a vida te dê tudo de lindo... igual você me dá todos os dias! 🎀",
    "Estar com você faz todos os meus dias valerem a pena... ❤️",
    "Hoje, amanhã e sempre... só quero estar ao seu lado! 💑",
    "Cada instante com você é uma lembrança feliz! 📸",
    "Meu coração bate mais forte só de pensar em você! ❤️",
    "Você é minha melhor história! 📚💕",
    "Você transforma meus dias em felicidade pura! 🌼",
    "Eu te amo mais do que as palavras conseguem expressar! 💓",
    "Meu mundo ficou mais bonito desde que você chegou! 🌈",
    "Que seu aniversário seja tão doce quanto o seu sorriso! 🍭",
    "Estarei ao seu lado hoje e sempre! 💑",
    "Você é o motivo dos meus melhores sorrisos! 😍",
    "Que a felicidade te abrace hoje e todos os dias! 🤗",
    "Você é a estrela mais brilhante do meu céu! ✨",
    "Obrigada por fazer parte da minha vida... eu te amo! 💌",
    "Com você, todos os dias são especiais! 🥰",
    "Você é a razão pela qual eu acordo sorrindo! ☀️",
    "Meu coração te escolheu... e vai escolher sempre! ❤️",
    "Sua existência torna tudo mais leve! 🌸",
    "Meu porto seguro sempre será você! ⚓",
    "Cada detalhe em você me faz te amar mais! 🌹",
    "Você é a dona do meu sorriso! 😊",
    "Estar com você é o meu lugar preferido! 🏡",
    "Com você ao meu lado, tudo faz sentido! 💫",
    "Você é o abraço que eu sempre quero! 🤗",
    "Feliz aniversário, minha razão de viver! 🎂❤️",
    "Só de te olhar, meu dia já fica melhor! 🌞",
    "Meu mundo gira em torno de você! 🌎",
    "Eu te amo de um jeito que nem eu consigo explicar! 💖",
    "O seu sorriso é o meu pôr do sol favorito! 🌅",
    "Se eu pudesse, te daria todas as estrelas do céu! ✨",
    "Que Deus ilumine seus caminhos sempre! 🙏",
    "Você é meu sonho realizado! 💭❤️",
    "Cada minuto com você é um pedaço de felicidade! ⏳💖",
}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui")

local tela = Instance.new("ScreenGui")
tela.Name = "TelaAniversario"
tela.IgnoreGuiInset = true
tela.ResetOnSpawn = false
tela.Parent = PlayerGui

-- Fundo detalhado
local fundo = Instance.new("Frame")
fundo.Size = UDim2.new(1,0,1,0)
fundo.Position = UDim2.new(0,0,0,0)
fundo.BackgroundColor3 = Color3.fromRGB(255, 182, 193)
fundo.BorderSizePixel = 0
fundo.ZIndex = 0
fundo.Parent = tela

local gradiente = Instance.new("UIGradient")
gradiente.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 105, 180)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 182, 193))
}
gradiente.Rotation = 45
gradiente.Parent = fundo

local sombra = Instance.new("UIStroke")
sombra.Color = Color3.fromRGB(255, 100, 150)
sombra.Thickness = 5
sombra.Transparency = 0.6
sombra.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
sombra.Parent = fundo

local brilho = Instance.new("UIGradient")
brilho.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 200, 200)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
}
brilho.Transparency = NumberSequence.new{
    NumberSequenceKeypoint.new(0, 0.85),
    NumberSequenceKeypoint.new(0.5, 0.95),
    NumberSequenceKeypoint.new(1, 0.85)
}
brilho.Rotation = 90
brilho.Parent = fundo

local label = Instance.new("TextLabel")
label.BackgroundTransparency = 1
label.Size = UDim2.new(1, -120, 0, 100)
label.Position = UDim2.new(0, 60, 0.5, -50)
label.Font = Enum.Font.GothamBold
label.TextColor3 = Color3.fromRGB(255, 105, 180)
label.TextStrokeTransparency = 0.7
label.TextSize = 36
label.TextWrapped = true
label.Text = ""
label.ZIndex = 100
label.Parent = fundo

local function rainbowText(textLabel, texto, tempo)
    local run = true
    spawn(function()
        local function utf8_chars(str)
            local i, len = 1, #str
            return function()
                if i > len then return end
                local c = string.byte(str, i)
                local n
                if c >= 240 then n = 4
                elseif c >= 224 then n = 3
                elseif c >= 192 then n = 2
                else n = 1 end
                local char = str:sub(i, i + n - 1)
                i = i + n
                return char
            end
        end
        local chars = {}
        for c in utf8_chars(texto) do table.insert(chars, c) end
        while run do
            local rainbow = ""
            for i = 1, #chars do
                local hue = ((tick()*1.5)+(i*0.18))%1
                local rgb = Color3.fromHSV(hue,1,1)
                rainbow = rainbow .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
                    math.floor(rgb.R*255), math.floor(rgb.G*255), math.floor(rgb.B*255), chars[i])
            end
            textLabel.Text = rainbow
            textLabel.TextColor3 = Color3.fromRGB(255,255,255)
            textLabel.TextStrokeTransparency = 0.6
            textLabel.TextTransparency = 0
            textLabel.Font = Enum.Font.GothamBold
            textLabel.RichText = true
            wait(0.06)
        end
    end)
    wait(tempo)
    run = false
end

-- Confetes
spawn(function()
    while true do
        local confete = Instance.new("Frame")
        confete.Size = UDim2.new(0, math.random(5,10), 0, math.random(5,10))
        confete.Position = UDim2.new(math.random(), 0, -0.1, 0)
        confete.BackgroundColor3 = Color3.fromHSV(math.random(), 1, 1)
        confete.BorderSizePixel = 0
        confete.ZIndex = 101
        confete.Parent = fundo

        spawn(function()
            local y = 0
            while y < 1.1 do
                y = y + 0.01
                confete.Position = UDim2.new(confete.Position.X.Scale, 0, y, 0)
                wait(0.01)
            end
            confete:Destroy()
        end)
        wait(0.3)
    end
end)

-- Corações
spawn(function()
    while true do
        local heart = Instance.new("TextLabel")
        heart.Text = "💖"
        heart.TextSize = 24
        heart.BackgroundTransparency = 1
        heart.Position = UDim2.new(math.random(), 0, 1.1, 0)
        heart.TextColor3 = Color3.fromRGB(255, 105, 180)
        heart.ZIndex = 101
        heart.Parent = fundo

        spawn(function()
            local y = 1.1
            while y > -0.1 do
                y = y - 0.01
                heart.Position = UDim2.new(heart.Position.X.Scale, 0, y, 0)
                wait(0.01)
            end
            heart:Destroy()
        end)
        wait(0.6)
    end
end)

-- Enfeites flutuantes
local enfeites = {"🎈","✨","🌸","🌟","🎀","💫","🌷","🌼"}

spawn(function()
    while true do
        local enfeite = Instance.new("TextLabel")
        enfeite.Text = enfeites[math.random(1,#enfeites)]
        enfeite.TextSize = math.random(18,28)
        enfeite.BackgroundTransparency = 1
        enfeite.Position = UDim2.new(math.random(), 0, math.random(), 0)
        enfeite.TextColor3 = Color3.fromHSV(math.random(),1,1)
        enfeite.ZIndex = 101
        enfeite.Parent = fundo

        spawn(function()
            local x = enfeite.Position.X.Scale
            local y = enfeite.Position.Y.Scale
            local dirX = (math.random() > 0.5) and 0.0015 or -0.0015
            local dirY = (math.random() > 0.5) and 0.0015 or -0.0015
            for i = 1,50 do
                x = x + dirX
                y = y + dirY
                enfeite.Position = UDim2.new(x,0,y,0)
                wait(0.04)
            end
            enfeite:Destroy()
        end)
        wait(1.5)
    end
end)

-- Mostrar frases
spawn(function()
    for _, frase in ipairs(frases) do
        label.RichText = false
        label.Text = frase
        label.TextColor3 = Color3.fromRGB(255, 105, 180)
        wait(5)
    end
    label.RichText = false
    label.Text = "Feliz aniversário meu amor! Que esse dia seja tão lindo quanto você! 💖🎉"
    label.TextColor3 = Color3.fromRGB(255, 50, 150)
    wait(5)
    rainbowText(label, "De pablo para jhi com todo amor 💕", 6)
    tela:Destroy()
end)
