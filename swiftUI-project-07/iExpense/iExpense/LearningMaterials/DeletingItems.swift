//
//  DeletingItems.swift
//  iExpense
//
//  Created by Syaoki Biek on 04/08/25.
//

import SwiftUI

struct DeletingItems: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .toolbar {  // only works in it wrapped in a navigation stack
                EditButton()
            }
        }
    }

    // create function for deleting items from the list
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

#Preview {
    DeletingItems()
}
