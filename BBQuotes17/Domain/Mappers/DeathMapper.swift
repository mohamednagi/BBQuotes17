//
//  DeathMapper.swift
//  BBQuotes17
//
//  Created by Mohamed Nagi on 15/01/2025.
//

import Foundation

class DeathMapper: MapperManager {
    typealias DTO = Death
    typealias Entity = DeathEntity
    
    func map(from dto: Death) -> DeathEntity {
        let rootNode = createDeathModel(from: dto)
        return DeathEntity(rootNode: rootNode)
    }
    
    private func createDeathModel(from dto: DTO) -> DeathModel {
        DeathModel(character: dto.character,
                   image: dto.image,
                   details: dto.details,
                   lastWords: dto.lastWords)
    }
    
}
