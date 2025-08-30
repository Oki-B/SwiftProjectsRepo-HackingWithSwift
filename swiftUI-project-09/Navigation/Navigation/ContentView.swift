//
//  ContentView.swift
//  Navigation
//
//  Created by Syaoki Biek on 29/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.inline) // customize the display mode of nagiation bar Title
            .toolbarBackground(.blue) // customize it's background color
            .toolbarColorScheme(.dark) // customize how it apperance for the Title text
            .toolbar(.hidden, for: .navigationBar) // customize if we want to hide the visibility of navigation bar
        }
    }
}

#Preview {
    ContentView()
}
