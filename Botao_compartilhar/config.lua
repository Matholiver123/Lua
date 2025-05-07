--
-- For more information on config.lua see the Project Configuration Guide at:
-- https://docs.coronalabs.com/guide/basics/configSettings
--

application =
{
	content =
	{
		width = function()
			-- verifica em qual dispositivo o App está sendo Executado
			local environment = system.getInfo("environment")
				
				-------------------------------------------------------
				--    Caso o App esteje rodando em um Navegador		---
				-------------------------------------------------------
				if environment == "html5" then
					local LarguraTela = display.pixelWidth
					local AlturaTela = display.pixelHeight
					
					-- Smartphone
					if LarguraTela < 768 or AlturaTela < 1024 then
						return display.actualContentWidth
					-- Computador/Desktop
					else
						return display.pixelWidth
					end
				---------------------------------------------------------
				
				----------------------------------------------------------
				---			Caso o app esteje Rodando no Simulador		--
				----------------------------------------------------------
				elseif environment == "simulator" then
					return display.pixelWidth
				-----------------------------------------------------------
				
				-----------------------------------------------------------
				--			Caso o App esteje rodando em um Celular		---
				-----------------------------------------------------------
				elseif environment == "device" then
					return display.actualContentWidth
				-----------------------------------------------------------
				
				-----------------------------------------------------------
				---						Caso contrário					---
				-----------------------------------------------------------
				else
					return 320
				end
				-----------------------------------------------------------
		end,
		height =  function()
			local environment = system.getInfo("environment")

				-------------------------------------------------------
				--    Caso o App esteje rodando em um Navegador		---
				-------------------------------------------------------
				if environment == "html5" then
					local LarguraTela = display.pixelWidth
					local AlturaTela = display.pixelHeight
					if LarguraTela < 768 or AlturaTela < 1024 then
						return display.actualContentHeight
					else
						return display.pixelHeight
					end
				--------------------------------------------------------
				
				-------------------------------------------------------
				--    Caso o App esteje rodando no Simulador		---
				-------------------------------------------------------
				elseif environment == "simulator" then
					return display.pixelHeight
				-------------------------------------------------------
				
				-------------------------------------------------------
				--    Caso o App esteje rodando no Celular			---
				-------------------------------------------------------
				elseif environment == "device" then
					return display.actualContentHeight
				-------------------------------------------------------
				
				-------------------------------------------------------
				--    Caso o contrário								---
				-------------------------------------------------------
				else
					return 480
				end
		end,
		scale = "letterbox",
		fps = 30,
		
		--[[
		imageSuffix =
		{
			    ["@2x"] = 2,
			    ["@4x"] = 4,
		},
		--]]
	},
}