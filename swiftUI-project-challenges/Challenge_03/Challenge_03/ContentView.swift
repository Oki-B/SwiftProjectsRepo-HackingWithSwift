//
//  ContentView.swift
//  Challenge_03
//
//  Created by Syaoki Biek on 01/07/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Form {
                    // Game Settings Sections
                    GameSettingsSectionView(viewModel: viewModel)

                    VStack {
                        if viewModel.gameIsStarted {
                            ScoreOrInstructionBoardView(
                                isCalculated: viewModel.isCalculated,
                                finalScore: viewModel.finalScorePercentage
                            )

                            QuestionList(viewModel: viewModel)
                        }
                    }
                }
                .listSectionSpacing(0)
                .scrollContentBackground(.hidden)
                .scrollDismissesKeyboard(.interactively)

                VStack {
                    Spacer()
                    ActionButton(
                        action: {
                            if viewModel.gameIsStarted {
                                if viewModel.isCalculated {
                                    viewModel.restartGame()
                                } else {
                                    viewModel.calculateScore()
                                }
                            } else {
                                viewModel.startGame()
                            }
                        },
                        labelText: viewModel.labelTextButton
                    )
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .shadow(radius: 1)
                    .disabled(viewModel.isActionDisabled)

                }
                .ignoresSafeArea(.keyboard, edges: .bottom)
                .navigationTitle("Multiplication Party")
                .navigationBarTitleDisplayMode(.automatic)
            }
            .gesture(
                TapGesture().onEnded { _ in
                    UIApplication.shared.dismissKeyboard()
                }
            )
        }
    }

}

#Preview {
    ContentView()
}
