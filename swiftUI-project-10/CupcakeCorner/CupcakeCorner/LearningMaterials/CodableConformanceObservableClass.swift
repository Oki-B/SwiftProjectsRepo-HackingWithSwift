//
//  CodableConformanceObservableClass.swift
//  CupcakeCorner
//
//  Created by Syaoki Biek on 07/09/25.
//

import SwiftUI

@Observable
class User: Codable {
    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }
    
    var name = "John"
}

struct CodableConformanceObservableClass: View {
    var body: some View {
        Button("Encode John", action: encodeJohn)
    }
    
    func encodeJohn() {
        let data = try! JSONEncoder().encode(User())
        let str = String(decoding: data, as: UTF8.self)
        print(str)
    }
}

#Preview {
    CodableConformanceObservableClass()
}
