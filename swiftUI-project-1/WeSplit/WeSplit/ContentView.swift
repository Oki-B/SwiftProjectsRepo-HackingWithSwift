//
//  ContentView.swift
//  WeSplit
//
//  Created by Syaoki Biek on 30/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "SGD")) // check the currencyof user based in their region settings
                        .keyboardType(.decimalPad) // .numberPad and .decimalPad tell swiftUI to show the digits 0 through 9 and optionally decimal point
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2...100, id: \.self) {
                            Text("\($0) poeple")
                        }
                    }
                    .pickerStyle(.navigationLink) // create a picker in form of navigation link => directing to other view, require navigation stack as a parents
                }
                
                Section {
                    Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "SGD"))
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

#Preview {
    ContentView()
}
