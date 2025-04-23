-------------------------------------------------------------------
--                  CRIANDO PONTO DE CENTRALIDADE:               --
-------------------------------------------------------------------
--[[
        Ponto de centralidade é um ponto para centralizar
        Objetos visuais na tela do dispositivo,
        Recomenda usar um arquivo de configuração em seu
        Projeto para usar essa tecnica
]]

-- Exemplo de ponto de centralidade no atual posição do dispositivo:
local centro = {
    x = display.actualContentWidth * .5,
    y = display.actualContentHeight * .5
}
--------------------------------------------------------------------

----------------------------------------------------------------------
--                 
----------------------------------------------------------------------

--------------------------------------------------------------------
--                  ADD UMA IMAGEM RETANGULADA                    --
--------------------------------------------------------------------
-- Exemplo de uma imagem retângulada com uma variável simples:
local imagem = display.newImageRect
            (    Grupo, -- Add o novo a um grupo visual
                "Caminho", -- Caminho da imagem no seu projeto  
                Largura, -- Largura da imagem em relação a tela.
                Altura  -- Altura da imagem em relação a tela.
            )
imagem.x = 0 -- Posição do eixo Horizontal na tela.
imagem.y = 0 -- Posição do eixo Verfical da tela.

-- Exemplo de uma imagem retângulada com tabela:
local elementos = {
    imagem = display.newImageRect(
        "Caminho",
        Largura,
        Altura
    )
}
-- passamos o nome da tabela depois o nome do objeto da tabela:
elementos.imagem.x = 0 -- Posição do eixo Horizontal na tela.
elementos.imagem.x = 0 -- Posição do eixo Verfical da tela.

--Trabalhando com multiplas imagens:
    -- Para se trabalhar com essa quantidade grande de imagens precisamos
    -- trabalhar com funções:

    -- Nesse exemplo adicionaremos uma imagem conforme o dispositivo:
    local multiplas = display.newImageRect(
        function()
            if system.getInfo().os == "Android" then
                return "Caminha da imagem no caso do Android"
            elseif system.getInfo().os == "iPhone OS" then
                return "Caminho da imagem no Caso do Iphone"
            else
                return "Caminho da imagem"
            end
         end,
         Largura,
         Altura
    )

multiplas.x = 0
multiplas.y = 0
----------------------------------------------------------------------

----------------------------------------------------------------------
--              TRATAMENTO DE POSICIONAMENTO 
----------------------------------------------------------------------
-- tratando o ponto ancora.
    -- Ponto Ancora é o ponto/pixel que ancora sua imagem geralmente ele
    -- é o ponto central da imagem configurado em 0.5 e 0.5
    
-- Indica que a Ancoragem do objeto é no canto superior esquerdo da imagem.
    objeto.anchorX = 0 -- 
    objeto.anchorY = 0 --

-- Refere a Ancoragem do objeto no canto superior central.
    objeto.anchorX = 0.5
    objeto.amchorY = 0.0

-- Ancoragem do objeto no Canto superior Direito:
    objeto.anchorX = 1
    objeto.anchorY = 0

-- Ancoragem do objeto no meio Esquerdo:
    objeto.anchorX = 0
    objeto.anchorY = 0.5

-- Ancoragem do objeto no Centro do objeto "Padrão"
    objeto.anchorX = 0.5
    objeto.anchorY = 0.5

-- Ancoragem do objeto no meio Direito:
    objeto.anchorX = 1
    objeto.anchorY = 0.5

-- Ancoragem do objeto no meio Direito:
    objeto.anchorX = 1
    objeto.anchorY = 0.5

-- Ancoragem do objeto no Canto Inferior Esquerdo:
    objeto.anchorX = 0
    objeto.anchorY = 1

-- Ancoragem do objeto no Canto Inferior central:
    objeto.anchorX = 0.5
    objeto.anchorY = 1

-- Ancoragem do objeto no Canto direito Esquerdo:
    objeto.anchorX = 1
    objeto.anchorY = 1
---------------------------------------------------------------------------

local Minha_imagem = display.newImageRect(
    "imagem.png", --> Coloque aqui o Endereço da IMAGEM.
    100, --> Tamanho da Largura da Imagem.
    80, --> Tamanho da Altura da imagem.
)

local centro = {
    x = display.actualContentWidth * 0.5,
    y = display.actualContentHeight * 0.5
}

local backgroud = display.newImage(
    "Endereço da Imagem",
    diplay.actualContentWidth,
    display.actualContentHeight)