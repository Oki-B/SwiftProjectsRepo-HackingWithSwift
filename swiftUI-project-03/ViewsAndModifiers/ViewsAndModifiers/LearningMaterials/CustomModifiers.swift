//
//  CustomModifiers.swift
//  ViewsAndModifiers
//
//  Created by Syaoki Biek on 03/06/25.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .center) {
            content
            Text(text)
                .font(.title2)
                .foregroundColor(.white)
                .padding()
                .rotationEffect(.degrees(-20))
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct CustomModifiers: View {
    var body: some View {
        Text( /*@START_MENU_TOKEN@*/"Hello, World!" /*@END_MENU_TOKEN@*/)
            .titleStyle()

        Text("Hello, World!")
            .modifier(Title())
        
        Color.blue
            .frame(width: 300, height: 200)
            .watermarked(with: "This is watermarked")
    }
}

#Preview {
    CustomModifiers()
}
