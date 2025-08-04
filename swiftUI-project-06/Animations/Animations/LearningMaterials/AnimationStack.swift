//
//  AnimationStack.swift
//  Animations
//
//  Created by Syaoki Biek on 26/06/25.
//

import SwiftUI

struct AnimationStack: View {
    @State private var enabled1: Bool = false
    @State private var enabled2: Bool = false
    @State private var enabled3: Bool = false

    var body: some View {
        VStack(spacing: 30) {
            VStack {
                Button("Tap me") {
                    enabled1.toggle()
                }
                .frame(width: 150, height: 150)
                .background(enabled1 ? .blue : .red)
                .foregroundStyle(.white)
                .clipShape(.rect(cornerRadius: enabled1 ? 60 : 0))
                .animation(.default, value: enabled1)

                Text("Normal Animation")
                    .font(.caption)
            }

            VStack {
                Button("Tap me") {
                    enabled2.toggle()
                }
                .frame(width: 150, height: 150)
                .background(enabled2 ? .blue : .red)
                .foregroundStyle(.white)
                .animation(.default, value: enabled2)
                .clipShape(.rect(cornerRadius: enabled2 ? 60 : 0))
                .animation(.spring(duration: 1, bounce: 0.9), value: enabled2)

                Text("Ordering the Animation using 2 animation modifier")
                    .font(.caption)
            }

            VStack {
                Button("Tap me") {
                    enabled3.toggle()
                }
                .frame(width: 150, height: 150)
                .background(enabled3 ? .blue : .red)
                .foregroundStyle(.white)
                .animation(nil, value: enabled3)
                .clipShape(.rect(cornerRadius: enabled3 ? 60 : 0))
                .animation(.spring(duration: 1, bounce: 0.9), value: enabled3)

                Text("Skip color animation using nil animation modifier")
                    .font(.caption)
            }
        }

    }
}

#Preview {
    AnimationStack()
}
