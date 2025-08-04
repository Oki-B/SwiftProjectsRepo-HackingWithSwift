//
//  ContentView.swift
//  Animations
//
//  Created by Syaoki Biek on 26/06/25.
//

import SwiftUI


struct ContentView: View {
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
    ContentView()
}
