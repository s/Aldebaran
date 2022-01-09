//
//  URLSession+MockURLResponder.swift
//  NetworkingTests
//
//  Created by Said Özcan on 09/01/2022.
//

import Foundation

extension URLSession {
    convenience init<T: MockURLResponder>(mockResponder: T.Type) {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol<T>.self]
        self.init(configuration: config)
        URLProtocol.registerClass(MockURLProtocol<T>.self)
    }
}
