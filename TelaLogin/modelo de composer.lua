---------------------------------------------------------------------------------------------------------
--                                      Importando módulos                                             --
---------------------------------------------------------------------------------------------------------
local composer = require ("composer") -- Gerenciamento de Cenas do Solar2D
local Cenas = composer.newScene()

---------------------------------------------------------------------------------------------------------
--                          GERENCIMANTO DE CENAS DO COMPOSER                                         ---
---------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------
--                                        CREATE                                                   --                                     --
-----------------------------------------------------------------------------------------------------

-- Ocorre anes da cena começar:
function Cenas:create( evento )

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
--                                        Destroy                                                  --                                                              
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
