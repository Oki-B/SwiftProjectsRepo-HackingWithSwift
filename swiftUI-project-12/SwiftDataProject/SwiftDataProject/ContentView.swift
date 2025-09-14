//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Syaoki Biek on 14/09/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(
        filter: #Predicate<User> { user in

            //  user.name.localizedStandardContains("O") && user.city == "Tokyo"

            // this also can works this way
            if user.name.localizedStandardContains("O") {
                if user.city == "Tokyo" {
                    return true
                } else {
                    return false
                }
            } else {
                return false
            }
        },
        sort: \User.name
    ) var users: [User]

    var body: some View {
        NavigationStack {
            List(users) { user in
                Text(user.name)
            }
            .navigationTitle("Users")
            .toolbar {
                Button("Add Samples", systemImage: "plus") {
                    try? modelContext.delete(model: User.self)

                    let first = User(
                        name: "Tarjo",
                        city: "London",
                        joinDate: .now.addingTimeInterval(86400 * -10)
                    )
                    let second = User(
                        name: "Paijo",
                        city: "Tokyo",
                        joinDate: .now.addingTimeInterval(86400 * -5)
                    )
                    let third = User(
                        name: "Oggah",
                        city: "Osaka",
                        joinDate: .now.addingTimeInterval(86400 * 5)
                    )
                    let fourth = User(
                        name: "Kai",
                        city: "New York",
                        joinDate: .now.addingTimeInterval(86400 * 10)
                    )

                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)

                }
            }
        }
    }
}

#Preview {
    ContentView()
}
