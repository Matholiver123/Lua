-----------------------------------------------------------------------
--
-----------------------------------------------------------------------

local Imagens = {}

function Imagens:Novo(Alvo, Orientacao, Dispositivo)
   local imagens = {}
   imagens.Alvo = Alvo
   imagens.Orientacao = Orientacao
   imagens.Dispositivo = Dispositivo
   setmetatable(imagens, {__index = self})
   return Imagens
end
------------------------------------------------------------------------------

