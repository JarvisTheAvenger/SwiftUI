//
//  MissionView.swift
//  Moonshot
//
//  Created by Rahul on 07/01/22.
//

import SwiftUI

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct MissionView: View {
    let mission: Mission
    let crew : [CrewMember]
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width*0.6, height: 200)
                    .padding(.top)
                
                VStack(alignment: .leading) {
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
               
                    SeparatorView()
                    
                    if mission.formattedLaunchDate != "N/A" {
                        Text("Launch date: \(mission.formattedLaunchDate)")
                            .padding(.bottom, 8)
                            .font(.headline)
                    }
                    
                    Text(mission.description)
                    
                    SeparatorView()
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)

                CrewView(crew: crew)
            }
            .padding(.bottom)
        }
        .navigationTitle("Mission Detail")
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
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

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        MissionView(mission: missions[1], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
