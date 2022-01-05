//
//  ContentView.swift
//  LazyVGrid-HGrid
//
//  Created by Rahul on 05/01/22.
//

import SwiftUI

struct ContentView: View {
    
    let layout = [
        GridItem(.adaptive(minimum: 70))
    ]
    
    var body: some View {
        
//        ScrollView {
//            LazyVGrid(columns: layout) {
//                ForEach(1..<1000) {
//                    Text("Row \($0)")
//                        .padding()
//                }
//            }
//        }
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(1..<1000) {
                    Text("Row \($0)")
                        .padding()
                }
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
