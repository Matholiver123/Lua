local composer = require("composer")
local cena = composer.newScene()

print("Ola Mundo")
print("A Largura da tela é:",display.pixelWidth )
print("A Altura da tela é:",display.pixelHeight)

function cena:create( evento )

end

function cena:hide( evento )
    local GrupoDeCenas = self.view
    local fazer = evento.phase
    local Grupo = display.newGroup

    -- eu fiz
    if ( fazer == "will" ) then

        -- eu farei
    elseif ( fazer == "did" ) then 

    end
end
return cena