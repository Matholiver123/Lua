-------------------------------------------------------------------
--          Classe de Registro de usuário                       ---
-------------------------------------------------------------------

-- Carregando módulos úteis:
local Config = require "meu_app.configuracao" -- Carrega arquivos de configurações
local json = require "json" -- Carrega Biblioteca Json do Solar2D.

--------------------------------------------------------------------
--              Criando Classe:                                   --
--------------------------------------------------------------------
local ClasseUsuario = {}

-- Método Construtor da Nossa Classe:
function ClasseUsuario:Novo(Usuario, Senha)
    local Usuario = {
        Usuario = Usuario,
        Senha = Senha
    }
    setmetatable(Usuario, { __index = self })
    return Usuario
end

-- Tabela de Instâncias de usuários
local Usuario = { Captura = nil }

--------------------------------------------------------------------
-- Método para Criar novos usuários
--------------------------------------------------------------------
function ClasseUsuario:NovoUsuario(Nome, Senha)
    Usuario.Novo = true

    if Usuario.Novo then
        -- Criando uma instância automática para o novo usuário:
        local novoUsuario = ClasseUsuario:Novo(Nome, Senha)
        rawset(Usuario, Nome, novoUsuario) -- Associando ao nome do usuário
        Usuario.Novo = false -- Resetando variável
    end
end

--------------------------------------------------------------------
-- Função de conexão com o servidor
--------------------------------------------------------------------
local function conectando(requerimento, callback)
    local servidor = {
        ip = "198.162.2.1",
        url = "http://exemplo.servidor"
    }

    local function Conectar(evento)
        if evento.isError then
            print("Erro na conexão:", evento.errorMessage)
        else
            print("Conexão bem-sucedida!")
            if callback then callback() end -- Chama função adicional se necessário
        end
    end

    if requerimento == "Logar" then
        network.request(servidor.url, "GET", Conectar)
    end
end

--------------------------------------------------------------------
--          Fazer Login com Verificação
--------------------------------------------------------------------
function ClasseUsuario:Logar2()
    local jsonDados = json.encode(self)
    local parametros = {
        body = jsonDados,
        headers = {
            ["Content-Type"] = "application/json"
        }
    }

    local function respostaLogin(evento)
        if evento.isError then
            print("Falha ao enviar login. Código de erro:", evento.errorMessage)
        else
            local resposta = json.decode(evento.response)
            if resposta and resposta.sucesso then
                print("Login realizado com sucesso! Usuário autenticado.")
            else
                print("Login falhou. Usuário ou senha incorretos.")
            end
        end
    end

    conectando("Logar", function()
        print("Enviando login ao servidor...")
        network.request("http://exemplo.servidor/login", "POST", respostaLogin, parametros)
    end)
end

--------------------------------------------------------------------
-- Método Para Cadastrar Novos Usuários
--------------------------------------------------------------------
Usuario.Cadastro = function(Cadastro)
    return ClasseUsuario:NovoUsuario(Cadastro.Nome, Cadastro.Senha)
end

--------------------------------------------------------------------
-- Método de Login
--------------------------------------------------------------------
Usuario.Logar = function(Logar)
    local novoUsuario = ClasseUsuario:Novo(Logar.Usuario, Logar.Senha)
    novoUsuario:Logar2()
end

return Usuario
