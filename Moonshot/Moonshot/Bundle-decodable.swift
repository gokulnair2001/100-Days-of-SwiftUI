//
//  Bundle-decodable.swift
//  Moonshot
//
//  Created by Gokul Nair on 29/11/21.
//

import Foundation

extension Bundle {
    
    func decode<T: Codable>(_ file: String) -> T {

        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file) in bundle")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }

        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode")
        }

        return loaded

    }
    
    
}
