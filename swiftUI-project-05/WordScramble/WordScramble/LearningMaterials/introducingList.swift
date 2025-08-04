//
//  introducingList.swift
//  WordScramble
//
//  Created by Syaoki Biek on 25/06/25.
//

import SwiftUI

struct introducingList: View {
    let people = ["Alice", "Bob", "Charlie", "David", "Eve"]
    
    var body: some View {
        List {
            Section("Section 1") {
                Text("Static Row 1")
                Text("Static Row 2")
                Text("Static Row 3")
            }
            
            Section("Section 2") {
                ForEach(0..<3) {
                    (Text("Dynamic Row \($0 + 1)"))
                }
            }
            
            Section("Section 3") {
                Text("Static Row 4")
                Text("Static Row 5")
            }
        }
        .listStyle(.grouped)
        
        // shorthands if we want to create a list without section from array or with loop
        List(0..<5) {
            Text("Dynamic Row \($0)")
        }
        
        List(people, id: \.self) { // when we want to use array we need id to make each element could be identified
            Text($0)
        }
        
    }
}

#Preview {
    introducingList()
}
