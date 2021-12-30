//
//  ContentView.swift
//  ControllingAnimationStack
//
//  Created by Rahul on 30/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var isAnimationEnabled = false
    
    var body: some View {
        Button("Tap me") {
            isAnimationEnabled.toggle()
        }
        .frame(width: 200, height: 200, alignment: .center)
        .background(isAnimationEnabled ? .blue : .red)
        .foregroundColor(.white)
        // animation - 1
        .animation(.default, value: isAnimationEnabled)
        .cornerRadius(isAnimationEnabled ? 0  : 40)
        // animation - 2
        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: isAnimationEnabled)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
