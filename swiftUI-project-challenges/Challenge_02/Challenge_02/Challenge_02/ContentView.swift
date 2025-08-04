//
//  ContentView.swift
//  Challenge_02
//
//  Created by Syaoki Biek on 05/06/25.
//

import SwiftUI

struct ContentView: View {
    @State private var moves: [String] = ["✊🏻", "🖐🏻", "✌🏻"]
    @State private var appMove = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    @State private var userMove: Int = 0
    
    @State private var showScore: Bool = false
    @State private var alertTitle: String = ""
    
    var body: some View {
        ZStack(alignment: .top) {
 
            Rectangle()
                .fill(Color.gray)
                .opacity(0.25)
            
            
            Rectangle()
                .fill(Color.blue)
                .padding(40)
                .cornerRadius(20)
                .shadow(radius: 10)
                
            ZStack {
                Text("How can you :")
                    .padding(30)
                    .background(Color.white)
                    .foregroundStyle(
                    .shadow(.inner(color: .blue, radius: 3, x: 0, y: 3))
                    )

            }
            .cornerRadius(20)
            .border(Color.blue, width: 3)
            .padding(10)
            

        }
        .padding(20)
        VStack {
            
            Text(shouldWin ? "Win" : "Lose")
                .font(.system(size: 72))
            Text("Againts")
            Text(moves[appMove])
                .font(.system(size: 100))
            
            VStack {
                Text("Pick your move:")
                HStack {
                    ForEach(0..<moves.count, id: \.self) { move in
                        Button {
                            checkMove(move)
                        } label: {
                            Text(moves[move])
                                .font(.system(size: 50))
                                .padding(10)
                        }
                        .buttonBorderShape(.circle)
                        .buttonStyle(.borderedProminent)
                        .shadow(radius: 5)
                    }
                }
            }
            .alert(alertTitle, isPresented: $showScore) {
                Button ("Play Again") {
                    newGame()
                }
            }

        }
        .padding()
    }
    
    func checkMove(_ idx: Int) {
        userMove = idx
        switch (userMove, appMove) {
        case (0, 2), (1, 0), (2, 1): // win case
            if shouldWin {
                alertTitle = "Correct"
            } else {
                alertTitle = "Incorrect"
            }
        case (0, 1), (1, 2), (2, 0): // lose case
            if shouldWin {
                alertTitle = "Incorrect"
            } else {
                alertTitle = "Correct"
            }
        default: // draw case
                alertTitle = "Incorrect"
        }
        showScore = true
    }
    
    func newGame() {
        appMove = Int.random(in: 0..<3)
        shouldWin = Bool.random()
    }
}

#Preview {
    ContentView()
}
