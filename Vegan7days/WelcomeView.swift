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
                            Text("旅程開始！")
                                .font(.largeTitle)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                    }
                }
            }
        }
    }
}
#Preview {
    WelcomeView()
}
