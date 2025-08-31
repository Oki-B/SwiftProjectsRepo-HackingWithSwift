//
//  ViewModel.swift
//  Challenge_02
//
//  Created by Syaoki Biek on 31/08/25.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var moves: [String]
    @Published var appMove: Int
    @Published var shouldWin: Bool
    @Published var userMove: Int
   
    @Published var score: Int
    @Published var round: Int
    @Published var showScore: Bool
    @Published var alertTitle: String
    
    init(moves: [String] = ["✊🏻", "🖐🏻", "✌🏻"], appMove: Int = Int.random(in: 0..<3), shouldWin: Bool = Bool.random(), userMove: Int  = 0, score: Int = 0, round: Int = 0, showScore: Bool = false, alertTitle: String = "") {
        self.moves = moves
        self.appMove = appMove
        self.shouldWin = shouldWin
        self.userMove = userMove
        self.score = score
        self.round = round
        self.showScore = showScore
        self.alertTitle = alertTitle
    }
    
    // Game Logic Function
    func checkMove(_ idx: Int) {
        self.userMove = idx
        switch (self.userMove, self.appMove) {
        case (0, 2), (1, 0), (2, 1):  // win case
            if self.shouldWin {
                self.alertTitle = "Correct"
                self.score += 1
            } else {
                self.alertTitle = "Incorrect"
            }
        case (0, 1), (1, 2), (2, 0):  // lose case
            if self.shouldWin {
                self.alertTitle = "Incorrect"
            } else {
                self.alertTitle = "Correct"

                self.score += 1
            }
        default:  // draw case
            self.alertTitle = "Incorrect"
        }
        self.round += 1
        if self.round == 10 {
            self.alertTitle = "Game Over"
        }
        self.showScore = true
    }

    func newGame() {
        self.appMove = Int.random(in: 0..<3)
        self.shouldWin = Bool.random()
    }
    
    func resetGame() {
        self.score = 0
        self.round = 0
        self.newGame()
    }
    
}
