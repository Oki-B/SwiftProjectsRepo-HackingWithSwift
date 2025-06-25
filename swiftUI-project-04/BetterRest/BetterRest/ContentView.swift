//
//  ContentView.swift
//  BetterRest
//
//  Created by Syaoki Biek on 09/06/25.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    // create commputed property for default wake time
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            Form { // using form to create a better view for input
                VStack(alignment: .leading, spacing: 0) {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    // input for wake Up time
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Desire amount of sleep")
                        .font(.headline)
                    
                    // input for sleep amount
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Daily coffee intake")
                        .font(.headline)
                    
                    // input for coffee amount
                    
                    VStack {
                        // how we can handle plular
                        // we can use tenary operartor
                        Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 0...20)
                        
                        // or swift have a syntax to handle it
                        Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
                    }

                }

                
                
            }
            .navigationTitle("BetterRest")
            .toolbar { // create button on toolbar
                Button("Calculate", action: calculateBedtime)
            }
            .alert(alertTitle, isPresented: $showAlert) {
                Button("OK") {}
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    // create a calculate function from ML model
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration() // create configuration handled by CoreML
            let model = try BetterRest(configuration: config) // try to get model from the file
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60 // get a value in second for hour
            let minute = (components.minute ?? 0) * 60 // get a value in second for minutes
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount)) // use Double type to match it with input from model
            
            let sleepTime = wakeUp - prediction.actualSleep // get sleep time by directing calculating Date Type which swift can handle operation for Date Type
            
            // use alert to show the prediction
            alertMessage = "Your ideal bedtime is ..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            // code for wrong
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime. Please try again later."
        }
        
        showAlert = true
    }
}

#Preview {
    ContentView()
}
