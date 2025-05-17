//
//  ChatRepo.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 17/05/25.
//

import Foundation

// MARK: - ChatRepo Protocol
protocol ChatRepoProtocol {
    func fetchChats(completion: @escaping (Result<[Chat], Error>) -> Void)
}

// MARK: - ChatRepo Implementation
class ChatRepoRepo: ChatRepoProtocol {
    private let endpoint = "http://localhost:3000/chats"
    
    func fetchChats(completion: @escaping (Result<[Chat], Error>) -> Void) {
//        guard let url = URL(string: endpoint) else {
//            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            
//            guard let data = data else {
//                completion(.failure(NSError(domain: "No data received", code: -1, userInfo: nil)))
//                return
//            }
//            
//            do {
//                let suggestions = try JSONDecoder().decode([Chat].self, from: data)
//                completion(.success(suggestions))
//            } catch {
//                completion(.failure(error))
//            }
//        }
//        
//        task.resume()
    }
}
