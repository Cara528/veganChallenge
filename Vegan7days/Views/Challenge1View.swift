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

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                Text("\(day) 挑戰")
                    .font(.largeTitle).bold()
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
        case "DAY3":
            return "到連鎖超市、商店尋找一款無動物實驗及成分的生活用品..."
        case "DAY4":
            return "情境模擬練習: 假設要購買一雙新的皮鞋..."
        case "DAY5":
            return "情境模擬練習: 幫Vegan朋友慶生，找純植蛋糕的通路"
        case "DAY6":
            return "上網查看: Vegan怎麼補充蛋白質與B12"
        case "DAY7":
            return "在社群平台記錄挑戰成果與心得！"
        default:
            return "未知的挑戰內容"
        }
    }
}


//import SwiftUI
//
//struct Challenge1View: View {
//    
//    @State private var scaleEffect: CGFloat = 1.0
//    @Environment(\.presentationMode) var presentationMode
//    
//    let day: String
//    
//    var body: some View {
//        
//        VStack {
//            
//            Text("\(day) 挑戰")
//                .font(.largeTitle)
//                .bold()
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .padding(.leading, 16)
//            
//                Image("vegan_restaurant")
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: UIScreen.main.bounds.width - 32, height: 450, alignment: .center)
//                            .cornerRadius(25)
//                            .padding(.horizontal, 10)
//
//            Text(getChallengeContent(for: day))
//                .font(.title3)
//                .padding()
//                .multilineTextAlignment(.center)
//                .padding(.horizontal, 20)
//            
//                HStack {
//                    Button(action: {
//                        print("Done!")
//                    }){
//                        Image(systemName: "star")
//                        Text("挑戰完成")
//                    }
//                }
//                .frame(minWidth:0, maxWidth: .infinity)
//                .padding(.vertical, 20)
//                .font(.headline)
//                .foregroundColor(.white)
//                .background(Color.green)
//                .cornerRadius(35)
//                .shadow(radius: 3)
//                .padding()
//                .scaleEffect(scaleEffect)
//                
//            }
//        .toolbar {
//            ToolbarItem(placement: .navigationBarLeading) {
//                Button(action: {
//                    presentationMode.wrappedValue.dismiss()
//                }) {
//                    Image(systemName: "chevron.left")
//                }
//            }
//        }
//        .navigationBarBackButtonHidden(true)
//
//        }
//        
//    }
//    
//    func getChallengeContent(for day: String) -> String {
//        switch day {
//        case "踩點餐廳":
//            return "踩點一間沒去過的Vegan餐廳，去吃個晚餐吧！"
//        case "邀請朋友吃素":
//            return "邀請1位朋友or家人，一起去Vegan或素食餐廳吃飯"
//        case "DAY3":
//            return "到連鎖超市、商店尋找一款無動物實驗及成分的生活用品，洗髮精、洗面乳或保養品，提示：可以看看有沒有兔兔標章或是Vegan認證"
//        case "DAY4":
//            return "情境模擬練習:假設要購買一雙新的皮鞋、一個新皮包，要怎麼挑選人造皮革的，如何辨別成分？哪裡買得到？"
//        case "DAY5":
//            return "情境模擬練習: 想像自己要幫Vegan朋友慶生，你找得到販售純植蛋糕的通路嗎？不論是實體店面或是網購、個人工作室都可以查看看"
//        case "DAY6":
//            return "上網查看看: Vegan要怎麼補充蛋白質以及B12，並仔細了解B12的來源，B12存在於哪裡呢？"
//        case "DAY7":
//            return "在自己的社群平台，記錄挑戰成果和心得，藉由貼文或限動 分享！"
//        case "DAY8":
//            return "恭喜你完成7天的挑戰，在這七天內"
//        default:
//            return "未知的挑戰內容"
//        }
//    }

#Preview {
    Challenge1View(day: "DAY1")
}
