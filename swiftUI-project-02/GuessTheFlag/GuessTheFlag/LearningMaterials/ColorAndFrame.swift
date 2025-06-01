//
//  ColorAndFrame.swift
//  GuessTheFlag
//
//  Created by Syaoki Biek on 31/05/25.
//

import SwiftUI

struct ColorAndFrame: View {
    var body: some View {
        ZStack {
            Color(red: 1, green: 0.8, blue: 0) // color also can be use using RGB code
            
            VStack {
                ZStack {
                    Color.red
                        .frame(width: 300, height: 200) // frame modifier can be use to control the content size
                    Text("Your content here")
                }
                
                ZStack {
                    Color.indigo
                        .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200) // using minimum and maximum to gain more dynamic control
                    Text("Your content here")
                }
                
                ZStack {
                    Color.secondary // it's a system color can be automatically change in ligth or dark mode
                        .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
                    Text("Your content here")
                }.background(.blue) // background ca be fill with color
            }
        }
        .ignoresSafeArea() // to delete the safe area on the top and bottom screen view
        
    /* try this to see a bit customize style
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            
            Text("Your Content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial) // give some glass effect
        }
        .ignoresSafeArea()
    */
    }
}

#Preview {
    ColorAndFrame()
}
