//
//  Untitled.swift
//  Vegan7days
//
//  Created by Cara Hsu on 2025/2/21.
//
//
//

import SwiftUI

// 圓圈進度元件
struct ProgressCircleView: View {
    let progress: Double // 0~1
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.2), lineWidth: 12)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color.green, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 0.6), value: progress)
            Text("\(Int(progress * 100))%")
                .font(.title).bold()
        }
        .frame(width: 160, height: 160)
        .padding(.vertical, 8)
    }
}

struct ProgressView: View {
    @State private var progress: Double = 0.5
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("進度總覽")
                    .font(.title2).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ProgressCircleView(progress: progress)
                
                HStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("小種子澆水灌溉中")
                            .font(.headline)
                        HStack(spacing: 6) {
                            LottieView(filename: "PlantGrowing")
                                .frame(width: 250, height: 250)

                        }
                        .foregroundStyle(.secondary)
                        .font(.subheadline)
                    }
                    Spacer()
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                
                NavigationLink {
                    ChallengeView()
                } label: {
                    Text("前往挑戰頁")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        .shadow(radius: 3, y: 2)
                }
                .padding(.top, 8)
            }
            .padding(16)
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .navigationTitle("Progress")
        .toolbarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack { ProgressView() }
}
