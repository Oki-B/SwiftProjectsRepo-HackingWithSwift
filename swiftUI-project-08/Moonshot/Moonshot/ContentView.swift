//
//  ContentView.swift
//  Moonshot
//
//  Created by Syaoki Biek on 06/08/25.
//

import SwiftUI

struct ContentView: View {
    //    let astronauts = Bundle.main.decode("astronauts.json")
    // while using generic function we need to define the type annotation
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    @State private var isGridLayout = true

    var body: some View {
        NavigationStack {
            // Moonshot: Wrap up challenge 3
            Group {
                if isGridLayout {
                    GridLayout(astronauts: astronauts, missions: missions)
                } else {
                    ListLayout(astronauts: astronauts, missions: missions)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isGridLayout.toggle()
                    } label: {
                        Image(systemName: "\(isGridLayout ? "rectangle.grid.1x2" : "square.grid.2x2")")
                            .foregroundStyle(.white)
                    }

                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
