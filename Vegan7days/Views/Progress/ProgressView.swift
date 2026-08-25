//
//  Untitled.swift
//  Vegan7days
//
//  Created by Cara Hsu on 2025/2/21.
//
//
//
//
//

import SwiftUI

struct ProgressCircleView: View {
    let progress: Double

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

    private var completedCount: Int {
        missionCompleted.filter { $0 }.count
    }

    private var remainingCount: Int {
        missionCompleted.count - completedCount
    }

    // 跟 HomeView 一致的邏輯
    private var plantImageName: String {
        switch completedCount {
        case 0...2:
            return "plant_seedling"
        case 3...5:
            return "plant_sprout"
        default:
            return "plant_mature"
        }
    }

    private var plantStageText: String {
        switch completedCount {
        case 0...2:
            return "小苗剛冒出頭"
        case 3...5:
            return "正在努力生長中"
        default:
            return "長成一棵小樹了！"
        }
    }

    private var milestoneText: String {
        if remainingCount == 0 {
            return "🎉 恭喜完成 7 天挑戰！"
        } else {
            return "再完成 \(remainingCount) 個任務就達成 100%！"
        }
    }

    var body: some View {
        ZStack {
            Color(hex: "F4FBF4")
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    // MARK: - 標題
                    Text("進度總覽")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(Color(hex: "303030"))
                        .padding(.top, 24)

                    // MARK: - 圓形進度條
                    ProgressCircleView(progress: progress)
                        .shadow(color: .black.opacity(0.05), radius: 8, y: 3)

                    // MARK: - 植物卡片
                    VStack(alignment: .leading, spacing: 12) {
                        Text("你的小盆栽")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(Color(hex: "8D8D8D"))

                        Text(plantStageText)
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(Color(hex: "303030"))

                        Image(plantImageName)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                    }
                    .padding(16)
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.05), radius: 8, y: 3)

                    // MARK: - 里程碑提示
                    VStack(alignment: .leading, spacing: 4) {
                        Text("距離完成還有")
                            .font(.system(size: 13))
                            .foregroundColor(Color(hex: "8D8D8D"))
                        Text(milestoneText)
                            .font(.system(size: 17, weight: .medium))
                            .foregroundColor(Color(hex: "303030"))
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.05), radius: 8, y: 3)

                    // MARK: - 前往挑戰頁
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
//                .stroke(Color(hex: "53B175"), style: StrokeStyle(lineWidth: 12, lineCap: .round))
//                .rotationEffect(.degrees(-90))
//                .animation(.easeInOut(duration: 0.6), value: progress)
//                .frame(width: 160, height: 160)
//
//            VStack {
//                Text("\(Int(progress * 100))%")
//                    .font(.system(size: 28, weight: .bold))
//                    .foregroundColor(Color(hex: "303030"))
//                Text("完成度")
//                    .font(.system(size: 14))
//                    .foregroundColor(Color(hex: "8D8D8D"))
//            }
//        }
//        .frame(maxWidth: .infinity)
//        .padding(.vertical, 8)
//        .background(Color.white)
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
//    var body: some View {
//        ZStack {
//            Color(hex: "F4FBF4")
//                .ignoresSafeArea()
//
//            ScrollView {
//                VStack(alignment: .leading, spacing: 24) {
//
//                    Text("進度總覽")
//                        .font(.system(size: 22, weight: .bold))
//                        .foregroundColor(Color(hex: "303030"))
//                        .padding(.top, 24)
//
//                    ProgressCircleView(progress: progress)
//                        .shadow(color: .black.opacity(0.05), radius: 8, y: 3)
//
//                    VStack(alignment: .leading, spacing: 6) {
//                        Text("小種子澆水灌溉中")
//                            .font(.system(size: 17, weight: .bold))
//                            .foregroundColor(Color(hex: "303030"))
//
//                        LottieView(filename: "PlantGrowing")
//                            .frame(maxWidth: .infinity)
//                            .frame(height: 300)
//                            .background(Color.white)
//                            .cornerRadius(16)
//                    }
//                    .padding(16)
//                    .background(Color.white)
//                    .cornerRadius(16)
//                    .shadow(color: .black.opacity(0.05), radius: 8, y: 3)
//
//                    NavigationLink {
//                        ChallengeView(missionCompleted: $missionCompleted)
//                    } label: {
//                        Text("前往挑戰頁")
//                            .font(.system(size: 16, weight: .semibold))
//                            .foregroundColor(.white)
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color(hex: "53B175"))
//                            .cornerRadius(25)
//                            .shadow(color: .black.opacity(0.08), radius: 6, y: 3)
//                    }
//                    .padding(.top, 8)
//
//                    Spacer()
//                }
//                .padding(.horizontal, 20)
//                .padding(.bottom, 32)
//            }
//        }
//        .navigationBarHidden(true)
//    }
//}
//
//#Preview {
//    ProgressScreen(missionCompleted: .constant(Array(repeating: true, count: 4)))
//}
