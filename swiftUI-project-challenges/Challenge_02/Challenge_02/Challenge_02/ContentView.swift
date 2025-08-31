//
//  ContentView.swift
//  Challenge_02
//
//  Created by Syaoki Biek on 05/06/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()

    var body: some View {
        VStack {
            Text("Focus Game")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(viewModel.round == 10 ? .white : viewModel.score == 10 ? .green :.red)
                .padding(40)
//            Text("Round : \(round + 1)")
            
            ZStack(alignment: .top) {
                Rectangle()
                    .fill(Color.blue)
                    .cornerRadius(40)
                    .frame(width: 320, height: 320)

                Rectangle()
                    .fill(Color.white)
                    .opacity(0.9)
                    .cornerRadius(40)
                    .padding(10)
                    .frame(width: 320, height: 320)
                    .shadow(radius: 5)

                ZStack {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 185, height: 100)
                        .cornerRadius(20)

                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 170, height: 85)
                        .cornerRadius(20)
                    VStack {
                        Text("How can you :")
                            .foregroundStyle(Color.blue)
                        Text(viewModel.shouldWin ? "Win" : "Lose")
                            .font(.system(size: 48))
                    }

                }
                .padding(-20)

                Text(viewModel.moves[viewModel.appMove])
                    .font(.system(size: 150))
                    .padding(.top, 100)
            }
            .padding(20)

            VStack(spacing: 30) {
                Text("Pick your move:")
                    .font(.title)

                HStack {
                    ForEach(0..<viewModel.moves.count, id: \.self) { move in
                        Button {
                            viewModel.checkMove(move)
                        } label: {
                            Text(viewModel.moves[move])
                                .font(.system(size: 50))
                                .padding(10)
                        }
                        .buttonBorderShape(.circle)
                        .buttonStyle(.borderedProminent)
                        .shadow(radius: 5)
                    }
                }
                
                Text("Your Score: \(viewModel.score)")
                    .font(.title2)
                    .bold()
            }
            
            .alert(viewModel.alertTitle, isPresented: $viewModel.showScore) {
                if viewModel.round == 10 {
                    Button("Play Again") {
                        viewModel.resetGame()
                    }
                } else {
                    Button("Next Round") {
                        viewModel.newGame()
                    }
                }
            } message: {
                if viewModel.round == 10 {
                    Text("You final socre is \(viewModel.score).")
                }
            }
            .padding()
            
            Spacer()
                
                
        }
        .frame(maxWidth: .infinity)
        .background(viewModel.round == 10 ? .red.opacity(0.7) : .white)

    }
    
}

#Preview {
    ContentView()
}
