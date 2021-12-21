//
//  ContentView.swift
//  ChallengeDay-ViewModifiers
//
//  Created by Rahul on 21/12/21.
//

import SwiftUI

struct CustomViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func customView() -> some View {
        modifier(CustomViewModifier())
    }
}


struct ContentView: View {
    var body: some View {
        Text("Hello world!!!")
            .customView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
