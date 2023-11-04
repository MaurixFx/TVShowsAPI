//
//  NetworkClient.swift
//
//
//  Created by Mauricio Figueroa on 03-11-23.
//

import Foundation

enum NetworkClientError: Error {
    case invalidResponse
}

final class NetworkClient {
    func get(from url: String) async throws -> [TVShow] {
        guard let url = URL(string: url) else { return [] }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let tvShowResponse = try decoder.decode(TVShowResponse.self, from: data)
            return tvShowResponse.results
        } catch {
            throw NetworkClientError.invalidResponse
        }
    }
}
