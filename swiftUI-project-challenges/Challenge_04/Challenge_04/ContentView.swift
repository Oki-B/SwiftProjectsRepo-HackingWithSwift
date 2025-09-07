//
//  ContentView.swift
//  Challenge_04
//
//  Created by Syaoki Biek on 06/09/25.
//

import SwiftUI

struct ContentView: View {
    @State private var activities = Activities()
    @State private var showAddActivityView: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                if activities.items.isEmpty {
                    VStack(spacing: 8) {
                        Image(systemName: "text.page.slash.fill")
                            .font(.system(size: 72))
                            .foregroundStyle(.secondary)
                        
                        Text("No activities yet!")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                    }

                } else {
                    List {
                        Section("Activit List") {
                            ForEach(activities.items) { activity in
                                NavigationLink(
                                    activity.title,
                                    destination: DetailView(
                                        activities: activities,
                                        activity: activity
                                    )
                                )
                            }
                        }
                    }
                }

            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Activity") {
                        showAddActivityView.toggle()
                    }
                    .padding(.trailing)
                }
            }
            .sheet(isPresented: $showAddActivityView) {
                AddActivityView(activities: activities)
            }
        }
    }

}

#Preview {
    ContentView()
}
