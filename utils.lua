local Button = function(controlButton)
    N_0xe83a3e3557a56640(controlButton)
end

local RegisterButton = function(id, controls, text)
    PushScaleformMovieFunction(scaleformButton, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(id)

    for _, control in pairs(controls) do
        Button(GetControlInstructionalButton(2, control, true))
    end
    
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
    PopScaleformMovieFunctionVoid()
end

SetupScaleform = function(scaleformSelected)
    scaleformButton = RequestScaleformMovie(scaleformSelected)
    while not HasScaleformMovieLoaded(scaleformButton) do
        Citizen.Wait(0)
    end

    DrawScaleformMovieFullscreen(scaleformButton, 255, 255, 255, 0, 0)

    PushScaleformMovieFunction(scaleformButton, "CLEAR_ALL")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleformButton, "SET_CLEAR_SPACE")
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()

    RegisterButton(0, { 173 }, "Descendre")
    RegisterButton(1, { 172 }, "Monter")

    PushScaleformMovieFunction(scaleformButton, "DRAW_INSTRUCTIONAL_BUTTONS")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleformButton, "SET_BACKGROUND_COLOUR")
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(80)
    PopScaleformMovieFunctionVoid()

    return scaleformButton
end