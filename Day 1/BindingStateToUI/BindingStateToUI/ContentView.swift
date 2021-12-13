//
//  ContentView.swift
//  BindingStateToUI
//
//  Created by Rahul on 13/12/21.
//

import SwiftUI

struct ContentView: View {
    @State var name = ""
    
    var body: some View {
        Form {
            TextField("Enter your name", text: $name)
            Text("Hello \(name)")
                .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))

        
    }
}
