//
//  Grandients.swift
//  GuessTheFlag
//
//  Created by Syaoki Biek on 01/06/25.
//

import SwiftUI

struct Grandients: View {
    var body: some View {
        VStack {
            LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
            
            LinearGradient(stops: [ // using stop to control the gradient
                Gradient.Stop(color: .white, location: 0.45),
                .init(color: .black, location: 0.55) // can also using init since swift already that it's a stop
            ], startPoint: .top, endPoint: .bottom)
            
            RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
            
            AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
            
            Text("Your content")
                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 150)
                .foregroundStyle(.white)
                .background(.indigo.gradient) // creating a very smooth gradient automatically from the based color
        }

    }
}

#Preview {
    Grandients()
}
