-- No escopo da sua cena
local config = require ("meu_app.configuracao")
local composer = require("composer")
local cena = composer.newScene()
local MudarOrientacao = false
local imagem = {}
local Botao = {}

local function atualizarFundo()
    if imagem.fundo then
        imagem.fundo:removeSelf()
        imagem.fundo = nil
    end

    local larguraFundo, alturaFundo, arquivoFundo
    if config.LarguraDaTela > config.AlturaDaTela then -- Paisagem
        larguraFundo = config.LarguraDaTela
        alturaFundo = config.AlturaDaTela
        arquivoFundo = "meu_app/Primeiro_pagina/imagens/fundo/azul.png"
        MudarOrientacao = true
    else -- Retrato
        larguraFundo = config.LarguraDaTela
        alturaFundo = config.AlturaDaTela
        arquivoFundo = "meu_app/Primeiro_pagina/imagens/fundo/cinza.png"
        MudarOrientacao = false
    end

    imagem.fundo = display.newImageRect(arquivoFundo, larguraFundo, alturaFundo)
    imagem.fundo.x = config.LarguraDaTela * 0.5
    imagem.fundo.y = config.AlturaDaTela * 0.5
    imagem.fundo.isFixedBackground = true
end

local function atualizarBotoes()
    local larguraBotao = config.LarguraDaTela * 0.7
    local alturaBotao = config.AlturaDaTela * 0.09

    Botao.Login.width = larguraBotao
    Botao.Login.height = alturaBotao
    Botao.Login.x = config.LarguraDaTela * 0.5
    Botao.Login.y = config.AlturaDaTela * 0.5

    Botao.Cadastro.width = larguraBotao
    Botao.Cadastro.height = alturaBotao
    Botao.Cadastro.x = config.LarguraDaTela * 0.5
    Botao.Cadastro.y = config.AlturaDaTela * 0.61
end

local function lidarComRedimensionamento(event)
    config.LarguraDaTela = display.actualContentWidth
    config.AlturaDaTela = display.actualContentHeight
    atualizarFundo()
    atualizarBotoes()
end

function cena:create( evento )
    -- Inicializar o fundo
    atualizarFundo()

    -- Criar os botões (apenas uma vez)
    local larguraBotaoInicial = config.LarguraDaTela * 0.7
    local alturaBotaoInicial = config.AlturaDaTela * 0.09

    Botao.Login = widget.newButton{
        defaultFile = "meu_app/Primeiro_pagina/imagens/botaologinin.png",
        overFile = "meu_app/Primeiro_pagina/imagens/botaologinout.png",
        width = larguraBotaoInicial,
        height = alturaBotaoInicial,
        onRelease = Botao.LoginApertado
    }

    Botao.Cadastro = widget.newButton{
        defaultFile = "meu_app/Primeiro_pagina/imagens/botaocadastroin.png",
        overFile = "meu_app/Primeiro_pagina/imagens/botaocadastroout.png",
        width = larguraBotaoInicial,
        height = alturaBotaoInicial,
        onRelease = function() return nil end
    }

    Botao.Login.x = config.LarguraDaTela * 0.5
    Botao.Login.y = config.AlturaDaTela * 0.5

    Botao.Cadastro.x = config.LarguraDaTela * 0.5
    Botao.Cadastro.y = config.AlturaDaTela * 0.61

    self.view:insert(imagem.fundo)
    self.view:insert(Botao.Login)
    self.view:insert(Botao.Cadastro)
end

function cena:show( evento )
    local fase = evento.phase
    if ( fase == "did" ) then
        Runtime:addEventListener("resize", lidarComRedimensionamento)
    end
end

function cena:hide( evento )
    local fase = evento.phase
    if ( fase == "will" ) then
        Runtime:removeEventListener("resize", lidarComRedimensionamento)
    end
end

function cena:destroy( evento )
    -- Limpar recursos se necessário
end

return cena