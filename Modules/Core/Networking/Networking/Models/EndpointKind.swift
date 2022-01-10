//
//  EndpointKind.swift
//  
//
//  Created by Said Özcan on 06/01/2022.
//

import Foundation

public protocol EndpointKind {
    associatedtype RequestData
    
    static func prepare(_ request: inout URLRequest,
                        with data: RequestData)
}

public enum EndpointKinds {
    public enum GET: EndpointKind {
        public static func prepare(_ request: inout URLRequest,
                                   with _: Void) {
            request.cachePolicy = .returnCacheDataElseLoad
        }
    }
    
    public enum POST: EndpointKind {
        public typealias RequestData = Data
        public static func prepare(_ request: inout URLRequest,
                                   with data: RequestData) {
            request.httpBody = data
            request.httpMethod = HTTPMethod.post.rawValue
            request.addValue("application/json", forHTTPHeaderField: "content-type")
        }
    }
    
    enum Stub: EndpointKind {
        static func prepare(_ request: inout URLRequest,
                            with data: Void) {
            // No-op
        }
    }
    
    enum Authenticated: EndpointKind {
        static func prepare(_ request: inout URLRequest,
                            with data: String) {
            request.addValue("Bearer \(data)",
                forHTTPHeaderField: "Authorization"
            )
        }
    }
}
