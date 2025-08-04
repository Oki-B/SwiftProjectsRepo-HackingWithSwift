//
//  CustomTransitionModifier.swift
//  Animations
//
//  Created by Syaoki Biek on 27/06/25.
//

import SwiftUI

// creating animation modifier
struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            // we use clip to cut some visual for animation
            .clipped()  // try to command this to see why use clipped
    }
}

// we create extension to specificly assign the modifier
extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
    
    static var reversePivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: 90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}


struct CustomTransitionModifier: View {
    @State private var isShowingRect = false
    var body: some View {
        ZStack {
            if !isShowingRect {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .reversePivot, removal: .reversePivot))
            }

            
            if isShowingRect {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .pivot, removal: .pivot))
            }
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.5)) {
                isShowingRect.toggle()
            }
        }
    }
}

#Preview {
    CustomTransitionModifier()
}
