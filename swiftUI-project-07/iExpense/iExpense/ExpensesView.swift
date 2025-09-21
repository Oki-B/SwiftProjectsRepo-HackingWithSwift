//
//  ExpensesView.swift
//  iExpense
//
//  Created by Syaoki Biek on 15/09/25.
//

import SwiftData
import SwiftUI

struct ExpensesView: View {
    @Query var expenses: [Expense]
    @Environment(\.modelContext) var modelContext
    let currency: String

    var body: some View {
        List {
            // using protocol Identifiable make us do not need wrote id parameter anymore it will automatically get id with type of UUID

            // Wrap-up challenge 3 -> For a bigger challenge, try splitting the expenses list into two sections: one for personal expenses, and one for business expenses. This is tricky for a few reasons, not least because it means being careful about how items are deleted!

            if !expenses.isEmpty {
                if expenses.contains(where: { $0.type == "Personal" }) {
                    Section("Personal Expenses") {

                        ForEach(expenses) { item in
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
                    }
                }

                if expenses.contains(where: { $0.type == "Business" }) {
                    Section("Business Expenses") {

                        ForEach(expenses) { item in
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
                    }
                }
            } else {
                Text("No personal expenses yet")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

        }
    }

    init(sortOrder: [SortDescriptor<Expense>], currency: String, type: String) {
        if type.isEmpty {
            // Tanpa filter → ambil semua Expense
            _expenses = Query(sort: sortOrder)
        } else {
            // Dengan filter berdasarkan type
            _expenses = Query(
                filter: #Predicate<Expense> { expense in
                    expense.type == type
                },
                sort: sortOrder
            )
        }
        self.currency = currency
    }

    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            let expense = expenses[offset]
            modelContext.delete(expense)

        }
    }
}

#Preview {
    ExpensesView(
        sortOrder: [SortDescriptor(\Expense.name)],
        currency: "USD",
        type: "Personal"
    )
}
