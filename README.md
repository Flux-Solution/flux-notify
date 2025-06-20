# 🚀 Flux Notify - Modern FiveM Notification System

<div align="center">

![Flux Solutions](https://img.shields.io/badge/Made%20by-Flux%20Solutions-blue?style=for-the-badge)
![Version](https://img.shields.io/badge/Version-2.0.0-green?style=for-the-badge)
![FiveM](https://img.shields.io/badge/FiveM-Compatible-orange?style=for-the-badge)

**A modern, sleek notification system for FiveM with glowing effects and smooth animations**

[Features](#features) • [Installation](#installation) • [Usage](#usage) • [Configuration](#configuration) • [Support](#support)

</div>

---

## ✨ Features

- 🎨 **Modern UI/UX** - Clean, contemporary design with glassmorphism effects
- 💫 **Glowing Effects** - Beautiful glow animations for each notification type
- 🎵 **Sound System** - Configurable sound effects for different notification types
- 📱 **Responsive Design** - Looks great on all screen resolutions
- ⚡ **Smooth Animations** - Fluid slide-in/out animations with easing
- 🎯 **4 Notification Types** - Success, Error, Warning, and Info
- 📍 **Flexible Positioning** - Place notifications in any corner of the screen
- 🖱️ **Interactive** - Click to dismiss, hover effects, progress bars
- 🔧 **Easy Configuration** - Simple config file with essential options
- 📦 **Lightweight** - Optimized performance with minimal resource usage

## 🖼️ Preview

![Notification Types](https://via.placeholder.com/800x400/1a1a1a/ffffff?text=Flux+Notify+Preview)

*Modern notification system with glowing effects and smooth animations*

## 📦 Installation

1. **Download** the latest release from GitHub
2. **Extract** the `flux-notify` folder to your FiveM resources directory
3. **Add** `ensure flux-notify` to your `server.cfg`
4. **Restart** your server or start the resource with `/start flux-notify`

```bash
# In your server.cfg
ensure flux-notify
```

## 🎮 Usage

### Basic Examples

```lua
-- Success notification
exports['flux-notify']:Success('Action completed successfully!', 'Success!')

-- Error notification  
exports['flux-notify']:Error('Something went wrong!', 'Error!')

-- Warning notification
exports['flux-notify']:Warning('Please check this action!', 'Warning!')

-- Info notification
exports['flux-notify']:Info('New update available!', 'Information')

-- Custom notification with duration
exports['flux-notify']:Notify('Custom message', 'success', 'Custom Title', 8000)

-- Clear all notifications
exports['flux-notify']:Clear()
```

### Available Exports

| Export | Parameters | Description |
|--------|------------|-------------|
| `Notify` | `message, type, title, duration` | Main notification function |
| `Success` | `message, title, duration` | Green success notification |
| `Error` | `message, title, duration` | Red error notification |
| `Warning` | `message, title, duration` | Orange warning notification |
| `Info` | `message, title, duration` | Blue info notification |
| `Clear` | None | Clear all active notifications |

### Test Commands

```bash
/testnotify success Your message here
/testnotify error Something went wrong
/testnotify warning Be careful
/testnotify info Just so you know
/notifyexamples  # Shows all notification types
```

## ⚙️ Configuration

Edit `config.lua` to customize the notification system:

```lua
Config = {}

-- Basic Settings
Config.maxNotifications = 5                    -- Maximum notifications shown at once
Config.defaultDuration = 5000                  -- Default duration in milliseconds
Config.enableSounds = true                     -- Enable/disable sound effects
Config.placement = 'top-right'                 -- Notification placement

-- Available placement options:
-- 'top-right', 'top-left', 'bottom-right', 'bottom-left'

-- Notification Types (customize colors and icons)
Config.NotificationTypes = {
    success = {
        color = '#00ff88',                      -- Main color
        glowColor = 'rgba(0, 255, 136, 0.3)',  -- Glow effect color
        icon = '✓'                             -- Icon displayed
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
```

## 🎨 Customization

### Changing Colors
Modify the colors in `config.lua` to match your server's theme:

```lua
Config.NotificationTypes.success.color = '#your-color-here'
Config.NotificationTypes.success.glowColor = 'rgba(r, g, b, 0.3)'
```

### Changing Position
Set notifications to appear in different corners:

```lua
Config.placement = 'bottom-left'  -- Notifications appear in bottom-left
```

### Adjusting Duration
Change how long notifications stay visible:

```lua
Config.defaultDuration = 7000  -- 7 seconds instead of 5
```

## 🔧 Advanced Usage

### From Other Resources

```lua
-- In any other resource
TriggerEvent('flux-notify:client:notify', {
    message = 'Custom notification',
    type = 'success',
    title = 'My Script',
    duration = 6000
})
```

### Integration Examples

```lua
-- ESX Integration Example
RegisterNetEvent('esx:showNotification')
AddEventHandler('esx:showNotification', function(msg, type)
    local notifyType = type == 'error' and 'error' or 'info'
    exports['flux-notify']:Notify(msg, notifyType, 'ESX')
end)

-- QBCore Integration Example  
RegisterNetEvent('QBCore:Notify')
AddEventHandler('QBCore:Notify', function(text, texttype)
    local type = texttype == 'error' and 'error' or 
                 texttype == 'success' and 'success' or 'info'
    exports['flux-notify']:Notify(text, type, 'QBCore')
end)
```

## 📋 Requirements

- **FiveM Server** - Latest recommended version
- **No additional dependencies** - Standalone resource

## 🐛 Troubleshooting

### Common Issues

**Notifications not showing:**
- Check if resource is started: `/ensure flux-notify`
- Verify no conflicting notification resources are running
- Check F8 console for any errors

**Sounds not playing:**
- Set `Config.enableSounds = true` in config.lua
- Restart the resource after config changes

**Wrong position:**
- Check `Config.placement` setting in config.lua
- Valid options: `'top-right'`, `'top-left'`, `'bottom-right'`, `'bottom-left'`

## 📞 Support

- **Website**: [fluxscripts.dev](https://fluxscripts.dev) - Visit our official website
- **GitHub Issues**: [Report bugs or request features](https://github.com/flux-solutions/flux-notify/issues)
- **Discord**: Join our community server for support
- **Documentation**: Check our wiki for detailed guides

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 🏢 About Flux Solutions

**Flux Solutions** is dedicated to creating high-quality, modern resources for the FiveM community. We focus on clean code, beautiful interfaces, and exceptional user experiences.

🌐 **Visit our website**: [fluxscripts.dev](https://fluxscripts.dev)

---

<div align="center">

**Made with ❤️ by Flux Solutions**

[🌐 fluxscripts.dev](https://fluxscripts.dev) • [⭐ Star this repo](https://github.com/flux-solutions/flux-notify) • [🐛 Report Bug](https://github.com/flux-solutions/flux-notify/issues) • [💡 Request Feature](https://github.com/flux-solutions/flux-notify/issues)

</div> 