//
//  CharacterMapper.swift
//  BBQuotes17
//
//  Created by Mohamed Nagi on 15/01/2025.
//

import Foundation

class CharacterMapper: MapperManager {
    
    typealias DTO = Character
    typealias Entity = CharacterEntity
    
    func map(from dto: DTO) -> Entity {
        let rootNode = createCharacterModel(from: dto)
        return Entity(rootNode: rootNode)
    }
    
    private func createCharacterModel(from dto: Character) -> CharacterModel {
        return CharacterModel(name: dto.name,
                              birthday: dto.birthday,
                              occupations: dto.occupations,
                              images: dto.images,
                              aliases: dto.aliases,
                              status: dto.status,
                              portrayedBy: dto.portrayedBy)
    }
}
