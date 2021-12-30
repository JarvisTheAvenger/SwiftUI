//
//  ContentView.swift
//  Show-Hide-Views-Animation
//
//  Created by Rahul on 30/12/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingRedRectangle = false
    
    var body: some View {
        VStack {
            Button("Tap me") {
                withAnimation {
                    isShowingRedRectangle.toggle()
                }
            }
            
            if isShowingRedRectangle {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 300)
                   // .transition(.scale)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
