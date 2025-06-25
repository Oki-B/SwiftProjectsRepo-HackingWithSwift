//
//  AddToList.swift
//  WordScramble
//
//  Created by Syaoki Biek on 25/06/25.
//

import SwiftUI

struct AddToList: View {
    @State private var usedWord = [String]()
    @State private var rootWord: String = ""
    @State private var newWord: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never) // to prevent auto capitalize on textfield
                }
                
                Section {
                    ForEach(usedWord, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle") // utilize sf symbol to make character count state
                            Text(word)
                        }
                        
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
        }
    }
    
    func addNewWord() {
        let word = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard word.count > 0 else {
            return
        }
        
        // extra validation
        withAnimation { // add simple animation for element
            usedWord.insert(word, at: 0) // insert new word at first index
        }
        newWord = "" // reset new word
        
    }
}

#Preview {
    AddToList()
}
