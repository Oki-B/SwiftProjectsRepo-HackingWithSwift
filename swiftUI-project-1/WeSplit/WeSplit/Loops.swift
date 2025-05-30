//
//  Loops.swift
//  WeSplit
//
//  Created by Syaoki Biek on 30/05/25.
//

import SwiftUI

struct Loops: View {
    let students = ["Harry", "Ron", "Hermione"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    // to create a loop in swiftUI use ForEach
                    ForEach(students, id: \.self) { // \.self part is a something that made each of array items unique to make SwiftUI be able to identified each items. it can be ID, or the value property, but since the value in this case is an array, we can use .self for that.
                        Text($0)
                    }
                }
            }
            .navigationTitle("Select a Student")
        }
    }
}

#Preview {
    Loops()
}
