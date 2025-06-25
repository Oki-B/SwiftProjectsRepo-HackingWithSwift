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
    
    @State private var score: Int = 0
    @State private var round: Int = 0
    @State private var showScore: Bool = false
    @State private var alertTitle: String = ""

    var body: some View {
        VStack {
            Text("Focus Game")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(round == 10 ? .white : .red)
                .padding(40)
            
            ZStack(alignment: .top) {
                Rectangle()
                    .fill(Color.blue)
                    .cornerRadius(40)
                    .frame(width: 320, height: 320)

                Rectangle()
                    .fill(Color.white)
                    .opacity(0.9)
                    .cornerRadius(40)
                    .padding(10)
                    .frame(width: 320, height: 320)
                    .shadow(radius: 5)

                ZStack {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 185, height: 100)
                        .cornerRadius(20)

                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 170, height: 85)
                        .cornerRadius(20)
                    VStack {
                        Text("How can you :")
                            .foregroundStyle(Color.blue)
                        Text(shouldWin ? "Win" : "Lose")
                            .font(.system(size: 48))
                    }

                }
                .padding(-20)

                Text(moves[appMove])
                    .font(.system(size: 150))
                    .padding(.top, 100)
            }
            .padding(20)

            VStack(spacing: 30) {
                Text("Pick your move:")
                    .font(.title)

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
                
                Text("Your Score: \(score)")
                    .font(.title2)
                    .bold()
            }
            
            .alert(alertTitle, isPresented: $showScore) {
                if round == 10 {
                    Button("Play Again") {
                        resetGame()
                    }
                } else {
                    Button("Next Round") {
                        newGame()
                    }
                }
            } message: {
                if round == 10 {
                    Text("You final socre is \(score).")
                }
            }
            .padding()
            
            Spacer()
                
                
        }
        .frame(maxWidth: .infinity)
        .background(round == 10 ? .red.opacity(0.7) : .white)

    }
    
    

    func checkMove(_ idx: Int) {
        userMove = idx
        switch (userMove, appMove) {
        case (0, 2), (1, 0), (2, 1):  // win case
            if shouldWin {
                alertTitle = "Correct"
                score += 1
            } else {
                alertTitle = "Incorrect"
            }
        case (0, 1), (1, 2), (2, 0):  // lose case
            if shouldWin {
                alertTitle = "Incorrect"
            } else {
                alertTitle = "Correct"
                score += 1
            }
        default:  // draw case
            alertTitle = "Incorrect"
        }
        round += 1
        if round == 10 {
            alertTitle = "Game Over"
        }
        showScore = true
    }

    func newGame() {
        appMove = Int.random(in: 0..<3)
        shouldWin = Bool.random()
    }
    
    func resetGame() {
        score = 0
        round = 0
        newGame()
    }
}

#Preview {
    ContentView()
}
