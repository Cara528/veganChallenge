//
//  SettingView.swift
//  Vegan7days
//
//  Created by Cara Hsu on 2025/6/14.
//

import SwiftUI
import UserNotifications

struct SettingView: View {
    
    @State private var selectedUIImage: UIImage? = nil
    @State private var isShowingImagePicker = false
    @State private var profileImage: Image? = nil
    
    @State private var notifOn: Bool = false
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .center, spacing: 30) {
                
                Text("個人化設定")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Button(action: {
                    isShowingImagePicker = true
                }) {
                    
                    if let profileImage = profileImage {
                        
                        profileImage
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 5))
                        
                    } else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 0.5)
                    }
                }
                
                VStack(alignment: .center, spacing: 20) {
                    
                    Image(systemName: "bell.fill")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.yellow)
                    
                    Text("啟用推播")
                        .font(.title2)
                    
                    
                    Text("每天收到最新任務")
                        .font(.title3)
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
                .cornerRadius(12)
                .shadow(color: Color.green.opacity(0.3), radius: 5, x: 0, y: 3)
                .onAppear {
                    if let imageData = UserDefaults.standard.data(forKey: "profileImageData"),
                       let uiImage = UIImage(data: imageData) {
                        selectedUIImage = uiImage
                        profileImage = Image(uiImage: uiImage)
                        
                        
                    
                    }
                }
                
                VStack(alignment: .leading, spacing: 12) {
                        Text("General")
                        .font(.footnote).foregroundStyle(.secondary)
                        .padding(.leading, 4)
                    
                    SettingsCard {
                        SettingRow(systemIcon: "bell", title: "Notification", accessory: .toggle($notifOn))
                            .onChange(of: notifOn) { newValue in
                                if newValue {
                                    requestNotificationAuthorization() }
                            }
                        
                        SettingRow(systemIcon: "person", title: "Accounts") {
                            print("Go Account")
                        }
                        
                        SettingRow(systemIcon: "banknote", title: "30天計劃") {
                            print("付款頁面")
                        }
                    }
                    
                    }
                
                Spacer(minLength: 24)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(hex: "#D3ECCD"))
            .cornerRadius(12)
            
            .sheet(isPresented: $isShowingImagePicker) {
                ImagePicker(selectedImage: $selectedUIImage)
                    .onDisappear {
                        if let uiImage = selectedUIImage {
                            profileImage = Image(uiImage: uiImage)
                            
                            // 存圖片到 UserDefaults
                            if let imageData = uiImage.jpegData(compressionQuality: 0.8) {
                                UserDefaults.standard.set(imageData, forKey: "profileImageData")
                        }
                    }
                }
            }
        }
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
    
    private func requestNotificationAuthorization() {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
                DispatchQueue.main.async { notifOn = granted }
            }
        }
}
    

#Preview {
    SettingView()
}


