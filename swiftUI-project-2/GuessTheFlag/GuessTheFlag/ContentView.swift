//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Syaoki Biek on 31/05/25.
//

import SwiftUI

/*
 Challenge :
    1. Add an @State property to store the user’s score, modify it when they get an answer right or wrong, then display it in the alert and in the score label.
    2. When someone chooses the wrong flag, tell them their mistake in your alert message – something like “Wrong! That’s the flag of France,” for example.
    3. Make the game show only 8 questions, at which point they see a final alert judging their score and can restart the game.

 */

struct ContentView: View {
    @State private var countries = [
        "Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Monaco",
        "Poland", "Russia", "Spain", "UK", "US",
    ].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var userAnswer = 0  // for challenge number 2

    @State private var showingScore = false
    @State private var scoreTitle = ""

    @State private var userScore = 0  // challenge number 1
    @State private var questionNumber = 1 // for challenge number 3

    var body: some View {
        ZStack {
            RadialGradient(
                stops: [
                    .init(
                        color: Color(red: 0.1, green: 0.2, blue: 0.45),
                        location: 0.3
                    ),
                    .init(
                        color: Color(red: 0.76, green: 0.15, blue: 0.26),
                        location: 0.3
                    ),
                ],
                center: .top,
                startRadius: 200,
                endRadius: 700
            )
            .ignoresSafeArea()

            VStack {
                Spacer()

                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)

                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))

                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }

                    ForEach(0..<3) { number in
                        Button {
                            // flag was tapped
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                Spacer()
                Spacer()

                Text("Score: \(userScore)")  // challenge number 1
                    .font(.title.bold())
                    .foregroundStyle(.white)

                Spacer()
            }
            .padding()

        }
        .alert(scoreTitle, isPresented: $showingScore) {
            if questionNumber < 8 {
                Button("Continue", action: askQuestion)
            } else { // challenge number 3
                Button("Play Again", action: resetGame)
            }

        } message: {
            if questionNumber < 8 {
                if scoreTitle == "Wrong" {
                    Text("That is the flag of \(countries[userAnswer])")  // challenge number 2
                } else {
                    Text("Your score is: \(userScore)")  // challenge number 1
                }
            } else { // challenge number 3
                Text("Your final score is: \(userScore)")
            }

        }
    }

    func resetGame() { // challenge number 3
        questionNumber = 0
        userScore = 0
        askQuestion()
    }

    func flagTapped(_ number: Int) {
        userAnswer = number
        if questionNumber <= 8 { // challenge number 3
            if number == correctAnswer {
                scoreTitle = "Correct"
                userScore += 1  // challenge number 1
            } else {
                scoreTitle = "Wrong"
            }
        }
        showingScore = true
    }

    func askQuestion() {
        questionNumber += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
