//
//  SuggestionsRepo.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 17/05/25.
//

import Foundation

// MARK: - SuggestionsRepo Protocol
protocol SuggestionsRepoProtocol {
    func fetchSuggestions(completion: @escaping (Result<[Suggestion], Error>) -> Void)
}

// MARK: - SuggestionsRepo Implementation
class SuggestionsRepo: SuggestionsRepoProtocol {
    private let endpoint = "http://localhost:3000/suggestions"
    private let apiFetcher = APIFetcher.shared
    
    func fetchSuggestions(completion: @escaping (Result<[Suggestion], Error>) -> Void) {
        apiFetcher.fetch(from: endpoint, responseType: [Suggestion].self, completion: completion)
    }
}
