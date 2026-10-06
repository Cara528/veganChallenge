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
                Text("Home")
                }
            
            ProgressScreen(missionCompleted: $missionStore.missionCompleted)
            .tabItem { Label("Progress", systemImage: "chart.bar.fill") }
            
            ChallengeView(missionCompleted: $missionStore.missionCompleted)      .tabItem {
                Image(systemName: "list.bullet.rectangle")
                Text("Challenges")
                }
            
            SettingView()
            .tabItem {
                Image(systemName: "gearshape.fill")
                Text("Settings")
                }
        }
        .preferredColorScheme(.light)
        .accentColor(Color(hex: "#253900"))
    }
}

#Preview {
    MainTabView()
}
