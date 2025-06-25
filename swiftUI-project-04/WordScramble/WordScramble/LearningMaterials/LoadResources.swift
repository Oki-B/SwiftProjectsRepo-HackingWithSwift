//
//  LoadResources.swift
//  WordScramble
//
//  Created by Syaoki Biek on 25/06/25.
//

import SwiftUI

struct LoadResources: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func testBundles() {
        if let fileURL = Bundle.main.url(forResource: "words", withExtension: "txt") {
            if let fileContens = try? String(contentsOf: fileURL ,encoding: .utf8) {
                // load the file into a string!
            }
        }
    }
}

#Preview {
    LoadResources()
}
