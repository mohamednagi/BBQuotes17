//
//  MapperManager.swift
//  BBQuotes17
//
//  Created by Mohamed Nagi on 15/01/2025.
//

import Foundation

protocol MapperManager {
    associatedtype DTO
    associatedtype Entity
    func map(from dto: DTO) -> Entity
}
