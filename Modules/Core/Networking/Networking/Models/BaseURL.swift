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
    public let version: String?
    
    public var fullURLString: String {
        var url = scheme + "://" + host
        if let v = version {
            url = url + "/" + v
        }
        return url
    }
    
    // MARK: -
    public init(scheme: String, host: String, version: String? = nil) {
        self.scheme = scheme
        self.host = host
        self.version = version
    }
}
