//
//  Untitled.swift
//  Vegan7days
//
//  Created by Cara Hsu on 2025/6/12.
//
import SwiftUI

struct MainTabView: View {
    
    @StateObject private var missionStore = MissionStore()
    
    // 目前選中的 tab：0 首頁、1 進度、2 挑戰、3 設定
    @State private var selectedTab = 0
    // 從任務清單點進來的那一天；nil 代表顯示今天
    @State private var selectedChallengeIndex: Int? = nil
    
    private let challengeTitles: [String] = [
        "踩點餐廳",
        "邀請朋友吃素",
        "連鎖店找一款無動實產品",
        "情境模擬練習：買新鞋",
        "情境模擬練習：好友過生日",
        "問答題：關於B12",
        "心得打卡"
    ]
    
    // 今天 = 第一個還沒完成的任務；全部完成則為最後一天
    private var todayIndex: Int {
        missionStore.missionCompleted.firstIndex(of: false)
            ?? (missionStore.missionCompleted.count - 1)
    }
    
    // 挑戰 tab 實際要顯示的那一天
    private var displayedIndex: Int {
        selectedChallengeIndex ?? todayIndex
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(missionStore: missionStore)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("首頁")
                }
                .tag(0)
            
            ProgressView(
                missionCompleted: $missionStore.missionCompleted,
                onSelectMission: { index in
                    selectedChallengeIndex = index
                    selectedTab = 2
                }
            )
            .tabItem {
                Image(systemName: "list.bullet.rectangle")
                Text("進度")
            }
            .tag(1)
            
            NavigationStack {
                ChallengeView(day: challengeTitles[displayedIndex], index: displayedIndex)
                    .id(displayedIndex)
            }
            .tabItem {
                Image(systemName: "list.bullet.rectangle")
                Text("挑戰")
            }
            .tag(2)
            
            SettingView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("設定")
                }
                .tag(3)
        }
        .onChange(of: selectedTab) { newValue in
            // 離開挑戰 tab 時清掉選擇，之後直接點進來就會回到今天
            if newValue != 2 {
                selectedChallengeIndex = nil
            }
        }
        .preferredColorScheme(.light)
        .accentColor(Color(hex: "#253900"))
    }
}

#Preview {
    MainTabView()
}
