-- Criando Classe de Texto:
local ClasseTexto = {}
local Config = require("meu_app.configuracao")

----------------------------------------------------------
-- Método Construtor da Classe Texto:                   --
----------------------------------------------------------
function ClasseTexto:Novo(Escrito,Desenho,Animacao,Caixa)
    local Texto = {
        Escrito = Escrito,
        Desenho = Desenho,
        Animacao = Animacao,
        Caixa = Caixa
    }
    setmetatable(Texto, {__index = self})
    return Texto
end
----------------------------------------------------------

-----------------------------------------------------------------
--              Criando Instâncias                            ---
-----------------------------------------------------------------
local Texto = {
    -- Instância LogoTipo
    LogoTipo = ClasseTexto:Novo("Etec",nil,nil),
    -- Instância Etec
    Etec = ClasseTexto:Novo("Belém",nil,nil)
}

Texto.LogoTipo.Desenho = display.newText(Texto.LogoTipo.Escrito, -- 
            Config.LarguraDaTela * .5, -- Eixo X (horizontal de texto)
            Config.AlturaDaTela *.2, -- Eixo Y ( vertical do texto )
            Config.Fonte, -- Fonte que será usado no texto gráfico
            Config.LarguraDaTela * .3) -- Tamanho do Texto
            
Texto.Etec.Desenho = display.newText(Texto.Etec.Escrito, -- 
            Config.LarguraDaTela * .5, -- Eixo X (horizontal de texto)
            Config.AlturaDaTela *.3, -- Eixo Y ( vertical do texto )
            Config.Fonte, -- Fonte que será usado no texto gráfico
            Config.LarguraDaTela * .15) -- Tamanho do Texto
-------------------------------------------------------------
            
