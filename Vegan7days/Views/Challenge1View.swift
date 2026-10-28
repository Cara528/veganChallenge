//
//  ChallengeView.swift
//  Vegan7days
//
//  Created by Cara Hsu on 2025/3/9.
//


import SwiftUI

struct Challenge1View: View {
    //    @Environment(\.dismiss) private var dismiss
    @State private var scaleEffect: CGFloat = 1.0
    let day: String
    let index: Int
    var onBack: () -> Void = {}
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                
                ZStack(alignment: .topLeading) {
                    // 圖片與標題
                    ZStack(alignment: .bottomLeading) {
                        Color.clear
                            .frame(maxWidth: .infinity)
                            .frame(height: 320)
                            .overlay(
                                Image("vegan_restaurant")
                                    .resizable()
                                    .scaledToFill()
                            )
                            .clipped()
                        
                        LinearGradient(
                            colors: [.clear, Color(hex: "FFFFFF")],
                            startPoint: .center,
                            endPoint: .bottom
                        )
                        .frame(maxWidth: .infinity)
                        .frame(height: 320)
                        
                        
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Day \(index + 1)")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(Color(hex: "253900"))
                                .padding(.horizontal, 12)
                                .padding(.vertical, 4)
                                .background(Color.white)
                                .clipShape(Capsule())
                            
                            Text(day)
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(Color(hex: "303030"))
                        }
                        .padding(16)
                    }
                    .frame(height: 320)
                    
