//
//  CustomComponentWithBinding.swift
//  Bookworm
//
//  Created by Syaoki Biek on 10/09/25.
//

import SwiftUI

struct pushButton: View {
    let title: String
    @Binding var isOn: Bool // it's to bind the variable from parents and change the variable from this components
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.5)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct CustomComponentWithBinding: View {
    @State private var rememberMe: Bool = false
    
    var body: some View {
        VStack {
            pushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ?
                 "On" :
            "Off")
        }
    }
}

#Preview {
    CustomComponentWithBinding()
}
