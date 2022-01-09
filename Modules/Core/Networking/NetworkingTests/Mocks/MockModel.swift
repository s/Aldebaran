//
//  MockModel.swift
//  NetworkingTests
//
//  Created by Said Özcan on 09/01/2022.
//

import Foundation

// MARK: -
struct MockModel: Codable, Equatable {
    let title: String
    let description: String
}

// MARK: -
extension MockModel {
    enum MockDataURLResponder: MockURLResponder {
        static let item = MockModel(title: "Title", description: "Description")

        static func respond(to request: URLRequest) throws -> Data {
            return try JSONEncoder().encode(item)
        }
    }
}
