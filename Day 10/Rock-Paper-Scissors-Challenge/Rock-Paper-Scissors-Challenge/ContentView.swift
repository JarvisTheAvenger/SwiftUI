//
//  ContentView.swift
//  Rock-Paper-Scissors-Challenge
//
//  Created by Rahul on 22/12/21.
//

import SwiftUI

// button design
struct ButtonDesign: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 100, height: 70, alignment: .center)
            .foregroundColor(.white)
            .background(Color.black)
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .cornerRadius(15)
    }
}

extension View {
    func buttonDesign() -> some View {
        modifier(ButtonDesign())
    }
}

struct ContentView: View {

    var options = ["Rock", "Paper", "Scissors"]
    @State private var shouldWin = false
    @State private var score = 0
    @State private var choice = "Rock"

    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var roundCount = 0
    @State private var roundCountView = false

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black, Color(.systemTeal)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)

            VStack {

                VStack(spacing: 20) {
                    Text("Next round you must")
                    Text(shouldWin ? "Win".uppercased() : "Loose".uppercased())
                        .font(.title)
                        .fontWeight(.bold)
                }
                .foregroundColor(.white)

                Spacer()
                // Rock selection button
                HStack(spacing: 20) {
                    Button(action: {
                        rockWasSelected()
                    }) {
                        Text("\(options[0])")
                            .buttonDesign()
                    }
                    // Paper selection
                    Button(action: {
                        paperWasSelected()
                    }) {
                        Text("\(options[1])")
                            .buttonDesign()
                    }
                    // Scissors selection
                    Button(action: {
                        scissorsWasSelected()
                    }) {
                        Text("\(options[2])")
                            .buttonDesign()
                    }
                }
                Spacer()

                Text(roundCountView ? "Score \(score)" : "")
                    .font(.title)
                    .foregroundColor(.black)
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(roundCountView ? "GAME OVER!" : alertTitle), message: Text("Siri picked \(choice)"), dismissButton: .default(Text(roundCountView ? "Click for next game" : "Next round")){
                nextRound()
            })
        }
    }

    // start a new round and restart the whole game
    func nextRound() {
        choice = options[Int.random(in: 0...2)]
        shouldWin = Bool.random()
        roundCount += 1
        if roundCount < 11 {
            roundCountView = false
        } else {
            roundCountView = true
            roundCount = 0
        }
    }

    // game logic when Rock is selected
    func rockWasSelected() {
        if choice == options[2] && shouldWin || choice == options[1] && !shouldWin {
            score += 1
            alertTitle = "You Won :)"
        } else if choice == options[0] && shouldWin || choice == options[0] && !shouldWin {
            score += 0
            alertTitle = "We're equal :/"
        } else {
            score -= 1
            alertTitle = "You lost :("
        }
        showingAlert = true
    }

    // game logic when Paper is selected
    func paperWasSelected() {
        if choice == options[0] && shouldWin || choice == options[2] && !shouldWin {
            score += 1
            alertTitle = "You Won :)"
        } else if choice == options[1] && shouldWin || choice == options[1] && !shouldWin {
            score += 0
            alertTitle = "We're equal :/"
        } else {
            score -= 1
            alertTitle = "You lost :("
        }
        showingAlert = true
    }

    // game logic when Scissors is selected
    func scissorsWasSelected() {
        if choice == options[1] && shouldWin || choice == options[0] && !shouldWin {
            score += 1
            alertTitle = "You Won :)"
        } else if choice == options[2] && shouldWin || choice == options[2] && !shouldWin {
            score += 0
            alertTitle = "We're equal :/"
        } else {
            score -= 1
            alertTitle = "You lost :("
        }
        showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
