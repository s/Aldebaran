//
//  Endpoint.swift
//  
//
//  Created by Said Özcan on 06/01/2022.
//

import Foundation

public struct Endpoint<Kind: EndpointKind, Response: Decodable> {
    var api: API
    var path: String
    var queryItems = [URLQueryItem]()
    
    public init(api: API, path: String, queryItems: [URLQueryItem] = []) {
        self.api = api
        self.path = path
        self.queryItems = queryItems
    }
}

extension Endpoint {
    func makeRequest(with data: Kind.RequestData) -> URLRequest? {
        var components = URLComponents()
        components.scheme = api.baseURL.scheme
        components.host = api.baseURL.host
        components.path = "/" + path
        components.queryItems = queryItems.isEmpty ? nil : queryItems

        // If either the path or the query items passed contained
        // invalid characters, we'll get a nil URL back:
        guard let url = components.url else {
            return nil
        }

        var request = URLRequest(url: url)
        Kind.prepare(&request, with: data)
        return request
    }
}
