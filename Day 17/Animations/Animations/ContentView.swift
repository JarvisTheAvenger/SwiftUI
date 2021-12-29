//
//  ContentView.swift
//  Animations
//
//  Created by Rahul on 29/12/21.
//

import SwiftUI

struct ContentView: View {
    @State var animationAmount = 1.0
    
    var body: some View {
        
  // 1. implicit animation
        /*
         Button("Tap me") {
         animationAmount += 1.0
         }
         .padding(50)
         .background(.red)
         .foregroundColor(.white)
         .clipShape(Circle())
         .scaleEffect(animationAmount)
         .animation(.easeIn(duration: 2.0).delay(1), value: animationAmount)
         
         */
        
  // 2. Spring animation
        /*
         Button("Tap me") {
         animationAmount += 1.0
         }
         .padding(50)
         .background(.red)
         .foregroundColor(.white)
         .clipShape(Circle())
         .blur(radius: (animationAmount - 1) * 3)
         .scaleEffect(animationAmount)
         .animation(.interpolatingSpring(stiffness: 50.0, damping: 1.0), value: animationAmount)
         */
        
 // 3. Overlay
        
        /*
        
        Button("Tap me") {
            // some code
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay {
            Circle()
                .stroke(Color.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeOut(duration: 1)
                        .repeatForever(autoreverses: false),
                    value: animationAmount
                )
        }
        .onAppear {
            animationAmount = 2
        }
         
    */
    
 // 4. Animating Bindings
        VStack {
            Stepper("Stepper",
                    value: $animationAmount.animation(
                        .easeOut(duration: 0.75)
                            .repeatCount(3, autoreverses: true)
                    ), in: 1...10)
                .padding()
            
            Spacer()
            
            Button("Tap me") {
                animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
        

        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
