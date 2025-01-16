//
//  Character.swift
//  BBQuotes17
//
//  Created by Mohamed Nagi on 06/01/2025.
//

import Foundation

struct Character: Decodable {
    var name: String
    var birthday: String
    var occupations: [String]
    var images: [URL]
    var aliases: [String]
    var status: String
    var portrayedBy: String
    var death: Death?
    
    enum CodingKeys: CodingKey {
        case name
        case birthday
        case occupations
        case images
        case aliases
        case status
        case portrayedBy
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        birthday = try container.decode(String.self, forKey: .birthday)
        occupations = try container.decode([String].self, forKey: .occupations)
        images = try container.decode([URL].self, forKey: .images)
        aliases = try container.decode([String].self, forKey: .aliases)
        status = try container.decode(String.self, forKey: .status)
        portrayedBy = try container.decode(String.self, forKey: .portrayedBy)
        
        death = MockData.shared.getSampleDeath()
    }
}
