---------------------------------------------------------------------------------------------------------
--                                      Importando módulos                                             --
---------------------------------------------------------------------------------------------------------
local config = require("meu_app.configuracao")
local widget = require "widget"
local composer = require ("composer") -- Gerenciamento de Cenas do Solar2D
local Cenas = composer.newScene()
local imagem = {}
local Botao = {}
local figuras = {}
---------------------------------------------------------------------------------------------------------
--                          GERENCIMANTO DE CENAS DO COMPOSER                                         ---
---------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------
--                                        CREATE                                                   --                                     --
-----------------------------------------------------------------------------------------------------

-- Ocorre anes da cena começar:
function Cenas:create( evento )

    local function ver()
        if config.Orientacao() == "Retrato" then
            return "meu_app/Primeiro_pagina/imagens/fundo/cinza.png"
        else
            return "meu_app/Primeiro_pagina/imagens/fundo/azul.png"
        end
    end

    imagem.fundo = display.newImageRect(
        ver(),
        config.LarguraDaTela,
        config.AlturaDaTela
      )
      
      imagem.fundo.x = config.LarguraDaTela * 0.5
      imagem.fundo.y = config.AlturaDaTela * 0.5
end
------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------
--                                        SHOW                                                     --          --
-----------------------------------------------------------------------------------------------------
function Cenas:show( evento )
    local GrupoDeCenas = self.view
    local fazer = evento.phase
    local Grupo = display.newGroup()

    -- eu fiz
    if ( fazer == "will" ) then


        -------------------------------------------------------------------------------
        -----                   Botão                                               ---
        -------------------------------------------------------------------------------
        
        -- Botão de Logar:
        Botao.Login = widget.newButton{
            defaultFile = "meu_app/Primeiro_pagina/imagens/botaologinin.png", -- Botão antes do click
            overFile = "meu_app/Primeiro_pagina/imagens/botaologinout.png", -- Botão quando clicado
            width = ( config.LarguraDaTela * 0.7 ), -- Tamano da largura do botão.
            height = config.AlturaDaTela * 0.09, -- Tamanho da Altura do botão.
            -- Ação que acontece quando o botão é apertado:
            onRelease = function() return nil end
        }
        Botao.Login.x = config.LarguraDaTela * 0.5
        Botao.Login.y = config.AlturaDaTela * 0.5

        -- Botão de Cadastro:
        Botao.Cadastro = widget.newButton{
            defaultFile = "meu_app/Primeiro_pagina/imagens/botaocadastroin.png", -- Botão antes do click
            overFile = "meu_app/Primeiro_pagina/imagens/botaocadastroout.png", -- Botão quando clicado
            width = ( config.LarguraDaTela * 0.7 ), -- Tamano da largura do botão.
            height = config.AlturaDaTela * 0.09, -- Tamanho da Altura do botão.
            -- Ação que acontece quando o botão é apertado:
            onRelease = function() return nil end
        }
        Botao.Cadastro.x = config.LarguraDaTela * 0.5
        Botao.Cadastro.y = config.AlturaDaTela * 0.61


        
    
    -- eu farei
    elseif ( fazer == "did" ) then

    end
end
-----------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------
--                                        Hide                                                  -----               --
-----------------------------------------------------------------------------------------------------
function Cenas:hide( evento )
    local GrupoDeCenas = self.view
    local fazer = evento.phase

    -- eu fiz
    if ( fazer == "will" ) then
    
    -- eu farei
    elseif ( fazer == "did" ) then

    end
end
-------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------
--                                        Destroy                                                  --                                                              --
-----------------------------------------------------------------------------------------------------
function Cenas:destroy( evento )
    local GrupoDeCenas = self.view
end
------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------
--                              Gerenciamento de Cenas do composer                                    --
--------------------------------------------------------------------------------------------------------
Cenas:addEventListener( "create", Cenas) -- o que faz antes dos objetos e personagens aparecerem no palco.
Cenas:addEventListener( "show", Cenas) --show mostra as cenas e interações dos personagens durante a cená do jogo
Cenas:addEventListener( "hide", Cenas) -- Coisas que vão ocorre um pouco antes da cena ir embora. ou terminar
Cenas:addEventListener( "destroy", Cenas) -- Remova objeto da cena Destruindo eles.

return Cenas