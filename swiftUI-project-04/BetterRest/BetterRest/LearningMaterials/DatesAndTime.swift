//
//  DatesAndTime.swift
//  BetterRest
//
//  Created by Syaoki Biek on 09/06/25.
//

import SwiftUI

struct DatesAndTime: View {
    @State private var wakeUp: Date = Date.now // there is a property called date in swift
    @State private var wakeUp2 = Date.now
    @State private var wakeUp3 = Date.now
    @State private var wakeUp4 = Date.now
    
    var body: some View {
        VStack {
            DatePicker("When you want to wake up?", selection: $wakeUp) // Date picker is used to work to get/set a date property value
            
            DatePicker("Please enter a date", selection: $wakeUp2, displayedComponents: .hourAndMinute) // display component modifier use to control what kind options users should see
            
            DatePicker("Please enter a date", selection: $wakeUp3)
                .labelsHidden() // we can use modifier labelsHidden to hide the label text of Date Picker
            
            DatePicker("Please enter a date", selection: $wakeUp4, in: Date.now...) // we can give a specific range for the picker using property in, as example code it will allow all dates in the future, but none in the past - read "from the current date up to anything."
                .labelsHidden()
                
            
        }
    }
    
    func exampleDates() {
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = Date.now...tomorrow
    }
}

#Preview {
    DatesAndTime()
}
