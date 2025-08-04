//
//  EnvirontmentModifiers.swift
//  ViewsAndModifiers
//
//  Created by Syaoki Biek on 01/06/25.
//

import SwiftUI

struct EnvirontmentModifiers: View {
    var body: some View {
        
        VStack(spacing: 30) {
            VStack {
                Text("Gryffindor")
                    .font(.largeTitle) // it's called regular modifier where that is apply directly to one view.
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .font(.title) // it's called environtment modifier where it's allow us to apply the same modifier to many views at the same time
            
            // However, they behave subtly differently because if any of those child views override the same modifier, the child’s version takes priority as example .largeTitle is override the .title on code above
            
            // However, certain modifier has some behaviour that not allow child to override their parents, as example is a blur()
            VStack {
                Text("Gryffindor")
                    .blur(radius: 0) // this code did not had any effect to the environtment modifier
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .blur(radius: 5)
        }

        
    }
}

#Preview {
    EnvirontmentModifiers()
}
