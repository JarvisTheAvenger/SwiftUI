//
//  ContentView.swift
//  GuessTheTable
//
//  Created by Rahul on 01/01/22.
//

import SwiftUI

struct CustomButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 150, height: 44)
            .background(.orange)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
            .font(.title3)
        
    }
}

extension View {
    func buttonStyle() -> some View {
        return modifier(CustomButtonModifier())
    }
}

struct ContentView: View {
    @State var table = 2
    @State var score = 0
    
    @State var isGameOn = false
    @State var randomNumber = 1
    @State var answer = 0
    
    @State var isAlertPresent = false
    @State var alertTitle = ""
    @State var alertMessage = ""
    
    @State var questionCounter = 1
    @State var maxQuestions = 5
    
    @FocusState var isKeyboardFocused : Bool
    
    let questionSet = [5,10,15,20]
    
    var correctAnswer : Int {
        return randomNumber * table
    }
    
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                Spacer()
                
                if !isGameOn {
                    Text("Choose Table")
                        .padding()
                        .font(.title2)
                        .foregroundColor(.orange)
                    
                    Stepper("\(table)'s table", value: $table, in: 2...12)
                        .padding()
                    
                    Text("How many questions?")
                        .padding()
                        .font(.title2)
                        .foregroundColor(.orange)
                    
                    
                    Picker("", selection: $maxQuestions) {
                        ForEach(questionSet, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                    
                    Button("Start Game") {
                        startGame()
                    }
                    .buttonStyle()
                }
                
                if isGameOn {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("What is \(table) * \(randomNumber) ?")
                            .padding()
                            .font(.largeTitle)
                            .foregroundColor(.orange)
                        
                        
                        TextField("Enter your answer", value: $answer, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                            .keyboardType(.numberPad)
                            .font(.body)
                            .focused($isKeyboardFocused)
                    }
                    .alert(alertTitle, isPresented: $isAlertPresent, actions: {
                        Button(questionCounter <= maxQuestions ? "Continue": "Restart Game") {
                            questionCounter <= maxQuestions ? setupQuestion() : stopGame()
                        }
                    }, message: {
                        Text(alertMessage)
                    })
                }
                
                Spacer()
                Spacer()
            }
            .navigationTitle("Fun Game")
            .toolbar {
                ToolbarItem {
                    if isGameOn {
                        Text("Score: \(score)")
                            .foregroundColor(.orange)
                            .bold()
                    }
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Submit") {
                        calculate()
                    }
                }
            }
            
            
        }

    }
    
    func askToRestartGame() {
        alertTitle = "Game Finished!"
        alertMessage = "Do you want to restart game?"
        
        isAlertPresent = true
    }
    
    func calculate() {
        isKeyboardFocused = false
        isAlertPresent = true
        
        questionCounter += 1
        
        if answer == correctAnswer {
            score += 1
            alertTitle = "Correct Answer!"
            alertMessage = "Keep going on!!!"
            
        } else {
            if score != 0 { score -= 1 }
            alertTitle = "Wrong Answer!"
            alertMessage = "Failure is key for success, try again 🙂"
        }
        
    }
    
    func startGame() {
        isGameOn = true
        setupQuestion()
    }
    
    func stopGame() {
        table = 2
        maxQuestions = 5
        questionCounter = 0
        isGameOn = false
    }
    
    func setupQuestion() {
        randomNumber = Int.random(in: 1...10)
        answer = 0
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
