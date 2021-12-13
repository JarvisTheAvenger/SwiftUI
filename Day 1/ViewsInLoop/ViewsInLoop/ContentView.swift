//
//  ContentView.swift
//  ViewsInLoop
//
//  Created by Rahul on 13/12/21.
//

import SwiftUI

struct ContentView: View {
    private let students = ["John", "Austin", "Jeremy"]
    
    @State var selectedStudent = "Jeremy"
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Pick a student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
            .navigationTitle("Student Selection")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
            .previewDisplayName("iPhone 12 Pro Max")
    }
}
