//
//  TemperatureConversion.swift
//  Challenge_01
//
//  Created by Syaoki Biek on 31/05/25.
//

import SwiftUI

struct TemperatureConversion: View {
    @Binding var temperature: Double
    @State private var selectedUnit = "Celsius"
    @FocusState private var isFocused: Bool
    let units: [String: UnitTemperature] = [
        "Celsius": .celsius, "Fahrenheit": .fahrenheit, "Kelvin": .kelvin,
    ]

    private var valueToConvert: Measurement<UnitTemperature> {
        .init(value: temperature, unit: units[selectedUnit] ?? .celsius)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Input Temperature") {

                    TextField(
                        "Enter temperature",
                        value: $temperature,
                        format: .number
                    )
                    .keyboardType(.decimalPad)
                    .focused($isFocused)

                    Picker("Temperature Unit", selection: $selectedUnit) {
                        ForEach(units.keys.sorted(), id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                }

                Section("Convert result") {
                    ForEach(
                        units.keys.sorted().filter { $0 != selectedUnit },
                        id: \.self
                    ) { key in
                        if let unit = units[key] {
                            let converted = valueToConvert.converted(to: unit)
                            Text(
                                "\(converted.value.formatted()) \(converted.unit.symbol)"
                            )
                        }

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
    @Previewable @State var temperature: Double = 0
    TemperatureConversion(temperature: $temperature)
}
