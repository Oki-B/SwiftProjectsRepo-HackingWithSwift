//
//  AnimatingGesture.swift
//  Animations
//
//  Created by Syaoki Biek on 26/06/25.
//

import SwiftUI

struct AnimatingGesture: View {
    let letters = Array("Hello, SwiftUI!")

    @State private var dragAmount1 = CGSize.zero
    @State private var dragAmount2 = CGSize.zero

    @State private var enabled = false
    @State private var dragAmount3: CGSize = .zero

    var body: some View {
        VStack (spacing: 30){
            Text("Tap and drag each element to see the animation")
                .padding(.top, 40)
            
            LinearGradient(
                colors: [.yellow, .red],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .frame(width: 300, height: 200)
            .clipShape(.rect(cornerRadius: 10))
            .overlay(
                Text("Implicit animation using bouncy effect")
                    .padding(20)
                    .font(.headline)
                    .multilineTextAlignment(.center)
            )
            .offset(dragAmount1)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount1 = $0.translation }
                    .onEnded { _ in dragAmount1 = .zero }
            )
            .animation(.bouncy, value: dragAmount1)

            LinearGradient(
                colors: [.yellow, .red],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .frame(width: 300, height: 200)
            .clipShape(.rect(cornerRadius: 10))
            .overlay(
                Text(
                    "Explicit animation to create bounce effect only at the end"
                )
                .padding(20)
                .font(.headline)
                .multilineTextAlignment(.center)
            )
            .offset(dragAmount2)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount2 = $0.translation }
                    .onEnded { _ in
                        withAnimation(.bouncy) {
                            dragAmount2 = .zero
                        }
                    }
            )

            HStack(spacing: 0) {
                ForEach(0..<letters.count, id: \.self) { num in
                    Text(String(letters[num]))
                        .padding(5)
                        .font(.title)
                        .background(enabled ? .blue : .red)
                        .offset(dragAmount3)
                        .animation(
                            .linear.delay(Double(num) / 20),
                            value: dragAmount3
                        )
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { dragAmount3 = $0.translation }
                    .onEnded { _ in
                        dragAmount3 = .zero
                        enabled.toggle()
                    }
            )
        }
        
        Spacer()
    }
}

#Preview {
    AnimatingGesture()
}
