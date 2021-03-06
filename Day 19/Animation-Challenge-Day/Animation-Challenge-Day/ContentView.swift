//
//  ContentView.swift
//  Animation-Challenge-Day
//
//  Created by Rahul on 31/12/21.
//

import SwiftUI

struct FlagImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State var showingScore = false
    @State var scoreTitle = ""
    
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State var correctAnswer = Int.random(in: 0...2)
    
    @State var score = 0
    
    @State var tapCount = 0
    @State var showingReset = false
    
    // Animation Challenge Related
    @State private var isCorrect = false
    @State private var isFadeOutOpacity = false
    @State private var selectedNumber = -1
    
    let maxTapCount = 8
    
    var body: some View {
        ZStack {
            
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 150, endRadius: 600).ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of country")
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .foregroundStyle(.secondary)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            withAnimation {
                                self.flagTapped(number)
                            }
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .modifier(FlagImage())
                        }
                        .rotation3DEffect(.degrees(self.isCorrect && self.selectedNumber == number ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                        .opacity(self.isFadeOutOpacity && self.selectedNumber != number ? 0.25 : 1)
                    }

                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
            
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        .alert("End of Game!!!", isPresented: $showingReset) {
            Button("Reset", action: reset)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        tapCount += 1
        
        self.selectedNumber = number
        
        if number == correctAnswer {
            scoreTitle = "Correct!"
            score += 1
            self.isCorrect = true
            self.isFadeOutOpacity = true
        } else {
            scoreTitle = "Wrong! That???s the flag of \(countries[correctAnswer])"
            
            if score != 0 {
                score -= 1
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            if tapCount == 8 {
                showingReset = true
            } else {
                showingScore = true
            }
        }
        
    }
    
    func reset() {
        tapCount = 0
        score = 0
        askQuestion()
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        self.isCorrect = false
        self.isFadeOutOpacity = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(.init(rawValue: "iPhone13"))
    }
}
