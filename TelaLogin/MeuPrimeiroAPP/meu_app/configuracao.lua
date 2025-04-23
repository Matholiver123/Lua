------------------------------------------------------------------------------
--                        Criando Classe de configuração                   ---
------------------------------------------------------------------------------
local Config = {}
------------------------------------------------------------------------
--              Criando pontos centrais na tela:                     ---
------------------------------------------------------------------------
-- Ponto central baseado na posição atual da tela:
Config.Centro = {
    -- Esse código mapeia a posição centro no eixo X
    x = display.actualContentWidth * .5,
    -- Esse código mapeia a posição centro no eixo y
    y = display.actualContentHeight * .5
}
-- Ponto de centralidade no dispositivo:
Config.TelaCentro = {
    -- Esse código mapeia a posição centro no eixo X
    x = display.contentWidth * 0.5,
    -- Esse código mapeia a posição centro no eixo y
    y = display.contentHeight * 0.5
}
--

Config.posicao = function(objeto)
    return objeto.width * 0.5
end

------------------------------------------------------------------------------------------------------
--                                       Orientação                                                 --
------------------------------------------------------------------------------------------------------ 

----------------------------------------------------------------------------------------
--           Verifique se o dispositivo está em modeo Retrato ou paisagem:           ---
----------------------------------------------------------------------------------------
Config.Orientacao = function()
    local orientation = system.getInfo("orientation") -- Captura a orientação do dispositivo
    if orientation == "portrait" then -- Se estiver em modo Retrato:
        return "Retrato" -- Retorna uma string "Retrato"
    elseif orientation == "landscapeLeft" or orientation == "landscapeRight" then -- Paisagem
        return "Paisagem" -- Retorna uma string "Paisagem"
    end
    return nil -- Caso o dispostivo não tenha orientação retorne vazio
end
-------------------------------------------------------------------------------------------
print("A orientação é:", Config.Orientacao())

-------------------------------------------------------------------------------------------


--display.getCurrentStage():insert(imagemExibida)

----------------------------------------------------------------------------------------
--           Mapeando Orientação de tela conforme cada dispositivo                  ---
----------------------------------------------------------------------------------------
Config.tela = function()
    return system.getInfo("model") -- API solar2d que captura o modelo do dispositivo
end

