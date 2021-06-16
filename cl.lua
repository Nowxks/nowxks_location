ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(80000)
  end
end)



local location = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 0, 0}, Title = "Location" },
	Data = { currentMenu = "Location", "Location" },
    Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result)

            if btn.name == "Faggio" then
                TriggerServerEvent('Faggio')

                ESX.ShowNotification('Vous avez payez ~r~2000$')

                Citizen.Wait(1)
                spawnCar("faggio")
                ESX.ShowAdvancedNotification("Location", "Votre ~b~Scooter ~w~à été loué pour ~r~2000$~s~ avec ~g~succés ~w~!", "", "CHAR_LIFEINVADER", 1)
                ESX.ShowAdvancedNotification("Location", "Bonne route !", "", "CHAR_LIFEINVADER", 1)
				CloseMenu(true)
            end

            if btn.name == "Blista" then
                TriggerServerEvent('Blista')

                ESX.ShowNotification('Vous avez payez ~r~1000$')

                Citizen.Wait(1)
				spawnCar("blista")
                ESX.ShowAdvancedNotification("Location", "Votre ~b~Véhicule ~w~à été loué pour ~r~1000$~s~ avec ~g~succés ~w~!", "", "CHAR_LIFEINVADER", 1)
                ESX.ShowAdvancedNotification("Location", "Bonne route !", "", "CHAR_LIFEINVADER", 1)
				CloseMenu(true)
            end
                
            if btn.name == "BMX" then
                TriggerServerEvent('BMX')

                ESX.ShowNotification('Vous avez payez ~r~500$')
                Citizen.Wait(1)
                spawnCar("bmx")
                ESX.ShowAdvancedNotification("Location", "Votre ~b~Vélo ~w~à été loué pour ~r~500$~s~ avec ~g~succés ~w~!", "", "CHAR_LIFEINVADER", 1)
                ESX.ShowAdvancedNotification("Location", "Bonne route !", "", "CHAR_LIFEINVADER", 1)
				CloseMenu(true)
            end

            if btn.name == "Louer un Véhicule" then
                OpenMenu("Louer un Véhicule")
            end

            end,
    },

	Menu = {
		["Location"] = {
			b = {
                	{name = "Louer un Véhicule", ask = "→→→", askX = true},
			}
		},

        ["Louer un Véhicule"] = {
			b = {
                	{name = "Blista", ask = "~g~2000$", askX = true},
                	{name = "Faggio", ask = "~g~1000$", askX = true},
                	{name = "BMX", ask = "~g~500$", askX = true},
			}
		}
	}
}

function spawnCar(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(50)
    end

    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), false))
	local vehicle = CreateVehicle(car, -1033.58, -2729.02, 20.1, 241.51, true, false)
  
    
    SetEntityAsNoLongerNeeded(vehicle)
	SetModelAsNoLongerNeeded(vehicleName) 

	SetVehicleNumberPlateText(vehicle, "LOCA" .. math.random(100, 900))
        
end

local position = {
    {x = -1034.78, y = -2732.76, z = 20.17}
}


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(position) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 1.0 then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour parler ~r~au vendeur.")
				if IsControlJustPressed(1,51) then 					
                    CreateMenu(location) 
				end
            end
        end
    end  
end)

Citizen.CreateThread(function()

    for k in pairs(position) do

	local blip = AddBlipForCoord(position[k].x, position[k].y, position[k].z)

	SetBlipSprite(blip, 205)
	SetBlipColour(blip, 1)
	SetBlipScale(blip, 0.6)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Location de véhicule")
    EndTextCommandSetBlipName(blip)
    end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("ig_taostranslator")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "ig_taostranslator", -1034.49, -2732.1, 19.17, 145.64, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
end)

------------------------CREATED BY Nowxks#0069---------------------------
------------------------CREATED BY Nowxks#0069---------------------------
------------------------CREATED BY Nowxks#0069---------------------------
--                  https://discord.gg/uu9sGjgKGT                      --
------------------------CREATED BY Nowxks#0069---------------------------
------------------------CREATED BY Nowxks#0069---------------------------
------------------------CREATED BY Nowxks#0069--------------------------- 
