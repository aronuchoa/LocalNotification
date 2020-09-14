//
//  LocalNotificationManager.swift
//  LocalNotification
//
//  Created by Aron Uchoa Bruno on 11/09/20.
//  Copyright © 2020 anonymous. All rights reserved.
//

import UIKit

class LocalNotificationManager {
    var notifications = [Notification]()
    
    func requestPermission() -> Void {
        UNUserNotificationCenter
            .current()
            .requestAuthorization(options: [.alert, .badge, .alert]) { granted, error in
                if granted == true && error == nil {
                    self.scheduleNotifications()
                }
        }
    }
    
    func addNotification(title: String) -> Void {
        notifications.append(Notification(id: UUID().uuidString, title: title))
    }
    
    func scheduleNotifications() -> Void {
        for notification in notifications {
            
            let badgeNotificationManager = BadgeNotificationManager()
            badgeNotificationManager.badgeNumber += 1
            
            let content = UNMutableNotificationContent()
            content.title = notification.title
            content.subtitle = "Subtitile"
            content.body = "Body of notification"
            content.badge = NSNumber(value: badgeNotificationManager.badgeNumber)
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                guard error == nil else { return }
                print("Scheduling notification with id: \(notification.id)")
            }
        }
    }
    
    func schedule() -> Void {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .notDetermined:
                self.requestPermission()
            case .authorized, .provisional:
                self.scheduleNotifications()
            default:
                break
            }
        }
    }
}
