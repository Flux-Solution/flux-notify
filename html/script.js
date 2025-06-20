let notificationId = 0;

window.addEventListener('message', function(event) {
    if (event.data.action === 'notify') {
        showNotification(event.data);
    } else if (event.data.action === 'clear') {
        clearAllNotifications();
    } else if (event.data.action === 'setPlacement') {
        setPlacement(event.data.placement);
    }
});

function showNotification(data) {
    const { type = 'info', title, message, duration = 5000, config: typeConfig } = data;
    const container = document.getElementById('notifications-container');
    
    // Create notification element
    const notification = document.createElement('div');
    const id = ++notificationId;
    notification.className = `notification ${type}`;
    notification.setAttribute('data-id', id);
    
    // Apply dynamic styling
    if (typeConfig) {
        notification.style.setProperty('--notification-color', typeConfig.color);
        notification.style.setProperty('--notification-glow', typeConfig.glowColor);
    }
    
    // Build notification HTML
    notification.innerHTML = `
        <div class="notification-content">
            <div class="notification-icon">${typeConfig?.icon || 'ℹ'}</div>
            <div class="notification-text">
                ${title ? `<div class="notification-title">${title}</div>` : ''}
                <div class="notification-message">${message}</div>
            </div>
        </div>
        <button class="notification-close">×</button>
        <div class="notification-progress" style="animation-duration: ${duration}ms;"></div>
    `;
    
    // Add event listeners
    const closeBtn = notification.querySelector('.notification-close');
    closeBtn.addEventListener('click', (e) => {
        e.stopPropagation();
        removeNotification(notification);
    });
    
    // Click to dismiss
    notification.addEventListener('click', () => {
        removeNotification(notification);
    });
    
    // Add to container
    container.appendChild(notification);
    
    // Auto remove after duration
    setTimeout(() => {
        if (document.contains(notification)) {
            removeNotification(notification);
        }
    }, duration);
    
    // Limit number of notifications (keep max 5)
    limitNotifications();
}

function removeNotification(notification) {
    notification.classList.add('removing');
    
    setTimeout(() => {
        if (notification.parentNode) {
            notification.parentNode.removeChild(notification);
        }
    }, 300);
}

function limitNotifications() {
    const container = document.getElementById('notifications-container');
    const notifications = container.querySelectorAll('.notification:not(.removing)');
    
    if (notifications.length > 5) {
        for (let i = 0; i < notifications.length - 5; i++) {
            removeNotification(notifications[i]);
        }
    }
}

function clearAllNotifications() {
    const container = document.getElementById('notifications-container');
    const notifications = container.querySelectorAll('.notification');
    
    notifications.forEach(notification => {
        removeNotification(notification);
    });
}

function setPlacement(placement) {
    const container = document.getElementById('notifications-container');
    if (!container) return;
    
    // Reset all positioning
    container.style.top = 'auto';
    container.style.bottom = 'auto';
    container.style.left = 'auto';
    container.style.right = 'auto';
    
    // Set new position based on placement
    switch(placement) {
        case 'top-right':
            container.style.top = '20px';
            container.style.right = '20px';
            break;
        case 'top-left':
            container.style.top = '20px';
            container.style.left = '20px';
            break;
        case 'bottom-right':
            container.style.bottom = '20px';
            container.style.right = '20px';
            break;
        case 'bottom-left':
            container.style.bottom = '20px';
            container.style.left = '20px';
            break;
        default:
            // Default to top-right
            container.style.top = '20px';
            container.style.right = '20px';
    }
} 