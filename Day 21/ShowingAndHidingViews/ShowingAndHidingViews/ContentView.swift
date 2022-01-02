//
//  ContentView.swift
//  ShowingAndHidingViews
//
//  Created by Rahul on 02/01/22.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    var name: String
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Hello \(name)")
            Button("Good bye!") {
                dismiss()
            }
        }
    }
}

struct ContentView: View {
    @State var isShowingSheet = false
    
    var body: some View {
        Button("Greet me!") {
            isShowingSheet.toggle()
        }.sheet(isPresented: $isShowingSheet) {
            SecondView(name: "Rahul")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
