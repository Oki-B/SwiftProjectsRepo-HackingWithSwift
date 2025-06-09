//
//  ConditionalModifiers.swift
//  ViewsAndModifiers
//
//  Created by Syaoki Biek on 01/06/25.
//

import SwiftUI

/*
 we can create conditional modifier using ternary conditional operator. Scott Michaud's helpful mnemonic is
 W => What do you want to check
 ?
 T => True
 or
 F => False
 code looks -> condition ? option1 : option2
 */

struct ConditionalModifiers: View {
    @State private var useRedText: Bool = false
    @State private var useBlueText: Bool = false
    var body: some View {
        VStack(spacing: 30) {
            
            // ternary can help us write our code more shorter and clean
            Button("Hello, world!") {
                useRedText.toggle()
            }
            .foregroundStyle(useRedText ? .red : .blue)
            
            // take a look of a case when we use regular if else condition operator
            if useBlueText {
                Button("Hello, world!") {
                   useBlueText.toggle()
                }.foregroundStyle(.blue)
            } else {
                Button("Hello, world!") {
                    useBlueText.toggle()
                }.foregroundStyle(.red)
            }
            // it might look same by the result but actually less efficient, Sometimes using if statements are unavoidable, but where possible prefer to use the ternary operator instead.
        }

    }
}

#Preview {
    ConditionalModifiers()
}
