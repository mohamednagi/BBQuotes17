//
//  ViewModel.swift
//  BBQuotes17
//
//  Created by Mohamed Nagi on 08/01/2025.
//

import Foundation

protocol ViewModelProtocol {
    func fetchData(from show: String) async
}

class ViewModelImpl: ViewModelProtocol, ObservableObject {
    
    private let fetcherUseCase: FetchServiceUseCaseProtocol
    
    @Published var quote: Quote
    @Published var character: Character
    
    
    init(useCase: FetchServiceUseCaseImpl) {
        self.fetcherUseCase = useCase
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let quoteURL = Bundle.main.url(forResource: "samplequote", withExtension: "json")!
        let quoteData = try! Data(contentsOf: quoteURL)
        self.quote = try! decoder.decode(Quote.self, from: quoteData)
        
        let characterURL = Bundle.main.url(forResource: "samplecharacter", withExtension: "json")!
        let characterData = try! Data(contentsOf: characterURL)
        self.character = try! decoder.decode(Character.self, from: characterData)
    }
    
    func fetchData(from show: String) async {
        await fetcherUseCase.fetchData(from: show) {returnedQuote, returnedCharacter in
            DispatchQueue.main.async {
                if let quote = returnedQuote { self.quote = quote }
                if let character = returnedCharacter { self.character = character }
            }
        }
    }
    
    func currentState() -> FetchServiceUseCaseImpl.Status {
        return fetcherUseCase.currentState()
    }
}
