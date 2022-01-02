//
//  ContentView.swift
//  StateVsStateObject
//
//  Created by Rahul on 02/01/22.
//

import SwiftUI

//struct User {
//    var firstName = "Rahul"
//    var lastName = "Umap"
//}

class User: ObservableObject {
    @Published var firstName = "Rahul"
    @Published var lastName = "Umap"
}

struct ContentView: View {
   //  @State var user = User()
    @StateObject var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
                .padding()
            
            TextField("first name", text: $user.firstName)
            TextField("last name", text: $user.lastName)
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
