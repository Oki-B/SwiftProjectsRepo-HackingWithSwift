//
//  HapticEffects.swift
//  CupcakeCorner
//
//  Created by Syaoki Biek on 07/09/25.
//

import CoreHaptics  // frameworks for Haptic
import SwiftUI

struct HapticEffects: View {
    @State private var counter = 0
    @State private var engine: CHHapticEngine?

    var body: some View {
        Button("Tap Count: \(counter)") {
            counter += 1
        }
        //        .sensoryFeedback(.increase, trigger: counter) // .increase = for increasing some value
        .sensoryFeedback(
            .impact(weight: .heavy, intensity: 1),
            trigger: counter
        )  // .impact could be customize
        .padding(.bottom, 20)

        Button("Play Haptic", action: complexSuccess)
            .onAppear(perform: prepareHaptics)

    }

    // to be able configure haptic engine we need to make sure the device is support for that
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            return
        }

        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print(
                "Failed to create haptic engine: \(error.localizedDescription)"
            )
        }
    }

    func complexSuccess() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            return
        }

        var events = [CHHapticEvent]()

        // this all the setting of how you want your haptics performing
//        let intensity = CHHapticEventParameter(
//            parameterID: .hapticIntensity,
//            value: 1
//        )
//        let sharpness = CHHapticEventParameter(
//            parameterID: .hapticSharpness,
//            value: 1
//        )
//        let event = CHHapticEvent(
//            eventType: .hapticTransient,
//            parameters: [intensity, sharpness],
//            relativeTime: 0
//        )
//        events.append(event)
        
        // exploring the haptics setup to know how you can utilize it to create different haptics event
        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
            events.append(event)
        }
        
        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
            events.append(event)
        }

        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play patter: \(error.localizedDescription)")
        }
    }
}

#Preview {
    HapticEffects()
}
