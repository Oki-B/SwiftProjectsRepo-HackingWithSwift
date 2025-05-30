//
//  ContentView.swift
//  WeSplit
//
//  Created by Syaoki Biek on 30/05/25.
//

import SwiftUI

/*
 Challenge :
 1. Add a header to the third section, saying “Amount per person”
 2. Add another section showing the total amount for the check – i.e., the original amount plus tip value, without dividing by the number of people.
 3. Change the tip percentage picker to show a new screen rather than using a segmented control, and give it a wider range of options – everything from 0% to 100%. Tip: use the range 0..<101 for your range rather than a fixed array.
 */

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool  // is a state variable to control the keyboard pad

    let tipPercentages = [10, 15, 20, 25, 0]

    var totalAmount: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandtotal = tipValue + checkAmount

        return grandtotal
    }

    var totalPerPerson: Double {
        // calculate the total per person here
        let poepleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / poepleCount

        return amountPerPerson
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField(
                        "Amount",
                        value: $checkAmount,
                        format: .currency(
                            code: Locale.current.currency?.identifier ?? "SGD"
                        )
                    )  // check the currency of user based in their region settings
                    .keyboardType(.decimalPad)  // .numberPad and .decimalPad tell swiftUI to show the digits 0 through 9 and optionally decimal point
                    .focused($amountIsFocused)  // modifier to control the visibility of keyboardPad

                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2...100, id: \.self) {
                            Text("\($0) poeple")
                        }
                    }
                    .pickerStyle(.navigationLink)  // create a picker in form of navigation link => directing to other view, require navigation stack as a parents
                }

                // create a section for segemented picker
                //                Section("How much would you like to tip?") {
                //                    Picker("Tip percentage", selection: $tipPercentage) {
                //                        ForEach(tipPercentages, id: \.self) {
                //                            Text($0, format: .percent) // format .percent to create a number in a format of percentage
                //                        }
                //                    }
                //                    .pickerStyle(.segmented)
                //                }

                // change the value with calculation of total per person

                // Challenge number 3
                Section("How much would you like to tip?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }

                // challenge number 2
                Section("Total Amount of The Check") {
                    Text(
                        totalAmount,
                        format: .currency(
                            code: Locale.current.currency?.identifier ?? "SGD"
                        )
                    )
                }
                
                Section("Amount Per Person:") {  // challenge number 1
                    Text(
                        totalPerPerson,
                        format: .currency(
                            code: Locale.current.currency?.identifier ?? "SGD"
                        )
                    )
                }
                
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {  // create a toolbar button to change the focus state for control
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
