//
//  Vegan7daysApp.swift
//  Vegan7days
//
//  Created by Cara Hsu on 2025/2/21.
//

//import SwiftUI
//
//@main
//struct Vegan7daysApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}

import SwiftUI

@main
struct Vegan7daysApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
