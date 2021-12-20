//
//  ContentView.swift
//  EnvironmentModifier
//
//  Created by Rahul on 20/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            Text("Hello, world!")
                .font(.subheadline)
            Text("Hello!")
            Text("How are you?")
            Text("fine!!!")
        }
        .font(.largeTitle)
        // Environment modifier
        // Font information flows down the view hierarchy as part of the environment, and remains in effect unless overridden at the level of an individual view or view container.
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
