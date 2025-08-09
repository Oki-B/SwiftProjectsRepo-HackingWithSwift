//
//  HierarchicalCodable.swift
//  Moonshot
//
//  Created by Syaoki Biek on 09/08/25.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct HierarchicalCodable: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
                {
                    "name": "Ogah JayaBaya",
                    "address": {
                        "street": "Jl. bajay merah, Cikalong",
                        "city": "Jakarta"
                    }
                }
                """
            
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            
            if let user = try? decoder.decode(User.self, from: data) {
                print(user.address.street)
            }
        }
    }
}

#Preview {
    HierarchicalCodable()
}
