---------------------------------------------------------------------------------------------------------
--                 CARREGA MÓDULOS IMPORTANTES PARA ESSE ARQUIVO:                                               ---
---------------------------------------------------------------------------------------------------------
local composer = require ( "composer" )
local Cenas = composer.newScene()
------------------------------------------------------------------
-- Tratamento de interfaces de usuários:
local widget = require "widget"

-- Configuração particular desse projeto
-- Configurações de telas, e outras configurações uteis
local Config = require("meu_app.configuracao") -- Carrega Configurações

-- Objetos uteis:
local Imagem = {
    Fundo = {}
    } -- Tabela para tratar das imagens
local Botao = {
    -- Função que é tratada quando o botão de callback é precionado:
    Voltar = function() 
        composer.gotoScene(
            --Parâmetros para úteis para o gotoScene
            "meu_app.Primeiro_pagina.pagina01", -- endereço da cena/página seguinte.
            "zoomInOutFade", -- efeito/animação quando o gotoScene for ativado.
            1000 -- tempo do evento (1000 representa 1 segundo)
        ) 
        return true;
    end,
    -- Função que avança para a próxima etapa:
    Login = function(resultado)
        if resultado == false then
            print("Algop deuy errado não conseguimos entrar com esse uuário")
        elseif resultado == true then
            print("Login Bem Sucedido")
            composer.gotoScene(
                "meu_app.Segunda_pagina.Status",
                "fade",
                1000
            )
        end
    end
    } -- Tabela para tratar dos botoẽs

-- Tabela para Tratar Textos:
local Texto = require("meu_app.Texto")

-- Tabela para tratamento temporário de objetos:
local Temporario = {} -- Tabela Temporario que armazena login e senha do usuário antes de enviar

-- Agrupar opbjetos em grupos:
local Grupo = display.newGroup() -- Grupo de objetos visuais

---------------------------------------------------------------------------------------------------------
--                 GERENCIMANTO DE CENAS DO COMPOSER                                                  ---
---------------------------------------------------------------------------------------------------------

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
        -------------------------------------------------------------
        --         Tratamento visuais da Caixa de Texto            --
        -------------------------------------------------------------

        Texto.telaLogin("telaLogin")

        -------------------------------------------------
        --          Botão de Acesso para Logar         --
        -------------------------------------------------
        Botao.Acesso = widget.newButton{
            defaultFile = "meu_app/Primeiro_pagina/imagens/Login_in.png", -- Botão antes do click
            overFile = "meu_app/Primeiro_pagina/imagens/Login_out.png", -- Botão quando clicado
            width = ( Config.LarguraDaTela * 0.2 ), -- Tamano da largura do botão.
            height = Config.AlturaDaTela * 0.06, -- Tamanho da Altura do botão.
            -- Ação que acontece quando o botão é apertado:
        }

        Botao.Acesso.x = Texto.Usuario.Caixa.x
        Botao.Acesso.y = Texto.Usuario.Caixa.y + Texto.Usuario.Caixa.width

        -----------------------------------------------------

        -------------------------------------------------------
         --          Tratamento da "Caixa de Digitação"       --
        -------------------------------------------------------


        Texto.Logando = function(Login)
            local Usuario = require("meu_app.Usuario")
            Usuario.Logar(Temporario)
            if Usuario.RespostaDoLogion == false then
                Botao.Login(false)
            else
                Botao.Login(true)
            end
        end


        Botao.Entrar = function (evento)
                if Temporario.Senha then
                    if Temporario.Senha == "" or Temporario.Senha == nil then
                        print("Campo Vazio, Digite uma senha Valida")
                    else
                        print("inserindo a Senha!")
                        Texto.Logando(Temporario)
                    end
                end            
                
        end
    
        -- Caixa de Digitar a Senha:
        Texto.digitacao_Senha = function (evento)
            if (evento.phase == "ended" or evento.phase == "submitted") then         
                if evento.target == Texto.Senha.Caixa then
                    Temporario.Senha = evento.target.text
                    print(Temporario.Senha)
                end
                return true;
            end
        end

        -- Caixa de Digitar o usuário:
        Texto.digitacao_Usuario = function (evento)
            if (evento.phase == "ended" or evento.phase == "submitted") then         
                if evento.target == Texto.Usuario.Caixa then
                    Temporario.Usuario = evento.target.text
                    print(Temporario.Usuario)
                end
                return true;
            end
        end




    -- Add objetos no grupo de cena:


    -------------------------------------------------------------
        -- Add ouvinte de evento do tipo "input" em ambas as caixas:
        Texto.Usuario.Caixa:addEventListener("userInput", Texto.Registrar)
        --Temporario.Usuario = Texto.Registrar()
        Texto.Senha.Caixa:addEventListener("userInput", Texto.digitacao_Senha)


    -- eu farei
    elseif ( fazer == "did" ) then

        Imagem.Fundo.Aparece = function()
            Imagem.Fundo.Desenho = display.newImageRect(
                "meu_app/Primeiro_pagina/imagens/fundo/cinza.png",
                Config.LarguraDaTela,
                Config.AlturaDaTela
            )
            Imagem.Fundo.Desenho.x = ( Config.LarguraDaTela * .5 )
            Imagem.Fundo.Desenho.y = ( Config.AlturaDaTela - Imagem.Fundo.Desenho.height)
            transition.to(Imagem.Fundo.Desenho,{y = Config.AlturaDaTela * .5,
                            timer = 500 });
            GrupoDeCenas:insert( Imagem.Fundo.Desenho)
            --GrupoDeCenas:insert(Texto.LogoTipo.Desenho)
            --GrupoDeCenas:insert(Texto.Etec.Desenho)
            GrupoDeCenas:insert( Texto.Usuario.Desenho)
            GrupoDeCenas:insert( Texto.Senha.Desenho)
            GrupoDeCenas:insert( Botao.Acesso )
            GrupoDeCenas:insert( Texto.Usuario.Caixa)
            GrupoDeCenas:insert( Texto.Senha.Caixa)

            --GrupoDeCenas:insert( Texto.LogoTipoEtec)
         end

         Imagem.Fundo.Tempo = timer.performWithDelay( 50, Imagem.Fundo.Aparece)

         

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

        -- Remove evento de userinput para economia de memoria:
        local sumir = function()
            if Texto.Usuario.Caixa then
                Texto.Usuario.Caixa.width = 1
                Texto.Usuario.Caixa.height = 1
            end

            if Texto.Senha.Caixa then
                Texto.Senha.Caixa.width = 1
                Texto.Senha.Caixa.height = 1
            end
        end
        local sumiu = timer.performWithDelay( 500, sumir )
        Texto.Usuario.Caixa:removeEventListener("userInput", Texto.digitacao)
        Texto.Senha.Caixa:removeEventListener("userInput", Texto.digitacao)

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

    if Texto.Usuario.Caixa then
        Texto.Usuario.Caixa:removeSelf()
        display.remove(Texto.Usuario.Caixa)
        Texto.Usuario.Caixa = nil
    end

    if Texto.Senha.Caixa then
        Texto.Senha.Caixa:removeSelf()
        Texto.Senha.Caixa = nil
    end

    if GrupoDeCenas then
        GrupoDeCenas:removeSelf();
        GrupoDeCenas = nil
    end


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
