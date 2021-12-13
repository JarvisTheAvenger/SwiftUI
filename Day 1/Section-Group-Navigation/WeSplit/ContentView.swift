//
//  ContentView.swift
//  WeSplit
//
//  Created by Rahul on 13/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            Form  {
                Section {
                    Text("Hello World!!!")
                }
            }
            .navigationTitle("Swift UI")
            .navigationBarTitleDisplayMode(.inline)
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
                .previewDisplayName("iPhone 12 Pro Max")
        }
    }
}
