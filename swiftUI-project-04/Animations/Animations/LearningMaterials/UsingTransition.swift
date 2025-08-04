//
//  UsingTransition.swift
//  Animations
//
//  Created by Syaoki Biek on 27/06/25.
//

import SwiftUI

struct UsingTransition: View {
    @State private var isShowingRectangle: Bool = false

    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRectangle.toggle()
                }
            }
            .buttonStyle(.borderedProminent)

            if isShowingRectangle {

                Rectangle()
                    .fill(.red)
                    .frame(width: 100, height: 100)
                    .padding(.top, 20)
                    .transition(.scale)  // using transition for animation

                Text("scale transition")
                    .transition(.scale)
                    .padding(.bottom, 30)
                
                Rectangle()
                    .fill(.red)
                    .frame(width: 100, height: 100)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity)) // using asymetric to create different transtion on start and end animation

                Text("asymetric transition start with scale and end with opacity")
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

#Preview {
    UsingTransition()
}
