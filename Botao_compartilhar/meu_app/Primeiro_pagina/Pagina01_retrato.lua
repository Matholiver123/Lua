--------------------------------------------------------------------
--          Módulos que são serão utilizados                      --
--------------------------------------------------------------------
local composer = require ( "composer" )
local cena = composer.newScene()
------------------------------------------------------------------
local widget = require "widget" -- Tratamento de interfaces de usuários
local config = require("meu_app.configuracao") -- Carrega Configurações
-- objetos uteis
local imagem = {} -- Tabela para tratar das imagens
local Botao = {
    Login = nil,
    Cadastro = nil
} -- Tabela para tratar dos botoẽs
local Grupo = display.newGroup() -- Grupo de objetos visuais
local MudarOrientacao = false
local Texto = require("meu_app.Texto") -- Arquivo de tratamento de Textos

-- Quando o botão Login é apertado:
Botao.LoginApertado = function()
    composer.gotoScene( 
        "meu_app.Primeiro_pagina.login",
        "zoomInOutFade",
        1000)
    return true;
end

-- Quando o BOtão de Cadastro é apertado:
Botao.CadastroApertado = function()
    composer.gotoScene(
        "meu_app.Primeiro_pagina.Cadastro",
        "zoomInOutFade",
        1000)
    return true;
end

-- Ocorre antes da cena começar:
function cena:create( evento )

    ------------------------------------------------------
    --Imagem de fundo:
    imagem.fundo = display.newImageRect(
        "meu_app/Primeiro_pagina/imagens/fundo/cinza.png",
        config.LarguraDaTela,
        config.AlturaDaTela)

    imagem.fundo.x = config.LarguraDaTela * 0.5
    imagem.fundo.y = config.AlturaDaTela * 0.5
    -------------------------------------------------------
end

function cena:show( evento )
    local GrupoDecena = self.view
    local fazer = evento.phase
    local Grupo = display.newGroup()

    -- eu fiz
    if ( fazer == "will" ) then

        --------------
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
                    onRelease = Botao.CadastroApertado
                }

                Botao.compartilhar = widget.newButton{
                    defaultFile = "meu_app/Primeiro_pagina/imagens/compartilhar_in.png", -- Botão antes do click
                    overFile = "meu_app/Primeiro_pagina/imagens/compartilhar_out.png", -- Botão quando clicado
                    width = ( config.LarguraDaTela * 0.7 ), -- Tamano da largura do botão.
                    height = config.AlturaDaTela * 0.09, -- Tamanho da Altura do botão.
                    -- Ação que acontece quando o botão é apertado:
                    onRelease = nil
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

            -- Cordenadas da posição do Botão de Login:
            Botao.Login.x = config.LarguraDaTela * 0.5 -- centro da posição horizontal
            Botao.Login.y = config.AlturaDaTela * 0.5 -- Centro da posição Vertical

            -- Cordenadas da posição do BOtão de Cadastro:
            Botao.Cadastro.x = config.LarguraDaTela * 0.5
            Botao.Cadastro.y = config.AlturaDaTela * 0.61

            Botao.compartilhar.x = config.LarguraDaTela * 0.5
            Botao.compartilhar.y = Botao.Cadastro.y + ( Botao.compartilhar.height * 1.2)
        end

        -- Botão de Cadastro:
        Botao.espera = timer.performWithDelay(2000, Botao.orientacao)


    -- eu farei
    elseif ( fazer == "did" ) then

        Runtime:addEventListener("orientation", function()
            --imagem.fundo:removeSelf();
            composer.gotoScene( 
                "meu_app.Primeiro_pagina.Pagina01_Paisagem",
                "zoomInOutFade",
                500)
            return true;
        end)


        ------------------------------------------------------------------
        --    Colocando os objetos visuais no grupo de Visualização
        ------------------------------------------------------------------
        GrupoDecena:insert( Grupo )
        GrupoDecena:insert( imagem.fundo)
        Botao.espera2 = timer.performWithDelay(2500,
            function() GrupoDecena:insert( Botao.Login)
                    GrupoDecena:insert( Botao.Cadastro)
                    GrupoDecena:insert( Botao.compartilhar)

            end)
        --GrupoDecena:insert( Texto.LogoTipo.Desenho)
        --GrupoDecena:insert( Texto.Etec.Desenho)
        ------------------------------------------------------------------

    end
end

function cena:hide( evento )
    local GrupoDecena = self.view
    local fazer = evento.phase
    local Grupo = display.newGroup()

    -- eu fiz
    if ( fazer == "will" ) then

        timer.cancel(Botao.espera);
        timer.cancel(Botao.espera2);

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

    if Botao.Login then
        Botao.Login:removeSelf();
        Botao.Login = nil
    end
end

cena:addEventListener( "create", cena) -- o que faz antes dos objetos e personagens aparecerem no palco.
cena:addEventListener( "show", cena) --show mostra as cena e interações dos personagens durante a cená do jogo
cena:addEventListener( "hide", cena) -- Coisas que vão ocorre um pouco antes da cena ir embora. ou terminar
cena:addEventListener( "destroy", cena) -- Remova objeto da cena Destruindo eles.

return cena
