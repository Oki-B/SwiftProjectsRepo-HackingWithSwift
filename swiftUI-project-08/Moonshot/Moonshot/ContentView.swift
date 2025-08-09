//
//  ContentView.swift
//  Moonshot
//
//  Created by Syaoki Biek on 06/08/25.
//

import SwiftUI

struct ContentView: View {
//    let astronauts = Bundle.main.decode("astronauts.json")
    // while using generic function we need to define the type annotation
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let mission: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        Text(String(astronauts.count))
    }
}

#Preview {
    ContentView()
}
