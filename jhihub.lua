--[[
Mensagens Poéticas com Apelidos Especiais (preserva acentuação, sem tradução, créditos arco-íris)
Antes dos créditos, aparece: "EU TE AMOOO MUITOOOO MEU AMORRR💖"
Créditos finais em cor arco-íris: "de pablo para jhi"
]]

local frases = {
    "Mb, teu sorriso ilumina até os dias mais nublados.",
    "Quando penso em poesia, penso em você, minha neném.",
    "Meu mundo ganhou cor desde que conheci você, vida.",
    "Cada batida do meu coração sussurra teu nome, minha bebê.",
    "Entre mil estrelas, você é a que mais brilha, amor da minha vida.",
    "Teus olhos, mvd, refletem os versos que nunca escrevi.",
    "O tempo desacelera quando estou com você, meu amor.",
    "Você é a poesia que minha alma sempre buscou, mb.",
    "Se amar é arte, minha neném, tu és minha obra-prima.",
    "No silêncio da noite, meu pensamento sempre te encontra, vida.",
    "É impossível não sorrir ao lembrar de você, minha bebê.",
    "Seu abraço é meu abrigo favorito, amor da minha vida.",
    "Você é o motivo do meu melhor sorriso, mvd.",
    "Ao teu lado, até o tempo parece querer parar, meu amor.",
    "Minha sorte grande foi te encontrar, vida.",
    "Nada é tão doce quanto o som da sua voz, minha neném.",
    "Você colore meus dias cinzentos, mb.",
    "Meu coração é todo seu, minha bebê.",
    "Te amar é meu verso favorito, amor da minha vida.",
    "Com você, a vida é mais leve, mvd.",
}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui")

local tela = Instance.new("ScreenGui")
tela.Name = "TelaPoetica"
tela.IgnoreGuiInset = true
tela.ResetOnSpawn = false
tela.Parent = PlayerGui

local black = Instance.new("Frame")
black.BackgroundColor3 = Color3.new(0,0,0)
black.Size = UDim2.new(1,0,1,0)
black.Position = UDim2.new(0,0,0,0)
black.ZIndex = 100
black.Parent = tela

local label = Instance.new("TextLabel")
label.BackgroundTransparency = 1
label.Size = UDim2.new(1, -120, 0, 100)
label.Position = UDim2.new(0, 60, 0.5, -50)
label.Font = Enum.Font.Arial -- Arial preserva acentos
label.TextColor3 = Color3.fromRGB(255, 220, 250)
label.TextStrokeTransparency = 0.7
label.TextSize = 36
label.TextWrapped = true
label.Text = ""
label.ZIndex = 101
label.Parent = black

-- Função arco-íris que preserva acentuação e emoji
local function rainbowText(textLabel, texto, tempo)
    local run = true
    spawn(function()
        -- Função para iterar corretamente sobre caracteres Unicode (acentos, emoji, etc.)
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
            textLabel.Font = Enum.Font.Arial
            textLabel.RichText = true
            wait(0.06)
        end
    end)
    wait(tempo)
    run = false
end

spawn(function()
    for i, frase in ipairs(frases) do
        label.RichText = false
        label.Text = frase
        label.TextColor3 = Color3.fromRGB(255, 220, 250)
        wait(5)
    end
    label.RichText = false
    label.Text = "EU TE AMOOO MUITOOOO MEU AMORRR💖"
    label.TextColor3 = Color3.fromRGB(255, 80, 180)
    wait(5)
    rainbowText(label, "de pablo para jhi", 4)
    tela:Destroy()
end)
