--------------------------------------------------------------------
--          CARREGANDO GERENCIADOR DE cena COMPOSER              --
--------------------------------------------------------------------
local composer = require ( "composer" )
local cena = composer.newScene()
------------------------------------------------------------------
local widget = require "widget"
local config = require("meu_app.configuracao") -- Carrega Configurações
-- objetos uteis
local imagem = {} -- Tabela para tratar das imagens
local Botao = {
    Login = nil,
    Cadastro = nil
} -- Tabela para tratar dos botoẽs
local Grupo = display.newGroup() -- Grupo de objetos visuais
local MudarOrientacao = false
local teste2 = nil
local Texto = {
    Fonte = native.newFont("/meu_app/font_da_vaquinha.ttf", 30)
} 

-- Quando o botão Login é apertado:
Botao.LoginApertado = function()
    composer.gotoScene( 
        "meu_app.Primeiro_pagina.login",
        "zoomInOutFade",
        1000)
    return true;
end

-- Ocorre antes da cena começar:
function cena:create( evento )

    imagem.AlterarFundo = function()
        imagem.fundo = nil
        if MudarOrientacao == false then
            imagem.fundo = display.newImageRect(
                "meu_app/Primeiro_pagina/imagens/fundo/cinza.png",
                config.LarguraDaTela,
                config.AlturaDaTela)

            imagem.fundo.x = config.LarguraDaTela * 0.5
            imagem.fundo.y = config.AlturaDaTela * 0.5

        elseif MudarOrientacao == true then
            imagem.fundo = display.newImageRect(
                "meu_app/Primeiro_pagina/imagens/fundo/azul.png",
                config.AlturaDaTela,
                config.LarguraDaTela)

            imagem.fundo.x = config.LarguraDaTela * 0.5
            imagem.fundo.y = config.AlturaDaTela * 0.5
                
        end

    end

    teste2 = function()
        if MudarOrientacao == true then
            if imagem.fundo then
                imagem.fundo:removeSelf();
                timer.performWithDelay( 1, imagem.AlterarFundo )
                return true;
            end
        elseif MudarOrientacao == false then
            if imagem.fundo then
                imagem.fundo:removeSelf();
                timer.performWithDelay( 1, imagem.AlterarFundo )
                return true;
            end
        end       
    end
    imagem.AlterarFundo()

    -------------------------------------------------
    --              Logo da Página                 --
    -------------------------------------------------
    Texto.LogoTipo = "ETEC"

    Texto.LogoTipo2 = display.newText(Texto.LogoTipo, -- 
                config.LarguraDaTela * .5, -- Eixo X (horizontal de texto)
                config.AlturaDaTela *.2, -- Eixo Y ( vertical do texto )
                Texto.Fonte, -- Fonte que será usado no texto gráfico
                300) -- Tamanho do Texto
                Texto.LogoTipo2:setFillColor( 0, 0, 0.1 ) -- cor do texto
end

