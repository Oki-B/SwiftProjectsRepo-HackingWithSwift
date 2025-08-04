//
//  ShowingAndHidingViews.swift
//  iExpense
//
//  Created by Syaoki Biek on 04/08/25.
//

import SwiftUI

struct secondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    
    var body: some View {
        Text("Hello, \(name)!")
            .padding(20)
        Button("Dismiss") {
            dismiss()
        }
        .buttonStyle(.borderedProminent)
    }
}

struct ShowingAndHidingViews: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            // show the sheet
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            // contents of our sheet
            secondView(name: "@twostraws")
        }
    }
}

#Preview {
    ShowingAndHidingViews()
}
