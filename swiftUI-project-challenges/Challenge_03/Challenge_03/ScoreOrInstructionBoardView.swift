//
//  ScoreOrInstructionBoardView.swift
//  Challenge_03
//
//  Created by Syaoki Biek on 05/09/25.
//

import SwiftUI

struct ScoreOrInstructionBoardView: View {
    let isCalculated: Bool
    let finalScore: Int
    
    var body: some View {
        VStack(alignment: .center) {
            if isCalculated {
                VStack {
                    Text("YOUR SCORE")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.secondary)
                    Text(
                        "\(finalScore)"
                    )
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
    }
}

#Preview {
    ScoreOrInstructionBoardView(isCalculated: true, finalScore: 60)
}
