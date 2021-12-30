//
//  ContentView.swift
//  CustomTransitionModifier
//
//  Created by Rahul on 30/12/21.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: .topLeading)
            .clipped()
    }
}

extension AnyTransition {
    static var pivote : AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct ContentView: View {
    @State private var isShowingRedRectangle = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 300)
            
            if isShowingRedRectangle {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 300)
                    .transition(.pivote)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRedRectangle.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
