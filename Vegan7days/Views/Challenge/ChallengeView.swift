//
//  ChallengeView.swift
//  Vegan7days
//
//  Created by Cara Hsu on 2025/3/9.
//

import SwiftUI

struct ChallengeView: View {
    let day: String
    let index: Int
    var onBack: () -> Void = {}

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {

                // MARK: - 頂部圖片與標題
                ZStack(alignment: .topLeading) {
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

                // MARK: - 今天的任務
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

                // MARK: - 任務說明（含小提醒、推薦工具）
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

                // MARK: - 完成任務按鈕
                Button {
                    print("Done!")
                } label: {
                    HStack(spacing: 8) {
                        Text("完成任務")
                            .font(.system(size: 17, weight: .semibold))
                        Image(systemName: "checkmark")
                            .font(.system(size: 15, weight: .bold))
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(Color(hex: "5C8E00"))
                    .cornerRadius(16)
                    .shadow(color: .black.opacity(0.1), radius: 6, y: 3)
                    .padding(.horizontal, 16)
                }
                .padding(.top, 4)
            }
            .padding(.bottom, 24)
        }
    }

    // MARK: - 資料函式

    func getMissionDetail(for day: String) -> (intro: String, tips: [String]) {
        switch day {
        case "踩點餐廳":
            return (
                "試著在附近的餐廳、咖啡廳或熟食店，尋找有提供 Vegan 選項的餐點。你可以：",
                ["先看看菜單上有沒有標示 Vegan", "詢問店員是否能客製成全植物餐點"]
            )
        case "邀請朋友吃素":
            return (
                "試著邀請一位朋友一起享用 Vegan 餐點，親身體驗植物性飲食。你可以：",
                [
                    "選擇一家有提供 Vegan 餐點的餐廳",
                    "邀請朋友一起用餐，分享你喜歡這道料理的原因",
                    "如果朋友有興趣，可以介紹 Vegan 飲食的基本概念"
                ]
            )
        case "連鎖店找一款無動實產品":
            return (
                "到便利商店或其他連鎖商店，試著找到一款不含動物性成分的食品或飲品。你可以：",
                [
                    "查看包裝上的成分表",
                    "留意牛奶、蛋、蜂蜜、明膠、乳清等成分",
                    "遇到不熟悉的成分時，查詢其來源或向品牌確認"
                ]
            )
        case "情境模擬練習：買新鞋":
            return (
                "假設你今天需要買一雙新鞋，練習如何挑選不使用動物來源材料的鞋款。你可以：",
                [
                    "查看商品標示與材質說明",
                    "留意皮革、麂皮、羊毛等動物來源材料",
                    "優先尋找明確標示為 Vegan 的鞋款，並確認鞋面、內裡及其他部件的材質"
                ]
            )
        case "情境模擬練習：好友過生日":
            return (
                "好友生日快到了，假設你需要準備一份符合 Vegan 理念的禮物或慶祝活動。你可以：",
                [
                    "挑選不含動物性成分的蛋糕或甜點",
                    "選擇不使用動物來源材料的禮物",
                    "如果要送保養品或化妝品，可以確認產品成分及品牌的動物實驗政策"
                ]
            )
        case "問答題：關於B12":
            return (
                "今天來認識維生素 B12，了解它為什麼是 Vegan 飲食中需要特別注意的營養素。完成以下任務：",
                [
                    "了解 B12 在人體中的重要功能",
                    "認識哪些食品有經過 B12 強化",
                    "了解純素者如何透過可靠的補充來源取得足夠的 B12"
                ]
            )
        case "心得打卡":
            return (
                "恭喜你來到最後一天！回顧這 7 天的挑戰，記錄自己學到的事情，以及未來想繼續嘗試的改變。你可以：",
                [
                    "分享這 7 天最有印象的一項任務",
                    "記錄自己對 Vegan 飲食或生活用品的新認識",
                    "寫下一個未來想持續實踐的小行動"
                ]
            )
        default:
            return ("", [])
        }
    }

    func getMissionReminder(for day: String) -> String? {
        switch day {
        case "踩點餐廳":
            return "有些餐廳會標示「全素」、「純素」或「Vegan」，也可以主動詢問店員喔！"
        case "邀請朋友吃素":
            return "邀請時以分享和體驗為主，不需要要求朋友改變飲食習慣。一次愉快的用餐，也能讓更多人認識 Vegan。"
        case "連鎖店找一款無動實產品":
            return "「植物性」或「無肉」不一定代表 Vegan。部分添加物的來源也可能因產品而異；若無法確認，可以先標記為待確認，不必急著下結論。"
        case "情境模擬練習：買新鞋":
            return "標示「人造皮革」不代表整雙鞋一定符合 Vegan 標準，因為黏著劑或其他部件的成分可能不明。遇到不確定的資訊，可以向品牌詢問。"
        case "情境模擬練習：好友過生日":
            return "「無動物實驗」與「不含動物性成分」是兩件不同的事。挑選 Vegan 禮物時，記得分別確認這兩個條件，不必追求一次就找到完美答案。"
        case "問答題：關於B12":
            return "維生素 B12 對神經系統與紅血球形成十分重要。未經強化的植物性食物，通常不能作為可靠的 B12 來源。採取 Vegan 飲食的人應規劃可靠的 B12 來源，例如經確認含有足量 B12 的強化食品或補充劑。"
        case "心得打卡":
            return "完成挑戰不代表你必須立刻做到所有事情。每個人的起點不同，這 7 天最重要的是增加認識、找到可實踐的方法，並決定下一步想怎麼走。"
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

// MARK: - 推薦工具資料模型

struct RecommendedTool: Identifiable {
    let id = UUID()
    let name: String
    let desc: String
    let symbol: String
}
