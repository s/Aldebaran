//
//  BaseURL.swift
//  Networking
//
//  Created by Said Özcan on 07/01/2022.
//

import Foundation

public struct BaseURL {
    // MARK: -
    public var scheme: String
    public var host: String
    
    // MARK: -
    public init(scheme: String, host: String) {
        self.scheme = scheme
        self.host = host
    }
}
