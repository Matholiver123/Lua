-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
--local con = require("meu_app.configuracao")
local composer = require("composer")

-- Carrega próxima cena:
composer.gotoScene("meu_app.Primeiro_pagina.Pagina01_retrato")
-------------------------------------------------------------------------------------------

print("tela: "..display.pixelWidth)
print("tamanho atual: "..display.actualContentWidth)