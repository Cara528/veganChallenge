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
        VStack(alignment: .leading, spacing: 35) {
            
            Text("Hi, Cara 👋")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("你的選擇")
                    .font(.title)
                Text("改變世界的一點 🌍")
                    .font(.title)
            }

            VStack(alignment: .leading, spacing: 12) {
                Text("Day3 任務")
                    .font(.headline)
                HStack {
                    Text(challengeCompleted ? "✅ 已完成" : "🔄 進行中")
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
            .background(Color.green.opacity(0.2))
            .cornerRadius(16)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
