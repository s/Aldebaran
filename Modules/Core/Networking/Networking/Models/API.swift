//
//  API.swift
//  Networking
//
//  Created by Said Özcan on 07/01/2022.
//

import Foundation

public struct API {
    // MARK: -
    public var baseURL: BaseURL
    public var headers: [String: String]
    
    // MARK: -
    public init(baseURL: BaseURL, headers: [String: String] = [:]) {
        self.baseURL = baseURL
        self.headers = headers
    }
}
