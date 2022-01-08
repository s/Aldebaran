//
//  URLSession+Publisher.swift
//  
//
//  Created by Said Özcan on 06/01/2022.
//

import Foundation
import Combine

public extension URLSession {
    func publisher<K, R>(
        for endpoint: Endpoint<K, R>,
        using requestData: K.RequestData,
        decoder: JSONDecoder = .init()
    ) -> AnyPublisher<R, Error> {
        guard let request = endpoint.makeRequest(with: requestData) else {
            return Fail(
                error: NetworkError.invalidEndpoint(endpoint)
            ).eraseToAnyPublisher()
        }
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: NetworkResponse<R>.self, decoder: decoder)
            .map(\.result)
            .eraseToAnyPublisher()
    }
}
