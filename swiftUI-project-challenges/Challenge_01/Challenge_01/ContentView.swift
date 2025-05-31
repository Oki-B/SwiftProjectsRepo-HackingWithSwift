//
//  ContentView.swift
//  Challenge_01
//
//  Created by Syaoki Biek on 30/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber: Double = 0
    
    var body: some View {
        TabView {
            Tab("Temperature", systemImage:
                    "thermometer.variable") {
                TemperatureConversion(temperature: $inputNumber)
            }
            
            Tab("Length", systemImage: "lines.measurement.horizontal") {
                LengthConversion(length: $inputNumber)
            }
            
            Tab("Time", systemImage: "clock") {
                TimeConversion(time: $inputNumber)
            }
            
            Tab("Volume", systemImage: "cube.transparent") {
                VolumeConversion(volume: $inputNumber)
            }
        }
    }
}

#Preview {
    ContentView()
}
