//
//  Untitled.swift
//  Vegan7days
//
//  Created by Cara Hsu on 2025/6/12.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject private var missionStore = MissionStore()
    
    var body: some View {
        TabView {
            HomeView(missionStore: missionStore)
                .tabItem {
                Image(systemName: "house.fill")
                Text("首頁")
                }
            
//            ProgressScreen(missionCompleted: $missionStore.missionCompleted)
//            .tabItem { Label("Progress", systemImage: "chart.bar.fill") }
            
            ChallengeView(missionCompleted: $missionStore.missionCompleted)      .tabItem {
                Image(systemName: "list.bullet.rectangle")
                Text("進度")
                }
            
            Text("挑戰即將推出")
                .tabItem {
                    Image(systemName: "list.bullet.rectangle")
                    Text("挑戰")
                }
            
            SettingView()
            .tabItem {
                Image(systemName: "gearshape.fill")
                Text("設定")
                }
        }
        .preferredColorScheme(.light)
        .accentColor(Color(hex: "#253900"))
    }
}

#Preview {
    MainTabView()
}
