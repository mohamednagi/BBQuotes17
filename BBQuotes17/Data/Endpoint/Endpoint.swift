//
//  Endpoint.swift
//  BBQuotes17
//
//  Created by Mohamed Nagi on 15/01/2025.
//

import Foundation

struct Endpoint {
    static let shared = Endpoint()
    
    private var baseURL = URL(string: "https://breaking-bad-api-six.vercel.app/api")!
    private init(){}
    
    func setEndpoint(with endpoint: String) -> URL {
        return baseURL.appending(path: endpoint)
    }
    
}
