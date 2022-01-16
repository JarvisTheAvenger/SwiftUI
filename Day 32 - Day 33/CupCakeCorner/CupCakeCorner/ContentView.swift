//
//  ContentView.swift
//  CupCakeCorner
//
//  Created by Rahul on 15/01/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var orderItem = OrderItem()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake types", selection: $orderItem.order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes  \(orderItem.order.quantity)", value: $orderItem.order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special request", isOn: $orderItem.order.specailRequestEnabled.animation())
                    
                    if orderItem.order.specailRequestEnabled {
                        Toggle("Add extra frosting", isOn: $orderItem.order.extraFrosting)
                        
                        Toggle("Add extra sprinkels", isOn: $orderItem.order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                       AddressView(orderItem: orderItem)
                    } label: {
                        Text("Delivery Details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
