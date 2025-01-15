//
//  FetchService.swift
//  BBQuotes17
//
//  Created by Mohamed Nagi on 15/01/2025.
//

import Foundation

protocol FetchServiceProtocol {
    func FetchQuote(for show: String) async throws -> Quote
    func FetchCharacter(_ name: String) async throws -> Character
    func FetchDeath(for character: String) async throws -> Death?
    
    func mapCharacters(dto: Character) -> CharacterEntity
    func mapQuotes(from dto: Quote) -> QuoteEntity
    func mapDeaths(from dto: Death) -> DeathEntity
}
