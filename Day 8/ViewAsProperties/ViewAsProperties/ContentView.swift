//
//  ContentView.swift
//  ViewAsProperties
//
//  Created by Rahul on 20/12/21.
//

import SwiftUI

struct ContentView: View {
    let spells = Text("Om!!!")
    
    @ViewBuilder var computedSpells: some View {
        Text("Om")
            .foregroundColor(.mint)
        Text("Shanti")
            .foregroundColor(.blue)
    }
    
    var computedSpellsWithGroup: some View {
        Group {
            Text("Om")
                .foregroundColor(.mint)
            Text("Shanti")
                .foregroundColor(.blue)
        }
    }
    
    var body: some View {
        HStack {
            computedSpellsWithGroup
                .foregroundColor(.red)
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
