//
//  ContentView.swift
//  userNotification_swift
//
//  Created by Mohammad Rishad p on 02/12/24.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Request permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) {
                    sucess, error in
                    if sucess{
                        print("Permission granted")
                    }
                    else if let error{
                        print("Error: \(error.localizedDescription)")
                    }
                }
            }
            
            Button("schedule Notification") {
                let content = UNMutableNotificationContent()
                content.title = "kjdsgfnsjkd"
                content.subtitle = "dfhgd"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
