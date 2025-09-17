//
//  ChallengeView.swift
//  Vegan7days
//
//  Created by Cara Hsu on 2025/3/9.
//


import SwiftUI

struct Challenge1View: View {
    @Environment(\.dismiss) private var dismiss
    @State private var scaleEffect: CGFloat = 1.0
    let day: String
    let index: Int

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                Text("Day \(index + 1) 挑戰")
                    .font(.title).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)

                GeometryReader { geo in
                    let width = geo.size.width - 32
                    let height = max(220, width * 0.55) 

                    Image("vegan_restaurant")
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: height)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .shadow(radius: 3)
                        .padding(.horizontal, 16)
                }
                .frame(height: 260)
                
                Text(day)
                    .font(.title).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)

                Text(getChallengeContent(for: day))
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)

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
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button { dismiss() } label: { Image(systemName: "chevron.left") }
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    func getChallengeContent(for day: String) -> String {
        switch day {
        case "踩點餐廳":
            return "踩點一間沒去過的Vegan餐廳，去吃個晚餐吧！"
        case "邀請朋友吃素":
            return "邀請1位朋友or家人，一起去Vegan或素食餐廳吃飯"
        case "連鎖店找一款無動實產品":
            return "到連鎖超市、商店尋找一款無動物實驗及成分的生活用品..."
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

//#Preview {
//    Challenge1View(index: 0, day: "踩點餐廳")
//}
