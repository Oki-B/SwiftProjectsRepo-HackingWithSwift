//
//  ContentView.swift
//  Challenge_03
//
//  Created by Syaoki Biek on 01/07/25.
//

import SwiftUI

struct Question: Identifiable {
    var id: Int
    var question: String
    var answer: Int
}

struct ContentView: View {
    @State var multiplicationTable: Int = 2
    @State var totalQuestion: Int = 5
    
    var body: some View {
        Form {
            Stepper(value: $multiplicationTable, in: 2...12) {
                Text("Multiplication Of : \(multiplicationTable)")
            }
            
            Section("Total Questions") {
                Picker("Total Question", selection: $totalQuestion) {
                    ForEach(5...20, id: \.self) { value in
                        if value % 5 == 0 {
                            Text("\(value)")
                        }
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }

        }
    }
    
//    func startQuiz(multiplier: Int, totalQuestion: Int) {
//        ForEach(1...totalQuestion) { index in
//            
//        }
//    }
}

#Preview {
    ContentView()
}
