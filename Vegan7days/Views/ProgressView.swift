//
//  Untitled.swift
//  Vegan7days
//
//  Created by Cara Hsu on 2025/2/21.
//
//
//
//

import SwiftUI

// 圓圈進度元件
struct ProgressCircleView: View {
    let progress: Double // 0~1
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.2), lineWidth: 12)
                .frame(width: 160, height: 160)

            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color(hex: "53B175"), style: StrokeStyle(lineWidth: 12, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 0.6), value: progress)
                .frame(width: 160, height: 160)

            VStack {
                Text("\(Int(progress * 100))%")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Color(hex: "303030"))
                Text("完成度")
                    .font(.system(size: 14))
                    .foregroundColor(Color(hex: "8D8D8D"))
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .background(Color.white)
        .cornerRadius(16)
    }
}

struct ProgressScreen: View {
    
    @Binding var missionCompleted: [Bool]
    
    private var progress: Double {
        guard !missionCompleted.isEmpty else { return 0 }
        let done = missionCompleted.filter { $0 }.count
        return Double(done) / Double(missionCompleted.count)
    }
    
    var body: some View {
        ZStack {
            Color(hex: "F4FBF4")
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    Text("進度總覽")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(Color(hex: "303030"))
                        .padding(.top, 24)

                    ProgressCircleView(progress: progress)
                        .shadow(color: .black.opacity(0.05), radius: 8, y: 3)

                    VStack(alignment: .leading, spacing: 6) {
                        Text("小種子澆水灌溉中")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(Color(hex: "303030"))

                        LottieView(filename: "PlantGrowing")
                            .frame(maxWidth: .infinity)
                            .frame(height: 300)
                            .background(Color.white)
                            .cornerRadius(16)
                    }
                    .padding(16)
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.05), radius: 8, y: 3)

                    NavigationLink {
                        ChallengeView(missionCompleted: $missionCompleted)
                    } label: {
                        Text("前往挑戰頁")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "53B175"))
                            .cornerRadius(25)
                            .shadow(color: .black.opacity(0.08), radius: 6, y: 3)
                    }
                    .padding(.top, 8)

                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 32)
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    ProgressScreen(missionCompleted: .constant(Array(repeating: true, count: 4)))
}

//import SwiftUI
//
//// 圓圈進度元件
//struct ProgressCircleView: View {
//    let progress: Double // 0~1
//    
//    var body: some View {
//        ZStack {
//            Circle()
//                .stroke(Color.gray.opacity(0.2), lineWidth: 12)
//                .frame(width: 160, height: 160)
//
//            Circle()
//                .trim(from: 0, to: progress)
//                .stroke(Color.green, style: StrokeStyle(lineWidth: 12, lineCap: .round))
//                .rotationEffect(.degrees(-90))
//                .animation(.easeInOut(duration: 0.6), value: progress)
//                .frame(width: 160, height: 160)
//
//            VStack {
//                Text("\(Int(progress * 100))%")
//                    .font(.title).bold()
//                Text("完成度")
//            }
//        }
////        .frame(width: 160, height: 160)
//        .frame(maxWidth: .infinity)
//        .padding(.vertical, 8)
//        .background()
//        .cornerRadius(16)
//    }
//}
//
//struct ProgressScreen: View {
//    
//    @Binding var missionCompleted: [Bool]
//    
//    private var progress: Double {
//        guard !missionCompleted.isEmpty else { return 0 }
//        let done = missionCompleted.filter { $0 }.count
//        return Double(done) / Double(missionCompleted.count)
//    }
//    
////    @State private var progress: Double = 0.5
//    
//    var body: some View {
//        ScrollView {
//            
//            ZStack {
//                
//                LinearGradient(
//                    gradient: Gradient(colors: [
//                        Color(hex: "F1F8E8"),
//                        Color(hex: "C9E9D2")
//                    ]),
//                    startPoint: .top,
//                    endPoint: .bottom
//                )
//                .ignoresSafeArea()
//            
//            VStack(spacing: 24) {
//                Text("進度總覽")
//                    .font(.title2).bold()
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    
//                    ProgressCircleView(progress: progress)
//                    
//                HStack(spacing: 16) {
//                    VStack(alignment: .leading, spacing: 6) {
//                        Text("小種子澆水灌溉中")
//                            .font(.title2).bold()
//                        HStack(spacing: 6) {
//                            LottieView(filename: "PlantGrowing")
//                                .frame(width: 300, height: 300)
//                                .background()
//                                .cornerRadius(16)
//
//                        }
//
//                        .foregroundStyle(.secondary)
//                        .font(.subheadline)
//                    }
//                    Spacer()
//                }
//                .padding()
//                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
//                
//                NavigationLink {
//                    ChallengeView(missionCompleted: $missionCompleted)
//                } label: {
//                    Text("前往挑戰頁")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.green)
//                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
//                        .shadow(radius: 3, y: 2)
//                }
//                .padding(.top, 8)
//            }
//            .padding(16)
//        }
////        .background(Color(.systemGroupedBackground).ignoresSafeArea())
////        .background(Color.green.opacity(0.2))
//        .navigationTitle("Progress")
//        .toolbarTitleDisplayMode(.inline)
//    }
//}
//}
//#Preview {
//    ProgressScreen(missionCompleted: .constant(Array(repeating: true, count: 4)))
//}
