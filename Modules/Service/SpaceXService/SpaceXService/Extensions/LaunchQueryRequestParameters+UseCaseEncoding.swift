//
//  LaunchQueryRequestParameters+UseCaseEncoding.swift
//  SpaceXService
//
//  Created by Said Özcan on 08/01/2022.
//

import Foundation

extension LaunchQueryRequestParameters {
    func encodeForRequest() throws -> Data {
        try JSONEncoder().encode(self)
    }
}
