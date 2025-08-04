//
//  TimeConversion.swift
//  Challenge_01
//
//  Created by Syaoki Biek on 31/05/25.
//

import SwiftUI

struct TimeConversion: View {
    @Binding var time: Double
    @State private var selectedUnit: String = "seconds"
    @FocusState private var isFocused: Bool
    @State private var selectedConversionUnit: String = "seconds"

    let units: [String: UnitDuration] = [
        "seconds": .seconds, "minutes": .minutes, "hours": .hours,
    ]

    var valueToConvert: Measurement<UnitDuration> {
        .init(value: time, unit: units[selectedUnit] ?? .seconds)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Input time") {
                    TextField("Time", value: $time, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)

                    Picker("Unit of time", selection: $selectedUnit) {
                        ForEach(units.keys.sorted(), id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)

                }

                Section("Converted Time") {
                    Picker("Unit of time", selection: $selectedConversionUnit) {
                        ForEach(units.keys.sorted(), id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.palette)

                    if let unit = units[selectedConversionUnit] {
                        let convertedValue = valueToConvert.converted(to: unit)
                            .value

                        Text("\(convertedValue.formatted()) \(unit.symbol)")
                    }
                }

            }

            .toolbar {
                if isFocused {
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var time: Double = 0
    TimeConversion(time: $time)
}
