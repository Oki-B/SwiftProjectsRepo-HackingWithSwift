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
    
    @State private var idealBedtime: String = ""

    // create commputed property for default wake time
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }

    var body: some View {
        NavigationStack {
            Form {  // using form to create a better view for input
                // Challenge 1 - Replace VStack in form with Section
                Section("When do you want to wake up?") {
                    DatePicker(
                        "Please enter a time",
                        selection: $wakeUp,
                        displayedComponents: .hourAndMinute
                    )
                }

                Section("Desire amount of sleep") {
                    // input for sleep amount
                    Stepper(
                        "\(sleepAmount.formatted()) hours",
                        value: $sleepAmount,
                        in: 4...12,
                        step: 0.25
                    )
                }

                Section("Daily coffee intake") {
                    
                    // input for coffee amount
                    VStack {
                        // how we can handle plular
                        // we can use tenary operartor
                        Stepper(
                            coffeeAmount == 1
                                ? "1 cup" : "\(coffeeAmount) cups",
                            value: $coffeeAmount,
                            in: 0...20
                        )

                        // or swift have a syntax to handle it
                        Stepper(
                            "^[\(coffeeAmount) cup](inflect: true)",
                            value: $coffeeAmount,
                            in: 1...20
                        )
                        
                        // replace number of cups stepper with Picker
                        Picker("Number of Coffee ", selection: $coffeeAmount) {
                            ForEach(1...20, id: \.self) {
                                Text("^[\($0) cup](inflect: true)")
                            }
                        }
                    }

                }
                
                // challenge 3 - Change the user interface so that it always shows their recommended bedtime using a nice and large font. You should be able to remove the “Calculate” button entirely.
                Section ("Your ideal bed time") {
                    Text("\(idealBedtime)")
                        .frame(maxWidth: .infinity)
                        .font(.largeTitle)
                        .bold()
                }


            }
            .navigationTitle("BetterRest")
            .onAppear(){
                calculateBedtime()
            }
            .onChange(of: wakeUp) { newTime, idx in
                calculateBedtime()
            }
            .onChange(of: sleepAmount) { newAmount, idx in
                calculateBedtime()
            }
            .onChange(of: coffeeAmount) { newAmount, idx in
                calculateBedtime()
            }
//            .toolbar {  // create button on toolbar
//                Button("Calculate", action: calculateBedtime)
//            }
//            .alert(alertTitle, isPresented: $showAlert) {
//                Button("OK") {}
//            } message: {
//                Text(alertMessage)
//            }
            
        }
    }

    // create a calculate function from ML model
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()  // create configuration handled by CoreML
            let model = try BetterRest(configuration: config)  // try to get model from the file

            let components = Calendar.current.dateComponents(
                [.hour, .minute],
                from: wakeUp
            )
            let hour = (components.hour ?? 0) * 60 * 60  // get a value in second for hour
            let minute = (components.minute ?? 0) * 60  // get a value in second for minutes

            let prediction = try model.prediction(
                wake: Double(hour + minute),
                estimatedSleep: sleepAmount,
                coffee: Double(coffeeAmount)
            )  // use Double type to match it with input from model

            let sleepTime = wakeUp - prediction.actualSleep  // get sleep time by directing calculating Date Type which swift can handle operation for Date Type
            
            // value of ideal bedtime
            idealBedtime = sleepTime.formatted(date: .omitted, time: .shortened)
            
            
            // use alert to show the prediction
            alertTitle = "Your ideal bedtime is ..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            // code for wrong
            alertTitle = "Error"
            alertMessage =
                "Sorry, there was a problem calculating your bedtime. Please try again later."
        }

        showAlert = true
    }
}

#Preview {
    ContentView()
}
