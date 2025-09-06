//
//  QuestionRow.swift
//  Challenge_03
//
//  Created by Syaoki Biek on 03/09/25.
//

import SwiftUI

struct QuestionRow: View {
    @ObservedObject var viewModel: QuestionRowViewModel
    @FocusState private var isFocused: Bool

    var body: some View {
        HStack {
            Spacer()

            Text("\(viewModel.question.question[0])")
                .font(.title2)
                .frame(width: 60, height: 50)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)

            Image(systemName: "multiply")
            Text("\(viewModel.question.question[1])")
                .font(.title2)
                .frame(width: 60, height: 50)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)

            Image(systemName: "equal")
            
            VStack {
                TextField(
                    "...",
                    text: Binding(
                        get: { viewModel.answer.wrappedValue },
                        set: { viewModel.updateAnswer($0) }
                    )
                )
                .font(.title2)
                .focused($isFocused)
                .multilineTextAlignment(.center)
                .frame(width: 75, height: 50)
                .foregroundStyle(
                    viewModel.isCalculated ? Color.white : Color.primary
                )
                .background(
                    viewModel.isCalculated
                        ? viewModel.isCorrect ? Color.green : Color.red
                        : Color.gray.opacity(0.2)
                )
                .cornerRadius(10)
                .keyboardType(.numberPad)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
            }


            if viewModel.isCalculated && !viewModel.isCorrect {
                Text("\(viewModel.question.answer)")
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
        .padding(.top, 6)
        .frame(maxWidth: .infinity)
//        .listRowSeparator(.hidden)
        .toolbar {
            if isFocused {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        UIApplication.shared.dismissKeyboard()
                    }
                }
            }
        }
    }
}
