//
//  ScrollingGrid.swift
//  Moonshot
//
//  Created by Syaoki Biek on 09/08/25.
//

import SwiftUI

struct ScrollingGrid: View {
    // Grid fixed size
    let layout = [
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
    ]

    // Grid adaptive size
    let adaptiveLayout = [
        GridItem(.adaptive(minimum: 80))
    ]

    // adaptive grid can make sure it content adaptive align with the screen orientation as example
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: adaptiveLayout) {
                ForEach(0..<100) {
                    Text("Item \($0)")
                }
            }
        }

        ScrollView {
            VStack {
                LazyVGrid(columns: layout) {
                    ForEach(0..<100) {
                        Text("Item \($0)")
                    }
                }

                LazyVGrid(columns: adaptiveLayout) {
                    ForEach(0..<100) {
                        Text("Item \($0)")
                    }
                }
            }

        }
    }
}

#Preview {
    ScrollingGrid()
}
