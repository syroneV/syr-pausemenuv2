local opened = false
--ESX = exports["es_extended"]:getSharedObject()



--functions
function SetDisplay(bool)
	SetNuiFocus(bool, bool)
	SetNuiFocusKeepInput(false)
	DisableIdleCamera(bool)
	SetCursorLocation(0.5, 0.5)

	SendNUIMessage({
        type = "ui",
        status = bool,
    });
end
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(1, 199) then
			OpenPauseMenu()
        end
    end
end)

CreateThread(function()
    while true do 
        SetPauseMenuActive(false) 
        Wait(1)
    end
end)



--callback
RegisterNUICallback("close", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("quit", function(data)
    SetDisplay(false)
	RestartGame()
end)

RegisterNUICallback("map", function(data)
    SetDisplay(false)
	ActivateFrontendMenu("FE_MENU_VERSION_MP_PAUSE", true, 0)
end)
RegisterNUICallback("opti", function(data)
    SetDisplay(false)
    DoScreenFadeIn(2000) -- Ecran Noir
    DoScreenFadeOut(2000)  -- Ecran Noir
    Citizen.Wait(2000)
    DoScreenFadeIn(1500) -- Ecran Noir
    ClearAllBrokenGlass()
    ClearAllHelpMessages()
    LeaderboardsReadClearAll()
    ClearBrief()
    ClearGpsFlags()
    ClearPrints()
    ClearSmallPrints()
    ClearReplayStats()
    LeaderboardsClearCacheData()
    ClearFocus()
    ClearHdArea()
    ClearHelp()
    ClearNotificationsPos()
    ClearPedInPauseMenu()
    ClearFloatingHelp()
    ClearGpsPlayerWaypoint()
    ClearGpsRaceTrack()
    ClearReminderMessage()
    ClearThisPrint()
    Citizen.Wait(2090)
    RemoveLoadingPrompt()
    Citizen.Wait(100)
    PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true)
    ShowNotification('Optimisation ~g~effectuée~g~')
end)

RegisterNUICallback("settings", function(data)
    SetDisplay(false)
	ActivateFrontendMenu('FE_MENU_VERSION_LANDING_MENU',0, 1)
end)

--commands
RegisterCommand('openesc', function ()
	if  not opened and not IsPauseMenuActive() then
	SetDisplay(true)
	end
end)

RegisterKeyMapping("openesc", "syrone", "keyboard", "ESCAPE")

