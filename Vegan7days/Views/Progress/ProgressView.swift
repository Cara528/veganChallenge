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
