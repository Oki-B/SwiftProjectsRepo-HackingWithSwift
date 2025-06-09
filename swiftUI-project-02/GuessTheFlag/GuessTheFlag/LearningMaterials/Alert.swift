//
//  Alert.swift
//  GuessTheFlag
//
//  Created by Syaoki Biek on 01/06/25.
//

import SwiftUI

struct Alert: View {
    // to show alert we need to use property wrapper and create stored state that changeable whenever it triggered
    @State private var showingAlert = false
    @State private var showingSecondAlert = false
    
    var body: some View {
        VStack (spacing: 30){
            Button("Show alert") {
                showingAlert = true
            }
            .buttonStyle(.bordered)
            // alert can be created using .alert
            .alert("Important message", isPresented: $showingAlert ) {
                Button("OK") { } // if the button only purpose to dismiss the alert { } is enough
            }
            
            Button("Show second alert") {
                showingSecondAlert = true
            }
            .buttonStyle(.borderedProminent)
            .alert("Second Alert", isPresented: $showingSecondAlert) { // alert can contain more than one button
                Button("Delete", role: .destructive) { }
                Button("Cancel", role: .cancel) { }
            } message : { // provide additional message on the alert
                Text("Please read this message.")
            }
        }

    }
}

#Preview {
    Alert()
}
