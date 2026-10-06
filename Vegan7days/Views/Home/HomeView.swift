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
    
    private let missionDescriptions: [String] = [
        "找一家提供 Vegan 選擇的餐廳，開始你的植物性探索吧！",
        "邀請一位朋友一起體驗素食，分享你的 Vegan 旅程。",
        "在連鎖店找一款無動物成分的生活用品，試試看！",
        "練習在買鞋時選擇非皮革材質，為動物發聲。",
        "幫朋友慶生時，選擇一款植物性蛋糕或甜點。",
        "查找 B12 的植物性來源，了解 Vegan 營養知識。",
        "記錄這 7 天的心得，分享你的改變！"
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
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("早安，Cara 🌱")
                                .font(.system(size: 15, weight: .regular))
                                .foregroundColor(Color(hex: "8D8D8D"))

                            HStack(spacing: 6) {
                                Text("🌱")
                                Text("Vegan 挑戰第 \(currentDay) 天")
                                    .font(.system(size: 17, weight: .bold))
                                    .foregroundColor(Color(hex: "303030"))
                            }
                        }

                        Spacer()

                        // 鈴鐺
                        ZStack(alignment: .topTrailing) {
                            Button(action: {
                                // TODO: 通知功能
                            }) {
                                Image(systemName: "bell")
                                    .font(.system(size: 20))
                                    .foregroundColor(Color(hex: "303030"))
                                    .padding(10)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .shadow(color: .black.opacity(0.05), radius: 4, y: 2)
                            }

                            // 紅點
                            Circle()
                                .fill(Color.red)
                                .frame(width: 8, height: 8)
                                .offset(x: 2, y: 2)
                        }
                    }
                    .padding(.top, 24)
                    
                    
                    // MARK: - 天數進度圓圈
                    HStack(spacing: 0) {
                        ForEach(0..<missionStore.missionCompleted.count, id: \.self) { index in
                            ZStack {
                                Circle()
                                    .fill(index < completedCount ? Color(hex: "53B175") : Color.white)
                                    .frame(width: 36, height: 36)
                                    .overlay(
                                        Circle()
                                            .stroke(Color(hex: "8D8D8D"), lineWidth: 1.5)
                                    )
                                
                                Text("\(index + 1)")
                                    .font(.system(size: 13, weight: .medium))
                                    .foregroundColor(index < completedCount ? Color.white : Color(hex: "303030"))
                            }
                            
                            if index < missionStore.missionCompleted.count - 1 {
                                Rectangle()
                                    .fill(index < completedCount ? Color(hex: "253900") : Color(hex: "D0D0D0"))
                                    .frame(height: 1.5)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                    }
                    .padding(.bottom, 4)
                    
                    // MARK: - 今日任務
                    VStack(alignment: .leading, spacing: 12) {

                        Text("今日任務")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(Color(hex: "253900"))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(Color(hex: "253900").opacity(0.1))
                            .cornerRadius(8)

                        Text(missionTitles[currentIndex])
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color(hex: "253900"))
                            .lineLimit(3)

                        Text(missionDescriptions[currentIndex])
                            .font(.system(size: 14))
                            .foregroundColor(Color(hex: "303030"))
                            .lineSpacing(4)

                        Button(action: {
                            missionStore.missionCompleted[currentIndex].toggle()
                        }) {
                            HStack(spacing: 8) {
                                Text(missionStore.missionCompleted[currentIndex] ? "已完成 ✓" : "開始任務")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.white)
                                if !missionStore.missionCompleted[currentIndex] {
                                    Text("→")
                                        .foregroundColor(.white)
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(Color(hex: "5C8E00"))
                            .cornerRadius(12)
                        }
                        .padding(.top, 4)
                    }
                    .padding(20)
                    .background(Color(hex: "FFFFFF"))
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.05), radius: 8, y: 3)

                    // MARK: - 你的小盆栽
                    HStack(alignment: .center, spacing: 12) {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("你的小盆栽")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(Color(hex: "8D8D8D"))
                            
                            HStack(spacing: 4) {
                                Text(plantStageText)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(Color(hex: "303030"))
                                Text("🌱")
                            }
                            
                            // 進度條
                            GeometryReader { geo in
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(Color(hex: "E8E8E8"))
                                        .frame(height: 6)
                                    
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(Color(hex: "53B175"))
                                        .frame(width: geo.size.width * CGFloat(completedCount) / CGFloat(missionStore.missionCompleted.count), height: 6)
                                }
                            }
                            .frame(height: 6)
                            
                            Text("再完成 \(remainingCount) 個任務就會長大囉！")
                                .font(.system(size: 12))
                                .foregroundColor(Color(hex: "8D8D8D"))
                        }
                        
                        Spacer()
                        
                        Image(plantImageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
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
