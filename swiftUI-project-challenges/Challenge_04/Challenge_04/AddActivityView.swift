//
//  AddActivityView.swift
//  Challenge_04
//
//  Created by Syaoki Biek on 06/09/25.
//

import SwiftUI

struct AddActivityView: View {
    @State private var name = ""
    @State private var description = ""
    
    var activities: Activities
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Activity Name", text: $name)
                TextField("Description", text: $description, axis: .vertical)
                    .lineLimit(5, reservesSpace: true)

                
                
            }
            .navigationTitle("Add new activity")
            .toolbar {
                Button("Save") {
                    let newActivity = Activity(title: name, description: description)
                    activities.items.append(newActivity)
                    dismiss()
                }
            }
        }

    }
}

#Preview {
    AddActivityView(activities: Activities())
}
