//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Syaoki Biek on 04/08/25.
//

import SwiftUI
import SwiftData

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Expense.self)
    }
}
