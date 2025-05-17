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
    
    func fetchSuggestions(completion: @escaping (Result<[Suggestion], Error>) -> Void) {
        guard let url = URL(string: endpoint) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let suggestions = try JSONDecoder().decode([Suggestion].self, from: data)
                completion(.success(suggestions))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
