//
//  ImplicitAnimation.swift
//  Animations
//
//  Created by Syaoki Biek on 26/06/25.
//

import SwiftUI

struct ImplicitAnimation: View {
    // create a value for a state of animation
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount) // scaleEffect can be used to change the scale of the object by giving the specific value
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.default, value: animationAmount) // using animation modifier like this called implicit animation
    }
}

#Preview {
    ImplicitAnimation()
}
