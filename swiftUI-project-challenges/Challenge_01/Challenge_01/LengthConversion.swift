//
//  LengthConversion.swift
//  Challenge_01
//
//  Created by Syaoki Biek on 31/05/25.
//

import SwiftUI

struct LengthConversion: View {
    @Binding var length: Double
    @State private var selectedUnit: String = "feet"
    @State private var selectedConversionUnit: String = "feet"
    @FocusState private var isFocused: Bool

    let units: [String: UnitLength] = [
        "meters": .meters, "kilometers": .kilometers, "feet": .feet,
        "yards": .yards, "miles": .miles,
    ]

    private var valueToConvert: Measurement<UnitLength> {
        .init(value: length, unit: units[selectedUnit] ?? .meters)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Input Length") {
                    TextField("Length", value: $length, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)

                    Picker("Unit of length", selection: $selectedUnit) {
                        ForEach(units.keys.sorted(), id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }

                Section("Converted Length") {
                    Picker("Unit Length", selection: $selectedConversionUnit) {
                        ForEach(units.keys.sorted(), id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    if let unit = units[selectedConversionUnit] {
                        let convertedValue = valueToConvert.converted(to: unit)
                            .value
                        Text(
                            "\(convertedValue.formatted()) \(unit.symbol)"
                        )
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
    @Previewable @State var length: Double = 0
    LengthConversion(length: $length)
}
