//
//  VolumeConversion.swift
//  Challenge_01
//
//  Created by Syaoki Biek on 31/05/25.
//

import SwiftUI

struct VolumeConversion: View {
    @Binding var volume: Double
    @State private var selectedUnit: String = "cups"
    @State private var selectedConversionUnits = "cups"
    @FocusState private var isFocused: Bool
    
    let units: [String: UnitVolume] = ["milliliters": .milliliters, "liters": .liters, "cups": .cups, "pints": .pints, "gallons": .gallons]
    
    private var valueToConvert: Measurement<UnitVolume> {
        .init(value: volume, unit: units[selectedUnit] ?? .cups)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input Volume") {
                    TextField("Volume", value: $volume, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                    
                    Picker("Unit of volume", selection: $selectedUnit) {
                        ForEach(units.keys.sorted(), id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.automatic)
                }
                
                Section("Converted Volume") {
                    Picker("Pick conversion unit", selection: $selectedConversionUnits) {
                        ForEach(units.keys.sorted(), id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    if let unit = units[selectedConversionUnits] {
                        let convertedValue = valueToConvert.converted(to: unit).value
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
    @Previewable @State var volume: Double = 100
    VolumeConversion(volume: $volume)
}
