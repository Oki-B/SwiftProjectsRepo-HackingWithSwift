//
//  SimpleNavigationLink.swift
//  Navigation
//
//  Created by Syaoki Biek on 29/08/25.
//

import SwiftUI

struct DetailView: View {
    var number : Int
    
    var body: some View {
       Text("Detail View \(number)")
    }
    
    init(number: Int) {
        self.number = number
//        print("Creating detai view for \(number)")
    }
}

// using NavigationLink with dynamic var could create some issue, we can look at it in the debug area
struct SimpleNavigationLink: View {

    var body: some View {
        NavigationStack {
            List(0..<1000) { i in
                NavigationLink("Tap Me") {
                    DetailView(number: i)
                }
            }
        }
    }
}

#Preview {
    SimpleNavigationLink()
}
