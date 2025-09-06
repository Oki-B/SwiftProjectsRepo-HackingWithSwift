//
//  Activity.swift
//  Challenge_04
//
//  Created by Syaoki Biek on 06/09/25.
//

import Foundation

struct Activity: Codable, Identifiable {
    var id = UUID()
    let title: String
    let description: String
    var completionData: [Date] = []

    var numberOfCompletion: Int {
        completionData.count
    }

    func formattedCompletionDates(date: Date) -> (date: String, time: String) {
        // Date only
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium  // or .short / .long / .full
        dateFormatter.timeStyle = .none
        let dateString = dateFormatter.string(from: date)

        // Time only
        let timeFormatter = DateFormatter()
        timeFormatter.dateStyle = .none
        timeFormatter.timeStyle = .short  // or .medium / .long
        let timeString = timeFormatter.string(from: date)

        return (date: dateString, time: timeString)
    }

}

@Observable
class Activities {
    var items = [Activity]() {
        didSet {
            save()
        }
    }

    init() {
        load()
    }

    private func save() {
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: "Activities")
        }
    }

    private func load() {
        if let savedItems = UserDefaults.standard.data(forKey: "Activities") {
            if let decodedItems = try? JSONDecoder().decode(
                [Activity].self,
                from: savedItems
            ) {
                self.items = decodedItems
                return
            }
        }
        items = []
    }

    func addCompletion(for activity: Activity, date: Date) {
        if let index = items.firstIndex(where: { $0.id == activity.id }) {
            items[index].completionData.append(date)
        }
    }
}
