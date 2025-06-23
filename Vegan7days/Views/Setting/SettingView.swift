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
            
            Text("設定頁")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack(alignment: .center, spacing: 20) {
                
                Image(systemName: "bell.fill")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.yellow)
                
                Text("啟用推播")
                    .font(.title3)
                
                Text("每天收到最新任務")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Button(action: {
                    //把啟用推播功能加進來
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in if granted {
                        DispatchQueue.main.asyncAfter(deadline: .now()+4) {
                            self.weeklyNotification()
                        }
                    } else {
                        print("使用者未授權")
                    }}
                }) {
                    
                    Text("啟用")
                        .padding(10)
                        .foregroundColor(.black)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)

                }
            }
            .padding()
            .frame(maxWidth: .infinity)

            .background(Color.white.opacity(0.85))
//            .border(Color.black, width: 3)
            .cornerRadius(12)
            .shadow(color: Color.green.opacity(0.3), radius: 5, x: 0, y: 3)



            
            Spacer()

                
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(hex: "#D3ECCD"))
        .cornerRadius(12)
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


