//
//  ActionButton.swift
//  Challenge_03
//
//  Created by Syaoki Biek on 03/09/25.
//

import SwiftUI

struct ActionButton: View {
    var action: () -> Void
    var labelText: String
    @Environment(\.isEnabled) var isEnabled: Bool

    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Rectangle()
                    .fill(isEnabled ? Color.blue : Color.gray.opacity(0.2))
                    .cornerRadius(16)

                Text(labelText)
                    .font(.headline)
                    .foregroundStyle(.white)

            }
            .frame(maxWidth: .infinity, maxHeight: 50)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    ActionButton(action: {}, labelText: "Start")
}
