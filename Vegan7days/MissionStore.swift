//
//  Untitled.swift
//  Vegan7days
//
//  Created by 徐郁淳 on 2026/6/27.
//

import Foundation
import Combine

class MissionStore: ObservableObject {
    @Published var missionCompleted: [Bool] {
        didSet {
            save()
        }
    }
    
    private let key = "missionCompleted"
    private let totalDays = 7
    
    init() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([Bool].self, from: data),
           decoded.count == totalDays {
            self.missionCompleted = decoded
        } else {
            self.missionCompleted = Array(repeating: false, count: totalDays)
        }
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(missionCompleted) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
}
