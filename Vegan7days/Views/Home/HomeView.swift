import SwiftUI

struct HomeView: View {
    @ObservedObject var missionStore: MissionStore
    
    private let missionTitles: [String] = [
        "邀請朋友到素食餐廳",
        "踩點一間 Vegan 餐廳",
        "找一款無動物實驗的產品",
        "情境模擬練習：買新鞋",
        "情境模擬練習：好友過生日",
        "了解 B12 怎麼補充",
        "心得打卡"
    ]
    
    private var completedCount: Int {
        missionStore.missionCompleted.filter { $0 }.count
    }
    
    private var remainingCount: Int {
        missionStore.missionCompleted.count - completedCount
    }
    
    private var currentIndex: Int {
        missionStore.missionCompleted.firstIndex(of: false) ?? (missionStore.missionCompleted.count - 1)
    }
    
    private var currentDay: Int {
        currentIndex + 1
    }
    
    // 根據完成度決定要顯示哪張盆栽圖
    private var plantImageName: String {
        switch completedCount {
        case 0:
            return "plant_seedling"
        case 1...2:
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
    
    var body: some View {
        ZStack {
            Color(hex: "F4FBF4")
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    // MARK: - Header
                    VStack(alignment: .leading, spacing: 4) {
                        Text("歡迎回來，Cara")
                            .font(.system(size: 15, weight: .regular))
                            .foregroundColor(Color(hex: "8D8D8D"))

                        HStack(spacing: 6) {
                            Text("🌱")
                            Text("Vegan 挑戰第 \(currentDay) 天")
                                .font(.system(size: 17, weight: .bold))
                                .foregroundColor(Color(hex: "303030"))
                        }
                    }
                    .padding(.top, 24)

                    // MARK: - 你的小盆栽
                    HStack(spacing: 16) {
                        Image(plantImageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)

                        VStack(alignment: .leading, spacing: 4) {
                            Text("你的小盆栽")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(Color(hex: "8D8D8D"))
                            Text(plantStageText)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(Color(hex: "303030"))
                        }

                        Spacer()
                    }
                    .padding(16)
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.05), radius: 8, y: 3)

                    // MARK: - 今日任務進行中
                    Text(completedCount == missionStore.missionCompleted.count ? "🎉 7 天挑戰已完成！" : "今日任務進行中")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundColor(Color(hex: "53B175"))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.vertical, 16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color(hex: "53B175"), lineWidth: 1.5)
                        )

                    // MARK: - 今日任務
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(missionTitles[currentIndex])
                                .font(.system(size: 17, weight: .medium))
                                .foregroundColor(Color(hex: "303030"))
                                .lineLimit(2)

                            Button(action: {
                                missionStore.missionCompleted[currentIndex].toggle()
                            }) {
                                Text(missionStore.missionCompleted[currentIndex] ? "已完成 ✓" : "完成")
                                    .font(.system(size: 13))
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color(hex: "8D8D8D"), lineWidth: 1)
                                    )
                                    .foregroundColor(missionStore.missionCompleted[currentIndex] ? Color(hex: "53B175") : Color(hex: "303030"))
                            }
                        }

                        Spacer()

                        Image("icon_vegangirl")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 90, height: 90)
                    }
                    .padding(16)
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.05), radius: 8, y: 3)

                    // MARK: - 本週進度
                    Text("本週進度")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(Color(hex: "303030"))

                    HStack(spacing: 0) {
                        VStack(spacing: 6) {
                            Text("\(completedCount)")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(Color(hex: "53B175"))
                            Text("已完成")
                                .font(.system(size: 12))
                                .foregroundColor(Color(hex: "8D8D8D"))
                        }
                        .frame(maxWidth: .infinity)

                        Divider().frame(height: 36)

                        VStack(spacing: 6) {
                            Text("\(remainingCount)")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(Color(hex: "303030"))
                            Text("剩餘任務")
                                .font(.system(size: 12))
                                .foregroundColor(Color(hex: "8D8D8D"))
                        }
                        .frame(maxWidth: .infinity)

                        Divider().frame(height: 36)

                        VStack(spacing: 6) {
                            Text("\(missionStore.missionCompleted.count)")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(Color(hex: "303030"))
                            Text("總任務數")
                                .font(.system(size: 12))
                                .foregroundColor(Color(hex: "8D8D8D"))
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(16)
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.05), radius: 8, y: 3)

                    // MARK: - 激勵文字
                    ZStack(alignment: .trailing) {
                        Image("bg_earth")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                            .frame(height: 140)
                            .clipped()

                        VStack(alignment: .trailing, spacing: 4) {
                            Text("你的選擇")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.black)

                            Text("改變世界的一點")
                                .font(.system(size: 15))
                                .foregroundColor(.black)
                        }
                        .padding(80)
                    }
                    .cornerRadius(20)

                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 32)
            }
        }
    }
}

#Preview {
    HomeView(missionStore: MissionStore())
}

