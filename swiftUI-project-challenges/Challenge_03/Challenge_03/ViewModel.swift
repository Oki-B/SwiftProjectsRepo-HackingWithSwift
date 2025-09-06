//
//  ViewModel.swift
//  Challenge_03
//
//  Created by Syaoki Biek on 05/09/25.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var questions: [Question] = []
    @Published var totalQuestion: Int = 5
    @Published var multiplicationTable: Int = 2
    @Published var gameIsStarted: Bool = false
    @Published var gameIsRestarting: Bool = false
    @Published var isCalculated: Bool = false
    @Published var correctAnswer: Int = 0
    @Published var userAnswers: [UUID: String] = [:]

    var answeredCount: Int {
        userAnswers.values.filter { !$0.isEmpty }.count
    }

    var labelTextButton: String {
        switch (gameIsStarted, isCalculated) {
        case (true, true):  return TextButton.restart.content
        case (true, false): return TextButton.calculate.content
        case (false, _):    return TextButton.start.content
        }
    }

    var finalScorePercentage: Int {
        guard totalQuestion > 0 else { return 0 }
        return Int(round(Double(correctAnswer) / Double(totalQuestion) * 100))
    }

    var isActionDisabled: Bool {
        gameIsStarted && !isCalculated && answeredCount != totalQuestion
    }

    var isFormDisabled: Bool {
        gameIsStarted && !isCalculated
    }
}

// MARK: - Game Flow Control
extension ViewModel {
    func generateQuestion() {
        questions = (1...totalQuestion).map { number in
            Question(
                id: UUID(),
                question: [number, multiplicationTable],
                answer: number * multiplicationTable
            )
        }
    }

    func startGame() {
        generateQuestion()
        gameIsStarted = true
    }

    func calculateScore() {
        correctAnswer = 0
        for (id, userAnswer) in userAnswers {
            if Int(userAnswer) == questions.first(where: { $0.id == id })?.answer {
                correctAnswer += 1
            }
        }
        isCalculated = true
        gameIsRestarting = true
    }

    func restartGame() {
        questions.removeAll()
        correctAnswer = 0
        userAnswers.removeAll()
        isCalculated = false
        generateQuestion()
    }
}

extension ViewModel {
    func binding(for id: UUID) -> Binding<String> {
        Binding(
            get: { self.userAnswers[id] ?? "" },
            set: { newValue in
                if newValue.isEmpty {
                    self.userAnswers.removeValue(forKey: id)
                } else {
                    self.userAnswers[id] = newValue
                }
            }
        )
    }
}

