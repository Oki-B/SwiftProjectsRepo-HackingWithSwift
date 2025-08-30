//
//  NavigationStackReturnToRoot.swift
//  Navigation
//
//  Created by Syaoki Biek on 30/08/25.
//

import SwiftUI

struct RandomView: View {
    var number: Int
//    @Binding var path: [Int]
    // we can also use different approach by reseting path to the very first initiation on the root view
    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Back to root") {
//                    path.removeAll()
                    path = NavigationPath()
                }
            }
    }
}

struct NavigationStackReturnToRoot: View {
//    @State private var path = [Int]()
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            RandomView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    RandomView(number: i, path: $path)
                }
        }
    }
}

#Preview {
    NavigationStackReturnToRoot()
}
