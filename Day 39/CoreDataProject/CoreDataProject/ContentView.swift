//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Rahul on 21/01/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>

    
    var body: some View {
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }
            
            
            HStack {
                Button("Add") {
                    let wizard = Wizard(context: moc)
                    wizard.name = "Harry Potter"
                }
                .padding()
                                
                Button("Save") {
                    save()
                }
                .padding()
            }
            

        }
    }
    
    func save() {
        if moc.hasChanges {
            try? moc.save()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @Environment(\.managedObjectContext) static var moc

    @FetchRequest(sortDescriptors: []) static var wizards: FetchedResults<Wizard>
    
    static var previews: some View {
        ContentView(moc: _moc, wizards: _wizards)
    }
}