function cena:show( evento )
    local GrupoDecena = self.view
    local fazer = evento.phase
    local Grupo = display.newGroup()

    -- eu fiz
    if ( fazer == "will" ) then

        -------------------------------------------------------------------------------
        -----                   Botão                                               ---
        -------------------------------------------------------------------------------
        
        -- Botão de Logar:
        Botao.orientacao = function()
            if MudarOrientacao == false then
                Botao.Login = widget.newButton{
                    defaultFile = "meu_app/Primeiro_pagina/imagens/botaologinin.png", -- Botão antes do click
                    overFile = "meu_app/Primeiro_pagina/imagens/botaologinout.png", -- Botão quando clicado
                    width = ( config.LarguraDaTela * 0.7 ), -- Tamano da largura do botão.
                    height = config.AlturaDaTela * 0.09, -- Tamanho da Altura do botão.
                    -- Ação que acontece quando o botão é apertado:
                    onRelease = Botao.LoginApertado
                }

                Botao.Cadastro = widget.newButton{
                    defaultFile = "meu_app/Primeiro_pagina/imagens/botaocadastroin.png", -- Botão antes do click
                    overFile = "meu_app/Primeiro_pagina/imagens/botaocadastroout.png", -- Botão quando clicado
                    width = ( config.LarguraDaTela * 0.7 ), -- Tamano da largura do botão.
                    height = config.AlturaDaTela * 0.09, -- Tamanho da Altura do botão.
                    -- Ação que acontece quando o botão é apertado:
                    onRelease = function() return nil end
                }

            elseif MudarOrientacao == true then
                Botao.Login = widget.newButton{
                    defaultFile = "meu_app/Primeiro_pagina/imagens/botaologinin.png", -- Botão antes do click
                    overFile = "meu_app/Primeiro_pagina/imagens/botaologinout.png", -- Botão quando clicado
                    width = ( config.LarguraDaTela * 0.7 ), -- Tamano da largura do botão.
                    height = config.AlturaDaTela * 0.09, -- Tamanho da Altura do botão.
                    -- Ação que acontece quando o botão é apertado:
                    onRelease = Botao.LoginApertado
                }

                Botao.Cadastro = widget.newButton{
                    defaultFile = "meu_app/Primeiro_pagina/imagens/botaocadastroin.png", -- Botão antes do click
                    overFile = "meu_app/Primeiro_pagina/imagens/botaocadastroout.png", -- Botão quando clicado
                    width = ( config.LarguraDaTela * 0.7 ), -- Tamano da largura do botão.
                    height = config.AlturaDaTela * 0.09, -- Tamanho da Altura do botão.
                    -- Ação que acontece quando o botão é apertado:
                    onRelease = function() return nil end
                }
            end
            Botao.Login.x = config.LarguraDaTela * 0.5
            Botao.Login.y = config.AlturaDaTela * 0.5

            Botao.Cadastro.x = config.LarguraDaTela * 0.5
            Botao.Cadastro.y = config.AlturaDaTela * 0.61
        end

        -- Botão de Cadastro:
        Botao.orientacao()

        Botao.teste2 = function(Alvo)

            local function destino()
                if imagem.fundo then
                    Alvo:removeSelf();
                    timer.performWithDelay( 50, Botao.orientacao )
                    return true;
                end
            end
            if MudarOrientacao == true then
                destino()
            elseif MudarOrientacao == false then
                destino()
            end     
        end

    -- eu farei
    elseif ( fazer == "did" ) then

        Runtime:addEventListener("orientation", function()
            print(config.LarguraDaTela)
            print(config.AlturaDaTela)
            if MudarOrientacao == false then
                MudarOrientacao = true
                teste2()
            elseif MudarOrientacao == true then
                MudarOrientacao = false
                teste2()
            end
        end)

        Runtime:addEventListener("orientation", function() 
            if MudarOrientacao == false then
                MudarOrientacao = true
                Botao.teste2(Botao.Login)
                Botao.teste2(Botao.Cadastro)
            elseif MudarOrientacao == true then
                MudarOrientacao = false
                Botao.teste2(Botao.Login)
                Botao.teste2(Botao.Cadastro)
            end
        end)



        GrupoDecena:insert( Grupo )
        GrupoDecena:insert( imagem.fundo)
        GrupoDecena:insert( Botao.Login)
        GrupoDecena:insert( Botao.Cadastro)

    end
end

function cena:hide( evento )
    local GrupoDecena = self.view
    local fazer = evento.phase
    local Grupo = display.newGroup()

    -- eu fiz
    if ( fazer == "will" ) then

    -- eu farei
    elseif ( fazer == "did" ) then

    end
end

function cena:destroy( evento )
    local GrupoDecena = self.view
    if imagem.fundo then
        imagem.fundo:removeSelf()
        imagem.fundo = nil
    end
end

cena:addEventListener( "create", cena) -- o que faz antes dos objetos e personagens aparecerem no palco.
cena:addEventListener( "show", cena) --show mostra as cena e interações dos personagens durante a cená do jogo
cena:addEventListener( "hide", cena) -- Coisas que vão ocorre um pouco antes da cena ir embora. ou terminar
cena:addEventListener( "destroy", cena) -- Remova objeto da cena Destruindo eles.

return cena
