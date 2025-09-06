//
//  Activity.swift
//  Challenge_04
//
//  Created by Syaoki Biek on 06/09/25.
//

import Foundation

struct Activity {
    let title: String
    let description: String
}

@Observable
class Activities {
    @Published var items: [Activity]
    
    init(items: [Activity]) {
        self.items = items
    }
}
