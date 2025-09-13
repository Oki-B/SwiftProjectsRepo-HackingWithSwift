//
//  IntroToSwiftData.swift
//  Bookworm
//
//  Created by Syaoki Biek on 13/09/25.
//

import SwiftUI
import SwiftData
// third is we can use it by called it using Query in the swiftUI file

struct IntroToSwiftData: View {
    @Environment(\.modelContext) var modelContext // model context use for storing data into the SwiftData storage
    @Query var students: [Student] // it's for called the data
    
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationBarTitle("Classroom")
            .toolbar {
                Button("Add") {
                    let firstName = ["Ginny", "Harry",
                    "Hermonie", "Luna", "Ron"]
                    let lastName = ["Weasley", "Potter",
                                    "Granger", "Lovegood", "Weasley"]
                    let chosenFirstName = firstName.randomElement()!
                    let chosenLastName = lastName.randomElement()!
                    
                    let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    
                    modelContext.insert(student)
                }
            }
        }
    }
}

#Preview {
    IntroToSwiftData()
}
