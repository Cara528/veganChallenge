//
//  Untitled.swift
//  Vegan7days
//
//  Created by Cara Hsu on 2025/6/12.
//
//
//

import SwiftUI

struct ChallengeView: View {
    
    @Binding var missionCompleted: [Bool]
    
    let missions: [String: String] = [
        "Day1":"踩點餐廳",
        "Day2":"邀請朋友吃素",
        "Day3":"連鎖店找一款無動實產品",
        "Day4":"情境模擬練習：買新鞋",
        "Day5":"情境模擬練習：好友過生日",
        "Day6":"問答題：關於B12",
        "Day7":"心得打卡"]
    
    var pairs: [(key: String, value: String)] { missions.sorted { $0.key.localizedStandardCompare($1.key) == .orderedAscending }}
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color(hex: "F4FBF4")
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("任務清單")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(Color(hex: "303030"))

                        Spacer()
                        
                        NavigationLink {
                            ProgressScreen(missionCompleted: $missionCompleted)
                        } label: {
                            Text("進度")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color(hex: "303030"))
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .shadow(color: .black.opacity(0.05), radius: 4, y: 2)
                        }
                    }
                    .padding(.top, 24)
                    .padding(.horizontal, 20)
                        
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(Array(pairs.enumerated()), id: \.element.key) { index, pair in

                                NavigationLink(destination: Challenge1View(day: pair.value, index: index)) {
                                    VStack(alignment: .leading, spacing: 16) {
                                        Text("Day \(index + 1)")
                                            .font(.system(size: 13, weight: .semibold))
                                            .foregroundColor(Color(hex: "53B175"))
                                        
                                        HStack {
                                            Text(pair.value)
                                                .font(.system(size: 17, weight: .medium))
                                                .foregroundColor(Color(hex: "303030"))
                                                
                                            Spacer()
                                                
                                            Button(action: {
                                                missionCompleted[index].toggle()
                                            }) {
                                                Image(systemName: missionCompleted[index] ? "checkmark.circle.fill" : "circle")
                                                    .font(.title3)
                                                    .foregroundColor(missionCompleted[index] ? Color(hex: "53B175") : Color(hex: "8D8D8D"))
                                            }
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                    .padding(16)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color.white)
                                    .cornerRadius(16)
                                    .shadow(color: .black.opacity(0.05), radius: 8, y: 3)
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 32)
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    ChallengeView(missionCompleted: .constant(Array(repeating: false, count: 7)))
}

//import SwiftUI
//
//struct ChallengeView: View {
//    
//    @Binding var missionCompleted: [Bool]
//    
//    let challenges: [String] = [
//        "踩點餐廳",
//        "邀請朋友吃素",
//        "連鎖店找一款無動實產品",
//        "情境模擬練習：買新鞋",
//        "情境模擬練習：好友過生日",
//        "問答題：關於B12",
//        "心得打卡"
//    ]
//    
//    let missions: [String: String] = [
//        "Day1":"踩點餐廳",
//        "Day2":"邀請朋友吃素",
//        "Day3":"連鎖店找一款無動實產品",
//        "Day4":"情境模擬練習：買新鞋",
//        "Day5":"情境模擬練習：好友過生日",
//        "Day6":"問答題：關於B12",
//        "Day7":"心得打卡"]
//    
//    var pairs: [(key: String, value: String)] { missions.sorted { $0.key.localizedStandardCompare($1.key) == .orderedAscending }}
//    
//    var body: some View {
//        
//        NavigationStack {
//            ZStack {
//                Color(hex: "#B0DB9C").opacity(0.8)
//                    .ignoresSafeArea()
//                
//                VStack(alignment: .leading) {
//                    HStack {
//                        Text("任務清單")
//                            .font(.largeTitle)
//                            .fontWeight(.bold)
//
//                        
//                        Spacer()
//                        
//                        NavigationLink {
//                            ProgressScreen(missionCompleted: $missionCompleted)} label: {
//                                    Text("進度")
//                                    .font(.headline)
//                                    .padding(.horizontal, 12)
//                                    .padding(.vertical, 8)
//                                    .background(Color.white)
//                                    .clipShape(RoundedRectangle(cornerRadius: 12))
//                                            }
//                                        }
//                                    .padding(.top, 55)
//                        
//                    ScrollView {
//                        VStack(spacing: 20) {
//                        ForEach(Array(pairs.enumerated()), id: \.element.key) { index, pair in
//
//                            
//                            NavigationLink(destination: Challenge1View(day:pair.value, index: index)) {
////                                NavigationLink(destination: Challenge1View(day:challenges[index])) {
//                              
//                                    VStack(alignment: .leading, spacing: 29) {
//                                            Text("Day \(index + 1)")
//                                            .font(.headline)
//                                        
//                                        HStack {
//                                            Text(pair.value)
//                                            .fontWeight(.medium)
//                                                
//                                            Spacer()
//                                                
//                                            Button(action: {
//                                                missionCompleted[index].toggle()
//                                            }) {
//                                                Image(systemName: missionCompleted[index] ? "checkmark.circle.fill" : "circle")
//                                                .font(.title3)
//                                                .foregroundColor(missionCompleted[index] ? .green : .gray)
//                                            }
//                                        }
//                                        .buttonStyle(PlainButtonStyle())
//                                    }
//                                }
//                                .padding()
//                                .frame(maxWidth: .infinity,alignment:.leading)
//                                .background(Color.white)
//                                .cornerRadius(16)
//                                }
//                            }
//                        }
//                        .padding(.horizontal, 20)
//                    }
//                }
//            }
//        }
//    }
//
//
//#Preview {
//    ChallengeView(missionCompleted: .constant(Array(repeating: false, count: 7)))
//}
