//
//  QuestionList.swift
//  Challenge_03
//
//  Created by Syaoki Biek on 03/09/25.
//

import SwiftUI

struct QuestionList: View {
    @Binding var questions: [Question]
    @Binding var userAnswers: [UUID: String]
    @Binding var isCalculated: Bool
    @FocusState.Binding var focusedField: UUID?
    var isChecking: Bool

    var body: some View {
        List {
            ForEach(questions) { question in
                QuestionRow(
                    question: question,
                    answer: Binding(
                        get: { userAnswers[question.id] ?? "" },
                        set: {
                            userAnswers[question.id] = $0
                            if $0 == "" && focusedField != question.id {
                                userAnswers.removeValue(forKey: question.id)
                            }
                        }
                    ),
                    isCalculated: isCalculated,
                    focusedField: $focusedField,
                    isOnCheck: isChecking
                )
            }

            Color.clear
                .frame(height: 70)
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
        }
    }
}

//#Preview {
//    var userAnswers: [UUID: String] = [UUID: String]()
//    var questions: [Question] = []
//    var isCalculated: Bool = false
//    var isFocused: UUID? = UUID()
//    
//    return QuestionList(userAnswers: $userAnswers, questions: $questions, isCalculated: $isCalculated, isFocused: $isFocused)
//}
