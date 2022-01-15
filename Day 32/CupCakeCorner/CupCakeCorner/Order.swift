//
//  Order.swift
//  CupCakeCorner
//
//  Created by Rahul on 15/01/22.
//

import Foundation

class Order: ObservableObject {
    static let types = ["Vanilla", "Chocolate", "Strawberry"]
    
    @Published var selectedtype = 0
    @Published var quantity = 3
    
    @Published var specailRequestEnabled = false {
        didSet {
            if specailRequestEnabled {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || city.isEmpty || zip.isEmpty || streetAddress.isEmpty {
            return false
        }
        
        return true
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2

        // complicated cakes cost more
        cost += (Double(selectedtype) / 2)

        // $1/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }

        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }

        return cost
    }
    
}
