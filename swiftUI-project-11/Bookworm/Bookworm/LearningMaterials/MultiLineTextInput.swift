//
//  MultiLineTextInput.swift
//  Bookworm
//
//  Created by Syaoki Biek on 10/09/25.
//

import SwiftUI

struct MultiLineTextInput: View {
    // @AppStorage works like a userDefaults it's works for SwiftUI and can be utilize to store simple information or simple persistance
    @AppStorage("notes") private var notes = ""
    @AppStorage("notesHorizontal") private var notesHorizontal = ""
    @AppStorage("notesVertical") private var notesVertical = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextEditor(text: $notes)
                
                TextField("Enter your text here", text: $notesHorizontal, axis: .horizontal)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Enter your text here", text: $notesVertical, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
            }
            .navigationBarTitle("Notes")
            .padding()
        }
    }
}

#Preview {
    MultiLineTextInput()
}
