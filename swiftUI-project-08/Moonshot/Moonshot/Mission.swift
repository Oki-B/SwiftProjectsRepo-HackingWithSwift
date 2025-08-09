//
// Mission.swift
//  Moonshot
//
//  Created by Syaoki Biek on 09/08/25.
//

import Foundation



struct Mission: Codable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}
