//
//  Location.swift
//  AddingUserLocationMap
//
//  Created by Rahul on 03/02/22.
//

import Foundation
import MapKit

struct Location: Identifiable, Codable, Equatable {
    static let example = Location(id: UUID(), name: "Buckingham Palace", description: "Where Queen Elizabeth lives with her dorgis.", latitude: 51.501, longitude: -0.141)

    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    var id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
    
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }

}
