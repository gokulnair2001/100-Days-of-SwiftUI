//
//  Astronaut.swift
//  Moonshot
//
//  Created by Gokul Nair on 29/11/21.
//

import Foundation

struct Astronaut: Codable {
    let id, name, astronautDescription: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case astronautDescription = "description"
    }
}
