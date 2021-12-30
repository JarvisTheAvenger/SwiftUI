//
//  ContentView.swift
//  AnimatingGesture
//
//  Created by Rahul on 30/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
            .frame(width: 280, height: 180, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .offset(dragAmount)
            .gesture(
             DragGesture()
                .onChanged {
                    dragAmount = $0.translation
                }
                .onEnded({ _ in
                    // 1. Explicit animation to animate only release of the view
                    withAnimation(.interpolatingSpring(stiffness: 10, damping: 1)) {
                        dragAmount = .zero
                    }
                    
                })
            )
            // 2. Implicit animation for animating complete drag and release
            // .animation(.spring(), value: dragAmount)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
