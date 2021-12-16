//
//  ContentView.swift
//  ChallengeDay
//
//  Created by Rahul on 16/12/21.
//

import SwiftUI

struct ContentView: View {
    var units = ["meters", "kilometers", "feet", "miles"]
    
    @State var inputUnit = "meters"
    @State var outputUnit = "kilometers"
    @State var value: Double = 1
    
    private func getUnitType(_ unit: String) -> UnitLength {
        switch unit {
        case "meters":
            return .meters
        case "kilometers":
            return .kilometers
        case "feet":
            return .feet
        default:
            return .miles
        }
    }
    
    var result : Double {
        guard inputUnit != outputUnit else {
            return Double(value)
        }
            
        let input = Measurement(value: value, unit: getUnitType(inputUnit))
        let output = input.converted(to: getUnitType(outputUnit))
    
        return output.value
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Enter value", value: $value, format: .number)
                        .keyboardType(.numberPad)
                } header: {
                    Text("Enter Value")
                }
                
                Section {
                    Picker("Select Input Unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("From Unit")
                }
                
                Section {
                    Picker("Selet Output Unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("To Unit")
                }
                
                Section {
                    Text("\(result)")
                } header: {
                    Text("Result")
                }
                
            }
            .navigationTitle("Distance Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
