//
//  Mission.swift
//  Moonshot
//
//  Created by Rahul on 06/01/22.
//

import Foundation

struct MissionCrew: Codable {
    let name: String
    let role: String
}

struct Mission: Codable, Identifiable {
    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [MissionCrew]
    let description: String
}
