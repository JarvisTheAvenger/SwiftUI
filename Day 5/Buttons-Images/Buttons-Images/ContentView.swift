//
//  ContentView.swift
//  Buttons-Images
//
//  Created by Rahul on 17/12/21.
//

import SwiftUI

struct ContentView: View {
    @State var isAlertShown = false
    
    var body: some View {
        VStack {
            Button("Button 1") { }
            .buttonStyle(.bordered)
            
            Button("Button 2", role: .destructive) { }
            .buttonStyle(.bordered)
            
            Button("Button 3") { }
            .buttonStyle(.borderedProminent)
            .tint(.yellow)
            
            Button("Button 4", role: .destructive) { }
            .buttonStyle(.borderedProminent)
            
            Button("See something interesting!!!", action: showSomethingInteresting)
                .frame(width: 300.0, height: 40.0, alignment: .center)
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            
            Button {
                print("Button was tapped")
            } label: {
                Label("Edit", systemImage: "pencil")
                    .frame(width: 100, height: 44, alignment: .center)
                    .tint(.white)
                    .background(.red)
                    .cornerRadius(10)
            }
            
            Button("Show Alert") {
                isAlertShown = true
            }
            .alert("Important message", isPresented: $isAlertShown) {
                Button("Cancel", role: .cancel) { }
                Button("Delete", role: .destructive) { }
                Button("None", role: .none) { }
                
            } message: {
                Text("Please read this")
            }
            
        }
        
    }
    
    func showSomethingInteresting() {
        print("interesting!!!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
