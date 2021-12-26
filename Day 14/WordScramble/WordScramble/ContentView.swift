//
//  ContentView.swift
//  WordScramble
//
//  Created by Rahul on 26/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            List {
                Section("Section 1") {
                    Text("Static row 1")
                    Text("Static row 2")
                }
                .textCase(nil)
               
                Section("Section 2") {
                    ForEach(0..<5) {
                        Text("Dynamic row - \($0)")
                    }
                }
                .textCase(nil)

                Section("Section 3") {
                    Text("Static row 3")
                    Text("Static row 4")
                    Text("Static row 5")
                }
                .textCase(nil)

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
