---------------------------------------------------------------------------------------------------------
--                 CARREGA MÓDULOS IMPORTANTES PARA ESSE ARQUIVO:                                               ---
---------------------------------------------------------------------------------------------------------
local composer = require ( "composer" )
local Cenas = composer.newScene()
------------------------------------------------------------------
-- Tratamento de interfaces de usuários:
local widget = require "widget"

-----------------------------------------------------------------------------
-- Configuração particular desse projeto
-- Configurações de telas, e outras configurações uteis
local Config = require("meu_app.configuracao") -- Carrega Configurações
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
-- TABELA QUE CUIDA DAS IMAGENS DESSA PAGÍNA OU CENA
local Imagem = {
    Fundo = {}
    }
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
-- Tabela que lida com os Botôes e interface de Usuários
local Botao = {
    -------------------------------------------------------------------------
    -- Função que é tratada quando o botão de callback é precionado:
    Voltar = function() 
        composer.gotoScene(
            --Parâmetros para úteis para o gotoScene
            "meu_app.Primeiro_pagina.pagina01_retrato", -- endereço da cena/página seguinte.
            "zoomInOutFade", -- efeito/animação quando o gotoScene for ativado.
            1000 -- tempo do evento (1000 representa 1 segundo)
        ) 
        return true;
    end,
    -------------------------------------------------------------------------

    -------------------------------------------------------------------------
    -- Função que avança para a próxima etapa:
    Senha = function(resultado)
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
    -------------------------------------------------------------------------

-----------------------------------------------------------------------------
-- Tabela para Tratar Textos:
local Texto = nil
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
-- Tabela para tratamento temporário de objetos:
local Temporario = {} -- Tabela Temporario que armazena login e senha do usuário antes de enviar
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
-- Temporazizador ( Cuida do tempo de "eventos especificos")
local Tempo = {}
-----------------------------------------------------------------------------

-- Agrupar opbjetos em grupos:
local Grupo = {}

-----------------------------------------------------------------------------------------------------
--                                        CREATE                                                   --                                     --
-----------------------------------------------------------------------------------------------------

-- Ocorre antes da cena começar:
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


    -- eu fiz
    if ( fazer == "will" ) then

        Texto = require("meu_app.Texto")

        -------------------------------------------------------------
        -- Imagem de Fundo dessa Cena/Página:
        Imagem.fundo = display.newImageRect(
            "meu_app/Primeiro_pagina/imagens/fundo/Azul.png", -- Endereço da Imagem
            Config.LarguraDaTela, -- Tamanho da Largura da Imagem
            Config.AlturaDaTela -- Tamanho da Altura da Imagem
            ) -- fecha a API
        -- Mapeando da Posição da imagem na tela:
        Imagem.fundo.x = Config.LarguraDaTela * 0.5
        Imagem.fundo.y = Config.AlturaDaTela * 0.5
        ---------------------------------------------------------------

        --------------------------------------------------------------
        --              Grupo de Exibição (display group)           --
        --------------------------------------------------------------
        GrupoDeCenas:insert( Imagem.fundo )
        GrupoDeCenas:insert( Texto.LogoTipo.Desenho )
        GrupoDeCenas:insert( Texto.Etec.Desenho )

        Grupo.Logo = display.newGroup()
        Grupo.Logo:insert(Texto.LogoTipo.Desenho)
        Grupo.Logo:insert(Texto.Etec.Desenho)

        Grupo.User = display.newGroup()
        Grupo.Senha = display.newGroup()
        --------------------------------------------------------------


        Botao.Vai = {}

        Botao.Vai.volta = function()
            
        end

        Botao.Vai.proximo2 = function(situacao)
            
            local function Remover(imagem,caixa)
                transition.to(Grupo.Senha, {
                    time = 1000,
                    delay = 100,
                    x = Config.LarguraDaTela + Config.LarguraDaTela,
                    alpha = 0,
                    onComplete = function()
                       Texto.Senha.Desenho.isVisible = false
                       Texto.Senha.Caixa.isVisible = false
                    end
                })
                transition.to(Botao.Vai.Imagem, {
                    time = 1500,
                    delay = 200,
                    x = Config.LarguraDaTela * 2,
                    onComplete = function()
                        Botao.Vai.Imagem:removeSelf()
                        Botao.Vai.Imagem = nil
                    end
                })
                transition.to(Botao.Vai.Imagem2, {
                    time = 1500,
                    delai = 200,
                    x = - Config.LarguraDaTela * 2,
                    onComplete = function()
                        Botao.Vai.Imagem2:removeSelf()
                        Botao.Vai.Imagem2 = nil
                    end
                })
            end

            local escolha = {
                situacao = situacao,
                escolha = {
                ["Vai"] = function()
                    -- Voltando para menu:
                    Remover()
                    Botao.Vai.f()
                 end,
                ["Volta"] = function()
                    -- Voltando para menu:
                    Remover()
                    Botao.Vai.f()
                 end}}

            local escolha2 = escolha.escolha[escolha.situacao]
            return escolha2
        end

        ---------------=-----------------------------------------------------------
        --                      Função Chamada Quando for Criar a senha:        ---
        ---------------------------------------------------------------------------
        local Animacao_Senha = function()
            -- use a API f passando o parâmetro "Senha":
            Texto.f("Senha")
            -- Add o Desenho e a Caixca de Senha no grupo de Senha:
            Grupo.Senha:insert(Texto.Senha.Desenho)
            Grupo.Senha:insert(Texto.Senha.Caixa)
            -- Add uma transição do tipo FadeIN no grupo de Senha
            transition.fadeIn(Grupo.Senha,
                {
                    2000,
                    -- Quando a Transição terminar:
                    onComplete = function()
                        -- Espere 1 segundo para:
                        Tempo.SenhaAnimada = timer.performWithDelay(
                            1000, function()
                                -- Carregar uma imagem:
                                Botao.Vai.Imagem = display.newImageRect(
                                "meu_app/Primeiro_pagina/imagens/seta_botao.png",
                                Texto.Senha.Desenho.width / 2,
                                Texto.Senha.Desenho.height
                                )
                                Botao.Vai.Imagem.x = Texto.Senha.Caixa.x + ( Texto.Senha.Caixa.width / 2.8 )
                                Botao.Vai.Imagem.y = Texto.Senha.Caixa.y + Texto.Senha.Caixa.height
                                GrupoDeCenas:insert( Botao.Vai.Imagem )

                                -- Carrega Outra Imagem:
                                Botao.Vai.Imagem2 = display.newImageRect(
                                    "meu_app/Primeiro_pagina/imagens/seta_botao.png",
                                    Texto.Senha.Desenho.width / 2,
                                    Texto.Senha.Desenho.height
                                    )
                                -- Posição na tela do objeto:
                                Botao.Vai.Imagem2.x = Texto.Senha.Caixa.x - ( Texto.Senha.Caixa.width / 2.8 )
                                Botao.Vai.Imagem2.y = Texto.Senha.Caixa.y + Texto.Senha.Caixa.height
                                -- Vire a imagem para o outro lado:
                                Botao.Vai.Imagem2:scale(-1, 1)
                                -- Add Essa Imagem no Grupo de Cenas:
                                GrupoDeCenas:insert( Botao.Vai.Imagem2 )
                                -- Add um evento de escuta do tipo "tap", na imagem2 que
                               -- A Função Botao.Vai.proximo2 

                                Botao.Vai.Imagem:addEventListener("tap", function() Botao.Vai.proximo2("Vai")() end)
                                Botao.Vai.Imagem2:addEventListener("tap", function() Botao.Vai.proximo2("Volta")() end)

                            end
                        )
                    end
                });
        end
        ---------------=-----------------------------------------------------------

        ---------------=-----------------------------------------------------------
        Botao.Vai.proximo = function()
            -- Add uma transição no grupo User de 1 segundo:
            transition.to(Grupo.User, {
                -- A transição deve dudar 1 segundo
                time = 1000,
                -- Move linearmente para esquerda o nosso grupo até sair da tela:
                x = - Config.LarguraDaTela,
                -- Quando terminar a transição:
                onComplete = function()
                    -- Se Caixa de Texto existir:
                    if Texto.Nome.Caixa then
                        -- vários métodos para tirar a caixa de texto:
                        Texto.Nome.Caixa.width = 0
                        Texto.Nome.Caixa.height = 0
                        Texto.Nome.Caixa.isVisible = false
                    end
                    -- Se Desenho do Nome Existir
                    if Texto.Nome.Desenho then
                        -- Torne invisivel nesse momento:
                        Texto.Nome.Desenho.isVisible = false
                    end
                end
            })
            -- Add uma transição na imagem vai
            transition.to(Botao.Vai.Imagem, {
                -- é esperado que essa transição dure 1 segundo:
                time = 1000,
                -- Move oobjeto para a direita até sair da tela
                x = Config.LarguraDaTela + Config.LarguraDaTela,
                -- Quando terminar a transição:
                onComplete = function()
                    
                    Animacao_Senha()
                end
            })
            return true;
        end
        ---------------=-----------------------------------------------------------

        ---------------=-----------------------------------------------------------
        Botao.Vai.f = function()

            local function x()
                -- em Vai.Imagem add um API que carrega uma Imagem Retangulada simples
            Botao.Vai.Imagem = display.newImageRect(
                -- Endereço da imagem a ser usada:
                "meu_app/Primeiro_pagina/imagens/seta_botao.png",
                -- Tamanho da Largura da Imagem:
                Texto.Nome.Desenho.width / 2,
                -- Tamanho da Altura da Imagem:
                Texto.Nome.Desenho.height
            )
            -- Posição horizontal da imagem será igual A posição da caixa de texto de digitação
            -- + a largura da Caixa dividido por 2.8
            Botao.Vai.Imagem.x = Texto.Nome.Caixa.x + ( Texto.Nome.Caixa.width / 2.8 )
            -- Posição Vertical da imagem será igual A posição da caixa do texto + a altura da caixa
            -- do texto
            Botao.Vai.Imagem.y = Texto.Nome.Caixa.y + Texto.Nome.Caixa.height
            -- insira a Imagem no grupo de Cenas:
            GrupoDeCenas:insert( Botao.Vai.Imagem )
            -- e então Add um evento de escuta do tipo toque "tap" na imagem que chame
            -- a Função Botao.vai.proximo
            Botao.Vai.Imagem:addEventListener("tap", Botao.Vai.proximo)
            end

            if Texto.Nome.Desenho.isVisible == false then
                Texto.Nome.Desenho.isVisible = true
                Texto.Nome.Caixa.isVisible = true
                transition.to(Grupo.User, {
                    x = Config.LarguraDaTela * .015,
                    onComplete = function() Tempo.x = timer.performWithDelay(2000, function() x() end )end
                })
            end

            x()
            
            
        end
        ---------------=-----------------------------------------------------------
    
        ---------------=-----------------------------------------------------------
        local Animacao = function()
            -- Chama a API telaLogin do módulo Texto passando o parametrô telaCadastro:
            Texto.telaLogin("telaCadastro")
            
            -- Transição do tipo fadeIn aplicado no texto de boas vindas, com duração de 1 segundo
            transition.fadeIn(Texto.BoasVindas.Desenho,{1000,
                -- Quando a transição terminar:
                onComplete = function()
                    -- Mude a Cor do Texto de Boas Vindas depois:
                    Texto.BoasVindas.Desenho:setFillColor(0.8,0.8,0.8,1);
                    -- espera 2 segundos (em média)
                    Tempo.animacao = timer.performWithDelay(2000,
                        -- use a API f do módulo Texto com o parâmetro "nome"
                        Texto.f("nome"))
                        -- Pinte o Desenho do texto
                        Texto.Nome.Desenho:setFillColor(0,0,0,1)
                        -- Add a Caixa e o Desenho do texto em um grupo:
                        Grupo.User = display.newGroup()
                        Grupo.User:insert(Texto.Nome.Desenho)
                        Grupo.User:insert(Texto.Nome.Caixa)
                        -- espere 1 segundo e chame a função Botao.Vai
                        Tempo.BoasVindas = timer.performWithDelay(
                            1000,Botao.Vai.f
                        )
                end
            });
        end
        ---------------=-----------------------------------------------------------

        ------------------------------------------------------------------------
        --                      1- Transição na Logo,                         --
        ------------------------------------------------------------------------
        transition.to(Grupo.Logo,{
            -- essa transição move a logo algumas unidades para cima:
            y = ( Texto.LogoTipo.Desenho.y - Texto.LogoTipo.Desenho.height ),
            -- Quando terminar a transição execute a função chamda:
            onComplete = function() Animacao() end
        });
        ------------------------------------------------------------------------

        
  
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

        ----------------------------------------------------------
        --              Removendo Temporizadores:              ---
        ----------------------------------------------------------
        if Tempo.BoasVindas then
            timer.cancel(Tempo.BoasVindas);
        end

        if Tempo.animacao then
            timer.cancel(Tempo.animacao);
        end
        -----------------------------------------------------------
        
        
        ----------------------------------------------------------
        --              Removendo Transições:                  ---
        ----------------------------------------------------------
        if Grupo.Logo then
            transition.cancel(Grupo.Logo)
        end
        -----------------------------------------------------------

 
    -- eu farei
    elseif ( fazer == "did" ) then

        -- Removendo Eventos:
        if Botao.Vai.imagem then
            Botao.Vai.Imagem:removeEventListener("tap", Botao.Vai.proximo)
        end
    end
end
-------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------
--                                        Destroy                                                  --                                                              
-----------------------------------------------------------------------------------------------------
function Cenas:destroy( evento )
    local GrupoDeCenas = self.view

    if GrupoDeCenas then
        GrupoDeCenas:removeSelf();
        GrupoDeCenas = nil
    end

    if Texto then
        Texto = nil
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