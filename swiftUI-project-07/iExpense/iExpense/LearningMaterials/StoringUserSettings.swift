//
//  StoringUserSettings.swift
//  iExpense
//
//  Created by Syaoki Biek on 04/08/25.
//

import SwiftUI

struct StoringUserSettings: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap") // can be used to store default data
    
    // another alternative to store data
    @AppStorage("tapCount2") private var tapCount2 = 0
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
            UserDefaults.standard.set(tapCount, forKey: "Tap") // related with the userDefaults
        }.padding(.bottom, 20)
        
        // using property wrapper of @AppStorage doesnt need to use another code to make it works
        Button("Tap Count2: \(tapCount2)") {
            tapCount2 += 1
        }
    }
}

#Preview {
    StoringUserSettings()
}
