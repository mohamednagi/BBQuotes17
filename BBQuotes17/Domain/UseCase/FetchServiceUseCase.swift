//
//  FetchServiceUseCase.swift
//  BBQuotes17
//
//  Created by Mohamed Nagi on 15/01/2025.
//

import Foundation

protocol FetchServiceUseCaseProtocol {
    func fetchData(from show: String, completion: @escaping ((Quote?,Character?)->Void)) async
}

class FetchServiceUseCaseImpl: FetchServiceUseCaseProtocol {
    
    private let repo: FetchServiceProtocol
    
    var state: DynamicObjects<Status> = DynamicObjects(.notStarted)
    var character: Character?
    var quote: Quote?
    
    enum Status {
        case notStarted
        case fetching
        case success
        case failed(error: Error)
    }
    
    
    init(repo: FetchServiceProtocol = FetchServiceImpl()) {
        self.repo = repo
    }
    
    func fetchData(from show: String, completion: @escaping ((Quote?,Character?)->Void)) async {
        state.value = .fetching
        do {
            quote = try await repo.FetchQuote(for: show)
            character = try await repo.FetchCharacter(quote?.character ?? "")
            if let char = character {
                character!.death = try await repo.FetchDeath(for: char.name)
            }
            state.value = .success
            completion(quote,character)
            
        } catch {
            state.value = .failed(error: error)
        }
    }
}
