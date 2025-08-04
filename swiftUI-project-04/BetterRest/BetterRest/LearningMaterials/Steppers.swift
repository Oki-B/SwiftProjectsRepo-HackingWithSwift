//
//  Steppers.swift
//  BetterRest
//
//  Created by Syaoki Biek on 09/06/25.
//

import SwiftUI

struct Steppers: View {
    @State private var sleepAmount: Double = 8
    @State private var sleepAmount2: Double = 8
    @State private var sleepAmount3: Double = 8
    @State private var sleepAmount4: Double = 8
    
    var body: some View {
        VStack {
            Stepper("\(sleepAmount) hours", value: $sleepAmount)
            
            Stepper("\(sleepAmount2) hours", value: $sleepAmount2, in: 4...12) // using in to give specific range for the value
            
            Stepper("\(sleepAmount3) hours", value: $sleepAmount3, in: 4...12, step: 0.25) // using step to give specific value on increment or decrement
            
            Stepper("\(sleepAmount4.formatted()) hours", value: $sleepAmount4, in: 4...12, step: 0.25) // use formatted modifier to make the value of Double variable automatically set to standard format.
        }
        .padding()
    }
}

#Preview {
    Steppers()
}
