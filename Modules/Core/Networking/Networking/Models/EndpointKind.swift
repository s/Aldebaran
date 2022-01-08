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
    public enum Public: EndpointKind {
        public static func prepare(_ request: inout URLRequest,
                            with _: Void) {
            request.cachePolicy = .reloadIgnoringLocalCacheData
        }
    }

    public enum Authenticated: EndpointKind {        
        public static func prepare(_ request: inout URLRequest,
                            with token: String) {
            request.addValue("Bearer \(token)",
                forHTTPHeaderField: "Authorization"
            )
        }
    }
}
