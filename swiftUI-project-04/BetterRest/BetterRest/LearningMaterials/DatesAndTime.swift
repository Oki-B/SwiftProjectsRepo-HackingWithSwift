//
//  DatesAndTime.swift
//  BetterRest
//
//  Created by Syaoki Biek on 09/06/25.
//

import SwiftUI

struct DatesAndTime: View {
    @State private var wakeUp: Date = Date.now  // there is a property called date in swift
    @State private var wakeUp2 = Date.now
    @State private var wakeUp3 = Date.now
    @State private var wakeUp4 = Date.now

    var body: some View {
        VStack {
            DatePicker("When you want to wake up?", selection: $wakeUp)  // Date picker is used to work to get/set a date property value

            DatePicker(
                "Please enter a date",
                selection: $wakeUp2,
                displayedComponents: .hourAndMinute
            )  // display component modifier use to control what kind options users should see

            DatePicker("Please enter a date", selection: $wakeUp3)
                .labelsHidden()  // we can use modifier labelsHidden to hide the label text of Date Picker

            DatePicker(
                "Please enter a date",
                selection: $wakeUp4,
                in: Date.now...
            )  // we can give a specific range for the picker using property in, as example code it will allow all dates in the future, but none in the past - read "from the current date up to anything."
            .labelsHidden()

            DatePicker(
                "Please enter a date",
                selection: $wakeUp4,
                in: exampleDates()
            )

            // we can use format .dateTime to call Date value in a tex
            Text(exampleDateComponents(), format: .dateTime.hour().minute())

            Text(Date.now, format: .dateTime.hour().minute())  // format of the specific data will automatically change based on user preference (time location)

            Text(Date.now, format: .dateTime.day().month().year())  // .dateTime has many date format we can use

            // method formatted also can be use to passing in cofiguration option as alternative
            Text(Date.now.formatted(date: .long, time: .shortened))
        }
        .padding()
    }

    // example how we can create range of date to make a parameter for Date Picker
    func exampleDates() -> ClosedRange<Date> {
        let tomorrow = Date.now.addingTimeInterval(86400)
        return Date.now...tomorrow
    }

    // example how we can work with dateComponents
    func exampleDateComponents() -> Date {
        var components = DateComponents()  // Date component let us read or write specific part of a date rather than the whole thing
        components.hour = 5
        components.minute = 30

        /*
        // we can also write a dateComponents like this to chose exactly which components we want to use
        let components = Calendar.current.dateComponents(
            [.hour, .minute],
            from: .now
        )
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
         */

        // current date method return an optional value, which make us need to use nil coalesing if it value is fail to get, we still can have any value example a current date
        let date = Calendar.current.date(from: components) ?? .now
        return date
    }
}

#Preview {
    DatesAndTime()
}
