//
//  AnimatingBindings.swift
//  Animations
//
//  Created by Syaoki Biek on 26/06/25.
//

import SwiftUI

struct AnimatingBindings: View {
    @State private var animationAmount = 1.0

    var body: some View {
        print(animationAmount)
        
        return VStack {
            Stepper("Scale amount", value: $animationAmount.animation( // by using binding we dont need to specifty which value we're watching for changes
                .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
        }

    }
}

#Preview {
    AnimatingBindings()
}
