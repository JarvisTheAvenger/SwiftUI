//
//  ContentView.swift
//  Binding
//
//  Created by Rahul on 17/01/22.
//

import SwiftUI

struct CustomButton: View {
    @Binding var isOn: Bool

    
    var body: some View {
        Button("Remember me") {
            isOn.toggle()
        }
        .padding()
        .clipShape(Capsule())
        .background(isOn ? .red : .gray)
        .foregroundColor(.white)
    }
}

struct ContentView: View {
    @State var rememberMe = false
    
    var body: some View {
        VStack {
            CustomButton(isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
