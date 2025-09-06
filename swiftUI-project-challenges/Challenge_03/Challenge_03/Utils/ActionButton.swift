//
//  ActionButton.swift
//  Challenge_03
//
//  Created by Syaoki Biek on 03/09/25.
//

import SwiftUI

enum TextButton {
    case start
    case restart
    case calculate

    var content: String {
        switch self {
        case .start:
            return "Start Round"
        case .restart:
            return "Try Another Round"
        case .calculate:
            return "Submit Answers"
        }
    }

}

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
    let labelText = TextButton.calculate.content
    return ActionButton(action: {}, labelText: labelText)
}
