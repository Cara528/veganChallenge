//
//  Untitled.swift
//  Vegan7days
//
//  Created by Cara Hsu on 2025/6/12.
//

import SwiftUI

struct WelcomeView: View {
    @State private var showMainApp = false
    
    var body: some View {
    if showMainApp {
        MainTabView()
    } else {
    NavigationStack {
        ZStack {
            VStack {
                Image("backgroundImageName")
                        .resizable()
                        
                Button(action: {
                    showMainApp = true
                        }) {
                            Text("旅程開始")
                                .font(.system(size: 18, weight: .bold))
                                .frame(width: 340, height: 50)
                                .foregroundStyle(.white)
                                .background(Color(hex: "53B175"))
                                .cornerRadius(16)
                        }
                        .padding(.bottom, 16)
                    }
                }
            }
        }
    }
}
#Preview {
    WelcomeView()
}
