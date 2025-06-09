//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Syaoki Biek on 01/06/25.
//

/*
 Challenge :
 - Create a custom ViewModifier (and accompanying View extension) that makes a view have a large, blue font suitable for prominent titles in a view.
 */

import SwiftUI

struct ProminentTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.blue)
    }
}

extension View {
    func promintentTitleStyle() -> some View {
        modifier(ProminentTitle())
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.white)
            Text("Hello, world!")
                .modifier(ProminentTitle())
            Text("Text above styled using ProminentTitle modifier")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(.red)
    }
}

#Preview {
    ContentView()
}
