//
//  ContentView.swift
//  ValidatingForms
//
//  Created by Rahul on 14/01/22.
//

import SwiftUI

struct ContentView: View {
    @State private var username = "rahul"
    @State private var email = "umap"
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account…")
                }
            }
            
        }
        .disabled(username.isEmpty || email.isEmpty)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
