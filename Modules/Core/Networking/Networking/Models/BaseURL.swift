//
//  BaseURL.swift
//  Networking
//
//  Created by Said Özcan on 07/01/2022.
//

import Foundation

public struct BaseURL {
    // MARK: -
    public let scheme: String
    public let host: String
    public let version: String
    
    public var fullHost: String {
        host + "/" + version
    }
    
    // MARK: -
    public init(scheme: String, host: String, version: String) {
        self.scheme = scheme
        self.host = host
        self.version = version
    }
}
