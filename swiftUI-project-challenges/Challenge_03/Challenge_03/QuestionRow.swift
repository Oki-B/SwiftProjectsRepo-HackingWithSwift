//
//  QuestionRow.swift
//  Challenge_03
//
//  Created by Syaoki Biek on 03/09/25.
//

import SwiftUI

struct QuestionRow: View {
    let question: Question
    @Binding var answer: String
    var isCalculated: Bool
    @FocusState.Binding var focusedField: UUID?
    var isOnCheck: Bool
    var isCorrect : Bool {
        question.answer == Int(answer)
    }

    var body: some View {
        HStack {
            Spacer()

            Text("\(question.question[0])")
                .font(.title2)
                .frame(width: 60, height: 50)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)

            Image(systemName: "multiply")
            Text("\(question.question[1])")
                .font(.title2)
                .frame(width: 60, height: 50)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)

            Image(systemName: "equal")

            TextField("...", text: $answer)
                .font(.title2)
                .focused($focusedField, equals: question.id)
                .multilineTextAlignment(.center)
                .disabled(isCalculated)
                .frame(width: 75, height: 50)
                .foregroundStyle(isOnCheck ? Color.white : Color.primary)
                .background(isOnCheck ? isCorrect ? Color.green : Color.red : Color.gray.opacity(0.2))
                .cornerRadius(10)
                .keyboardType(.decimalPad)
                .onChange(of: answer, initial: false) { oldValue, newValue in
                    if newValue.count > 3 {
                        answer = String(newValue.prefix(3))
                    }
                }
            
            if isOnCheck && !isCorrect {
                Text("\(question.answer)")
                    .font(.title2)
                    .frame(width: 75, height: 50)
                    .foregroundStyle(.white)
                    .background(.blue.opacity(0.6))
                    .cornerRadius(10)

            }
            
            Spacer()
        }
        .padding(.bottom, 12)
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.gray.opacity(0.7)),
            alignment: .bottom
        )
        .frame(maxWidth: .infinity)
        .listRowSeparator(.hidden)
    }
}


//#Preview {
//    QuestionRow()
//}
