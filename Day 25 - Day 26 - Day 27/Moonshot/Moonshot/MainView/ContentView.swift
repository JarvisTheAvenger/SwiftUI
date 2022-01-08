//
//  ContentView.swift
//  Moonshot
//
//  Created by Rahul on 06/01/22.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State var isShowingGrid = false
    
    var body: some View {
        NavigationView {
            Group {
                if isShowingGrid {
                    GridLayout(astronauts: astronauts, missions: missions)
                } else {
                    ListLayout(astronauts: astronauts, missions: missions)
                }
            }
            .preferredColorScheme(.dark)
            .background(.darkBackground)
            .navigationTitle("Moonshot")
            .toolbar {
                Button("Switch View") {
                    isShowingGrid.toggle()
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
