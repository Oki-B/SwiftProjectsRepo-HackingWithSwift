//
//  PushingViews.swift
//  Moonshot
//
//  Created by Syaoki Biek on 08/08/25.
//

import SwiftUI

struct PushingViews: View {
    var body: some View {
        NavigationStack {
            NavigationLink { // used to navigate to other view
                Text("Tap me")
            } label: {
                VStack {
                    Text("This is the label")
                    Text("new syntax required label for navigationLink")
                    Image(systemName: "face.smiling")
                }
            }
            .navigationTitle("SwiftUI")
            
            List {
                ForEach(0..<100) { row in
                    NavigationLink { // commonly used on list to navigate to the view that show details of each items
                        Text("Detail \(row)")
                    } label: {
                        Text("Item \(row)")
                    }
                }
            }
        }

    }
}

#Preview {
    PushingViews()
}
