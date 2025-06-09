//
//  ButtonsAndImages.swift
//  GuessTheFlag
//
//  Created by Syaoki Biek on 01/06/25.
//

import SwiftUI

struct ButtonsAndImages: View {
    var body: some View {

        VStack(spacing: 20) {

            Button("Delete selection", action: executeDelete)
            Button("Button 1") {}
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive) {}
                .buttonStyle(.bordered)
            Button("Button 3") {}
                .buttonStyle(.borderedProminent)
            Button("Button 4", role: .destructive) {}
                .buttonStyle(.borderedProminent)
            Button("Button 5") {}
                .buttonStyle(.borderedProminent)
                .tint(.indigo)

            // customize you own button style
            Button {
                print("Button was tapped!")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }

            // using button with image
            Button("Edit", systemImage: "pencil") {}  // can be writen like this

            //can be customize like this
            Button {
            } label: {
                HStack {
                    Image(systemName: "pencil")
                    Text("Edit")
                }
                .padding()
                .foregroundStyle(.white)
                .background(.indigo)
            }

            // or can be used Label components on label as is better practice
            Button {
                print("Button Image was tapped!")
            } label: {
                Label("Edit", systemImage: "pencil")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.blue)
            }
        }
    }

    func executeDelete() {
        print("Now deleting...")
    }
}

#Preview {
    ButtonsAndImages()
}
