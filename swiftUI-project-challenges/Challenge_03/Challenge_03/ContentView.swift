//
//  ContentView.swift
//  Challenge_03
//
//  Created by Syaoki Biek on 01/07/25.
//

import SwiftUI

struct Question: Identifiable {
    var id: UUID
    var question: [Int]
    var answer: Int
}

struct ContentView: View {
    @State var multiplicationTable: Int = 2
    @State var totalQuestion: Int = 5
    @State var gameIsStarted: Bool = false
    @State var gameIsReset: Bool = false
    @State private var userAnswers: [UUID: String] = [UUID: String]()
    @State private var questions: [Question] = []
    @State private var isCalculated: Bool = false
    @State var correctAnswer: Int = 0
    @State var isDisabled: Bool = false
    @State var isSubmitted: Bool = false
    @FocusState private var focusState: UUID?
    var answeredCount: Int {
        userAnswers.values.filter { !$0.isEmpty }.count
    }
    var labelTextButton: String {
        if gameIsStarted {
            if isCalculated {
                return "Try Another Round"
            } else {
                return "Submit Answers"
            }
        } else {
            return "Start Round"
        }
    }
    
    var finalScorePercentage: Int {
        guard totalQuestion > 0 else { return 0 }
        return Int(round((Double(correctAnswer) / Double(totalQuestion)) * 100))
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Form {
                    // Game Settings Sections
                    Section(
                        header: Text("⚙️ Game Settings"),
                        footer: Text("Set difficulty level and total question")
                    ) {
                        HStack {
                            Stepper(value: $multiplicationTable, in: 2...12) {
                                HStack {
                                    Text("Multiplication of :")
                                    Spacer()
                                    Text("\(multiplicationTable)")
                                        .font(.headline)
                                        .foregroundStyle(.blue)
                                        .padding(.trailing, 5)
                                }
                            }
                        }

                        Picker("Total Question", selection: $totalQuestion) {
                            ForEach(5...20, id: \.self) { value in
                                if value % 5 == 0 {
                                    Text("\(value)")
                                }
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    .disabled(gameIsStarted && !isCalculated ? true : false)
                    .padding(.vertical, 3)
                    .listRowBackground(Color.gray.opacity(0.05))

                    Group {
                        if gameIsStarted {
                            VStack(alignment: .center) {
                                if isCalculated {
                                    VStack {
                                        Text("YOUR SCORE")
                                            .font(.title3)
                                            .fontWeight(.bold)
                                            .foregroundStyle(.secondary)
                                        Text("\(finalScorePercentage)")
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .foregroundStyle(.red.opacity(0.8))
                                            .frame(width: 150, height: 60)
                                            .background(Color.green.opacity(0.25))
                                            .cornerRadius(12)
                                    }
                                    .padding(.bottom, 20)
                                }
                                
                                if !isCalculated {
                                    Text("Finish all table below")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundStyle(.blue.opacity(0.8))
                                        .padding(.bottom, 8)
                                }

                            }
                            .frame(maxWidth: .infinity)
                            .overlay(
                                Rectangle()
                                    .frame(height: 1.5)
                                    .foregroundStyle(.blue.opacity(0.8))
                                    .shadow(
                                        color: Color.blue.opacity(0.5),
                                        radius: 1,
                                        x: 0,
                                        y: 1
                                    ),
                                alignment: .bottom
                            )

                            QuestionList(
                                questions: $questions,
                                userAnswers: $userAnswers,
                                isCalculated: $isCalculated,
                                focusedField: $focusState,
                                isChecking: isCalculated
                            )
                        }
                    }
                }
                .listRowSpacing(0)
                .listSectionSpacing(0)
                .scrollContentBackground(.hidden)
                .scrollDismissesKeyboard(.interactively)

                VStack {
                    Spacer()
                    ActionButton(
                        action: {
                            if gameIsStarted {
                                if isCalculated {
                                    resetGame(
                                        totalQuestions: totalQuestion,
                                        multiplicationTable: multiplicationTable
                                    )
                                } else {
                                    calculateScore(
                                        questions: questions,
                                        userAnswers: userAnswers
                                    )
                                }
                            } else {
                                startGame(
                                    totalQuestions: totalQuestion,
                                    multiplicationTable: multiplicationTable
                                )
                            }
                        },
                        labelText: labelTextButton
                    )
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .shadow(radius: 1)
                    .disabled(
                        gameIsStarted && !isCalculated && answeredCount != totalQuestion
                    )

                }
                .ignoresSafeArea(.keyboard, edges: .bottom)
                .navigationTitle("Multiplication Party")
                .navigationBarTitleDisplayMode(.automatic)
                .toolbar {
                    if focusState != nil {
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                UIApplication.shared.dismissKeyboard()
                            }
                        }
                    }
                }
            }
            .gesture(
                TapGesture().onEnded { _ in
                    UIApplication.shared.dismissKeyboard()
                }
            )
        }

    }

    func startGame(totalQuestions: Int, multiplicationTable: Int) {
        questions.removeAll()
        correctAnswer = 0
        isCalculated = false
        userAnswers = [UUID: String]()

        for questionNumber in 1...totalQuestions {
            questions.append(
                Question(
                    id: UUID(),
                    question: [questionNumber, multiplicationTable],
                    answer: questionNumber * multiplicationTable
                )
            )
        }
        gameIsStarted.toggle()

    }

    func calculateScore(questions: [Question], userAnswers: [UUID: String]) {
        for i in userAnswers.keys {

            guard let userAnswer = userAnswers[i] else { continue }
            print(userAnswer)
            if Int(userAnswer) == questions.first(where: { $0.id == i })?.answer
            {
                correctAnswer += 1
            }
        }
        isCalculated.toggle()
        gameIsReset.toggle()
    }

    func resetGame(totalQuestions: Int, multiplicationTable: Int) {
        questions.removeAll()
        correctAnswer = 0
        userAnswers = [UUID: String]()
        isCalculated.toggle()
        
        for questionNumber in 1...totalQuestions {
            questions.append(
                Question(
                    id: UUID(),
                    question: [questionNumber, multiplicationTable],
                    answer: questionNumber * multiplicationTable
                )
            )
        }
    }

}

#Preview {
    ContentView()
}
