//
//  ContentView.swift
//  GradientFun
//
//  Created by Rahul on 17/12/21.
//

import SwiftUI

struct ContentView: View {
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var initialDegree: Double = 0.0
    
    var body: some View {
        AngularGradient(colors: [.red, .blue], center: .center, angle: Angle(degrees: $initialDegree.wrappedValue)).onReceive(timer) { _ in
            if initialDegree == 360 {
                initialDegree = 20
            } else {
                initialDegree += 20.0
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
