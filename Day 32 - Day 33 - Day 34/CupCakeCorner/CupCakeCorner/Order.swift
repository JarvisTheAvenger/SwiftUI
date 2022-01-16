//
//  Order.swift
//  CupCakeCorner
//
//  Created by Rahul on 15/01/22.
//

import Foundation

class OrderItem: ObservableObject {
    @Published var order = Order()
}

struct Order: Codable {
    static let types = ["Vanilla", "Chocolate", "Strawberry"]
    
     var type = 0
     var quantity = 3
    
     var specailRequestEnabled = false {
        didSet {
            if specailRequestEnabled {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
     var extraFrosting = false
     var addSprinkles = false
    
    
     var name = ""
     var streetAddress = ""
     var city = ""
     var zip = ""
    
    var hasValidAddress: Bool {
    
        let name = self.name.trimmingCharacters(in: .whitespacesAndNewlines)
        let city = self.city.trimmingCharacters(in: .whitespacesAndNewlines)
        let zip = self.zip.trimmingCharacters(in: .whitespacesAndNewlines)
        let streetAddress = self.streetAddress.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if name.isEmpty || city.isEmpty || zip.isEmpty || streetAddress.isEmpty {
            return false
        }
        
        return true
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2

        // complicated cakes cost more
        cost += (Double(type) / 2)

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
    
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }
    
}