                    // 上方按鈕
                    HStack {
                        Button(action: onBack) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(Color(hex: "303030"))
                                .frame(width: 44, height: 44)
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(color: .black.opacity(0.1), radius: 4, y: 2)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            // TODO: 書籤功能
                        }) {
                            Image(systemName: "bookmark")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(Color(hex: "303030"))
                                .frame(width: 44, height: 44)
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(color: .black.opacity(0.1), radius: 4, y: 2)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
                }
                .frame(height: 320)
                .clipped()
                
           
                HStack(alignment: .center, spacing: 14) {
                    ZStack {
                        Circle()
                            .fill(Color(hex: "E6F3E6"))
                            .frame(width: 48, height: 48)

                        Image(systemName: "leaf.fill")
                            .font(.system(size: 20))
                            .foregroundColor(Color(hex: "53B175"))
                    }

                    VStack(alignment: .leading, spacing: 6) {
                        Text("今天的任務")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(Color(hex: "53B175"))

                        Text(getChallengeContent(for: day))
                            .font(.system(size: 16))
                            .foregroundColor(Color(hex: "303030"))
                            .lineSpacing(4)
                            .fixedSize(horizontal: false, vertical: true)
                    }

                    Spacer(minLength: 0)
                }
                .padding(16)
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.05), radius: 8, y: 3)
                .padding(.horizontal, 16)

                if !getMissionDetail(for: day).intro.isEmpty {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("任務說明")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(Color(hex: "303030"))

                        Text(getMissionDetail(for: day).intro)
                            .font(.system(size: 16))
                            .foregroundColor(Color(hex: "303030"))
                            .lineSpacing(4)
                            .fixedSize(horizontal: false, vertical: true)

                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(getMissionDetail(for: day).tips, id: \.self) { tip in
                                HStack(alignment: .top, spacing: 8) {
                                    Text("•")
                                    Text(tip)
                                }
                                .font(.system(size: 16))
                                .foregroundColor(Color(hex: "303030"))
                            }
                        }

                        if let reminder = getMissionReminder(for: day) {
                            HStack(alignment: .top, spacing: 12) {
                                ZStack {
                                    Circle()
                                        .fill(Color(hex: "D4EBD4"))
                                        .frame(width: 36, height: 36)

                                    Image(systemName: "lightbulb.fill")
                                        .font(.system(size: 16))
                                        .foregroundColor(Color(hex: "53B175"))
                                }

                                VStack(alignment: .leading, spacing: 6) {
                                    Text("小提醒")
                                        .font(.system(size: 15, weight: .semibold))
                                        .foregroundColor(Color(hex: "3A7A3A"))

                                    Text(reminder)
                                        .font(.system(size: 15))
                                        .foregroundColor(Color(hex: "303030"))
                                        .lineSpacing(4)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                            .padding(14)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(hex: "EEF7EE"))
                            .cornerRadius(14)
                        }

                        if !getRecommendedTools(for: day).isEmpty {
                            Divider()

                            Text("推薦工具")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(Color(hex: "303030"))

                            HStack(spacing: 10) {
                                ForEach(getRecommendedTools(for: day)) { tool in
                                    HStack(spacing: 10) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color(hex: "F2F2F2"))
                                            .frame(width: 40, height: 40)
                                            .overlay(
                                                Image(systemName: tool.symbol)
                                                    .foregroundColor(Color(hex: "53B175"))
                                            )

                                        VStack(alignment: .leading, spacing: 2) {
                                            Text(tool.name)
                                                .font(.system(size: 14, weight: .semibold))
                                                .foregroundColor(Color(hex: "303030"))
                                            Text(tool.desc)
                                                .font(.system(size: 12))
                                                .foregroundColor(Color(hex: "8D8D8D"))
                                                .lineLimit(1)
                                                .minimumScaleFactor(0.8)
                                        }
                                    }
                                    .padding(10)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color.white)
                                    .cornerRadius(12)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color(hex: "E8E8E8"))
                                    )
                                }
                            }
                        }
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.05), radius: 8, y: 3)
                    .padding(.horizontal, 16)
                }
                
                Button {
                    print("Done!")
                } label: {
                    HStack {
                        Image(systemName: "star")
                        Text("挑戰完成")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(35)
                    .shadow(radius: 3)
                    .padding(.horizontal, 16)
                    .scaleEffect(scaleEffect)
                }
            }
            .padding(.bottom, 24)
        }
    }
    
    func getMissionDetail(for day: String) -> (intro: String, tips: [String]) {
        switch day {
        case "踩點餐廳":
            return (
                "試著在附近的餐廳、咖啡廳或熟食店，尋找有提供 Vegan 選項的餐點。你可以：",
                ["先看看菜單上有沒有標示 Vegan", "詢問店員是否能客製成全植物餐點"]
            )
        default:
            return ("", [])
        }
    }
    
    func getMissionReminder(for day: String) -> String? {
        switch day {
        case "踩點餐廳":
            return "有些餐廳會標示「全素」、「純素」或「Vegan」，也可以主動詢問店員喔！"
        default:
            return nil
        }
    }
    
    func getRecommendedTools(for day: String) -> [RecommendedTool] {
        switch day {
        case "踩點餐廳":
            return [
                RecommendedTool(name: "HappyCow", desc: "尋找附近 Vegan 餐廳", symbol: "pawprint.fill"),
                RecommendedTool(name: "地圖", desc: "搜尋周邊餐廳", symbol: "map.fill")
            ]
        default:
            return []
        }
    }
    
    func getChallengeContent(for day: String) -> String {
        switch day {
        case "踩點餐廳":
            return "踩點一間沒去過的Vegan餐廳，去吃個晚餐吧！"
        case "邀請朋友吃素":
            return "邀請1位朋友or家人，一起去Vegan或素食餐廳吃飯"
        case "連鎖店找一款無動實產品":
            return "到連鎖超市、商店尋找一款無動物實驗及成分的生活用品"
        case "情境模擬練習：買新鞋":
            return "假設要購買一雙新的皮鞋..."
        case "情境模擬練習：好友過生日":
            return "幫Vegan朋友慶生，找純植蛋糕的通路"
        case "問答題：關於B12":
            return "上網查看: Vegan怎麼補充蛋白質與B12"
        case "心得打卡":
            return "在社群平台記錄挑戰成果與心得！"
        default:
            return "未知的挑戰內容"
        }
    }
    
}

struct RecommendedTool: Identifiable {
    let id = UUID()
    let name: String
    let desc: String
    let symbol: String
}
