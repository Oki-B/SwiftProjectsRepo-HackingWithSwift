//
//  ExpensesView.swift
//  iExpense
//
//  Created by Syaoki Biek on 15/09/25.
//

import SwiftUI
import SwiftData

struct ExpensesView: View {
    @Query var expenses: [Expense]
    @Environment(\.modelContext) var modelContext
    let currency: String
    
    var body: some View {
        List {
            // using protocol Identifiable make us do not need wrote id parameter anymore it will automatically get id with type of UUID
            
            // Wrap-up challenge 3 -> For a bigger challenge, try splitting the expenses list into two sections: one for personal expenses, and one for business expenses. This is tricky for a few reasons, not least because it means being careful about how items are deleted!

            Section("Personal Expenses") {
                if expenses.contains(where: { $0.type == "Personal" }) {
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
                } else {
                    Text("No personal expenses yet")
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            
            Section("Business Expenses") {
                if expenses.contains(where: { $0.type == "Business" }) {
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
                } else {
                    Text("No Business expenses yet")
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }

        }
    }
    
    init(sortOrder: [SortDescriptor<Expense>], currency: String) {
        _expenses = Query(sort: sortOrder)
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
    ExpensesView(sortOrder: [SortDescriptor(\Expense.name)], currency: "USD")
}
