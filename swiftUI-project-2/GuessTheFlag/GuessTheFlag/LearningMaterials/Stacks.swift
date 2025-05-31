//
//  Stacks.swift
//  GuessTheFlag
//
//  Created by Syaoki Biek on 31/05/25.
//

import SwiftUI

struct Stacks: View {
    var body: some View {
        VStack {
            Spacer ()
            VStack(alignment: .leading, spacing: 20) { // create a stack vertically
                Text("Hello, world!")
                Text("This is another text view")
            }
            
            Spacer() // fill the empty space
            HStack (spacing: 20) { // create a stack horizontally
                Text("Hello")
                Text("World")
            }
            Spacer ()
            ZStack(alignment: .top) { // create a stack from back to the front
                Text("Back text")
                Text("Front of the text")
            }
                Spacer()
        }
        .padding()
    }
}

#Preview {
    Stacks()
}
