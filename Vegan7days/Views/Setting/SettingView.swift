//
//  SettingView.swift
//  Vegan7days
//
//  Created by Cara Hsu on 2025/6/14.
//

import SwiftUI
import UserNotifications

struct SettingView: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 30) {
            Text("設定")
                .font(.largeTitle)
                .bold()
            
            Button("啟用推播") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                    if granted {
                        DispatchQueue.main.asyncAfter(deadline: .now()+4) {
                            self.weeklyNotification()
                        }
                    } else {
                        print("❌ 使用者未授權通知")
                    }
                }

            }
                
        }
//        .frame(minWidth: .infinity)
    }
    
    func weeklyNotification() {
        
        //Content
        let content = UNMutableNotificationContent()
        content.title = "🌱Vegan小挑戰來囉！"
        content.body = "一點點改變，就是很棒的堅持！"
        content.interruptionLevel = .active
        
        //Trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        //Request
        let request = UNNotificationRequest(identifier: "timeSensitive_example", content: content, trigger: trigger)
        
        //Schedule Request
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print(error)
            } else {
                print("Success!")
            }
        }
        
    }
}

#Preview {
    SettingView()
}
