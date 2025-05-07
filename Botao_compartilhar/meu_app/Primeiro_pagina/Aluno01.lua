---------------------------------------------------------------------------------------------------------
--                                      Importando módulos                                             --
---------------------------------------------------------------------------------------------------------
local config = require("meu_app.configuracao") -- Carrega Configurações
local widget = require "widget" -- Biblioteca para UI e UX
local composer = require ("composer") -- Gerenciamento de Cenas do Solar2D
local Cenas = composer.newScene() -- Gerenciamento de Cena dessa Página
local imagem = {} -- Imagens
local Botao = {} -- Botoẽs
---------------------------------------------------------------------------------------------------------
--                          GERENCIMANTO DE CENAS DO COMPOSER                                         ---
---------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------
--                                        CREATE                                                   --                                     --
-----------------------------------------------------------------------------------------------------

-- Ocorre anes da cena começar:
function Cenas:create( evento )

    imagem.fundo = display.newImageRect(
        "meu_app/Primeiro_pagina/imagens/fundo/cinza.png",
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