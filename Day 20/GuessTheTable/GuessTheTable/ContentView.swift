//
//  ContentView.swift
//  GuessTheTable
//
//  Created by Rahul on 01/01/22.
//

import SwiftUI

struct ContentView: View {
    @State var table = 2
    @State var numberOfQuestions = 5
    @State var score = 0
    
    @State var isGameOn = false
    @State var randomNumber = 1
    @State var answer = 0
    @FocusState var isKeyboardFocused : Bool
    
    @State var isAlertPresent = false
    @State var alertTitle = ""
    @State var alertMessage = ""
    
    let questionSet = [5,10,15,20]
    
    var correctAnswer : Int {
        return randomNumber * table
    }
    
    @State var questionCounter = 0
    
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
                    
                    
                    Picker("", selection: $numberOfQuestions) {
                        ForEach(questionSet, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                    
                    Button("Start Game") {
                        startGame()
                    }
                    .frame(width: 150, height: 44)
                    .background(.orange)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    .font(.title3)
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
                        
                        Button("Next") {
                            calculate()
                        }
                        .frame(width: 155, height: 44)
                        .background(.orange)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding()
                        .font(.title3)

                    }
                }
                
                Spacer()
                Spacer()
            }
            .navigationTitle("Fun Game")
            .alert(alertTitle, isPresented: $isAlertPresent, actions: {
                Button("Continue") {
                    setupQuestion()
                }
            })
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
    
    func calculate() {
        isKeyboardFocused = false
        
        if questionCounter == numberOfQuestions {
            alertTitle = "Game Finished!"
            alertMessage = "Do you want to restart game?"
            return
        }
        
        if answer == correctAnswer {
            score += 1
            alertTitle = "Correct Answer!"
            alertMessage = "Do you want to answer next question?"
            
        } else {
            if score != 0 { score -= 1 }
            alertTitle = "Wrong Answer!"
            alertMessage = "Failure is key for success, try again 🙂"
        }
        
        isAlertPresent = true
    }
    
    func startGame() {
        isGameOn = true
        setupQuestion()
    }
    
    func stopGame() {
        table = 2
        numberOfQuestions = 5
        questionCounter = 0
        randomNumber = Int.random(in: 1...10)
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
