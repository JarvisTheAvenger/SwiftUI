//
//  ContentView.swift
//  AppStoragePropertyWrapper
//
//  Created by Rahul on 02/01/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("tapCount") var tapCount = 1
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Tap count \(tapCount)")
            
            Button("Increase tap count") {
                tapCount += 1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
