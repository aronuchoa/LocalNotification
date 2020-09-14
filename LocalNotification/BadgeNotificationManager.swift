//
//  BadgeNotificationManager.swift
//  LocalNotification
//
//  Created by Aron Uchoa Bruno on 11/09/20.
//  Copyright © 2020 anonymous. All rights reserved.
//

import UIKit
import Foundation

class BadgeNotificationManager {
    
    static let keyforBadgeNumber = "badgeNumber"
    var badgeNumber: Int {
        get {
            return UserDefaults.standard.integer(forKey: BadgeNotificationManager.keyforBadgeNumber)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: BadgeNotificationManager.keyforBadgeNumber)
        }
    }
    
    func removeBadgeCount() -> Void {
        UIApplication.shared.applicationIconBadgeNumber = 0
        badgeNumber = 0
    }
}
