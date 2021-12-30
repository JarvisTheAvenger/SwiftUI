//
//  ContentView.swift
//  AnimatingCharacters
//
//  Created by Rahul on 30/12/21.
//

import SwiftUI

struct ContentView: View {
    let characters = Array("Hello SwiftUI")
    @State var enabled = false
    @State var dragAmount = CGSize.zero
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<characters.count) { num in
                Text(String(characters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.default.delay(Double(num) / 20), value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
