//
//  ContentView.swift
//  Moonshot
//
//  Created by Syaoki Biek on 06/08/25.
//

import SwiftUI

struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        Text(String(astronauts.count))
    }
}

#Preview {
    ContentView()
}
