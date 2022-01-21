//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Rahul on 21/01/22.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var year: Int16
    @NSManaged public var title: String
    @NSManaged public var director: String

}

extension Movie : Identifiable {

}
