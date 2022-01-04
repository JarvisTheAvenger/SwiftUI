//
//  AddExpenseView.swift
//  ExpenseCalculator
//
//  Created by Rahul on 03/01/22.
//

import SwiftUI

struct AddExpenseView: View {
    @ObservedObject var expenses : Expenses
    @Environment(\.dismiss) var dismiss

    
    @State var name: String = ""
    @State var amount : Double = 0.0
    @State var selectedType : String = "Personal"
    
    let types = ["Personal", "Business"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $selectedType) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                
            }
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: selectedType, amount: amount)
      
                    expenses.items.append(item)
                    
                    dismiss()
                }
            }
        }
    
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView(expenses: Expenses())
    }
}
