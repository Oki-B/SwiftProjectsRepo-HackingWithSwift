//
//  BindingState.swift
//  WeSplit
//
//  Created by Syaoki Biek on 30/05/25.
//

import SwiftUI

struct BindingState: View {
    @State private var name: String = ""
    
    var body: some View {
        Form {
            TextField("Enter your name", text: $name) // marking the value with $ => tell Swift that it should read the value of the property but also write it back as any changes happen. == Two-Way Binding
            Text("Your name is \(name).")
        }
    }
}

#Preview {
    BindingState()
}
