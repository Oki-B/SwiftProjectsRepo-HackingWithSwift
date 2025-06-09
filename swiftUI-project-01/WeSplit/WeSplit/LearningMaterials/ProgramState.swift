//
//  ProgramState.swift
//  WeSplit
//
//  Created by Syaoki Biek on 30/05/25.
//

import SwiftUI

struct ProgramState: View {
    // Property Wrapper => @State == allow value to be stored separatedly by SwiftUI in a place that can be modified
    @State private var tapCount: Int = 0
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
    }
}

#Preview {
    ProgramState()
}
