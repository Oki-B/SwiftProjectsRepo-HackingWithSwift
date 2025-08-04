//
//  Strings.swift
//  WordScramble
//
//  Created by Syaoki Biek on 25/06/25.
//

import SwiftUI

struct Strings: View {
    @State private var input: String = ""
    @State private var letters: [String] = []
    @State private var letter : String = ""
    @State private var trimmed : String = ""
    
    var body: some View {
        List {
            Section("Separate by newline") {
                ForEach(letters, id: \.self) { letter in
                    Text(letter)
                }
            }
            
            Section("Random") {
                Text(letter)
            }

            Section("Trimmed") {
                Text(trimmed)
            }


            Button("Test") {
                testStrings()
            }
        }
        
    }
    
    func testStrings() {
        let input = """
            a
            b
            c
            """
        letters = input.components(separatedBy: "\n") // it's created array from string inputed based on value of separatedBy
        letter = letters.randomElement() ?? "none" // random from letter element
        trimmed = input.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let word = "nice to mat you"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let missspelledRange = checker.rangeOfMisspelledWord(in: word,
                                                             range: range,
                                                             startingAt: 0,
                                                             wrap: false,
                                                             language: "en")
        
        print("misspelledRange: \(missspelledRange)")
        let allGood = missspelledRange.location == NSNotFound
        print(allGood)
        print(checker)
        
    }
}

#Preview {
    Strings()
}
