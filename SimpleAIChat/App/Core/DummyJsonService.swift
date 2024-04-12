//
//  DummyJsonService.swift
//  SimpleAIChat
//
//  Created by Leo Wirasanto Laia on 12/04/24.
//

import Foundation
import Dependencies

protocol DummyJsonService {
    func get<T: Codable>(_ type: DummyJsonImplementation.ResponseType) async throws -> T
}

class DummyJsonImplementation: DummyJsonService {
    enum ResponseType: String {
        case failed = "failed-response"
        case success = "success-response"
        case emptyExplore = "success-empty-explore"
    }
    
    func get<T: Codable>(_ type: ResponseType) async throws -> T {
        let responseData = try await data(type)
        return try JSONDecoder().decode(T.self, from: responseData)
    }
    
    private func data(_ type: ResponseType) async throws -> Data  {
        let url = Bundle.main.url(forResource: type.rawValue, withExtension: "json")
        guard let dataURL = url else {
            throw NetworkError.badRequest
        }
        return try Data(contentsOf: dataURL)
    }
}
