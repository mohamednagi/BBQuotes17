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
        
        self.quote = MockData.shared.getSampleQuote()
        
        self.character = MockData.shared.getSampleCharacter()
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
