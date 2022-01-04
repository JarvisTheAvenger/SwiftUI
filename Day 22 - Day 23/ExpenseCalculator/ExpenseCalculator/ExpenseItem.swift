//
//  ExpenseItem.swift
//  ExpenseCalculator
//
//  Created by Rahul on 03/01/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    
    let name: String
    let type: String
    let amount: Double
}
