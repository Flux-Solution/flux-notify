-- Flux Notify Client Script
local isUIOpen = false

-- Initialize UI
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if not isUIOpen then
            SetNuiFocus(false, false)
            
            -- Send placement config to NUI
            SendNUIMessage({
                action = 'setPlacement',
                placement = Config.placement
            })
            
            isUIOpen = true
        end
    end
end)

-- Main notification function
function Notify(message, type, title, duration)
    if not message then
        print("^1[Flux-Notify] Error: Message is required^7")
        return
    end
    
    type = type or 'info'
    duration = duration or Config.defaultDuration
    
    -- Validate type
    if not Config.NotificationTypes[type] then
        type = 'info'
    end
    
    -- Play sound if enabled
    if Config.enableSounds and type == 'success' or type == 'info' then
        PlaySoundFrontend(-1, 'CHECKPOINT_PERFECT', 'HUD_MINI_GAME_SOUNDSET', true)
    elseif Config.enableSounds and type == 'error' or type == 'warning' then
        PlaySoundFrontend(-1, 'CHECKPOINT_MISSED', 'HUD_MINI_GAME_SOUNDSET', true)
    end
    
    SendNUIMessage({
        action = 'notify',
        message = message,
        type = type,
        title = title,
        duration = duration,
        config = Config.NotificationTypes[type]
    })
end

-- Export the main function
exports('Notify', Notify)

-- Simple export functions
exports('Success', function(message, title, duration)
    Notify(message, 'success', title or 'Success!', duration)
end)

exports('Error', function(message, title, duration)
    Notify(message, 'error', title or 'Error!', duration)
end)

exports('Warning', function(message, title, duration)
    Notify(message, 'warning', title or 'Warning!', duration)
end)

exports('Info', function(message, title, duration)
    Notify(message, 'info', title or 'Info', duration)
end)

-- Clear all notifications
exports('Clear', function()
    SendNUIMessage({
        action = 'clear'
    })
end)

-- Test Commands
RegisterCommand('testnotify', function(source, args)
    local type = args[1] or 'info'
    local message = table.concat(args, ' ', 2) or 'This is a test notification!'
    
    if message == '' then
        message = 'This is a test notification!'
    end
    
    Notify(message, type, 'Test Notification')
end, false)

RegisterCommand('notifyexamples', function()
    Citizen.CreateThread(function()
        Citizen.Wait(500)
        exports['flux-notify']:Success('Your action was completed successfully!', 'Success!')
        
        Citizen.Wait(1000)
        exports['flux-notify']:Info('A new version of the app is ready for you. Update now to enjoy the latest features.', 'Update Available')
        
        Citizen.Wait(1000)
        exports['flux-notify']:Warning('You need to complete this action before proceeding.', 'Action Needed')
        
        Citizen.Wait(1000)
        exports['flux-notify']:Error('Something went wrong with your request.', 'Oops!')
    end)
end, false)

-- Register NUI Callbacks
RegisterNUICallback('closeNotification', function(data, cb)
    cb('ok')
end) 