---------------------------------
Texto.telaLogin = function(Pagina)
    -- Se estiver na Pagina de Login esse código:
    if Pagina == "telaLogin" then
        ------------------------------------------------------
        ---     Criando Instância Usuário:                 ---
        ------------------------------------------------------
        Texto.Usuario = ClasseTexto:Novo() -- Dizendo que Texto.Usuario faz parte da nossa ClasseTexto
        Texto.Usuario.Escrito = "Usuário: " -- Texto da instância
        -- Caixa de Texto (Aquela caixa para digitar o Login):
        Texto.Usuario.Caixa = native.newTextField(
            Config.Centro.x, -- Posição X
            Config.AlturaDaTela * .5, -- Posição Y
            Config.LarguraDaTela * .8, -- Tamanho Horizontal da Caixa
            Config.AlturaDaTela * .5 / 8) -- Tamanho Vertical da Caixa
        -- Texto Gráfico (o que é mostrado na tela)
        Texto.Usuario.Desenho = display.newText(
            Texto.Usuario.Escrito,
            -- Posição no eixo X será ( a Posição da Caixa Usuário menos
            -- o tamanho da largura(width) da caixa de usuário dividido por 3.5)
            Texto.Usuario.Caixa.x - Texto.Usuario.Caixa.width / 3.5,
            -- Posição no eixo Y será a posição vertical da caixa do usuário
            -- menos o tamanho vertical(heigth da caixa do usuário.)
            Texto.Usuario.Caixa.y - Texto.Usuario.Caixa.height,
            -- Font do texto que estamos usando nesse Texto.
            Config.Fonte,
            -- Tamanho do Texto.
            Config.LarguraDaTela * .1)

        -------------------------------------------------
        -----                   instância Senha:
        -------------------------------------------------
        Texto.Senha = ClasseTexto:Novo() -- Diz que nossa instância faz parte da ClasseTexto
        Texto.Senha.Escrito = "Senha: " -- Texto
        -- Texto Gráfico:
        Texto.Senha.Desenho = display.newText(
            -- Texto que aparece
            Texto.Senha.Escrito,
            Texto.Usuario.Caixa.x - Texto.Usuario.Caixa.width / 3.5,
            Texto.Usuario.Caixa.y + Texto.Usuario.Caixa.height,
            Config.Fonte,
            Config.LarguraDaTela * .1)

        Texto.Senha.Caixa = native.newTextField(
            Config.Centro.x, -- Posição X
            Texto.Usuario.Caixa.y + Texto.Usuario.Caixa.width / 3.0, -- Posição Y
            Config.LarguraDaTela * .8,
            Config.AlturaDaTela * .5 / 8)
        Texto.Senha.Caixa.isSecure = true

    -- Se o Estiver na Página/Cena de
    elseif ( Pagina == "telaCadastro" ) then
        Texto.BoasVindas = ClasseTexto:Novo()
        Texto.BoasVindas.Escrito = "Bem vindo! novo usuário"
        Texto.BoasVindas.Desenho = display.newText(
            -- Texto que aparece
            Texto.BoasVindas.Escrito,
            -- Posição X do texto:
            Config.LarguraDaTela * .5,
            -- Posição Y será:
            (Texto.Etec.Desenho.y + Texto.Etec.Desenho.height),

            Config.Fonte,
            Config.LarguraDaTela * .08)
        Texto.BoasVindas.Animacao = function()

        end

        -- Pegar nome do novo usuário:
        Texto.f = function(Parametro)

            -------------------------------------------------
            if Parametro == "nome" then
                Texto.Nome = ClasseTexto:Novo()
                Texto.Nome.Escrito = "Qual é o seu Nome ?: "
                Texto.Nome.Desenho = display.newText(
                    -- Texto que aparece
                    Texto.Nome.Escrito,
                    -- POsição X do texto:
                    Config.LarguraDaTela * .5,
                    -- Posição Y será:
                    (Texto.Etec.Desenho.y + (Texto.Etec.Desenho.height * 1.5)),

                    Config.Fonte,
                    Config.LarguraDaTela * .08)
                -- Caixa de Digitação para colocar o Nome:
                Texto.Nome.Caixa = native.newTextField(
                    Texto.Nome.Desenho.x, -- Posição X
                    Texto.Nome.Desenho.y + (Texto.Nome.Desenho.height * 1.2), -- Posição Y
                    Config.LarguraDaTela * .8,
                    Config.AlturaDaTela * .5 / 8)

            -------------------------------------------------------------
            elseif Parametro == "Senha" then
                Texto.Senha = ClasseTexto:Novo()
                Texto.Senha.Escrito = "Palavra Chave: "
                Texto.Senha.Desenho = display.newText(
                    -- Texto que aparece
                    Texto.Senha.Escrito,
                    -- POsição X do texto:
                    Config.LarguraDaTela * .5,
                    -- Posição Y será:
                    (Texto.Etec.Desenho.y + (Texto.Etec.Desenho.height * 1.5)),

                    Config.Fonte,
                    Config.LarguraDaTela * .08)
                -- Caixa de Digitação para colocar o Nome:
                Texto.Senha.Caixa = native.newTextField(
                    Texto.Senha.Desenho.x, -- Posição X
                    Texto.Senha.Desenho.y + (Texto.Senha.Desenho.height * 1.2), -- Posição Y
                    Config.LarguraDaTela * .8,
                    Config.AlturaDaTela * .5 / 8)
            end
            --------------------------------------------------------
        end

    end

    end

------------------------------------------------------------------------------
-- API de usperinput:
Texto.Registrar = function(evento)
    if (evento.phase == "ended" or evento.phase == "submitted") then         
        if evento.target == Texto.Usuario.Caixa then
            print("Usuário digitado: ",evento.target.text)
            return evento.target.text          
        end
        return true;
    end
end
------------------------------------------------------------------------------

---------=---------------------------------------
--          Objeto que esse arquivo retorna
-----------------------------------------------------
return Texto

-- Todo arquivo em um desenvolvimento modular deve retornar algum Objeto
-- como se fosse um return de uma função.