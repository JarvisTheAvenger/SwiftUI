//
//  AddressView.swift
//  CupCakeCorner
//
//  Created by Rahul on 15/01/22.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var orderItem: OrderItem
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $orderItem.order.name)
                TextField("Street Address", text: $orderItem.order.streetAddress)
                TextField("City", text: $orderItem.order.city)
                TextField("Zip", text: $orderItem.order.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(orderItem: orderItem)
                } label: {
                    Text("Checkout")
                }
            }.disabled(orderItem.order.hasValidAddress == false)
        }
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(orderItem: OrderItem())
    }
}
