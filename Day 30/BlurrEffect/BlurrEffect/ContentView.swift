//
//  ContentView.swift
//  BlurrEffect
//
//  Created by Rahul on 11/01/22.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = 0.0

    
    var body: some View {
        VStack {
            Image("rahul")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(amount)
                .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
