//
//  CrewMemberView.swift
//  Moonshot
//
//  Created by Syaoki Biek on 10/08/25.
//

import SwiftUI

// Moonshot: Wrap up challenge 2

struct CrewMemberView: View {
    
    struct CrewMember { // creating nested struct to merge data
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in // can be called for merging the data on one view
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(
                                            .white,
                                            lineWidth: 1
                                        )
                                )

                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)

                                Text(crewMember.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) { // init the nested struct
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let mission : [Mission] = Bundle.main.decode("missions.json")
    let astronauts : [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return CrewMemberView(mission: mission[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
