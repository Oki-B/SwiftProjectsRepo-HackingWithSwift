//
//  ViewsAsProperties.swift
//  ViewsAndModifiers
//
//  Created by Syaoki Biek on 01/06/25.
//

import SwiftUI

struct ViewsAsProperties: View {
    // we could create tow text views like this as properties, then use them inside a VStack:
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    // the problem doing code above is that swift doesn’t let us create one stored property that refers to other stored properties, because it would cause problems when the object is create
    
    // we can create computed properties like this:
    var motto3: some View {
        Text("Draco dormiens")
            .foregroundStyle(.red)
//        Text("nunquam titillandus") -> unlike the body property, Swift won’t automatically apply the @ViewBuilder attribute here
    }
    
    // to do it we have several option to send back multiple view
    var spells: some View {
        VStack { // we can either wrap it up using a stack
            Text("Expelliarmus")
            Text("Protego Maxima")
        }
    }
    
    var spells2: some View {
        Group { // or we can use group, When this happens, the arrangement of your views is determined by how you use them elsewhere in your code:
            Text("Lumos")
            Text("Accio")
        }
    }
    
    // last options is by add attribute @ViewBuilder
    @ViewBuilder var spells3: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    var body: some View {
        VStack(spacing: 30) {
            motto1
                .foregroundStyle(.red) // we can even apply modifiers
            motto2
                .foregroundStyle(.green)
            motto3
            spells
            spells2
            spells3
        } // doing this can helpful to keep body code clearer
    }
}

#Preview {
    ViewsAsProperties()
}
