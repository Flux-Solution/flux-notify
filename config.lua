Config = {}

-- Basic Settings
Config.maxNotifications = 5
Config.defaultDuration = 5000
Config.enableSounds = true
Config.placement = 'top-right' -- Options: 'top-right', 'top-left', 'bottom-right', 'bottom-left'

-- Notification Types
Config.NotificationTypes = {
    success = {
        color = '#00ff88',
        glowColor = 'rgba(0, 255, 136, 0.3)',
        icon = '✓'
    },
    error = {
        color = '#ff4757',
        glowColor = 'rgba(255, 71, 87, 0.3)',
        icon = '✕'
    },
    warning = {
        color = '#ffa502',
        glowColor = 'rgba(255, 165, 2, 0.3)',
        icon = '⚠'
    },
    info = {
        color = '#3742fa',
        glowColor = 'rgba(55, 66, 250, 0.3)',
        icon = 'ℹ'
    }
} 