//
//  GameSettingsSectionView.swift
//  Challenge_03
//
//  Created by Syaoki Biek on 05/09/25.
//

import SwiftUI

struct GameSettingsSectionView: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        Section(
            header: Text("⚙️ Game Settings"),
            footer: Text("Set difficulty level and total question")
        ) {
            Stepper(value: $viewModel.multiplicationTable, in: 2...12) {
                HStack {
                    Text("Multiplication of :")
                    Spacer()
                    Text("\(viewModel.multiplicationTable)")
                        .font(.headline)
                        .foregroundStyle(.blue)
                        .padding(.trailing, 5)
                }
            }

            Picker("Total Question", selection: $viewModel.totalQuestion) {
                ForEach(5...20, id: \.self) { value in
                    if value % 5 == 0 { Text("\(value)") }
                }
            }
            .pickerStyle(.menu)
        }
        .disabled(viewModel.isFormDisabled)
        .padding(.vertical, 3)
        .listRowBackground(Color.gray.opacity(0.05))
    }
}

#Preview {
    GameSettingsSectionView(viewModel: ViewModel())
}

