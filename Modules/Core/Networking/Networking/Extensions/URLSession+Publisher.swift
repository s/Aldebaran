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
        
        typealias NetworkingError = NetworkError<Endpoint<K, R>>
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return dataTaskPublisher(for: request)
            .breakpointOnError()
            .tryMap() { (data, response) -> Data in
                debugPrint(response)
                guard let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode == 200 else {
                        throw NetworkingError.httpError(URLError(.badServerResponse))
                    }
                return data
            }
            .decode(type: R.self, decoder: decoder)
            .mapError({ error in
                switch error {
                case is Swift.DecodingError:
                    if let err = error as? DecodingError {
                        return NetworkingError.decodingFailed(err)
                    }
                    return NetworkingError.undefined(error)
                default:
                    return NetworkingError.undefined(error)
                }
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
