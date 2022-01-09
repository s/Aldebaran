//
//  MockErrorURLResponder.swift
//  NetworkingTests
//
//  Created by Said Özcan on 09/01/2022.
//

import Foundation

enum MockErrorURLResponder: MockURLResponder {
    static func respond(to request: URLRequest) throws -> Data {
        throw URLError(.badServerResponse)
    }
}
