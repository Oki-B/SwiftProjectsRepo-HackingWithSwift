//
//  ExplicitAnimation.swift
//  Animations
//
//  Created by Syaoki Biek on 26/06/25.
//

import SwiftUI

struct ExplicitAnimation: View {
    @State private var animationAmount = 0.0

    var body: some View {
        Button("Tap Me") {
            // we can create explisit animation by using withAnimation
            withAnimation(.spring(duration: 1, bounce: 0.5)) { // we can custom animation in withAnimation also
                animationAmount += 360
            }
        }.buttonStyle(.borderedProminent)
            .padding(.bottom, 30)

        HStack {

            VStack {
                Circle()
                    .fill(.red)
                    .frame(width: 80, height: 80)
                    .foregroundStyle(.white)
                    .rotation3DEffect(
                        .degrees(animationAmount),
                        axis: (x: 1, y: 0, z: 0)
                    )
                Text("X axis rotation")
            }
            .frame(width: 120)

            VStack {
                Circle()
                    .fill(.red)
                    .frame(width: 80, height: 80)
                    .foregroundStyle(.white)
                    .rotation3DEffect( // rotation effect to create animation but must be inputed explisit
                        .degrees(animationAmount),
                        axis: (x: 0, y: 1, z: 0)
                    )
                Text("Y axis rotation")
            }
            .frame(width: 120)

            VStack {
                Circle()
                    .fill(.red)
                    .frame(width: 80, height: 80)
                    .foregroundStyle(.white)
                    .overlay(
                        Text("Rotate")
                            .font(.headline)
                            .foregroundColor(.white)
                    )
                    .rotation3DEffect(
                        .degrees(animationAmount),
                        axis: (x: 0, y: 0, z: 1)
                    )

                Text("Z axis rotation")
            }
            .frame(width: 120)

        }

    }
}

#Preview {
    ExplicitAnimation()
}
