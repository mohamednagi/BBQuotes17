//
//  FetchService.swift
//  BBQuotes17
//
//  Created by Mohamed Nagi on 07/01/2025.
//

import Foundation

class FetchServiceImpl: FetchServiceProtocol {
    
    private enum FetchError: Error {
        case badResponse
    }
    
    init(){}
    
    func FetchQuote(for show: String) async throws -> Quote {
        // Build fetch url
        let quoteURL = Endpoint.shared.setEndpoint(with: "quotes/random")
        let fetchURL = quoteURL.appending(queryItems: [URLQueryItem(name: "production", value: show)])
        
        // Fetch data
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        // Handle response
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        
        // Decode data
        let quote = try JSONDecoder().decode(Quote.self, from: data)
        
        // Return quote
        return quote
    }
    
    func FetchCharacter(_ name: String) async throws -> Character {
        // Build fetch url
        let characterURL = Endpoint.shared.setEndpoint(with: "characters")
        let fetchURL = characterURL.appending(queryItems: [URLQueryItem(name: "name", value: name)])
        
        // Fetch data
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        // Handle response
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        
        // Decode data
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let characters = try decoder.decode([Character].self, from: data)
        
        // Return character
        return characters[0]
    }
    
    func FetchDeath(for character: String) async throws -> Death? {
        // Build fetch url
        let characterURL = Endpoint.shared.setEndpoint(with: "deaths")
        
        // Fetch data
        let (data, response) = try await URLSession.shared.data(from: characterURL)
        
        // Handle response
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        
        // Decode data
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let deaths = try decoder.decode([Death].self, from: data)
        
        for death in deaths {
            if death.character == character {
                return death
            }
        }
        return nil
    }
    
    func mapCharacters(dto: Character) -> CharacterEntity {
        return CharacterMapper().map(from: dto)
    }
    
    func mapQuotes(from dto: Quote) -> QuoteEntity {
        return QuoteMapper().map(from: dto)
    }
    
    func mapDeaths(from dto: Death) -> DeathEntity {
        return DeathMapper().map(from: dto)
    }
}
