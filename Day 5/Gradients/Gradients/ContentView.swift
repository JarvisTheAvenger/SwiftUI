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
//        LinearGradient(colors: [.red, .blue], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
        
//        LinearGradient(gradient: Gradient(stops: [
//            Gradient.Stop(color: .white, location: 0.45),
//            Gradient.Stop(color: .black, location: 0.55),
//        ]), startPoint: .top, endPoint: .bottom)
        
        
        RadialGradient(colors: [.red, .blue], center: .center, startRadius: 20, endRadius: 200)
            .ignoresSafeArea()                
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
