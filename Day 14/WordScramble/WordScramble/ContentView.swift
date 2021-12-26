//
//  ContentView.swift
//  WordScramble
//
//  Created by Rahul on 26/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        let places = ["Ooty", "Mahabaleshwar", "Shimla", "Manali", "Mysore"]
        
        NavigationView {
            List(places, id: \.self) {
                Text("\($0)")
            }
            .listStyle(.grouped)
            .navigationTitle("List")
        }.onAppear {
            test()
        }
        
    }
    
    func test() {
        let word = "swift"
 
        let range = NSRange(location: 0, length: word.utf16.count)
        let checker = UITextChecker()
        
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        
        let allGood = misspelledRange.location == NSNotFound
        
        print(allGood)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
