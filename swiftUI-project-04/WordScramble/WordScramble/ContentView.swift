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

}

#Preview {
    ContentView()
}
