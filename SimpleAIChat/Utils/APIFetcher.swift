//
//  APIFetcher.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 17/05/25.
//

import Foundation

// MARK: - APIFetcher
class APIFetcher {
    static let shared = APIFetcher()
    private init() {}
    
    /// Fetches JSON data from the given URL string and decodes it into a generic type.
    /// - Parameters:
    ///   - urlString: The URL string to fetch data from.
    ///   - responseType: The type of the response object to decode into.
    ///   - completion: A completion handler with a `Result` containing the decoded object or an error.
    func fetch<T: Codable>(from urlString: String, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
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
                let decodedResponse = try JSONDecoder().decode(responseType, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}