Config.Escala = function()
    local Tela = {
        tipo = Config.tela(),
        escalas = {
            ["iPhone 6/6s/7/8"] = { ["Retrato"] = { 1334, 750 }, ["Paisagem"] = { 750, 1334 } },
            ["iPhone 6/6s/7/8 Plus"] = { ["Retrato"] = { 1920, 1080 }, ["Paisagem"] = { 1080, 1920 } },
            ["iPhone X/XS/11 Pro"] = { ["Retrato"] = { 2436, 1125 }, ["Paisagem"] = { 1125, 2436 } },
            ["iPhone XR/11"] = { ["Retrato"] = { 1792, 828 }, ["Paisagem"] = { 828, 1792 } },
            ["iPhone XS Max/11 Pro Max"] = { ["Retrato"] = { 2688, 1242 }, ["Paisagem"] = { 1242, 2688 } },
            ["iPhone 12/12 Pro/13/13 Pro/14"] = { ["Retrato"] = { 2532, 1170 }, ["Paisagem"] = { 1170, 2532 } },
            ["iPhone 12 Mini/13 Mini"] = { ["Retrato"] = { 2340, 1080 }, ["Paisagem"] = { 1080, 2340 } },
            ["iPhone 12 Pro Max/13 Pro Max/14 Plus"] = { ["Retrato"] = { 2778, 1284 }, ["Paisagem"] = { 1284, 2778 } },
            ["iPhone 14 Pro"] = { ["Retrato"] = { 2556, 1179 }, ["Paisagem"] = { 1179, 2556 } },
            ["iPhone 14 Pro Max"] = { ["Retrato"] = { 2796, 1290 }, ["Paisagem"] = { 1290, 2796 } },
            ["iPad Mini 1"] = { ["Retrato"] = { 1024, 768 }, ["Paisagem"] = { 768, 1024 } },
            ["iPad Mini 4/5"] = { ["Retrato"] = { 2048, 1536 }, ["Paisagem"] = { 1536, 2048 } },
            ["iPad Mini 6"] = { ["Retrato"] = { 2266, 1488 }, ["Paisagem"] = { 1488, 2266 } },
            ["iPad 9"] = { ["Retrato"] = { 2160, 1620 }, ["Paisagem"] = { 1620, 2160 } },
            ["iPad 10"] = { ["Retrato"] = { 2360, 1640 }, ["Paisagem"] = { 1640, 2360 } },
            ["iPad 11/Pro"] = { ["Retrato"] = { 2732, 2048 }, ["Paisagem"] = { 2048, 2732 } },
            ["iPad Pro 13"] = { ["Retrato"] = { 2752, 2064 }, ["Paisagem"] = { 2064, 2752 } },
            ["Android Phone"] = { ["Retrato"] = { 1920, 1080 }, ["Paisagem"] = { 1080, 1920 } },
            ["Android Tablet"] = { ["Retrato"] = { 1280, 800 }, ["Paisagem"] = { 800, 1280 } },
            ["HTML5"] = { ["Retrato"] = { display.actualContentWidth, display.actualContentHeight }, ["Paisagem"] = { display.actualContentHeight, display.actualContentWidth } },
            ["Desktop"] = { ["Retrato"] = { display.actualContentWidth, display.actualContentHeight }, ["Paisagem"] = { display.actualContentHeight, display.actualContentWidth } },
            ["Nintendo Switch Portátil"] = { ["Retrato"] = { 1280, 720 }, ["Paisagem"] = { 720, 1280 } },
            ["Nintendo Switch Dock"] = { ["Retrato"] = { 1920, 1080 }, ["Paisagem"] = { 1080, 1920 } },
            ["TV 720p"] = { ["Retrato"] = { 1280, 720 }, ["Paisagem"] = { 720, 1280 } },
            ["TV 1080p"] = { ["Retrato"] = { 1920, 1080 }, ["Paisagem"] = { 1080, 1920 } },
            ["TV 4K"] = { ["Retrato"] = { 3840, 2160 }, ["Paisagem"] = { 2160, 3840 } },
            ["Default"] = { ["Retrato"] = { display.actualContentWidth, display.actualContentHeight }, ["Paisagem"] = { display.actualContentHeight, display.actualContentWidth } }
        }
    }
    print(Tela.escalas[Tela.tipo])
    local tela = Tela.escalas[Tela.tipo] or Tela.escalas["Default"]
    return tela
end
----------------------------------------------------------------------------------------------

Config.Tamanho = function()
    local orienta = Config.Orientacao()
    if orienta == "Retrato" then
        local escala = Config.Escala()
        if escala then
            return escala["Retrato"]
        end
    elseif orienta == "Paisagem" then
        local escala = Config.Escala()
        if escala then
            return escala["Paisagem"]
        end
    end
    return {display.actualContentWidth, display.actualContentHeight} --retorna o tamanho da tela caso nao encontre nada.
end

----------------------------------------------------------------------------------------
--           Redimencione a tela conforme a orientação do dispositivo:               ---
----------------------------------------------------------------------------------------
Config.resize = function(event)
    if Config.LarguraDaTela < Config.AlturaDaTela or 
        display.contentWidth < display.contentHeight then
        return "Retrato" 
    elseif Config.LarguraDaTela > Config.AlturaDaTela or
        display.contentWidth > display.contentHeight then
        return "Paisagem"        
    end
end


Config.resize2 = function()
    local escala = Config.Escala()
    local resize = Config.resize()
    if resize == "Retrato" then
        display.pixelWidth = escala["Retrato"][1]
        display.pixelHeight = escala["Retrato"][2]
        return "Retrato"
    elseif resize == "Paisagem" then
        display.pixelWidth = escala["Paisagem"][1]
        display.pixelHeight = escala["paisagem"][2]
        return "Paisagem"        
    end
end




--Runtime:addEventListener("orientation", Config.mudarOritentacao2)
Runtime:addEventListener("resize", Config.resize2)

Config.LarguraDaTela = Config.Tamanho()[1]
Config.AlturaDaTela = Config.Tamanho()[2]

-------------------------------------------------------
--          Mapeando de Pontos na tela:             ---
-------------------------------------------------------
-- Mapeamento de centralidade:
Config.Centro = {
    x = Config.Tamanho()[1] * .5,
    y = Config.Tamanho()[2] * .5
}


print("Largura inicial:", Config.LarguraDaTela, "Altura inicial:", Config.AlturaDaTela)


-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
--
------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------------
return Config