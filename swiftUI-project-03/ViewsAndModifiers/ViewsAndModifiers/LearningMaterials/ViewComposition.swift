//
//  ViewComposition.swift
//  ViewsAndModifiers
//
//  Created by Syaoki Biek on 01/06/25.
//

import SwiftUI

// if we have same identical modifier as example apart form their content,  we can wrap them ip in a new custom view, and use it to make our original view more clear, like this as example :
struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
//            .foregroundStyle(.white) // if we want to have different text color we can delete this code and custome it in original view
            .background(.blue)
            .clipShape(.capsule)
    }
}

struct ViewComposition: View {
    var body: some View {
        VStack(spacing: 30) {
            // instead of copy it and make our original view full with code
            VStack(spacing: 30) {
                Text("First")
                    .font(.largeTitle)
                    .padding()
                    .foregroundStyle(.white)
                    .background(.blue)
                    .clipShape(.capsule)
                
                Text("Second")
                    .font(.largeTitle)
                    .padding()
                    .foregroundStyle(.white)
                    .background(.blue)
                    .clipShape(.capsule)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // we can use it like this:
            VStack(spacing: 30) {
                CapsuleText(text: "First")
                    .foregroundStyle(.white) // as example
                CapsuleText(text: "Second")
                    .foregroundStyle(.yellow) // we still can make it customizeable
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.secondary)

        }
    }
}

#Preview {
    ViewComposition()
}
