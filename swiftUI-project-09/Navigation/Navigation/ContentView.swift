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
            .toolbar {
//                ToolbarItem(placement: .confirmationAction) { // using placement to put button in exact location
//                    Button("Tap Me") {
//                        
//                    }
//                }
//                
//                // we can add more button by duplication the same code
//                ToolbarItem(placement: .confirmationAction) { // using placement to put button in exact location
//                    Button("Or Tap Me") {
//                        
//                    }
//                }
                
                // or we can use group to make it in a shorthands code
                ToolbarItemGroup(placement: .cancellationAction) {
                    Button("Group Tap"){}
                    Button("Another Group Tap"){}
                }
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.inline) // customize the display mode of nagiation bar Title
            .toolbarBackground(.blue) // customize it's background color
            .toolbarColorScheme(.dark) // customize how it apperance for the Title text
//            .toolbar(.hidden, for: .navigationBar) // customize if we want to hide the visibility of navigation bar
        }
    }
}

#Preview {
    ContentView()
}
