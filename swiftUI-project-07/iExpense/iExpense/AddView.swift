//
//  AddView.swift
//  iExpense
//
//  Created by Syaoki Biek on 05/08/25.
//

import SwiftUI
import SwiftData

struct AddView: View {
    @Environment(\.modelContext) var modelContext
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount: Double = 0.0
    var currencyCode: String
    
    @Environment(\.dismiss) var dismiss
    
    var expenses: [Expense]
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: currencyCode))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add Expense")
            .toolbar {
                Button("Save") {
                    let item = Expense(name: name, type: type, amount: amount)
                    modelContext.insert(item)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Expense.self, configurations: config)
        let expenses = [Expense]()
        
        return AddView(currencyCode: "USD", expenses: expenses)
            .modelContainer(container)
    } catch {
        return Text("Error loading preview data: \(error.localizedDescription)")
    }
    
}
