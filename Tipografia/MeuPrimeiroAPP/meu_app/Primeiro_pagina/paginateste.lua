--------------------------------------------------------------------
--          CARREGANDO GERENCIADOR DE cena COMPOSER              --
--------------------------------------------------------------------
local composer = require ( "composer" )
local cena = composer.newScene()
------------------------------------------------------------------
local widget = require "widget"
local config = require("meu_app.configuracao")

local centro = {
    x = display.actualContentWidth *.5,
    y = display.actualContentHeight *.5
}

local quadrado = display.newRect(0,0,400,400);
quadrado.x = centro.x
quadrado.y = centro.y
quadrado:setFillColor(1,1,1,1);

local bola = display.newCircle( 0, 0, 100 )
bola.x = centro.x
bola.y = centro.y
bola:setFillColor(1,0,0,1);
local function MudarCor()
    bola:setFillColor(1,0,1,1)
end
bola:addEventListener("tap", MudarCor)

return cena
