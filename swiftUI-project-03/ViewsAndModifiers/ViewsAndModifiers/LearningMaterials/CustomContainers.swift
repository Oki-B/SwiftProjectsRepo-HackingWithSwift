//
//  CustomContainers.swift
//  ViewsAndModifiers
//
//  Created by Syaoki Biek on 04/06/25.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content // using protocol ViewBuilder so we dont need to implisitly create HStack in the content body when we use this stack
    
    var body: some View {
        ForEach(0..<rows, id: \.self) { row in
            HStack {
                ForEach(0..<self.columns, id: \.self) { column in
                    self.content(row, column)
                }
            }
        }
    }
}

struct CustomContainers: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
//            HStack {
                Image (systemName: "\(row * 4 + col).circle")
                Text("R\(row), C\(col)")
//            }
        }
    }
}

#Preview {
    CustomContainers()
}
