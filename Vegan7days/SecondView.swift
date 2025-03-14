//
//  Untitled.swift
//  Vegan7days
//
//  Created by Cara Hsu on 2025/2/21.
//
//

import SwiftUI

var progress: CGFloat = 0

var percentage: Int = 0

struct SecondView: View {
    
    let days = [
        
        "DAY1",
        "DAY2",
        "DAY3",
        "DAY4",
        "DAY5",
        "DAY6",
        "DAY7",
        "DAY8"
        
    ]
    
    var body: some View {
        
        VStack {
        
            HStack{
                Text("每日挑戰")
                    .font(.title)
                
                ZStack{
                    Circle()
                        .stroke(lineWidth: 10)
                        .opacity(0.3)
                        .foregroundColor(Color.gray)
                    
                    Circle()
                        .trim(from: 0.0, to: progress)
                        .stroke(
                            AngularGradient(gradient: Gradient(colors: [.purple, .red]), center: .center),
                            style: StrokeStyle(lineWidth: 8, lineCap: .round)
                        )
                        .rotationEffect(.degrees(-90))
                        
                    VStack{
                        Text("目前進度")
                            
                        
                        Text("\(percentage)%")
                            .bold()
                    }

                }
                .frame(width: 100, height: 100)
            }
                
            NavigationStack {
                
                let columns = [GridItem(), GridItem()]
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(days.indices, id: \.self) { item in
                            NavigationLink(destination: ChallengeView(day: days[item])){
                                DailyView(day: days[item])
                            }
                        }
                    }
                }
            }
        }
    }
}

struct DailyView: View {
    let day: String
    
    var body: some View {
        
            ZStack{
                Image(day)
                    .resizable()
                    .scaledToFit()
                    .frame(width:200, height: 200)
                    .cornerRadius(10)
                
                Text(day)
                    .font(.system(size: 20))
                    .cornerRadius(10)
        }
    }
}



#Preview {
    SecondView()
}
