//
//  Untitled.swift
//  Vegan7days
//
//  Created by Cara Hsu on 2025/6/12.
//
//

import SwiftUI

struct ChallengeView: View {
    
    @State private var missionCompleted: [Bool] = Array(repeating: false, count: 7)
    
    let challenges: [String] = [
        "踩點餐廳",
        "邀請朋友吃素",
        "連鎖店找一款無動實產品",
        "情境模擬練習：買新鞋",
        "情境模擬練習：好友過生日",
        "問答題：關於B12",
        "心得打卡"
    ]
    
    var body: some View {
        NavigationStack {
        ZStack {
            Color(hex: "#B0DB9C").opacity(0.8)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                Text("任務清單")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 55)
                
                    
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(challenges.indices, id: \.self) { index in
                                
                        NavigationLink(destination: Challenge1View(day:challenges[index])) {
                                    
                            VStack(alignment: .leading, spacing: 29) {
                                    Text("Day \(index + 1)")
                                        .font(.headline)
                                        
                                    HStack {
                                        Text(challenges[index])
                                        .fontWeight(.medium)
                                            
                                        Spacer()
                                            
                                        Button(action: {
                                            missionCompleted[index].toggle()
                                        }) {
                                            Image(systemName: missionCompleted[index] ? "checkmark.circle.fill" : "circle")
                                                .font(.title3)
                                                .foregroundColor(missionCompleted[index] ? .green : .gray)
                                            }
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.white)
                                .cornerRadius(16)
                            }
                            
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    
                }
            }

        }
    }
}

#Preview {
    ChallengeView()
}

