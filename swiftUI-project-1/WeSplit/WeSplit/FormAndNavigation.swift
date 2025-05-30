//
//  FormAndNavigation.swift
//  WeSplit
//
//  Created by Syaoki Biek on 30/05/25.
//

import SwiftUI

struct FormAndNavigation: View {
    var body: some View {
        NavigationStack {
            Form {  // creating a form
                Section {  // separating from into a section
                    Text("Hello, World!")
                }

                Section {
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                }

                Section {
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                }
            }
            .navigationTitle("SwiftUI")  // add a navigation title
            .navigationBarTitleDisplayMode(.inline)  // to make display smaller and get into the middle top of the view
        }
    }
}

#Preview {
    FormAndNavigation()
}
