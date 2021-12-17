//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Rahul on 17/12/21.
//

import SwiftUI

struct ContentView: View {
   @State var colorState = false
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 0) {
                colorState ? Color.green: Color.blue
                colorState ? Color.blue: Color.green
            }

            Text("Tap me to switch color")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
                .onTapGesture {
                    colorState.toggle()
                }
        }
        .ignoresSafeArea()
        
  
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
