//
//  Untitled.swift
//  Vegan7days
//
//  Created by Cara Hsu on 2025/6/12.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var missionCompleted: [Bool] = Array(repeating: false, count: 7)

    
    var body: some View {
        TabView {
            HomeView()
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
                }
            
            ProgressScreen(missionCompleted: $missionCompleted)
                            .tabItem { Label("Progress", systemImage: "chart.bar.fill") }
            
            ChallengeView(missionCompleted: $missionCompleted)
            .tabItem {
                Image(systemName: "list.bullet.rectangle")
                Text("Challenges")
                }
            
            SettingView()
            .tabItem {
                Image(systemName: "gearshape.fill")
                Text("Settings")
                }
        }
        .accentColor(Color(hex: "#253900"))
    }
}

#Preview {
    MainTabView()
}
