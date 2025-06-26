//
//  ContentView.swift
//  WordScramble
//
//  Created by Syaoki Biek on 25/06/25.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWord = [String]()
    @State private var rootWord: String = ""
    @State private var newWord: String = ""
    
    @State private var errorTitle: String = ""
    @State private var errorMessage: String = ""
    @State private var showingError: Bool = false

    var body: some View {

        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)  // to prevent auto capitalize on textfield
                }

                Section {
                    ForEach(usedWord, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")  // utilize sf symbol to make character count state
                            Text(word)
                        }

                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK") { }
            } message: { Text(errorMessage) }
        }
    }

    func addNewWord() {
        let word = newWord.lowercased().trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        guard word.count > 0 else {
            return
        }

        // extra validation
        // validation for duplicated word
        guard isOriginal(word: word) else {
            wordError(title: "Duplicate Word", message: "You have already used this word")
            return
        }
        
        // validation for possible word from the available letters
        guard isPossible(word: word) else {
            wordError(title: "Invalid Word", message: "Word ust be possible to be spell from '\(rootWord)'!")
            return
        }
        
        // validation for is the word is an real english word
        guard isReal(word: word) else {
            wordError(title: "Invalid Word", message: "Word '\(word)' is not in english dictionary!")
            return
        }
        
        withAnimation {  // add simple animation for element
            usedWord.insert(word, at: 0)  // insert new word at first index
        }
        newWord = ""  // reset new word

    }
    
    func startGame() {
        // try to load file from bundle
        if let startWordURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // try to get content from file
            if let startWords = try? String(contentsOf: startWordURL, encoding: .utf8) {
                // seperate all words from content
                let allWords = startWords.components(separatedBy: "\n")
                
                // create random element from the separated word
                rootWord = allWords.randomElement() ?? "Asimelekete"
                
                // return all the load
                return
            }
        }
        
        // if we get here, then the apps failed to load. use Fatal error to trigger and error report
        fatalError("Could not load start.txt from bundle")
    }
    
    // check if the word is already use
    func isOriginal(word: String) -> Bool {
        !usedWord.contains(word)
    }
    
    // check if the word is possible with the letter available in the word
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        // loop to check and remove each letter used
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    // check whether the word is a real words
    func isReal(word: String) -> Bool {
        // check spelling using UI Text Checker
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let missSpelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return missSpelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }

}

#Preview {
    ContentView()
}
