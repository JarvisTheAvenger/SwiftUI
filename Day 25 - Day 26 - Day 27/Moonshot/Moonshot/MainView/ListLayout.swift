//
//  ListLayout.swift
//  Moonshot
//
//  Created by Rahul on 08/01/22.
//

import SwiftUI

struct ListLayout: View {
    let astronauts : [String: Astronaut]
    let missions : [Mission]
    
    var body: some View {
        List(missions, id: \.id) { mission in
            NavigationLink {
                MissionView(mission: mission, astronauts: astronauts)
            } label: {
                
                HStack(alignment: .center) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        
                        if mission.formattedLaunchDate != "N/A" {
                            Text(mission.formattedLaunchDate)
                                .padding(.top)
                        }
                    }
                }
                
            }
            
        }

    }
}

struct ListLayout_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        ListLayout(astronauts: astronauts, missions: missions)
    }
}
