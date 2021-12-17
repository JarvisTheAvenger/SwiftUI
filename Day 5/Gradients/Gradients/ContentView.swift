//
//  ContentView.swift
//  Gradients
//
//  Created by Rahul on 17/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Linear gradient goes in one direction
        LinearGradient(colors: [.red, .blue], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
