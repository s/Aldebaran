//
//  API+ExpectedURL.swift
//  NetworkingTests
//
//  Created by Said Özcan on 09/01/2022.
//

import Foundation
import Networking
import XCTest

extension API {
    func expectedURL(withPath path: String) throws -> URL {
        let url = URL(string: baseURL.fullURLString + "/" + path)
        return try XCTUnwrap(url)
    }
}
