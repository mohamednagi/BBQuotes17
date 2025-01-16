//
//  MockCharacter.swift
//  BBQuotes17
//
//  Created by Mohamed Nagi on 16/01/2025.
//

import Foundation

struct MockData {
    
    static let shared = MockData()
    
    private init(){}
    
    private let decoder = JSONDecoder()
    
    func getSampleCharacter() -> Character {
        MockData.shared.decoder.keyDecodingStrategy = .convertFromSnakeCase
        let characterURL = Bundle.main.url(forResource: "samplecharacter", withExtension: "json")!
        let characterData = try! Data(contentsOf: characterURL)
        return try! MockData.shared.decoder.decode(Character.self, from: characterData)
    }
    
    func getSampleQuote() -> Quote {
        MockData.shared.decoder.keyDecodingStrategy = .convertFromSnakeCase
        let quoteURL = Bundle.main.url(forResource: "samplequote", withExtension: "json")!
        let quoteData = try! Data(contentsOf: quoteURL)
        return try! MockData.shared.decoder.decode(Quote.self, from: quoteData)
    }
    
    func getSampleDeath() -> Death {
        MockData.shared.decoder.keyDecodingStrategy = .convertFromSnakeCase
        let deathURL = Bundle.main.url(forResource: "sampledeath", withExtension: "json")!
        do {
            let deathData = try Data(contentsOf: deathURL)
            return try MockData.shared.decoder.decode(Death.self, from: deathData)
        }catch {
            return Death(character: "Moe",
                         image: URL(string: "https://static.wikia.nocookie.net/breakingbad/images/9/9e/Walt%27s_Death.png/revision/latest?cb=20221121191611")!,
                         details: "Details",
                         lastWords: "last words")
        }
    }
}
