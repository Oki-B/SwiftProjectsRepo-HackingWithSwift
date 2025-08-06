//
//  ContentView.swift
//  iExpense
//
//  Created by Syaoki Biek on 04/08/25.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

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

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }

    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode(
                [ExpenseItem].self,
                from: savedItems
            ) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}

struct ContentView: View {
    @State private var expenses = Expenses()

    @State private var showingAddExpenseView = false

    @State private var currency =
        UserDefaults.standard.string(forKey: "currency") ?? "USD"

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

            List {
                // using protocol Identifiable make us do not need wrote id parameter anymore it will automatically get id with type of UUID
                
                // Wrap-up challenge 3 -> For a bigger challenge, try splitting the expenses list into two sections: one for personal expenses, and one for business expenses. This is tricky for a few reasons, not least because it means being careful about how items are deleted!

                Section("Personal Expenses") {
                    if expenses.items.contains(where: { $0.type == "Personal" }) {
                        ForEach(expenses.items) { item in
                            if item.type == "Personal" {
                                HStack {

                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(.headline)
                                        Text(item.type)
                                    }
                                    Spacer()
                                    Text(
                                        item.amount,
                                        format: .currency(code: currency)
                                    )
                                    .amountModifier(item.amount)
                                }
                            }
                        }
                        .onDelete(perform: removeItems)
                    } else {
                        Text("No personal expenses yet")
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
                
                Section("Business Expenses") {
                    if expenses.items.contains(where: { $0.type == "Business" }) {
                        ForEach(expenses.items) { item in
                            if item.type == "Business" {
                                HStack {

                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(.headline)
                                        Text(item.type)
                                    }
                                    Spacer()
                                    Text(
                                        item.amount,
                                        format: .currency(code: currency)
                                    )
                                    .amountModifier(item.amount)
                                }
                            }
                        }
                        .onDelete(perform: removeItems)
                    } else {
                        Text("No Business expenses yet")
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }

            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpenseView = true
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

    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }

}

#Preview {
    ContentView()
}
