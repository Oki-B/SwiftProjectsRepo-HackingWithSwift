//
//  NavigationPathUsingCodable.swift
//  Navigation
//
//  Created by Syaoki Biek on 30/08/25.
//

import SwiftUI

@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    // create variable to store data on directory
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        // check the data on intiation
        if let data = try? Data(contentsOf: savePath) { // check on the path directory
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) { // check if there is a data can be decoded
                path = NavigationPath(decoded) // assign the decoded data to the vatiable
                return
            }
        }
        
        // if there are no data then start from assignning new annotation data
        path = NavigationPath()
    }
    
    func save() { // create function to save data
        guard let representation = path.codable else { return } // if there asre any codable data first
        
        do {
            let data = try JSONEncoder().encode(representation) // if it's there then encode the data representation
            try data.write(to: savePath) // write the encoded data to new intiation directory
        } catch {
            print("Faild to save navigation data")
        }
    }
}

struct ChildrenView: View {
    var number: Int
//    @Binding var path: [Int]
    
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
    }
}

struct NavigationPathUsingCodable: View {
    @State private var pathStore = PathStore() // passing the directory stored data to creata a navigation path data for view
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            ChildrenView(number: 0)
                .navigationDestination(for: Int.self) { i in
                        ChildrenView(number: i)
                }
        }
    }
}

#Preview {
    NavigationPathUsingCodable()
}
