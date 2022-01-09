//
//  MockURLResponder.swift
//  Networking
//
//  Created by Said Özcan on 09/01/2022.
//

import Foundation

protocol MockURLResponder {
    static func respond(to request: URLRequest) throws -> Data
}
