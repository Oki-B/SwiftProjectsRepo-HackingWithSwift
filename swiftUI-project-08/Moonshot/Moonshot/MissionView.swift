//
//  MissionView.swift
//  Moonshot
//
//  Created by Syaoki Biek on 09/08/25.
//

import SwiftUI

struct divider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

struct MissionView: View {
    let mission: Mission
    let astronauts: [String: Astronaut]

    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                
                // Moonshot: Wrap up Challenge 1
                Text(mission.launchDate?.formatted(date: .complete, time: .omitted) ?? "N/A")
                    .font(.headline)
                    .padding(.top)
                    
            
                VStack(alignment: .leading) {
                    divider()
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)

                    Text(mission.description)
                    
                    divider()
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)

                CrewMemberView(mission: mission, astronauts: astronauts)

            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }


}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    return MissionView(mission: missions[2], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
