//
//  ChallengeView.swift
//  Vegan7days
//
//  Created by Cara Hsu on 2025/3/9.
//

import SwiftUI

var oneProgress: Double = 1/7

var isFinish: Bool = false

struct ChallengeView: View {
    
    @State private var scaleEffect: CGFloat = 1.0

    
    let day: String
    
    var body: some View {
        
        VStack {
            
            Text("\(day) 挑戰")
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
            
//            GeometryReader { geometry in

                Image("vegan_restaurant") // 這裡換成你的圖片名稱
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width - 32, height: 450, alignment: .center) // 調整高度
                            .cornerRadius(25)
                            .padding(.horizontal, 10)

//            }
            Text(getChallengeContent(for: day))
                .font(.title3)
                .padding()
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            
            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)) {
                    scaleEffect = 0.9
                    progress += oneProgress
                    percentage = Int(progress * 100)
                    isFinish = true
                    
                }
                withAnimation(.easeInOut(duration: 0.5).delay(0.2)) {
                    scaleEffect = 1.0
                }
                
            }) {
                HStack {
                    Image(systemName: "star")
                    Text("挑戰完成")
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(radius: 3)
                .scaleEffect(scaleEffect)
            }

        }
        .navigationTitle("\(day) 挑戰")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // 依照 day 來顯示不同的挑戰內容
    func getChallengeContent(for day: String) -> String {
        switch day {
        case "DAY1":
            return "踩點一間沒去過的Vegan餐廳，去吃個晚餐吧！"
        case "DAY2":
            return "邀請1位朋友or家人，一起去Vegan或素食餐廳吃飯"
        case "DAY3":
            return "到連鎖超市、商店尋找一款無動物實驗及成分的生活用品，洗髮精、洗面乳或保養品，提示：可以看看有沒有兔兔標章或是Vegan認證"
        case "DAY4":
            return "情境模擬練習:假設要購買一雙新的皮鞋、一個新皮包，要怎麼挑選人造皮革的，如何辨別成分？哪裡買得到？"
        case "DAY5":
            return "情境模擬練習: 想像自己要幫Vegan朋友慶生，你找得到販售純植蛋糕的通路嗎？不論是實體店面或是網購、個人工作室都可以查看看"
        case "DAY6":
            return "上網查看看: Vegan要怎麼補充蛋白質以及B12，並仔細了解B12的來源，B12存在於哪裡呢？"
        case "DAY7":
            return "在自己的社群平台，記錄挑戰成果和心得，藉由貼文或限動 分享！"
        case "DAY8":
            return "恭喜你完成7天的挑戰，在這七天內"
        default:
            return "未知的挑戰內容"
        }
    }
}
#Preview {
    ChallengeView(day: "DAY1")
}
