//
//  Untitled.swift
//  Vegan7days
//
//  Created by Cara Hsu on 2025/6/12.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
                }
            
            ProgressView()
            .tabItem {
                Image(systemName: "chart.bar.fill")
                Text("Progress")
                }
            
            ChallengeView()
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
