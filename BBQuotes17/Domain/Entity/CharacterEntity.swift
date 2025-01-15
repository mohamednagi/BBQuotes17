//
//  CharacterEntity.swift
//  BBQuotes17
//
//  Created by Mohamed Nagi on 15/01/2025.
//

import Foundation

struct CharacterEntity {
    var rootNode: CharacterModel? = nil
}

struct CharacterModel {
    var name: String
    var birthday: String
    var occupations: [String]
    var images: [URL]
    var aliases: [String]
    var status: String
    var portrayedBy: String
    var death: Death?
}
