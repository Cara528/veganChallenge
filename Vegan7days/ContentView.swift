//
//  ContentView.swift
//  Vegan7days
//
//  Created by Cara Hsu on 2025/2/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // 背景圖片
                
                VStack {
                    
                    Image("backgroundImageName") // 記得將背景圖片加到你的資源中
                        .resizable()
                    
                    NavigationLink {
                        SecondView()
                    } label: {
                        Text("旅程開始!")
                            .font(.largeTitle)
                    }
                }
            }
//            .navigationTitle("首頁")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


#Preview {
    ContentView()
}
