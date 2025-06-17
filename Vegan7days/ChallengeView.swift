//
//  Untitled.swift
//  Vegan7days
//
//  Created by Cara Hsu on 2025/6/12.
//

import SwiftUI

struct ChallengeView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("任務清單")
                .font(.largeTitle) // 調大字體
                .fontWeight(.bold)
            
            VStack(alignment: .leading, spacing: 12) {
                
                Text("Day1")
                    .font(.headline)
                
                Text("邀請朋友一起吃素")
                
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.yellow.opacity(0.3))
            .cornerRadius(16)
//            .padding(.horizontal, 10)
            
            Spacer()
            
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    ChallengeView()
}
