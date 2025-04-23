-- CARREGA CONFIGURAÇÕES
local con = require ( "meu_app.configuracao")

-----------------------------------------------------------------
--              Imagem de fundo simples                        --
-----------------------------------------------------------------
-- Usando a API newImageRect para usar imagem na tela.
local fundo = display.newImageRect(
"/meu_app/Primeiro_pagina/imagens/base.png", -- Local da Imagem
 display.actualContentWidth, -- Largura da imagem
 display.actualContentHeight -- Altura da imagem
)
 -- Posição da imagem na tela
 fundo.x = con.centro.x + 5 -- Posição da imagem no eixo X
 fundo.y = con.centro.y -- POsição da imagem no eixo y
----------------------------------------------------------------

----------------------------------------------------------------
---         ADD uma imagem de Titulo na tela                  --
----------------------------------------------------------------
local titulo = display.newImageRect(
    "/meu_app/Primeiro_pagina/imagens/logo.png", -- Endereço do titulo
    ( display.actualContentWidth * 0.5 ) / 0.7, -- Posição horizontal do titulo
    ( display.actualContentWidth * 0.5 ) / 4 -- Posição Vertical do titulo
)
-- Posição das cordenadas te tela no eixo x e y
titulo.x = display.actualContentWidth / 2
titulo.y = ( display.actualContentHeight * 0.5 ) / 2

-- tradução:
--´[[
    -- a API newImageRect contem uma função que recebe alguns parametros para inserir e configurar
    --imagem na tela, podemos passar o enderço da imagem que está no projeto, a largura da imagem em pixel
    --a altura da imagem em pixel e de qual grupo essa imagem faz parte.

                    --ENTENDENDO actualContentWidth E actualContentHeight

    --A API actualContentWidth calcula o tamanho total da largura da tela no dispositivo em execução
    --Enquanto a API actualContentWidth faz o mesmo porém com a Altura.

-----------------------------------------------------------------------
--- RETORNA CENA NO FINAL DO ARQUIVO