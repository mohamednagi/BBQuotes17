//
//  QuoteMapper.swift
//  BBQuotes17
//
//  Created by Mohamed Nagi on 15/01/2025.
//

import Foundation

class QuoteMapper: MapperManager {
    typealias DTO = Quote
    typealias Entity = QuoteEntity
    
    func map(from dto: DTO) -> QuoteEntity {
        let rootNode = createQuoteModel(from: dto)
        return QuoteEntity(rootNode: rootNode)
    }
    
    private func createQuoteModel(from dto: DTO) -> QuoteModel {
        return QuoteModel(
            quote: dto.quote,
            character: dto.character
        )
    }
}
