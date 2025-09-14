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
//    @Query(
//        filter: #Predicate<User> { user in
//
//            //  user.name.localizedStandardContains("O") && user.city == "Tokyo"
//
//            // this also can works this way
//            if user.name.localizedStandardContains("O") {
//                if user.city == "Tokyo" {
//                    return true
//                } else {
//                    return false
//                }
//            } else {
//                return false
//            }
//        },
//        sort: \User.name
//    ) var users: [User]
    
    @State private var showingUpcomingOnly: Bool = false
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]

    var body: some View {
        NavigationStack {
            UsersView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast, sortOrder: sortOrder)
            .navigationTitle("Users")
            .toolbar {
                Button("Add Samples", systemImage: "plus") {
                    try? modelContext.delete(model: User.self)

                    let first = User(
                        name: "Paijo",
                        city: "London",
                        joinDate: .now.addingTimeInterval(86400 * -10)
                    )
                    let second = User(
                        name: "Oggah",
                        city: "Tokyo",
                        joinDate: .now.addingTimeInterval(86400 * -5)
                    )
                    let third = User(
                        name: "Kai",
                        city: "Osaka",
                        joinDate: .now.addingTimeInterval(86400 * 5)
                    )
                    let fourth = User(
                        name: "Tarjo",
                        city: "New York",
                        joinDate: .now.addingTimeInterval(86400 * 10)
                    )

                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)

                }
                
                Button(showingUpcomingOnly ? "Show Everyone" : "Show Upcoming") {
                    showingUpcomingOnly.toggle()
                }
                
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\User.name),
                                SortDescriptor(\User.joinDate)
                            ])
                        
                        Text("Sort by Join Date")
                            .tag([
                                SortDescriptor(\User.joinDate),
                                SortDescriptor(\User.name)
                            ])
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
