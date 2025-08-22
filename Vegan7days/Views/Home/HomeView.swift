//
//  Untitled.swift
//  Vegan7days
//
//  Created by Cara Hsu on 2025/6/12.
//

import SwiftUI

struct HomeView: View {
    @State private var challengeCompleted = false
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(hex: "F1F8E8"),
                    Color(hex: "C9E9D2")
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            
            VStack(alignment: .leading, spacing: 30) {
                
                Text("Hello, Cara 👋!")
                    .font(.title)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("你的選擇")
                        .font(.largeTitle)
                    //                    .fontWeight(.bold)
                    
                    Text("改變世界的一點 🌍")
                        .font(.largeTitle)
                    //                    .fontWeight(.bold)
                    
                }
                
                VStack(alignment: .leading, spacing: 18) {
                    Text("今日任務")
                        .font(.title2)
                    Text("邀請朋友到素食餐廳")
                        .font(.title3)
                    HStack {
                        Text(challengeCompleted ? "✅ 已完成" : "🔄 正在進行中")
                        Spacer()
                        Button(action: {
                            challengeCompleted.toggle()
                        }) {
                            Text(challengeCompleted ? "還原" : "完成")
                                .font(.caption)
                                .padding(6)
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(8)
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(16)
                
                Spacer()
            }
            
            .padding()
            
        }
    }
}

#Preview {
    HomeView()
}