//import SwiftUI
//
//struct HomeView: View {
//    @ObservedObject var missionStore: MissionStore
//    
//    private let missionTitles: [String] = [
//        "邀請朋友到素食餐廳",
//        "踩點一間 Vegan 餐廳",
//        "找一款無動物實驗的產品",
//        "情境模擬練習：買新鞋",
//        "情境模擬練習：好友過生日",
//        "了解 B12 怎麼補充",
//        "心得打卡"
//    ]
//    
//    private var completedCount: Int {
//        missionStore.missionCompleted.filter { $0 }.count
//    }
//    
//    private var remainingCount: Int {
//        missionStore.missionCompleted.count - completedCount
//    }
//    
//    // 目前該做的任務 index：找第一個還沒完成的，如果全部完成就停在最後一個
//    private var currentIndex: Int {
//        missionStore.missionCompleted.firstIndex(of: false) ?? (missionStore.missionCompleted.count - 1)
//    }
//    
//    private var currentDay: Int {
//        currentIndex + 1
//    }
//    
//    var body: some View {
//        ZStack {
//            Color(hex: "F4FBF4")
//                .ignoresSafeArea()
//
//            ScrollView {
//                VStack(alignment: .leading, spacing: 20) {
//
//                    // MARK: - Header
//                    VStack(alignment: .leading, spacing: 4) {
//                        Text("歡迎回來，Cara")
//                            .font(.system(size: 15, weight: .regular))
//                            .foregroundColor(Color(hex: "8D8D8D"))
//
//                        HStack(spacing: 6) {
//                            Text("🌱")
//                            Text("Vegan 挑戰第 \(currentDay) 天")
//                                .font(.system(size: 17, weight: .bold))
//                                .foregroundColor(Color(hex: "303030"))
//                        }
//                    }
//                    .padding(.top, 24)
//
//                    // MARK: - 今日任務進行中
//                    Text(completedCount == missionStore.missionCompleted.count ? "🎉 7 天挑戰已完成！" : "今日任務進行中")
//                        .font(.system(size: 17, weight: .medium))
//                        .foregroundColor(Color(hex: "53B175"))
//                        .frame(maxWidth: .infinity, alignment: .center)
//                        .padding(.vertical, 16)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 14)
//                                .stroke(Color(hex: "53B175"), lineWidth: 1.5)
//                        )
//
//                    // MARK: - 今日任務
//                    HStack(spacing: 0) {
//                        VStack(alignment: .leading, spacing: 10) {
//                            Text(missionTitles[currentIndex])
//                                .font(.system(size: 17, weight: .medium))
//                                .foregroundColor(Color(hex: "303030"))
//                                .lineLimit(2)
//
//                            Button(action: {
//                                missionStore.missionCompleted[currentIndex].toggle()
//                            }) {
//                                Text(missionStore.missionCompleted[currentIndex] ? "已完成 ✓" : "完成")
//                                    .font(.system(size: 13))
//                                    .padding(.horizontal, 14)
//                                    .padding(.vertical, 5)
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 12)
//                                            .stroke(Color(hex: "8D8D8D"), lineWidth: 1)
//                                    )
//                                    .foregroundColor(missionStore.missionCompleted[currentIndex] ? Color(hex: "53B175") : Color(hex: "303030"))
//                            }
//                        }
//
//                        Spacer()
//
//                        Image("icon_vegangirl")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 90, height: 90)
//                    }
//                    .padding(16)
//                    .background(Color.white)
//                    .cornerRadius(16)
//                    .shadow(color: .black.opacity(0.05), radius: 8, y: 3)
//
//                    // MARK: - 本週進度
//                    Text("本週進度")
//                        .font(.system(size: 17, weight: .bold))
//                        .foregroundColor(Color(hex: "303030"))
//
//                    HStack(spacing: 0) {
//                        VStack(spacing: 6) {
//                            Text("\(completedCount)")
//                                .font(.system(size: 28, weight: .bold))
//                                .foregroundColor(Color(hex: "53B175"))
//                            Text("已完成")
//                                .font(.system(size: 12))
//                                .foregroundColor(Color(hex: "8D8D8D"))
//                        }
//                        .frame(maxWidth: .infinity)
//
//                        Divider().frame(height: 36)
//
//                        VStack(spacing: 6) {
//                            Text("\(remainingCount)")
//                                .font(.system(size: 28, weight: .bold))
//                                .foregroundColor(Color(hex: "303030"))
//                            Text("剩餘任務")
//                                .font(.system(size: 12))
//                                .foregroundColor(Color(hex: "8D8D8D"))
//                        }
//                        .frame(maxWidth: .infinity)
//
//                        Divider().frame(height: 36)
//
//                        VStack(spacing: 6) {
//                            Text("\(missionStore.missionCompleted.count)")
//                                .font(.system(size: 28, weight: .bold))
//                                .foregroundColor(Color(hex: "303030"))
//                            Text("總任務數")
//                                .font(.system(size: 12))
//                                .foregroundColor(Color(hex: "8D8D8D"))
//                        }
//                        .frame(maxWidth: .infinity)
//                    }
//                    .padding(16)
//                    .background(Color.white)
//                    .cornerRadius(16)
//                    .shadow(color: .black.opacity(0.05), radius: 8, y: 3)
//
//                    // MARK: - 激勵文字
//                    ZStack(alignment: .trailing) {
//                        Image("bg_earth")
//                            .resizable()
//                            .scaledToFill()
//                            .frame(maxWidth: .infinity)
//                            .frame(height: 140)
//                            .clipped()
//
//                        VStack(alignment: .trailing, spacing: 4) {
//                            Text("你的選擇")
//                                .font(.system(size: 18, weight: .semibold))
//                                .foregroundColor(.black)
//
//                            Text("改變世界的一點")
//                                .font(.system(size: 15))
//                                .foregroundColor(.black)
//                        }
//                        .padding(80)
//                    }
//                    .cornerRadius(20)
//
//                    Spacer()
//                }
//                .padding(.horizontal, 20)
//                .padding(.bottom, 32)
//            }
//        }
//    }
//}
