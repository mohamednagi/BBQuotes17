//
//  DeathEntity.swift
//  BBQuotes17
//
//  Created by Mohamed Nagi on 15/01/2025.
//

import Foundation

struct DeathEntity {
    var rootNode: DeathModel? = nil
}

struct DeathModel {
    var character: String
    var image: URL
    var details: String
    var lastWords: String
}
