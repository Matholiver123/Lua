local ClasseTransicao = {}


function ClasseTransicao:Novo(Objeto)
    local T = {
        Objeto = Objeto
    }
    setmetatable(T, {__index = self})
    return T
end

-- Move objeto para cima
function ClasseTransicao:Cima(self,Valor)
    transition.to(self.Objeto, {y = -Valor})  
end

local quadrado = display.newCircle( 50, 100, 100, 50 )
quadrado:cima(20)
