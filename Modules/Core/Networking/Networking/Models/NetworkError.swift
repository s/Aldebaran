//
//  NetworkError.swift
//  Networking
//
//  Created by Said Özcan on 07/01/2022.
//

import Foundation

public enum NetworkError<Endpoint>: Error {

    /// Indicates that there has been a connection error to the server
    case connectionError(Error)

    /// Indicates not ok HTTP response code: 200..<300
    case httpError(Error)

    /// Indicates that parsing is not possible with the current data and
    /// given type to parse into.
    case decodingFailed(DecodingError)

    /// In case an error occures which is not identified
    case undefined(Error)

    /// Indicates that the endpoint produced invalid url
    case invalidEndpoint(Endpoint)
}
