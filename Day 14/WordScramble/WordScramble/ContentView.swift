//
//  ContentView.swift
//  WordScramble
//
//  Created by Rahul on 26/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        let places = ["Ooty", "Mahabaleshwar", "Shimla", "Manali", "Mysore"]
        
        NavigationView {
            List(places, id: \.self) {
                Text("\($0)")
            }
            .listStyle(.grouped)
            .navigationTitle("List")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
