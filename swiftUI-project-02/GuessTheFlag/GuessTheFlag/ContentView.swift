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

// Challenge -> Go back to project 2 and replace the Image view used for flags with a new FlagImage() view that renders one flag image using the specific set of modifiers we had.

// Go back to the Guess the Flag project and add some animation:

//When you tap a flag, make it spin around 360 degrees on the Y axis.
//Make the other two buttons fade out to 25% opacity.
//Add a third effect of your choosing to the two flags the user didn’t choose – maybe make them scale down? Or flip in a different direction? Experiment!

struct FlagImage: View { // from materi view composition
    var country: String
    var body: some View {
        Image(country)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

//struct FlagTappedAnimation: ViewModifier {
//    @State private var amount: Double
//    @State private var opacity: Double
//    
//    func body(content: Content) -> some View {
//        content
//            .opacity(opacity)
//            .rotation3DEffect(
//                .degrees(amount), axis: (x: 0, y: 1, z: 0)
//            )
//    }
//}

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
    @State private var questionNumber = 1  // for challenge number 3
    
    @State private var angle: [Angle] = [.zero, .zero, .zero]
    @State private var isChoosed: [Bool] = [false, false, false]
    @State private var opacity = 1.0
    @State private var animation: Animation? = .easeInOut
    @State private var scale: CGFloat = 1.0

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
                            animation = .easeInOut
                            withAnimation {
                                angle[number] = .degrees(360)
                            }
                        } label: {
                            /*
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                             */
                            FlagImage(country: countries[number])  // change the image with use new view
                                .scaleEffect(isChoosed[number] ? 1 : scale)
                                .animation(.spring(duration: 0.6, bounce: 0.6), value: scale)
                        
                                .rotation3DEffect(angle[number], axis: (x: 0, y: 1, z: 0))
                                .opacity(isChoosed[number] ? 1 : opacity)
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
            } else {  // challenge number 3
                Button("Play Again", action: resetGame)
            }

        } message: {
            if questionNumber < 8 {
                if scoreTitle == "Wrong" {
                    Text("That is the flag of \(countries[userAnswer])")  // challenge number 2
                } else {
                    Text("Your score is: \(userScore)")  // challenge number 1
                }
            } else {  // challenge number 3
                Text("Your final score is: \(userScore)")
            }

        }
    }

    func resetGame() {  // challenge number 3
        questionNumber = 0
        userScore = 0
        askQuestion()
        angle = [.zero, .zero, .zero]
        animation = nil
        scale = 1
        opacity = 1
    }

    func flagTapped(_ number: Int) {
        isChoosed[number] = true
        opacity = 0.25
        scale = 0.8
        userAnswer = number
        if questionNumber <= 8 {  // challenge number 3
            if number == correctAnswer {
                scoreTitle = "Correct"
                userScore += 1  // challenge number 1
            } else {
                scoreTitle = "Wrong"
            }
        }
        // creating delay with que
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            showingScore = true
        }
       
    }

    func askQuestion() {
        questionNumber += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        angle = [.zero, .zero, .zero]
        isChoosed = Array(repeating: false, count: 3)
        opacity = 1
        scale = 1
        animation = nil
    }
}

#Preview {
    ContentView()
}
