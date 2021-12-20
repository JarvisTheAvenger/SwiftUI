//
//  ContentView.swift
//  ViewCompositions
//
//  Created by Rahul on 20/12/21.
//

import SwiftUI

struct CustomText: View {
    var title: String
    
    var body: some View {
        Text(title)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .font(.title)
            .clipShape(Capsule())
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            CustomText(title: "Hello, world!")
            CustomText(title: "Hiii")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
