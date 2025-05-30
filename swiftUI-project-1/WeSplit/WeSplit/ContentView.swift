//
//  ContentView.swift
//  WeSplit
//
//  Created by Syaoki Biek on 30/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Form { // creating a form
            Section { // separating from into a section
                Text("Hello, World!")
            }
            
            Section {
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
            }
            
            Section {
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
            }
        }
    }
}

#Preview {
    ContentView()
}
