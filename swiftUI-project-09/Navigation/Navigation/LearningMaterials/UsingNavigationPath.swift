//
//  UsingNavigationPath.swift
//  Navigation
//
//  Created by Syaoki Biek on 30/08/25.
//

import SwiftUI

struct UsingNavigationPath: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) { // binding the path variable
            List {
                ForEach(0..<5) { i in
                    NavigationLink("You are selected: \(i)", value: i)
                }
                ForEach(0..<5) { i in
                    NavigationLink("You are selected: \(i)", value: String(i))
                }
            }
            .toolbar {
                Button("Push number 556") { // we can write the navigation path through appending any value
                    path.append(556)
                }
                Button("Push Hello") {
                    path.append("Hello")
                }
            }
            .navigationDestination(for: Int.self) { selection in
                    Text("You selected number: \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                    Text("You selected string: \(selection)")
            }
        }
    }
}

#Preview {
    UsingNavigationPath()
}
