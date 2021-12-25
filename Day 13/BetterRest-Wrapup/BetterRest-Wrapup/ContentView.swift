//
//  ContentView.swift
//  BetterRest-Wrapup
//
//  Created by Rahul on 25/12/21.
//

import SwiftUI
import CoreML

struct ContentView: View {
    @State private var wakeUp = defaultWakeupTime
    @State var coffeeAmount = 1
    @State var sleepAmount = 4
    
    @State var alertTitle = ""
    @State var alertMessage = ""
    @State var isAlertShowing = false
        
    static var defaultWakeupTime : Date {
        var component = DateComponents()
        component.hour = 7
        component.minute = 0
        return Calendar.current.date(from: component) ?? .now
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section("When do you want to wake up?"){
                    DatePicker("Please select a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                Section("Desired amount of sleep") {
                    Stepper("\(sleepAmount) hours", value: $sleepAmount, in: 2...10)
                }
                
                Section("Daily coffee intake") {
                    Picker(coffeeAmount == 1 ? "1 cup": "\(coffeeAmount) cups", selection: $coffeeAmount) {
                        
                        ForEach(Array(stride(from: 1, to: 20, by: 1)), id: \.self) { index in
                            Text("\(index)")
                        }
                       
                    }
                }
            }
            .navigationTitle("Better Rest")
            .toolbar {
                Button("Calculate", action: calculateBedTime)
            }
            .alert(alertTitle, isPresented: $isAlertShowing) {
                Button("Ok") {}
            } message: {
                Text(alertMessage)
            }
        }
        
    }
    
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try BetterRestCoreML(configuration: config)
            
            let component = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            
            let hourInSeconds = (component.hour ?? 0) * 60 * 60
            let minuteInSeconds = (component.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hourInSeconds+minuteInSeconds), estimatedSleep: Double(sleepAmount), coffee: Double(coffeeAmount))
         
            let sleepTime = wakeUp - prediction.actualSleep
        
            alertTitle = "Your ideal bedtime is"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            alertTitle = "error"
            alertMessage = "Something went wrong!!!"
        }
        
        isAlertShowing = true
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

