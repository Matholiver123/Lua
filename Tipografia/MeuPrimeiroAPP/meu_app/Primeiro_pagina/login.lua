---------------------------------------------------------------------------------------------------------
--                 GERENCIMANTO DE CENAS DO COMPOSER                                                  ---
---------------------------------------------------------------------------------------------------------
local composer = require ( "composer" )
local Cenas = composer.newScene()
------------------------------------------------------------------

-- Tratamento de interfaces de usuários
local widget = require "widget"
-- Configuração particular desse projeto
local Config = require("meu_app.configuracao") -- Carrega Configurações
-- Objetos uteis
local imagem = {} -- Tabela para tratar das imagens
local Botao = {
    -- Função que é tratada quando o botão de callback é precionado:
    voltar = function() 
        composer.gotoScene(
            --Parâmetros para úteis para o gotoScene
            "meu_app.Primeiro_pagina.pagina01", -- endereço da cena/página seguinte.
            "zoomInOutFade", -- efeito/animação quando o gotoScene for ativado.
            1000 -- tempo do evento (1000 representa 1 segundo)
        ) 
        return true;
    end
} -- Tabela para tratar dos botoẽs
local CaixaTexto = {}
local Grupo = display.newGroup() -- Grupo de objetos visuais
-----------------------------------------------------------------------------------------------------
--                                        CREATE                                                   --                                     --
-----------------------------------------------------------------------------------------------------

-- Ocorre anes da cena começar:
function Cenas:create( evento )

    ----------------------------------------------------------
    --          Tratamente de Botão de CallBack (voltar)    --
    ----------------------------------------------------------
    -- esse botão faz referencia a o botão callback do Android
    -- Runtime -> Evento que ocorre o "tempo todo".
    -- addEventListener -> Método que adiciona algum ouvinte de evento a um objeto
    -- "key" -> parametro do método addEventListener que indica que alguma "tecla" será precionada.
    Runtime:addEventListener("key", function (Alvo)
        -- se o botão back("CallBack do Android for apertado")
        if (Alvo.keyName == "back") then
            -- Quando o botão for soltado:
            if (Alvo.phase == "up") then
                -- mensagem no Console para Debugação:
                print("Botão de voltar pressionado")
                -- chama essa função para tratar esse evento:
                Botao.Voltar() -- função está no começo do código
                return true; -- Retorna verdadeiro indica que o evento é acionado apenas uma vez.
            end;
                return true  -- Indica que o evento foi tratado
            end
        return false  -- Indica que o evento não foi tratado
    end)


    -------------------------------------------------------
    --          Tratamento da "Caixa de Digitação"       --
    -------------------------------------------------------
    CaixaTexto.digitacao = function (evento) 
        if (evento.phase == "began") then
            -- O usuário começou a editar Editar a Caixa de Texto:
        elseif (evento.phase == "ended" or evento.phase == "submitted") then
            -- O usuário terminou de editar o campo de texto
            print("Email inserido: " .. evento.target.text)
            return evento.target.text
        elseif (evento.phase == "editing") then
            -- O usuário está editando o campo de texto
        end
        return true;
    end;
    -------------------------------------------------------------
end
------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------
--                                        SHOW                                                     --          --
-----------------------------------------------------------------------------------------------------
function Cenas:show( evento )
    local GrupoDeCenas = self.view
    local fazer = evento.phase
    local Grupo = display.newGroup()

    -------------------------------------------------------------
    --         Tratamento visuais da Caixa de Texto            --
    -------------------------------------------------------------
    CaixaTexto.Caixa_Logar = native.newTextField(
                Config.Centro.x,
                Conectando.texto.boaVinda4a.y + 1,
                350,
                60)

    CaixaTexto.Caixa_Senha = native.newTextField(Conectando.texto.boaVinda3a.x + 300,
                                            Conectando.texto.boaVinda3a.y + 1,
                                            350,
                                            60)
    CaixaTexto.Caixa_Senha.isSecure = true -- Código que faz com que o que se escreve nessa caixa não seja visto.

    -- Add ouvinte de evento do tipo "input" em ambas as caixas:
    CaixaTexto.Caixa_Logar:addEventListener("userInput", CaixaTexto.digitacao)
    CaixaTexto.Caixa_Senha:addEventListener("userInput", CaixaTexto.digitacao)
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

---------------------------------------
return Cenas
