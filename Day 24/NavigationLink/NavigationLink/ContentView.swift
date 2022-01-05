//
//  ContentView.swift
//  NavigationLink
//
//  Created by Rahul on 05/01/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            List(1..<100) { row in
                NavigationLink {
                   Text("Detail View \(row)")
                } label: {
                    Text("Row \(row)")
                }
            }
            .navigationTitle("Navigation Link")

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
