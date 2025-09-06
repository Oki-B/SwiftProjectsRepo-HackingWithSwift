//
//  QuestionList.swift
//  Challenge_03
//
//  Created by Syaoki Biek on 03/09/25.
//

import SwiftUI

struct QuestionList: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.questions) { question in
                QuestionRow(
                    viewModel: QuestionRowViewModel(
                        question: question,
                        exsitingAnswer: viewModel.binding(for: question.id),
                        isCalculated: viewModel.isCalculated
                    )
                )
            }
            Color.clear
                .frame(height: 70)
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
        }
        .disabled(viewModel.isCalculated)
    }
}

