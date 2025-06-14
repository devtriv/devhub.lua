--[[
Script de declaração para Jhi 💖
Coloque este script como LocalScript em StarterPlayerScripts ou StarterGui.
--]]

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local playerGui = player:WaitForChild("PlayerGui")

-- Cria a tela preta
local telaPreta = Instance.new("ScreenGui")
telaPreta.Name = "TelaPretaJhi"
telaPreta.ResetOnSpawn = false
telaPreta.IgnoreGuiInset = true
telaPreta.Parent = playerGui

local fundo = Instance.new("Frame")
fundo.Size = UDim2.new(1, 0, 1, 0)
fundo.Position = UDim2.new(0, 0, 0, 0)
fundo.BackgroundColor3 = Color3.new(0, 0, 0)
fundo.BackgroundTransparency = 0
fundo.Parent = telaPreta

local mensagem = Instance.new("TextLabel")
mensagem.Size = UDim2.new(1, 0, 0.22, 0)
mensagem.Position = UDim2.new(0, 0, 0.39, 0)
mensagem.BackgroundTransparency = 1
mensagem.TextColor3 = Color3.fromRGB(255, 105, 180)
mensagem.TextStrokeTransparency = 0.5
mensagem.TextScaled = true
mensagem.Font = Enum.Font.GothamBold
mensagem.Parent = fundo
mensagem.Text = ""

-- Função para mostrar mensagem com tempo
local function mostrarMensagem(texto, cor, tempo)
    mensagem.Text = texto
    if cor then
        mensagem.TextColor3 = cor
    else
        mensagem.TextColor3 = Color3.fromRGB(255, 105, 180)
    end
    mensagem.Visible = true
    wait(tempo)
    mensagem.Visible = false
end

-- Sequência de mensagens
spawn(function()
    -- Segunda mensagem
    mensagem.Text = "jhi voce é o amor da minha vida vou te amar para sempre"
    mensagem.TextColor3 = Color3.fromRGB(255, 182, 193)
    mensagem.Visible = true
    wait(4)

    -- Terceira mensagem
    mensagem.Text = "EU TE AMOOOOO MUITOOOOO MINHA MULHER MAVARAVILHOSAAA💖"
    mensagem.TextColor3 = Color3.fromRGB(255, 20, 147)
    mensagem.Visible = true
    wait(5)

    -- Quarta mensagem (mantido como pabloo)
    mensagem.Text = "by amor da sua vidaa pabloo💖"
    mensagem.TextColor3 = Color3.fromRGB(231, 84, 128)
    mensagem.Visible = true
    wait(3)

    telaPreta:Destroy()
end)
