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
    @Published var state: FetchServiceUseCaseImpl.Status = .notStarted
    
    
    init(useCase: FetchServiceUseCaseImpl) {
        fetcherUseCase = useCase
        
        quote = MockData.shared.getSampleQuote()
        character = MockData.shared.getSampleCharacter()
        
        handleObservation(useCase: useCase)
    }
    
    private func handleObservation(useCase: FetchServiceUseCaseImpl) {
        useCase.state.bind { state in
            DispatchQueue.main.async {[weak self] in
                guard let `self` = self else {return}
                self.state = state
            }
        }
    }
    
    func fetchData(from show: String) async {
        await fetcherUseCase.fetchData(from: show) {returnedQuote, returnedCharacter in
            DispatchQueue.main.async {
                if let quote = returnedQuote { self.quote = quote }
                if let character = returnedCharacter { self.character = character }
            }
        }
    }
}
