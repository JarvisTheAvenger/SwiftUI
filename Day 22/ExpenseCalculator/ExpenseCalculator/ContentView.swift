//
//  ContentView.swift
//  ExpenseCalculator
//
//  Created by Rahul on 03/01/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State var isShowingAddExpenseView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id: \.id) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }

                        Spacer()
                        Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                            .foregroundStyle(
                                item.amount > 10 ? .linearGradient( colors: [.yellow, .red], startPoint: .top, endPoint: .bottom) : .linearGradient(
                                    colors: [.black],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem {
                    Button {
                        isShowingAddExpenseView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingAddExpenseView) {
                AddExpenseView(expenses: expenses)
            }
        }

    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
