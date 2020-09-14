//
//  ContentView.swift
//  LocalNotification
//
//  Created by Aron Uchoa Bruno on 11/09/20.
//  Copyright © 2020 anonymous. All rights reserved.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Notification Demo")
                Button(action: { self.setNotification() }) {
                    Text("Set Notification!")
                }
            }
        }.onAppear() {
            print("onAppear")
            BadgeNotificationManager().removeBadgeCount()
        }
    }
    
    func setNotification() -> Void {
        let manager = LocalNotificationManager()
        manager.addNotification(title: "This is a test reminder")
        manager.schedule()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
