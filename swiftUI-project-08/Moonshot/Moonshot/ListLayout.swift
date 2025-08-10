//
//  ListLayout.swift
//  Moonshot
//
//  Created by Syaoki Biek on 10/08/25.
//

import SwiftUI

struct ListLayout: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]

    var body: some View {
            List {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(
                            mission: mission,
                            astronauts: astronauts
                        )
                    } label: {
                        HStack(spacing: 20) {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                
                            VStack(alignment: .leading, spacing: 6) {
                                Text(mission.displayName)
                                    .font(.title2.bold())
                                    .foregroundStyle(.white)

                                Text(mission.formattedLaunchDate)
                                    .font(.subheadline)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                            
                            
                        }
                    }
                    .listRowSeparator(.visible)
                    .padding(.horizontal)
                }
                .listRowBackground(Color.darkBackground)
            }
            .listStyle(.plain)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    return ListLayout(astronauts: astronauts, missions: missions)
        .background(.darkBackground)
        .preferredColorScheme(.dark)
}
