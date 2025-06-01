//
//  ModifierOrder.swift
//  ViewsAndModifiers
//
//  Created by Syaoki Biek on 01/06/25.
//

import SwiftUI

//the way modifiers work is each one creates a new struct with that modifier applied, rather than just setting a property on the view. => that is why the order of modifiers matter

struct ModifierOrder: View {
    var body: some View {
        Button("Tap Me!") {
            print(type(of: self.body))
        }
        .background(.red)
        .frame(width: 200, height: 200)
        
        Button("Tap Me!") {
            print(type(of: self.body))
        }
        .frame(width: 200, height: 200)
        .background(.red)
        
        Text("Hello, world!")
            .padding()
            .background(.red)
            .padding()
            .background(.blue)
            .padding()
            .background(.green)
            .padding()
            .background(.yellow)

    }
}

#Preview {
    ModifierOrder()
}
