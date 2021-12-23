//
//  ContentView.swift
//  BetterRest
//
//  Created by Rahul on 23/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var sleepHours = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        NavigationView {
            Form {
                Section("Sleep hours") {
                    Stepper("\(sleepHours.formatted()) sleep hours", value: $sleepHours, in: 4...12)
                }
                .textCase(nil)
                
                Section("Please enter a date"){
                    DatePicker("Please select date", selection: $wakeUp, in: Date.now...)
                        .labelsHidden()
                }
                .textCase(nil)
                
                Section {
                    Text(Date.now, format: .dateTime.day().month())
                }
            }
            .background(.primary)
            .navigationTitle("Better Rest")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
