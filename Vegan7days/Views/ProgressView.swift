//
//  Untitled.swift
//  Vegan7days
//
//  Created by Cara Hsu on 2025/2/21.
//
//
//

import SwiftUI

struct ProgressView: View {
    
    let progress: Double
        
    var body: some View {
        
        VStack {
            
            Text("目前進度")
                .font(.title)
            
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 12)
                
                // 進度圓圈
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(Color.green, style:StrokeStyle(lineWidth: 12, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut, value: progress)
                
                // 百分比文字
                Text("\(Int(progress * 100))%")
                    .font(.title)
                    .bold()
            }
            .frame(width: 150, height: 150)
        }
    }
}

#Preview {
    ProgressView(progress: 0.5)
}
