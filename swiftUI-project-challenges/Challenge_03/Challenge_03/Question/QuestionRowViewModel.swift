//
//  QuestionRowViewModel.swift
//  Challenge_03
//
//  Created by Syaoki Biek on 05/09/25.
//

import SwiftUI
import Foundation

final class QuestionRowViewModel: ObservableObject, Identifiable {
    let id: UUID
    let question: Question
    let isCalculated: Bool
    
    var answer: Binding<String>
    
    var isCorrect: Bool {
        Int(answer.wrappedValue) == question.answer
    }
    
    init(question: Question, exsitingAnswer: Binding<String>, isCalculated: Bool) {
        self.id = question.id
        self.question = question
        self.answer = exsitingAnswer
        self.isCalculated = isCalculated
    }
    
    func updateAnswer(_ newValue: String) {
        let filtered = newValue.filter { $0.isNumber }
        if filtered.isEmpty {
            self.answer.wrappedValue = ""
        } else {
            self.answer.wrappedValue = String(filtered.prefix(3))
        }
    }

}
