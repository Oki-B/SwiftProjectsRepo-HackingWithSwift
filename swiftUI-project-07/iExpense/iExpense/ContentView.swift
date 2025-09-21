//
//  ContentView.swift
//  iExpense
//
//  Created by Syaoki Biek on 04/08/25.
//

import SwiftUI
import SwiftData

// Wrap-up Challenge 2 -> Modify the expense amounts in ContentView to contain some styling depending on their value – expenses under $10 should have one style, expenses under $100 another, and expenses over $100 a third style. What those styles are depend on you.
extension View {
    func amountModifier(_ amount: Double) -> some View {
        if amount < 10 {
            self.foregroundStyle(.green)
        } else if amount < 100 {
            self.foregroundStyle(.blue)
        } else {
            self.foregroundStyle(.red)
        }
    }
}

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [Expense]


    @State private var showingAddExpenseView = false
    @State private var currency =
        UserDefaults.standard.string(forKey: "currency") ?? "USD"
    @State private var sortOrder = [
        SortDescriptor(\Expense.name)
    ]
    @State private var filter = ""

    var body: some View {
        NavigationStack {
            // wrap-up challenge 1 -> Use the user’s preferred currency, rather than always using US dollars.
            Picker("Currency", selection: $currency) {
                Text("USD").tag("USD")
                Text("EUR").tag("EUR")
                Text("JPY").tag("JPY")
            }
            .pickerStyle(.segmented)
            .padding()

            ExpensesView(sortOrder: sortOrder, currency: currency, type: filter)
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpenseView = true
                }
                
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by Name")
                            .tag([SortDescriptor(\Expense.name)])
                        
                        Text("Sort by Amount")
                            .tag([SortDescriptor(\Expense.amount)])
                    }
                }
                
                Menu("Filter", systemImage: "line.3.horizontal.decrease.circle") {
                    Picker("Filter", selection: $filter) {
                        Text("All")
                            .tag("")
                        
                        Text("Business")
                            .tag("Business")
                        
                        Text("Personal")
                            .tag("Personal")
                    }
                }
            }
            .sheet(isPresented: $showingAddExpenseView) {
                AddView(currencyCode: currency, expenses: expenses)
            }
            .onChange(of: currency) {
                UserDefaults.standard.set(currency, forKey: "currency")
            }
        }
    }

}

#Preview {
    ContentView()
}
