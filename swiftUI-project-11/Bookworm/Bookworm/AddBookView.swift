//
//  AddBookView.swift
//  Bookworm
//
//  Created by Syaoki Biek on 13/09/25.
//

import SwiftUI

// For wrap-up Challenge 1
extension String {
    var isEmptyOrWhitespace: Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var rating: Int = 3
    @State private var genre: String = "Fantasy"
    @State private var review: String = ""
    
    // For wrap-up Challenge 1
    private var isDisabled: Bool {
        !title.isEmptyOrWhitespace && !author.isEmptyOrWhitespace && !review.isEmptyOrWhitespace
    }
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating, date: Date.now)
                        modelContext.insert(newBook)
                        dismiss()
                        
                    }
                    .disabled(!isDisabled) // For wrap-up Challenge 1
                }
            }
            .navigationTitle("Add book")
        }
    }
}

#Preview {
    AddBookView()
}
