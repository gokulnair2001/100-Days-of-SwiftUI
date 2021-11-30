//
//  Mission.swift
//  Moonshot
//
//  Created by Gokul Nair on 30/11/21.
//

import Foundation

struct Mission: Codable, Identifiable {
    let id: Int
    let crew: [Crew]
    let missionDescription: String
    let launchDate: Date?
    
    enum CodingKeys: String, CodingKey {
        case id, crew
        case missionDescription = "description"
        case launchDate
    }
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
}

// MARK: - Crew
struct Crew: Codable {
    let name, role: String
}
