//
//  ArchivingSwiftObjects.swift
//  iExpense
//
//  Created by Syaoki Biek on 04/08/25.
//

import SwiftUI

struct User1: Codable {
    let firstName: String
    let lastName: String
}

struct ArchivingSwiftObjects: View {
    @State private var user = User1(firstName: "Benjo", lastName: "Laturatonin")
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

#Preview {
    ArchivingSwiftObjects()
}
