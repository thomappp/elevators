local ShowNotification = function(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end

local ShowHelpText = function(text)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

local ChangeFloor = function(evelator, nextFloor)
    local evelatorFloors = #evelator.floors

    if nextFloor > 0 and nextFloor <= evelatorFloors then
        local playerPed = PlayerPedId()

        DoScreenFadeOut(1500)
        FreezeEntityPosition(playerPed, true)

        Citizen.Wait(Config.FadeOutTime)

        SetEntityCoords(playerPed, evelator.floors[nextFloor].coords)
        SetEntityHeading(playerPed, evelator.floors[nextFloor].heading)

        DoScreenFadeIn(1500)
        FreezeEntityPosition(playerPed, false)

    elseif nextFloor == 0 then
        ShowNotification("Vous ne pouvez pas descendre plus bas.")
    elseif nextFloor == evelatorFloors + 1 then
        ShowNotification("Vous ne pouvez pas monter plus haut.")
    end
end

Citizen.CreateThread(function()
    local playerPed = PlayerPedId()

    while true do
        local playerWait = 1000
        local playerCoords = GetEntityCoords(playerPed)

        for _, evelator in pairs(Config.Elevators) do
            for floorId, floor in pairs(evelator.floors) do

                local distance = #(playerCoords - floor.coords)
                if distance < 10.0 then
                    playerWait = 5
                    DrawMarker(evelator.marker.type, floor.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, evelator.marker.size.x, evelator.marker.size.y, evelator.marker.size.z, evelator.marker.color.r, evelator.marker.color.g, evelator.marker.color.b, evelator.marker.color.a, false, true, 2, false, false, false, false)
                
                    if distance < 1.5 then
                        local form = SetupScaleform("instructional_buttons")
                        DrawScaleformMovieFullscreen(form, 255, 255, 255, 255, 0)

                        ShowHelpText(("%s : %s"):format(evelator.name, floor.name))

                        if IsControlJustReleased(0, 172) then
                            ChangeFloor(evelator, floorId + 1)
                        elseif IsControlJustReleased(0, 173) then
                            ChangeFloor(evelator, floorId - 1)
                        end
                    end
                end
            end
        end

        Citizen.Wait(playerWait)
    end
end)